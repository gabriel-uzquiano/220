--[[
proof-checker-widget.lua

Quarto/Pandoc Lua filter that turns the `.ProofChecker` Carnap-syntax code
blocks already used throughout notes/*.md into a live, interactive embed of

    https://gabriel-uzquiano.github.io/proof-checker/

The app keeps its whole state in the URL hash as plain (non-JSON, non-base64)
query params, built with `URLSearchParams` on the app's own "Copy link"
button and read the same way on load:

    #p=<premises>&c=<conclusion>&pr=<one proof line per row>

  p   comma-separated premises (English "," + space). Omitted entirely when
      there are no premises — the app itself skips the key in that case, so
      this filter does too.
  c   the conclusion formula.
  pr  the proof, one step per line (steps joined by literal "\n", i.e. %0A
      once encoded): "<leading-whitespace><formula> <rule> <citation>".
      Leading whitespace on a line is exactly what marks it as inside a
      subproof — the app's parser only checks for presence of indentation,
      not an exact width, so this filter passes the source's own indentation
      straight through unchanged.

Rule vocabulary the app expects (confirmed by loading test proofs into the
live app and reading back its own "Verification" panel):
  P    top-level premise              A    subproof assumption
  R    repetition                     DN   double-negation elimination
  ∧I ∧E  →I →E  ∨I ∨E  ¬I ¬E          EFSQ ex falso
(∀/∃/= rules exist in the app but are not mapped here — no quantificational
natural-deduction deck exists yet in this repo; extend RULE_MAP when one
does.)

Block handled (this is exactly the syntax already in notes/*.md — copy the
block as-is out of a note and it renders as a live, checkable proof):

    ```{.ProofChecker .GamutPND options="indent resize fonts popout render tabindent" submission="none"}
    1. p, (p /\ q) > r, q :|-: r
    |p :assumption
    |(p /\ q) > r :assumption
    |q :assumption
    |p/\q :I/\ 1,3
    |r :E-> 2, 4
    ```

The leading "<label>." on the sequent line is stripped and otherwise
ignored — the app doesn't display it. `.Playground` blocks (open scratch
proofs with no sequent) are left untouched; there's nothing to embed.

Optional attributes on the block (all optional, default matches the other
widgets in this repo):
    height   CSS height, e.g. "700px" (default scales with proof length —
             the app has no compact/embed mode yet, so its Rules/Examples
             sidebar always renders above the editor; longer proofs need a
             taller height= or will scroll inside the iframe)
    width    CSS width, e.g. "100%" (default)
    card     app card-mode selector, e.g. "verify" (default: unset, i.e. the
             full app with header + Rules/Examples + Sequent + Proof +
             Verification). Passed straight through as "?card=<value>"
             ahead of the app's own "#p=..." hash — the app supports
             "sequent", "proof", "verify", or a comma-separated combination
             (see app.js's applyCardMode). "verify" shows only the graded
             Fitch display, so the default height heuristic switches to the
             much smaller VERIFY_* constants below when this is set to a
             value that is exactly "verify" (any other/combined value falls
             back to the full-app heuristic since its footprint still
             includes at least one of the large Sequent/Proof cards).
--]]

local PROOF_CHECKER_URL = "https://gabriel-uzquiano.github.io/proof-checker/"

local BASE_HEIGHT = 620   -- fits banner + rules + examples + a short proof
local PER_EXTRA_LINE = 46 -- each proof line grows the editor + verification table
local BASELINE_LINES = 5
local MAX_HEIGHT = 1300

-- card="verify" shows only the Verification card (title + Fitch rows), so it
-- needs nowhere near the above. Measured directly against the app: the
-- Verification card's own content height was ~205px for a 2-line proof and
-- ~575px for a 12-line one, i.e. roughly linear at ~37px/line off a ~130px
-- base. A little slack is added since subproof bars/errors can add a couple
-- more px per line than a clean proof does.
local VERIFY_BASE_HEIGHT = 150
local VERIFY_PER_LINE = 40
local VERIFY_MAX_HEIGHT = 900

-- ─── Generic helpers (same shape as the other widget filters) ─────────────

local function has_class(block, name)
  for _, c in ipairs(block.classes) do
    if c == name then return true end
  end
  return false
end

local function attr(block, key, default)
  local v = block.attributes[key]
  if v == nil or v == "" then return default end
  return v
end

local function trim(s)
  return s:match("^%s*(.-)%s*$")
end

local function html_escape_attr(s)
  return (s:gsub("&", "&amp;")
           :gsub('"', "&quot;")
           :gsub("<", "&lt;")
           :gsub(">", "&gt;"))
end

-- Percent-encode everything outside the URL-unreserved set. The decoded
-- bytes are all that matters to the app's URLSearchParams parser, so this
-- doesn't need to special-case space-as-"+"; %20 decodes to a space too.
--
-- Deliberately spelled out as an explicit ASCII byte range (A-Za-z0-9)
-- rather than Lua's %w/%a pattern classes: at least one pandoc-bundled Lua
-- build treats %w as locale-sensitive, so a raw byte like 0xE2 (the lead
-- byte of \u{2227}'s UTF-8 encoding, and coincidentally 'a with circumflex'
-- under Latin-1) can satisfy %w there and slip through unescaped while its
-- continuation bytes still get encoded, corrupting exactly the non-ASCII
-- formulas this filter exists to handle. An explicit byte range has no
-- locale to be sensitive to.
local function url_encode(s)
  return (s:gsub("[^A-Za-z0-9%-%._~]", function(c)
    return string.format("%%%02X", c:byte())
  end))
end

-- ─── Formula translation: Carnap/Gamut ASCII → Unicode ────────────────────
-- Same conversion translate-widget.lua uses for the sibling translation app,
-- copied here so this filter has no cross-file dependency.

local function strip_wrapping_parens(s)
  s = trim(s)
  while s:sub(1, 1) == "(" and s:sub(-1) == ")" do
    local depth = 0
    local wraps_whole = true
    for i = 1, #s do
      local c = s:sub(i, i)
      if c == "(" then
        depth = depth + 1
      elseif c == ")" then
        depth = depth - 1
        if depth == 0 and i < #s then
          wraps_whole = false
          break
        end
      end
    end
    if wraps_whole then
      s = trim(s:sub(2, -2))
    else
      break
    end
  end
  return s
end

local function carnap_to_unicode(raw)
  local s = strip_wrapping_parens(raw)

  local iff_pos = s:find("<%->")
  if iff_pos then
    local left = strip_wrapping_parens(s:sub(1, iff_pos - 1))
    local right = strip_wrapping_parens(s:sub(iff_pos + 3))
    local left_u = carnap_to_unicode(left)
    local right_u = carnap_to_unicode(right)
    return "((" .. left_u .. "\u{2192}" .. right_u .. ")\u{2227}(" ..
      right_u .. "\u{2192}" .. left_u .. "))"
  end

  s = s:gsub("/\\", "\u{2227}")   -- /\  -> ∧
  s = s:gsub("\\/", "\u{2228}")   -- \/  -> ∨
  s = s:gsub("&", "\u{2227}")     -- &   -> ∧
  s = s:gsub("|", "\u{2228}")     -- |   -> ∨
  s = s:gsub("%-%>", "\u{2192}")  -- ->  -> →  (before the standalone '-' rule)
  s = s:gsub(">", "\u{2192}")     -- >   -> →
  s = s:gsub("~", "\u{00AC}")     -- ~   -> ¬
  s = s:gsub("%-", "\u{00AC}")    -- -   -> ¬  (negation prefix)

  return trim(s)
end

-- "!?" is Carnap's token for the absurdity formula reached by ¬E, i.e. ⊥.
local function formula_to_unicode(raw)
  local t = trim(raw)
  if t == "!?" then return "\u{22A5}" end
  return carnap_to_unicode(t)
end

-- ─── Justification translation: Carnap rule tags → app rule tags ──────────

local RULE_MAP = {
  ["rep"]  = "R",
  ["efsq"] = "EFSQ",
  ["--"]   = "DN",
  ["i/\\"] = "\u{2227}I",
  ["e/\\"] = "\u{2227}E",
  ["i->"]  = "\u{2192}I",
  ["i>"]   = "\u{2192}I",
  ["e->"]  = "\u{2192}E",
  ["e>"]   = "\u{2192}E",
  ["i\\/"] = "\u{2228}I",
  ["e\\/"] = "\u{2228}E",
  ["i-"]   = "\u{00AC}I",
  ["e-"]   = "\u{00AC}E",
}

-- "1,3" / "1, 3" -> "1, 3". "2-4" (or an en dash) -> "2-4". Left alone
-- otherwise (a bare line number, or already-clean text).
local function normalize_citation(s)
  s = trim(s)
  if s == "" then return "" end
  local a, b = s:match("^(%d+)%s*[%-\u{2013}]%s*(%d+)$")
  if a then return a .. "-" .. b end
  if s:find(",") then
    local parts = {}
    for part in s:gmatch("[^,]+") do
      table.insert(parts, trim(part))
    end
    return table.concat(parts, ", ")
  end
  return s
end

-- justification is everything after the line's " :", e.g. "assumption",
-- "rep 1", "I/\ 1,3", "E-> 2, 4". `nested` is true when the formula carried
-- leading whitespace (i.e. this line sits inside a subproof), which is what
-- decides whether a bare "assumption" becomes a premise (P) or a local
-- assumption (A).
local function translate_justification(justification, nested)
  local rule_token, citation = justification:match("^(%S+)%s*(.*)$")
  if not rule_token then return nil end
  citation = normalize_citation(citation or "")

  if rule_token:lower() == "assumption" then
    return nested and "A" or "P", ""
  end

  local mapped = RULE_MAP[rule_token] or RULE_MAP[rule_token:lower()]
  if not mapped then return nil end
  return mapped, citation
end

-- ─── Parsing the Carnap block ───────────────────────────────────────────--

-- "1. p, (p /\ q) > r, q :|-: r"  ->  "p, (p /\ q) > r, q", "r"
local function parse_sequent(line)
  local rest = line:match("^%s*%S+%.%s*(.*)$") or line
  local premises_str, conclusion_str = rest:match("^(.-)%s*:|%-:%s*(.*)$")
  if not conclusion_str then return nil end
  return trim(premises_str or ""), trim(conclusion_str)
end

-- Comma-split the premises list. Propositional/FOL formulas never contain a
-- literal comma, so a plain split is safe.
local function split_premises(s)
  local out = {}
  if trim(s) == "" then return out end
  for part in s:gmatch("[^,]+") do
    table.insert(out, formula_to_unicode(trim(part)))
  end
  return out
end

-- "|  p :assumption"  ->  leading_ws="  ", formula="p", justification="assumption"
local function parse_proof_line(line)
  if line:sub(1, 1) ~= "|" then return nil end
  local body = line:sub(2)
  local formula_part, justification = body:match("^(.-):%s*(.*)$")
  if not justification then return nil end
  local leading_ws = formula_part:match("^(%s*)")
  local formula = trim(formula_part)
  if formula == "" then return nil end
  return leading_ws, formula, trim(justification)
end

local function build_pr(text)
  local pr_lines = {}
  local first = true
  local premises_str, conclusion_str

  for raw_line in (text .. "\n"):gmatch("([^\n]*)\n") do
    local line = raw_line:gsub("%s+$", "")
    if first then
      if trim(line) ~= "" then
        premises_str, conclusion_str = parse_sequent(line)
        if not conclusion_str then return nil end
        first = false
      end
    elseif trim(line) ~= "" then
      local leading_ws, formula, justification = parse_proof_line(line)
      if not formula then return nil end
      local nested = leading_ws ~= ""
      local rule, citation = translate_justification(justification, nested)
      if not rule then return nil end
      local formula_u = formula_to_unicode(formula)
      local step = leading_ws .. formula_u .. " " .. rule
      if citation ~= "" then step = step .. " " .. citation end
      table.insert(pr_lines, step)
    end
  end

  if not conclusion_str or #pr_lines == 0 then return nil end

  local premises = split_premises(premises_str)
  return table.concat(premises, ", "), formula_to_unicode(conclusion_str),
    table.concat(pr_lines, "\n"), #pr_lines
end

-- ─── Filter entry point ────────────────────────────────────────────────--

function CodeBlock(block)
  if not has_class(block, "ProofChecker") then return nil end

  local premises, conclusion, pr, line_count = build_pr(block.text or "")
  if not pr then return nil end

  local parts = {}
  if premises ~= "" then
    table.insert(parts, "p=" .. url_encode(premises))
  end
  table.insert(parts, "c=" .. url_encode(conclusion))
  table.insert(parts, "pr=" .. url_encode(pr))

  local card = attr(block, "card", nil)
  local query = ""
  if card then
    query = "?card=" .. url_encode(card)
  end
  local src = PROOF_CHECKER_URL .. query .. "#" .. table.concat(parts, "&")

  local default_height
  if card == "verify" then
    default_height = VERIFY_BASE_HEIGHT + line_count * VERIFY_PER_LINE
    if default_height > VERIFY_MAX_HEIGHT then default_height = VERIFY_MAX_HEIGHT end
  else
    default_height = BASE_HEIGHT + math.max(0, line_count - BASELINE_LINES) * PER_EXTRA_LINE
    if default_height > MAX_HEIGHT then default_height = MAX_HEIGHT end
  end
  local height = attr(block, "height", tostring(default_height) .. "px")
  local width  = attr(block, "width", "100%")

  local title = "Proof: "
  if premises ~= "" then title = title .. premises .. " " end
  title = title .. "\u{22A2} " .. conclusion

  local html = table.concat({
    '<div class="proofchecker-embed"',
    ' style="margin: 0.4rem 0 0.5rem; width: 96%; margin-left: 2%;">',
    '<iframe src="' .. html_escape_attr(src) .. '"',
    ' style="width: ' .. html_escape_attr(width) ..
    '; height: ' .. html_escape_attr(height) ..
    '; border: 1px solid #ddd; border-radius: 4px; background: #fffff8;"',
    ' loading="lazy"',
    ' title="' .. html_escape_attr(title) .. '"',
    '></iframe>',
    '</div>',
  }, "")

  return pandoc.RawBlock("html", html)
end
