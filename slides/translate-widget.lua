--[[
translate-widget.lua

Pandoc/Quarto Lua filter for embedding the propositional-translation
practice app at https://gabriel-uzquiano.github.io/prop-translation/

Works on both pipelines used in this repo:
  - notes/*.md -> notes/*.html   via `pandoc --lua-filter slides/translate-widget.lua`
    (see scripts/convert_notes.sh)
  - slides/*.qmd                 via Quarto (add to the `filters:` list, same as
    carnap-widgets.lua / checker-widget.lua / truth-table-widgets.lua)

Only fires on `.Translate .Prop` blocks (propositional-logic translation
exercises). `.Translate .FOL` blocks (first-order/quantificational exercises,
used in notes/quantificational-translation.md and
notes/issues-with-translation.md) are left untouched - the app only supports
propositional logic and would mishandle quantifiers/predicates.

Each nonblank line of a `.Translate .Prop` code block is one translation
problem, in the same shape already used throughout notes/translation.md:

    <label>. <carnap-formula>: <English sentence>

Example:

    ```{.Translate .Prop system="gamutPND" submission="none"}
    1. p > q: If the British are coming by land, then Paul Revere should light two lamps
    ```

Multiple lines in one block become multiple sentences batched into a single
embedded card (numbered "Sentence 1", "Sentence 2", ... by the app itself).

The `<label>` is only there to match the numbering already used in the
surrounding prose; the app doesn't display it and the filter ignores its value.

Formula syntax: this filter accepts the Carnap/Gamut ASCII the notes already
use - `-` (negation), `/\` (and), `\/` (or), `&` (and), `|` (or), `>` (conditional),
and `<->` (biconditional) - and converts it to the Unicode the app's parser
expects (¬ ∧ ∨ →). The app's parser rejects `<->`/↔ outright ("not a connective
of propositional logic in this course"), so `<->` is expanded into the
conjunction of two conditionals per the course's own definition:
  (phi <-> psi) := (phi -> psi) /\ (psi -> phi)

Optional attributes:
  width      CSS width, e.g. "100%" (default)
  height     CSS height override, e.g. "600px" (default is computed from the
             number of sentences)
--]]

local TRANSLATE_URL = "https://gabriel-uzquiano.github.io/prop-translation/"

local BASE_HEIGHT = 500
local PER_EXTRA_SENTENCE = 280

local B64_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

local function has_class(block, name)
  for _, c in ipairs(block.classes) do
    if c == name then return true end
  end
  return false
end

local function attr(block, key, default)
  local value = block.attributes[key]
  if value == nil or value == "" then return default end
  return value
end

local function html_escape_attr(s)
  return (s:gsub("&", "&amp;")
           :gsub('"', "&quot;")
           :gsub("<", "&lt;")
           :gsub(">", "&gt;"))
end

local function b64encode(s)
  local out = {}
  local i = 1

  while i <= #s do
    local b1 = s:byte(i)
    local b2 = i + 1 <= #s and s:byte(i + 1) or nil
    local b3 = i + 2 <= #s and s:byte(i + 2) or nil

    local n1 = math.floor(b1 / 4)
    local n2 = (b1 % 4) * 16 + (b2 and math.floor(b2 / 16) or 0)
    local n3 = b2 and ((b2 % 16) * 4 + (b3 and math.floor(b3 / 64) or 0)) or nil
    local n4 = b3 and (b3 % 64) or nil

    table.insert(out, B64_CHARS:sub(n1 + 1, n1 + 1))
    table.insert(out, B64_CHARS:sub(n2 + 1, n2 + 1))
    table.insert(out, n3 and B64_CHARS:sub(n3 + 1, n3 + 1) or "=")
    table.insert(out, n4 and B64_CHARS:sub(n4 + 1, n4 + 1) or "=")

    i = i + 3
  end

  return table.concat(out)
end

-- Minimal UTF-8-safe JSON string encoder (input is already UTF-8 text; we
-- only need to escape the JSON metacharacters, not re-encode codepoints).
local function json_string(s)
  local escaped = s:gsub("\\", "\\\\")
                   :gsub('"', '\\"')
                   :gsub("\n", "\\n")
                   :gsub("\r", "\\r")
                   :gsub("\t", "\\t")

  return '"' .. escaped .. '"'
end

local function trim(s)
  return s:match("^%s*(.-)%s*$")
end

-- Strip one layer of enclosing parens, if the parens actually wrap the whole
-- string (balanced, and the first ")" that closes them is the last char).
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

-- Convert Carnap/Gamut ASCII connectives to the Unicode symbols the
-- prop-translation app's parser accepts, expanding "<->" into a conjunction
-- of two conditionals since the app's parser rejects the biconditional
-- symbol outright.
local function carnap_to_unicode(raw)
  local s = strip_wrapping_parens(raw)

  local iff_pos = s:find("<%->")
  if iff_pos then
    local left = strip_wrapping_parens(s:sub(1, iff_pos - 1))
    local right = strip_wrapping_parens(s:sub(iff_pos + 3))
    local left_u = carnap_to_unicode(left)
    local right_u = carnap_to_unicode(right)
    return "((" .. left_u .. "\xe2\x86\x92" .. right_u .. ")\xe2\x88\xa7(" ..
      right_u .. "\xe2\x86\x92" .. left_u .. "))"
  end

  s = s:gsub("/\\", "\xe2\x88\xa7")  -- /\  -> ∧
  s = s:gsub("\\/", "\xe2\x88\xa8")  -- \/  -> ∨
  s = s:gsub("&", "\xe2\x88\xa7")    -- &   -> ∧
  s = s:gsub("|", "\xe2\x88\xa8")    -- |   -> ∨
  -- "->" is one token (some notes files use it instead of bare '>' for the
  -- conditional) - must convert it before the standalone '-' and '>' rules
  -- below, or the '-' would wrongly also become a negation.
  s = s:gsub("%-%>", "\xe2\x86\x92")  -- ->  -> →
  s = s:gsub(">", "\xe2\x86\x92")    -- >   -> →
  s = s:gsub("~", "\xc2\xac")        -- ~   -> ¬
  s = s:gsub("-", "\xc2\xac")        -- -   -> ¬

  return trim(s)
end

-- Parse "<label>. <formula>: <sentence>" - only the first ":" is
-- structurally significant (the formula never contains one), so a lazy
-- match up to it is safe even if the sentence text itself contains a colon.
local function parse_line(line)
  local rest = line:match("^%S+%.%s+(.*)$")
  if not rest then return nil end

  local formula, sentence = rest:match("^(.-):%s+(.*)$")
  if not formula or not sentence then return nil end

  formula = trim(formula)
  sentence = trim(sentence)
  if formula == "" or sentence == "" then return nil end

  return formula, sentence
end

local function sentences_from_block(text)
  local sentences = {}

  for line in (text .. "\n"):gmatch("(.-)\n") do
    local trimmed = trim(line)
    if trimmed ~= "" then
      local formula, sentence = parse_line(trimmed)
      if formula and sentence then
        table.insert(sentences, {
          text = sentence,
          formula = carnap_to_unicode(formula),
        })
      end
    end
  end

  return sentences
end

local function build_hash(sentences)
  local sentence_parts = {}
  local trans_parts = {}

  for _, item in ipairs(sentences) do
    table.insert(sentence_parts,
      '{"text":' .. json_string(item.text) ..
      ',"refFormula":' .. json_string(item.formula) ..
      ',"refAtoms":[]}')
    table.insert(trans_parts, '{"formula":""}')
  end

  local json = '{"sentences":[' .. table.concat(sentence_parts, ",") .. ']' ..
    ',"wsAtoms":[{"letter":"","clause":""}]' ..
    ',"trans":[' .. table.concat(trans_parts, ",") .. ']}'

  return "v1:" .. b64encode(json)
end

local function iframe_html(src, width, height, title)
  return table.concat({
    '<div class="translate-embed"',
    ' style="margin: 0.4rem 0 0.5rem; width: 92%; margin-left: 4%;">',
    '<iframe src="' .. html_escape_attr(src) .. '"',
    ' style="width: ' .. html_escape_attr(width) ..
    '; height: ' .. html_escape_attr(height) ..
    '; border: 1px solid #ddd; border-radius: 4px; background: #fffff8;"',
    ' loading="lazy"',
    ' title="' .. html_escape_attr(title) .. '"',
    '></iframe>',
    '</div>',
  }, "")
end

function CodeBlock(block)
  if not (has_class(block, "Translate") and has_class(block, "Prop")) then
    return nil
  end

  local sentences = sentences_from_block(block.text or "")
  if #sentences == 0 then
    return nil
  end

  local width = attr(block, "width", "100%")
  local default_height = BASE_HEIGHT + (#sentences - 1) * PER_EXTRA_SENTENCE
  local height = attr(block, "height", tostring(default_height) .. "px")

  local hash = build_hash(sentences)
  local src = TRANSLATE_URL .. "?card=translation#" .. hash
  local title = "Translation exercise"
  if #sentences > 1 then
    title = title .. "s"
  end

  local html = iframe_html(src, width, height, title)
  return pandoc.RawBlock("html", html)
end
