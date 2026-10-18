--[[
ql-checker-widget.lua

Quarto/Pandoc Lua filter. Turns `.QLFormulaChecker` code blocks into an
iframe embedding of the quantificational formula checker at
    https://gabriel-uzquiano.github.io/ql-formula-checker/

Like checker-widget.lua (propositional), the initial formula is passed in
the hash (#v1: + base64 JSON {"f": ...}) and `?card=` selects what to show.

    ```{.QLFormulaChecker}
    ∀x(Px → ∃y Qxy)
    ```

Attributes (all optional):

    card    — one of:
                "formula"    (default) input + parse tree (View / Build).
                             Build walks students through the tree, then
                             Step 2 (free & bound occurrences) and
                             Step 3 (open or closed?).
                "tree"       read-only parse tree, no input.
                "tree-vars"  parse tree + free/bound panel, no input.
                "full"       the whole app, including the Variables card
                             that reports free variables / open vs closed.
    height  — CSS height (default depends on card)
    width   — CSS width  (default "100%")

ASCII is accepted in the block body (A/E for quantifiers, ~ & | ->);
the app converts it on load.
--]]

local CHECKER_URL = "https://gabriel-uzquiano.github.io/ql-formula-checker/"

local DEFAULT_HEIGHTS = {
  ["formula"]   = "620px",
  ["tree"]      = "400px",
  ["tree-vars"] = "560px",
  ["full"]      = "640px",
}

local function has_class(block, name)
  for _, c in ipairs(block.classes) do
    if c == name then return true end
  end
  return false
end

local function esc(s)
  return (s:gsub("&", "&amp;"):gsub('"', "&quot;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function b64encode(s)
  local out, n, i = {}, #s, 1
  while i <= n do
    local b1, b2, b3 = s:byte(i), s:byte(i + 1), s:byte(i + 2)
    local n1 = b1 // 4
    local n2 = (b1 % 4) * 16 + (b2 and b2 // 16 or 0)
    local n3 = b2 and ((b2 % 16) * 4 + (b3 and b3 // 64 or 0)) or nil
    local n4 = b3 and (b3 % 64) or nil
    out[#out + 1] = B64:sub(n1 + 1, n1 + 1)
    out[#out + 1] = B64:sub(n2 + 1, n2 + 1)
    out[#out + 1] = n3 and B64:sub(n3 + 1, n3 + 1) or "="
    out[#out + 1] = n4 and B64:sub(n4 + 1, n4 + 1) or "="
    i = i + 3
  end
  return table.concat(out)
end

local function json_string(s)
  return '"' .. s:gsub("\\", "\\\\"):gsub('"', '\\"'):gsub("\n", " "):gsub("\r", ""):gsub("\t", " ") .. '"'
end

local function attr(block, key, default)
  local v = block.attributes[key]
  if v == nil or v == "" then return default end
  return v
end

function CodeBlock(block)
  if not has_class(block, "QLFormulaChecker") then return nil end
  local formula = (block.text or ""):match("^%s*(.-)%s*$")
  if formula == "" then return nil end

  local card = attr(block, "card", "formula")
  if not DEFAULT_HEIGHTS[card] then card = "formula" end
  local height = attr(block, "height", DEFAULT_HEIGHTS[card])
  local width  = attr(block, "width", "100%")

  local hash = "v1:" .. b64encode('{"f":' .. json_string(formula) .. '}')
  -- "full" = no card param: the complete app, including the Variables card.
  local query = (card == "full") and "" or ("?card=" .. card)
  local src = CHECKER_URL .. query .. "#" .. hash

  return pandoc.RawBlock("html", table.concat({
    '<div class="checker-embed" style="margin: 0.4rem 0 0.5rem; width: 92%; margin-left: 4%;">',
    '<iframe src="', esc(src), '"',
    ' style="width: ', esc(width), '; height: ', esc(height),
    '; border: 1px solid #ddd; border-radius: 4px; background: #fffff8;"',
    ' loading="lazy" title="QL formula checker (', esc(card), ')"></iframe>',
    '</div>',
  }))
end
