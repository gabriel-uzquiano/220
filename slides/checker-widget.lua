--[[
checker-widget.lua

Quarto/Pandoc Lua filter. Turns Carnap-style code blocks into an iframe
embedding of the propositional formula checker at
    https://gabriel-uzquiano.github.io/prop-formula-checker/

The checker supports a `?card=<mode>` query param that hides all but the
requested card — designed for slide embedding. The initial formula is
passed in via the hash (v1: + base64 JSON), the same encoding the app uses
for its own copy-link feature.

Blocks handled:

    ```{.FormulaChecker}
    (p ∧ (q → ¬r))
    ```

Optional attributes on the block (all optional):

    card    — which cards to show. One of:
                "formula"          (default: input + parse status + tree tabs)
                "assign"           (assignment + tree, no formula input)
                "formula,assign"   (everything: input, tree, and evaluator)
                "tree"             (parse-tree View only, read-only)
    height  — CSS height, e.g. "420px" (default varies by card)
    width   — CSS width, e.g. "100%"   (default "100%")

Example with all attributes:

    ```{.FormulaChecker card="tree" height="520px"}
    ((p ∨ q) → ¬r)
    ```

The filter emits a raw HTML <iframe> pointed at the live GitHub Pages copy
of the app. No JS, no CSS, no shared assets — the app carries its own.
--]]

-- Base URL of the deployed checker. The trailing slash matters.
local CHECKER_URL = "https://gabriel-uzquiano.github.io/prop-formula-checker/"

-- Per-card default iframe heights (px). Tuned so the widget fits inside a
-- reveal.js content area at the default 1100x750 slide size without
-- clipping or leaving a lot of empty scroll space.
-- Reveal.js content area at the default 1100x750 slide size is about 640px
-- tall after the header. These defaults fill the frame without clipping the
-- interactive controls at the bottom.
local DEFAULT_HEIGHTS = {
  -- Formula input + examples row + parse-tree tabs (View / Build).
  ["formula"]        = "620px",
  -- Parse tree Build tab + evaluator (no formula input).
  ["assign"]         = "620px",
  -- Full: formula input + tree + evaluator. Taller than a single slide;
  -- caller usually wants to reduce with a per-block height=.
  ["formula,assign"] = "640px",
  -- Read-only parse tree only; scales with formula depth.
  ["tree"]           = "400px",
}

-- ─── Helpers ────────────────────────────────────────────────────────────────

local function has_class(block, name)
  for _, c in ipairs(block.classes) do
    if c == name then return true end
  end
  return false
end

local function html_escape_attr(s)
  return (s:gsub("&", "&amp;")
           :gsub('"', "&quot;")
           :gsub("<", "&lt;")
           :gsub(">", "&gt;"))
end

-- Minimal, dependency-free base64 encoder for the checker's `#v1:` hash format.
-- The app decodes with `atob(unescape(encodeURIComponent(json)))`, so we need
-- to feed it standard base64 of the UTF-8 bytes of the JSON string.
local B64_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function b64encode(s)
  local out = {}
  local n = #s
  local i = 1
  while i <= n do
    local b1 = s:byte(i)
    local b2 = i + 1 <= n and s:byte(i + 1) or nil
    local b3 = i + 2 <= n and s:byte(i + 2) or nil
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

-- JSON-encode a string with the small set of escapes we actually need.
local function json_string(s)
  local esc = s:gsub("\\", "\\\\")
               :gsub('"', '\\"')
               :gsub("\n", "\\n")
               :gsub("\r", "\\r")
               :gsub("\t", "\\t")
  return '"' .. esc .. '"'
end

-- Grab a key=value attribute from a Pandoc block's `.attributes` table,
-- returning `default` if absent or empty.
local function attr(block, key, default)
  local v = block.attributes[key]
  if v == nil or v == "" then return default end
  return v
end

-- ─── Filter entry point ────────────────────────────────────────────────────

function CodeBlock(block)
  if not has_class(block, "FormulaChecker") then return nil end

  local formula = (block.text or ""):match("^%s*(.-)%s*$")
  if formula == "" then return nil end

  local card = attr(block, "card", "formula")
  -- The app validates the card param against a fixed set; keep us honest.
  local valid_cards = {
    formula = true,
    assign = true,
    ["formula,assign"] = true,
    tree = true,
  }
  if not valid_cards[card] then card = "formula" end

  local height = attr(block, "height", DEFAULT_HEIGHTS[card] or "360px")
  local width  = attr(block, "width",  "100%")

  local json    = '{"f":' .. json_string(formula) .. '}'
  local hash    = "v1:" .. b64encode(json)
  local src     = CHECKER_URL .. "?card=" .. card .. "#" .. hash

  -- The wrapper div centers the iframe and gives it a slide-friendly max
  -- width consistent with the mc-exercise widgets. Tight top margin so a
  -- taller iframe still fits below the slide title on a 1100x750 canvas.
  local html = table.concat({
    '<div class="checker-embed"',
    ' style="margin: 0.4rem 0 0.5rem; width: 92%; margin-left: 4%;">',
    '<iframe src="' .. html_escape_attr(src) .. '"',
    ' style="width: ' .. html_escape_attr(width) ..
    '; height: ' .. html_escape_attr(height) ..
    '; border: 1px solid #ddd; border-radius: 4px; background: #fffff8;"',
    ' loading="lazy"',
    ' title="Formula checker (' .. html_escape_attr(card) .. ')"',
    '></iframe>',
    '</div>',
  }, "")

  return pandoc.RawBlock("html", html)
end
