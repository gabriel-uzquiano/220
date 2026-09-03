--[[
truth-table-widgets.lua

Quarto/Pandoc Lua filter for embedding the propositional truth-table builder.
Use one lowercase propositional formula per nonblank line.

Build-only card:
  card="table"      exactly one formula; shows only the table-building interface
  solved="true"     optional; fills the table and makes it read-only

Evaluation modes:
  tautology          exactly one formula
  equivalence        exactly two formulas
  consistency        one or more formulas
  validity           premises followed by conclusion; the final formula is conclusion

Examples:

    ```{.TruthTable card="table"}
    (p -> q)
    ```

    ```{.TruthTable card="table" solved="true"}
    (p -> q)
    ```

    ```{.TruthTable mode="validity"}
    (p -> q)
    p
    q
    ```

Optional attributes:
  card       "table" for the build-only card
  solved     "true" to show a completed build-only table
  mode/type  tautology, equivalence, consistency, validity
  autorun    "true" to show an evaluated result automatically
  height     CSS height, e.g. "600px"
  width      CSS width, e.g. "100%"
--]]

local TRUTH_TABLE_URL = "https://gabriel-uzquiano.github.io/prop-truth-table/"

local DEFAULT_HEIGHTS = {
  table = "560px",
  tautology = "560px",
  equivalence = "580px",
  consistency = "590px",
  validity = "600px",
}

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

local function json_string(s)
  local escaped = s:gsub("\\", "\\\\")
                   :gsub('"', '\\"')
                   :gsub("\n", "\\n")
                   :gsub("\r", "\\r")
                   :gsub("\t", "\\t")

  return '"' .. escaped .. '"'
end

local function formulas_from_block(text)
  local formulas = {}

  for line in (text .. "\n"):gmatch("(.-)\n") do
    local formula = line:match("^%s*(.-)%s*$")
    if formula ~= "" then
      table.insert(formulas, formula)
    end
  end

  return formulas
end

local function json_string_array(items)
  local encoded = {}

  for _, item in ipairs(items) do
    table.insert(encoded, json_string(item))
  end

  return "[" .. table.concat(encoded, ",") .. "]"
end

local function iframe_html(src, width, height, title)
  return table.concat({
    '<div class="truth-table-embed"',
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
  if not has_class(block, "TruthTable") then
    return nil
  end

  local formulas = formulas_from_block(block.text or "")
  if #formulas == 0 then
    return nil
  end

  local card = attr(block, "card", "")
  local width = attr(block, "width", "100%")

  -- Build-only mode: no Formulas or Check cards; one formula only.
  if card == "table" then
    if #formulas ~= 1 then
      return nil
    end

    local height = attr(block, "height", DEFAULT_HEIGHTS.table)
    local solved = attr(block, "solved", "false") == "true"
    local json = '{"build":' .. json_string(formulas[1]) .. '}'
    local hash = "v1:" .. b64encode(json)
    local query = "?card=table"

    if solved then
      query = query .. "&solved=1"
    end

    local src = TRUTH_TABLE_URL .. query .. "#" .. hash
    local html = iframe_html(src, width, height, "Truth-table construction exercise")
    return pandoc.RawBlock("html", html)
  end

  local mode = attr(block, "mode", attr(block, "type", "consistency"))
  local valid_modes = {
    tautology = true,
    equivalence = true,
    consistency = true,
    validity = true,
  }

  if not valid_modes[mode] then
    mode = "consistency"
  end

  if mode == "tautology" and #formulas ~= 1 then
    return nil
  end

  if mode == "equivalence" and #formulas ~= 2 then
    return nil
  end

  if mode == "validity" and #formulas < 2 then
    return nil
  end

  local height = attr(block, "height", DEFAULT_HEIGHTS[mode] or "580px")
  local autorun = attr(block, "autorun", "false") == "true"
  local json = '{"formulas":' .. json_string_array(formulas) .. '}'
  local hash = "v1:" .. b64encode(json)
  local query = "?mode=" .. mode

  if autorun then
    query = query .. "&autorun=1"
  end

  local src = TRUTH_TABLE_URL .. query .. "#" .. hash
  local html = iframe_html(src, width, height, "Truth-table exercise: " .. mode)
  return pandoc.RawBlock("html", html)
end
