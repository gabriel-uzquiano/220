--[[
carnap-widgets.lua

Quarto/Pandoc Lua filter that turns Carnap-style code blocks into interactive
widgets, in-place during rendering. Mirrors the behavior of scripts/carnap_to_mc.py
but runs as part of Quarto so you can drop the block into any .qmd and get a
working exercise on `quarto render`, no post-processing step needed.

Blocks handled:

    ```{.QualitativeProblem .MultipleSelection options="check" submission="none"}
    A.
    | wrong option
    |* correct option        (also accepts |+ for correctness)
    | wrong option
    Explanation: optional prose, can span multiple lines
      and continue below.
    ```

Also handled: `.QualitativeProblem` alone (single-select radio).

Assets: CSS + JS are injected once per document via Pandoc metadata
(`header-includes` and `include-after`), so multiple exercises share one copy.
--]]

local seen_mc = false
local mc_counter = 0

-- ─── Assets (single copy per document) ──────────────────────────────────────

local MC_CSS = [[
<style>
.mc-exercise { margin: 1.2rem 0 2rem; width: 55%; margin-left: 8%; }
.mc-question { margin-bottom: 0.7rem; font-size: 1.4rem; line-height: 2rem; }
.mc-options { display: flex; flex-direction: column; gap: 0.4rem; margin-bottom: 0.8rem; }
.mc-option { display: flex; align-items: baseline; gap: 0.6rem; cursor: pointer; font-size: 1.3rem; line-height: 1.7rem; }
.mc-option input { margin: 0; flex-shrink: 0; }
.mc-controls { display: flex; gap: 0.6rem; margin-bottom: 0.5rem; }
.btn-check, .btn-reveal {
  font-family: Gill Sans, Gill Sans MT, Calibri, sans-serif;
  font-size: 0.82rem; padding: 0.22rem 0.7rem;
  border-radius: 3px; cursor: pointer; border: 1px solid #ccc;
  background: #fffff8; color: #111;
}
.btn-check:hover { background: #006666; color: #fff; border-color: #006666; }
.mc-feedback { font-family: Gill Sans, Gill Sans MT, Calibri, sans-serif; font-size: 0.9rem; margin-bottom: 0.3rem; }
.fb-ok { color: #1a6e2e; } .fb-err { color: #8b1a1a; }
.mc-answer { font-family: Gill Sans, Gill Sans MT, Calibri, sans-serif; font-size: 0.88rem; color: #555; margin-top: 0.3rem; }
.mc-explanation { margin-top: 0.4rem; font-family: et-book, Palatino, serif; font-size: 1.2rem; line-height: 1.7rem; color: #333; }
</style>
]]

local MC_JS = [[
<script>
function checkMC(btn) {
  var ex = btn.closest('.mc-exercise');
  var correct = JSON.parse(ex.dataset.correct);
  var multi = ex.dataset.multi === "true";
  var feedback = ex.querySelector('.mc-feedback');
  feedback.removeAttribute('hidden');
  if (multi) {
    var checked = Array.from(ex.querySelectorAll('input[type=checkbox]:checked')).map(function(c){ return parseInt(c.value); });
    var ok = correct.length === checked.length && correct.every(function(v){ return checked.includes(v); });
    feedback.textContent = ok ? '✓ Correct.' : '✗ Not quite — try again.';
    feedback.className = 'mc-feedback ' + (ok ? 'fb-ok' : 'fb-err');
  } else {
    var selected = ex.querySelector('input[type=radio]:checked');
    if (!selected) { feedback.textContent = 'Please select an option.'; feedback.className = 'mc-feedback'; return; }
    var ok = correct.includes(parseInt(selected.value));
    feedback.textContent = ok ? '✓ Correct.' : '✗ Not quite — try again.';
    feedback.className = 'mc-feedback ' + (ok ? 'fb-ok' : 'fb-err');
  }
}
function revealMC(btn) {
  var ex = btn.closest('.mc-exercise');
  var ans = ex.querySelector('.mc-answer');
  ans.removeAttribute('hidden');
  if (window.MathJax) {
    if (MathJax.typesetPromise) { MathJax.typesetPromise([ans]); }
    else if (MathJax.Hub && MathJax.Hub.Queue) { MathJax.Hub.Queue(['Typeset', MathJax.Hub, ans]); }
  }
}
</script>
]]

-- ─── Helpers ────────────────────────────────────────────────────────────────

local function has_class(block, name)
  for _, c in ipairs(block.classes) do
    if c == name then return true end
  end
  return false
end

local function html_escape(s)
  return (s:gsub("&", "&amp;")
           :gsub("<", "&lt;")
           :gsub(">", "&gt;")
           :gsub('"', "&quot;")
           :gsub("'", "&#39;"))
end

-- Render a snippet of inline markdown (with $...$ math) to inline HTML using
-- Pandoc's own reader. This gives us MathJax-ready \(...\) automatically.
local function inline_md_to_html(text)
  if not text or text == "" then return "" end
  local doc = pandoc.read(text, "markdown+tex_math_dollars")
  -- doc.blocks is a list; usually a single Para. Pull its inlines out so we
  -- don't wrap the explanation in an extra <p>.
  local inlines = {}
  for _, blk in ipairs(doc.blocks) do
    if blk.t == "Para" or blk.t == "Plain" then
      for _, il in ipairs(blk.content) do table.insert(inlines, il) end
    else
      -- fall back: just write the block as-is
      return pandoc.write(pandoc.Pandoc({blk}), "html5", { html_math_method = "mathjax" })
    end
  end
  return pandoc.write(pandoc.Pandoc({pandoc.Plain(inlines)}), "html5", { html_math_method = "mathjax" })
end

-- ─── Parser: Carnap pipe format ────────────────────────────────────────────

local function parse_carnap(text)
  local options = {}
  local explanation_lines = {}
  local in_explanation = false
  local label = nil

  for line in (text .. "\n"):gmatch("([^\n]*)\n") do
    local s = line:match("^%s*(.-)%s*$")   -- trim
    if in_explanation then
      table.insert(explanation_lines, s)
    else
      local expl = s:match("^Explanation:%s*(.*)$")
      if expl ~= nil then
        in_explanation = true
        if expl ~= "" then table.insert(explanation_lines, expl) end
      elseif s == "" then
        -- skip
      elseif not label and s:match("^[A-Za-z0-9]+%.%s*$") then
        label = s:gsub("%.$", "")
      elseif s:sub(1, 2) == "|*" or s:sub(1, 2) == "|+" then
        table.insert(options, { text = s:sub(3):match("^%s*(.-)%s*$"), correct = true })
      elseif s:sub(1, 1) == "|" then
        local t = s:sub(2):match("^%s*(.-)%s*$")
        if t ~= "" then
          table.insert(options, { text = t, correct = false })
        end
      end
    end
  end

  -- join explanation lines, preserving blank-line paragraph breaks
  local expl = table.concat(explanation_lines, "\n"):match("^%s*(.-)%s*$")
  return label or "", options, expl
end

-- ─── Widget rendering ──────────────────────────────────────────────────────

local function make_widget(label, options, multi, explanation)
  mc_counter = mc_counter + 1
  local idx = mc_counter
  local name = "ex_" .. idx

  local correct_indices = {}
  local correct_texts = {}
  for i, o in ipairs(options) do
    if o.correct then
      table.insert(correct_indices, tostring(i - 1))
      table.insert(correct_texts, html_escape(o.text))
    end
  end
  local correct_json = "[" .. table.concat(correct_indices, ",") .. "]"
  local answer_str = table.concat(correct_texts, "; ")

  local input_type = multi and "checkbox" or "radio"
  local opts_html = {}
  for i, o in ipairs(options) do
    table.insert(opts_html, string.format(
      '<label class="mc-option"><input type="%s" name="%s_%d" value="%d"><span>%s</span></label>',
      input_type, name, i - 1, i - 1, html_escape(o.text)
    ))
  end

  local explanation_html = ""
  if explanation and explanation ~= "" then
    explanation_html = '<div class="mc-explanation">' .. inline_md_to_html(explanation) .. '</div>'
  end

  local multi_attr = multi and ' data-multi="true"' or ""

  return table.concat({
    string.format('<div class="mc-exercise" data-correct=\'%s\'%s>', correct_json, multi_attr),
    '  <div class="mc-options">',
    '    ' .. table.concat(opts_html, "\n    "),
    '  </div>',
    '  <div class="mc-controls">',
    '    <button class="btn-check" onclick="checkMC(this)">Check</button>',
    '    <button class="btn-reveal" onclick="revealMC(this)">Show answer</button>',
    '  </div>',
    '  <div class="mc-feedback" hidden></div>',
    string.format('  <div class="mc-answer" hidden><strong>Answer:</strong> %s%s</div>',
                  answer_str,
                  explanation_html ~= "" and ("<br><br>" .. explanation_html) or ""),
    '</div>',
  }, "\n")
end

-- ─── Pandoc filter entry points ────────────────────────────────────────────

function CodeBlock(block)
  if not has_class(block, "QualitativeProblem") then return nil end
  local multi = has_class(block, "MultipleSelection")
  local _, options, explanation = parse_carnap(block.text)
  if #options == 0 then return nil end

  local html = make_widget(_, options, multi, explanation)

  -- On the first occurrence, prepend the CSS/JS as raw HTML blocks in-flow.
  -- Reveal.js is fine with a <style>/<script> block appearing at the start of
  -- the surrounding section; the CSS applies globally and the JS defines the
  -- checkMC/revealMC handlers used by every subsequent widget.
  if not seen_mc then
    seen_mc = true
    return {
      pandoc.RawBlock("html", MC_CSS),
      pandoc.RawBlock("html", MC_JS),
      pandoc.RawBlock("html", html),
    }
  end
  return pandoc.RawBlock("html", html)
end
