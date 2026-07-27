"""
Post-process pandoc-generated HTML to replace Carnap exercise blocks
with interactive MC widgets matching the USC Logic Web Unit I style.
"""
import re
import sys
from html import escape

MC_JS = """
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
}
</script>
"""

MC_CSS = """
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
</style>
"""

def parse_carnap_block(label, lines, multi):
    """
    Parse Carnap pipe-format options.
    |* option  -> correct
    | option   -> incorrect
    Returns (options: list of (text, is_correct))
    """
    options = []
    for line in lines:
        line = line.strip()
        if not line or line == label + '.':
            continue
        if line.startswith('|*'):
            text = line[2:].strip()  # strip |* with or without space
            options.append((text, True))
        elif line.startswith('|'):
            text = line[1:].strip()
            if text:
                options.append((text, False))
    return options

counter = [0]

def make_widget(label, options, multi, context_question=None):
    counter[0] += 1
    idx = counter[0]
    name = f"ex_{idx}"
    correct = [i for i, (_, c) in enumerate(options) if c]
    correct_json = str(correct).replace(" ", "")
    multi_attr = 'data-multi="true"' if multi else ''
    
    opts_html = []
    for i, (text, _) in enumerate(options):
        input_type = "checkbox" if multi else "radio"
        opts_html.append(
            f'<label class="mc-option">'
            f'<input type="{input_type}" name="{name}_{i}" value="{i}">'
            f'<span>{escape(text)}</span></label>'
        )
    
    correct_texts = [escape(options[i][0]) for i in correct]
    answer_str = "; ".join(correct_texts)
    
    question_html = ""
    if context_question:
        question_html = f'<div class="mc-question">{escape(context_question)}</div>'
    
    return (
        f'<div class="mc-exercise" data-correct=\'{correct_json}\' {multi_attr}>\n'
        f'  {question_html}\n'
        f'  <div class="mc-options">\n    ' + "\n    ".join(opts_html) + '\n  </div>\n'
        f'  <div class="mc-controls">\n'
        f'    <button class="btn-check" onclick="checkMC(this)">Check</button>\n'
        f'    <button class="btn-reveal" onclick="revealMC(this)">Show answer</button>\n'
        f'  </div>\n'
        f'  <div class="mc-feedback" hidden></div>\n'
        f'  <div class="mc-answer" hidden><strong>Answer:</strong> {answer_str}</div>\n'
        f'</div>'
    )

def transform(html):
    # Regex to find <pre class="QualitativeProblem ..."><code>...</code></pre>
    pattern = re.compile(
        r'<pre[^>]*class="([^"]*QualitativeProblem[^"]*)"[^>]*><code>(.*?)</code></pre>',
        re.DOTALL
    )
    
    def replace_block(m):
        classes = m.group(1)
        raw = m.group(2)
        multi = "MultipleSelection" in classes
        
        # Decode HTML entities in raw content
        raw = raw.replace('&amp;', '&').replace('&lt;', '<').replace('&gt;', '>').replace('&#39;', "'").replace('&quot;', '"')
        
        lines = raw.split('\n')
        # First line is the label (e.g. "1." or "A.")
        label = lines[0].strip().rstrip('.') if lines else ''
        options = parse_carnap_block(label, lines[1:], multi)
        
        if not options:
            return m.group(0)  # leave unchanged if parsing fails
        
        return make_widget(label, options, multi)
    
    result = pattern.sub(replace_block, html)
    
    # Inject CSS and JS before </head>
    result = result.replace('</head>', MC_CSS + '\n</head>', 1)
    # Inject JS before </body>
    result = result.replace('</body>', MC_JS + '\n</body>', 1)
    
    return result

if __name__ == "__main__":
    src = sys.argv[1]
    dst = sys.argv[2]
    with open(src, 'r') as f:
        html = f.read()
    out = transform(html)
    with open(dst, 'w') as f:
        f.write(out)
    print(f"Done: {dst}")
