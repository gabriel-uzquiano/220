# PHIL 220 — slide workflow for the semester

A working guide for turning each session's notes into a deck, publishing it, and
projecting it. Written for Fall 2026, but nothing here is term-specific.

---

## 1. The map: what lives where

You have four distinct things in play. Keeping them straight is most of the
battle.

| Thing | Where it lives | Public address |
| --- | --- | --- |
| **Course website** (schedule, policies) | `gabriel-uzquiano.github.io` repo, `courses/220.md` | `gabriel-uzquiano.github.io/courses/220` |
| **Lecture notes** (source of truth) | `gabriel-uzquiano/220` repo, `notes/*.md` | `gabriel-uzquiano.github.io/220/notes/<slug>.html` |
| **Slides** | `gabriel-uzquiano/220` repo, `slides/*.qmd` — *proposed, see §2* | `gabriel-uzquiano.github.io/220/slides/<slug>.html` |
| **Truth-table app** | `gabriel-uzquiano/prop-truth-table` repo | `gabriel-uzquiano.github.io/prop-truth-table/` |

The notes are the source of truth. Slides are a *performance* of the notes —
shorter, one idea per screen, no exercise blocks. When the two disagree, fix the
notes first and re-derive the slide.

### The nineteen slugs

Notes and slides share one filename per session, so a session's two URLs differ
only in the directory. The full list, in schedule order:

```
arguments                                    truth-tables
validity-and-form                            validity
formal-languages                             translation
syntax                                       complex-translation
natural-deduction-conjunction                natural-deduction-conditional-disjunction
natural-deduction-negation                   propositional-validity
quantificational-basic-language              quantificational-translation
issues-with-translation                      models
quantificational-validity                    natural-deduction-quantification
common-mistakes-and-strategies
```

No numeric prefixes. That was deliberate: session numbers move when the calendar
shifts, and a renamed file breaks every link a student has bookmarked. The
*schedule* carries the numbering; the *files* carry the topic.

---

## 2. Recommendation: put the slides in the notes repo

The three finished decks now live in a `slides/` directory inside
`gabriel-uzquiano/220`, next to `notes/`:

```
220/
├── notes/                       # .md source + .html built by CI
├── slides/
│   ├── _quarto.yml              # one project, shared reveal.js assets
│   ├── custom.scss              # the house style — one copy, all decks
│   ├── index.html               # landing page listing the decks
│   ├── site_libs/               # reveal.js runtime, shared by every deck
│   ├── arguments-slides.qmd     # source ─┐
│   ├── arguments-slides.html    # build   ─┘ side by side
│   ├── validity-and-form-slides.qmd
│   ├── validity-and-form-slides.html
│   ├── formal-languages-slides.qmd
│   └── formal-languages-slides.html
├── scripts/
└── shared/
```

Why one repo rather than two:

- **One deploy.** The repo already publishes to GitHub Pages, and `.nojekyll` is
  already in place, so `slides/*.html` is served the moment it lands on `main`.
- **Relative links.** A deck can point at its notes with `../notes/<slug>.html`
  and never break, even if the domain changes.
- **One place to look** in February when you cannot remember where the modus
  tollens slide went.

### Why `_quarto.yml`, and why `type: website`

There is one non-obvious piece of configuration here and it is worth
understanding, because it is the difference between a repo you can live with and
one you cannot.

Rendering a `.qmd` on its own makes Quarto emit a private `<name>_files/`
directory holding a complete copy of the reveal.js runtime — **8.2 MB per deck**.
Across nineteen sessions that is about 155 MB of byte-identical duplicated
JavaScript in git history.

Declaring the directory a Quarto *website* project instead hoists that runtime
into a single shared `site_libs/`, which every deck links to. Measured on the
three current decks: **25 MB → 8.5 MB**, and it stays roughly 8.5 MB as decks are
added, since each new one costs only its own ~45 KB of HTML.

```yaml
project:
  type: website
  output-dir: .          # build next to the source, so URLs stay /slides/<name>.html
  render:
    - "*.qmd"

website:
  title: "PHIL 220 slides"
  search: false
```

Three things to know about this arrangement:

- **`output-dir: .` is intentional.** Quarto's default is a `_site/`
  subdirectory, which would have pushed every deck to
  `/220/slides/_site/<name>.html`. Building in place keeps the clean URL.
- **`type: default` does not dedupe.** Only the `website` type produces
  `site_libs/`; a `default` project still writes per-deck `_files/`. This is the
  sole reason for the `website` type — there is no navbar, no theme, no site.
- **Your hand-written `index.html` survives the render.** Quarto only generates a
  stub index when none exists, and it leaves an existing one alone.

One thing that does **not** work, in case you are tempted: `embed-resources: true`
would collapse each deck to a single portable file, but Quarto rejects it —
`Reveal plugin 'RevealChalkboard' is not compatible with self-contained output`.
Since `C` and `B` are the two keys that make these decks usable in a logic
classroom, the chalkboard wins and single-file decks are off the table.

### One caveat about the current decks

Each `.qmd` carries its own inline `format: revealjs` block rather than sharing a
`_metadata.yml`. That was chosen so any single deck is a self-contained *source*
file you can hand to a colleague. The trade-off: a house-style change to the YAML
has to be made in every deck. If you would rather change it once, move the block
into `slides/_metadata.yml` and delete it from each `.qmd` — Quarto applies
directory metadata to every document in the folder. Worth doing once you have
more than about six decks.

---

## 3. The per-session loop

Roughly 45–90 minutes per session once the rhythm is established.

### Step 1 — Read the notes and pick the spine

Open `notes/<slug>.md` and find the three or four claims the session actually
turns on. Everything else is support. A 50-minute session supports about 18–26
slides at this density, counting section dividers and pauses.

The 1.2 deck went: *definition → risk-free is not enough → refutation by
instance → the four conditional forms → validity in English → soundness →
Monty Hall as payoff.* Seven beats, 26 slides.

### Step 2 — Copy the nearest finished deck

Do not start from a blank file. Copy the deck whose shape is closest and gut the
content:

```bash
cd 220/slides
cp validity-and-form-slides.qmd syntax-slides.qmd
```

Then change exactly two things in the YAML — the `title` and the `output-file`:

```yaml
title: "2.2 The Syntax of Propositional Logic"
format:
  revealjs:
    output-file: syntax-slides.html      # ← must be unique per deck
```

**The `output-file` line is the one that bites.** Two decks in a folder that both
default to `index.html` will silently overwrite each other.

### Step 3 — Write the slides

House conventions, all defined in `custom.scss`:

| Markup | Use it for |
| --- | --- |
| `## Title {.smaller}` | a slide; add `.smaller` only if it genuinely overflows |
| `::: {.divider}` | a section break — big cardinal text, one line of gloss |
| `::: {.argument}` | numbered premises with a rule above the conclusion |
| `::: {.conclusion}` | the conclusion inside an `.argument` block |
| `::: {.aside}` | the payoff line, pinned to the bottom of the slide |
| `::: {.caption}` | small grey annotation directly under something |
| `. . .` | a pause — everything after it appears on the next click |
| `::: {.incremental}` | a list revealed one item at a time |
| `::: {.notes}` | speaker notes, visible only in presenter view |
| `[.cardinal]{...}` | cardinal-coloured inline emphasis |

Two rules worth internalising:

1. **One claim per slide.** If a slide has two `.aside` blocks it is two slides.
2. **`.smaller` is a smell.** Reach for it only after cutting words. Three of the
   1.2 slides had it for no reason and looked timid at the back of the room.

Always write the `::: {.notes}` block. It costs a sentence and it is what you
read from the presenter screen when a student's question derails you.

### Step 4 — Embed the truth-table app where a form is at stake

Any slide that claims a form is or is not valid should be able to *show* it. The
app takes its input from the URL, so no clicking is needed during class:

```markdown
<iframe class="app check"
        data-src="https://gabriel-uzquiano.github.io/prop-truth-table/?search=1#v1:eyJmb3JtdWxhcyI6IFsiKHAg4oaSIHEpIiwgInEiLCAicCJdfQ==">
</iframe>
```

Three things are doing work there:

- **`data-src` rather than `src`.** Reveal loads the frame when you reach the
  slide, not at page load. With eight embeds and plain `src` the deck opens
  slowly and every frame fights for bandwidth at once.
- **`class="app check"`** sizes the box for the compact verdict view.
- **`?search=1`** hides the app's own chrome, runs automatically, shows only the
  rows where the conclusion is false, and prints a verdict — *Counterexample
  found* or *Valid*. Exactly the question you are asking in class, and nothing
  else on screen.

To build the hash for a new argument: take a JSON object `{"formulas": [...]}`
where the **last** formula is the conclusion and the rest are premises,
base64-encode it, and prefix `#v1:`.

```bash
python3 -c "
import base64, json
f = ['(p → q)', '¬q', '¬p']            # premises …, conclusion last
print('#v1:' + base64.b64encode(json.dumps({'formulas': f}).encode()).decode())
"
```

Binary formulas need their outer parentheses. If you would rather type ASCII,
the app maps `->` `<->` `/\` `\/` `~` (also `&` and `|`) to the real symbols.

Drop `?search=1` when you want the students to press **Evaluate** themselves —
that is the right mode for the four-connectives truth tables, where the point is
watching the columns fill in rather than reaching a verdict.

### Step 5 — Render and look at every slide

```bash
cd 220/slides
quarto render syntax-slides.qmd     # just this deck
quarto render                       # or every deck, after a custom.scss change
```

Quarto is not on your `PATH` — the copy you have is the one bundled with RStudio.
Either render from RStudio's own terminal, or add it once to `~/.zshrc`:

```bash
export PATH="/Applications/RStudio.app/Contents/Resources/app/quarto/bin:$PATH"
```

Run it from inside `slides/`, so Quarto picks up `_quarto.yml` and puts the
assets in the shared `site_libs/` rather than a private `_files/` directory.

Then **actually look at it**, because Quarto will not warn you about a slide
whose content runs off the bottom. Fastest way to see all of them at once:

```bash
python3 -m http.server 8899 --directory slides
# then open http://localhost:8899/syntax-slides.html?print-pdf and print to PDF
```

`?print-pdf` flattens every fragment and lays one slide per page, so a single
scroll through the PDF shows you every overflow, every orphaned line, every
`.smaller` you did not need. Four of the fixes in the 1.2 and 2.1 decks were
found this way and would not have shown up clicking through in presenter mode.

One expected artefact: **the iframes are blank in `?print-pdf`.** That is
`data-src` doing its job — lazy loading does not fire in print mode. Check the
embeds live instead, on the real slide.

### Step 6 — Commit and push

```bash
git add slides/syntax-slides.qmd
git commit -m "Slides for 2.2 syntax"
git push
```

CI renders it and it is live at
`gabriel-uzquiano.github.io/220/slides/syntax-slides.html` in a minute or two.

---

## 4. Sharing with students

### The schedule table is the front door

Students should never need a direct slide URL. Each row of the schedule at
`/courses/220` gets two links, notes and slides:

```markdown
| Wed 9/2 | Basic Language | [notes](https://gabriel-uzquiano.github.io/220/notes/formal-languages.html) · [slides](https://gabriel-uzquiano.github.io/220/slides/formal-languages-slides.html) |
```

You mentioned wanting to make these live week by week. That works well — add the
pair of links the morning of each session, or the evening before if you want
students reading ahead. The URLs are predictable from the slug, so you can write
them before the deck exists and they will start working the moment it renders.

### What students get

A slide URL is a complete, self-contained presentation in the browser — no
download, no PowerPoint, works on a phone. Useful details to tell them once, in
the first week:

- **`?print-pdf` appended to any slide URL** gives them a printable one-slide-per-page
  view they can save as PDF for annotating.
- **`M`** opens a table of contents to jump to a specific slide.
- **The deck remembers nothing.** Reloading returns to slide 1, so a bookmark
  will not preserve their place. Bookmarking with the `#/slug` fragment will.
- **The embedded truth tables are the same tool** they use for homework, so
  anything demonstrated in class can be re-run at home.

### Linking notes and slides to each other

Every deck's closing slide points at its notes:

```markdown
Notes for this session:
[gabriel-uzquiano.github.io/220/notes/syntax.html](https://gabriel-uzquiano.github.io/220/notes/syntax.html)
```

Use the **bare slug**, not a numbered filename. The migration renamed
`1.1-arguments.md` to `arguments.md`, and any deck still pointing at the old path
has a dead link — that is exactly the bug in the 1.1 deck you downloaded before
the rename.

---

## 5. Projecting in the classroom

### Before you leave your office

1. **Open the deck once** on your laptop, on the network you will be using. It
   caches.
2. **Save a PDF fallback.** Press `E`, then print to PDF. Put it on the desktop.
   This is your insurance: the decks themselves are self-contained HTML, but
   **the truth-table embeds need the internet**. If USC's wireless is having a
   day, the frames come up empty and you will want the PDF, or you work those
   examples on the board — which is the honest fallback anyway, and arguably
   better teaching.
3. **Decide about presenter view.** `S` opens a second window with your speaker
   notes, a timer, and the next slide. It is genuinely useful, but it needs
   pop-ups allowed for the site and a second display arranged the right way
   round. Worth ten minutes in an empty classroom in week one rather than five
   minutes in front of thirty students.

### Keyboard, during class

| Key | Does |
| --- | --- |
| `→` / `Space` | next slide or next fragment |
| `←` | back |
| `F` | fullscreen |
| `Esc` or `O` | overview grid of all slides — good for "as we saw earlier" |
| `M` | slide menu, jump by title |
| `S` | presenter view in a second window |
| `C` | **draw on the current slide** |
| `B` | **blank chalkboard** over the deck |
| `X` / `Y` | next / previous pen colour |
| `Del` | erase this slide's drawings |
| `Backspace` | erase all drawings |
| `D` | download your drawings |
| `E` | PDF export view |
| `?` | full shortcut list |
| `Alt`+click | zoom into a region — useful for a truth table at the back of the room |

`C` and `B` are the two that change how the deck feels. A logic session lives or
dies on being able to work a step by hand, and `C` lets you annotate the actual
argument on screen — circle the antecedent, cross out a premise — rather than
recopying it onto a whiteboard. `D` afterwards, and you can post the annotated
version.

### On the classroom machine, if you must

Slides are a URL, so the podium computer works: log in, browser, paste. Two
caveats — you lose your cached copy and your PDF fallback, and pop-up blocking
will probably stop `S` from working. Prefer your own laptop with an adapter.

### 16:9

The decks are 1100×750, roughly 3:2, and reveal.js scales to fit whatever it is
given, letterboxing rather than cropping. On a 16:9 projector you get thin bars
left and right. Nothing is lost. Changing `width`/`height` in the YAML to
`1600`/`900` would fill the screen if the bars bother you, but it would also mean
re-checking every slide for overflow, so it is a between-semesters job.

---

## 6. The automated build

Slides are built by their own workflow, `.github/workflows/build-slides.yml`,
rather than being bolted onto `build-notes.yml`. Two pipelines because they share
nothing — notes go through pandoc and a Python post-processor, slides through
Quarto — and because a broken Quarto step should not stop you from fixing a typo
in the notes.

```yaml
name: Build lecture slides

on:
  push:
    branches: [main]
    paths:
      - 'slides/**.qmd'
      - 'slides/custom.scss'
      - 'slides/_quarto.yml'
  workflow_dispatch:

concurrency:
  group: publish-main
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - uses: actions/checkout@v4

      - uses: quarto-dev/quarto-actions/setup@v2
        with:
          version: 1.9.38

      - name: Render slides
        run: quarto render
        working-directory: slides

      - name: Commit rendered slides
        run: |
          git config user.name  "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add slides/*.html slides/site_libs
          git diff --cached --quiet && exit 0
          git commit -m "auto: rebuild slides from qmd"
          git push || (git pull --rebase && git push)
```

Four deliberate choices in there:

- **The Quarto version is pinned** to `1.9.38`, the Quarto bundled with RStudio on
  your machine. There are two distinct reasons to pin. A floating `release` would
  eventually pull a new reveal.js and shift your layouts mid-semester. And a pin
  that merely *disagrees* with your local Quarto produces endless churn, because
  the committed HTML embeds version-hashed asset filenames, so every local render
  rewrites what CI just wrote. When RStudio updates Quarto, run `quarto --version`
  and bump the workflow to match.
- **`workflow_dispatch`** gives you a *Run workflow* button in the Actions tab. Use
  it to force a full rebuild after bumping that version, or when a change should
  have triggered a render but the path filter missed it.
- **`concurrency: publish-main`** is shared with the notes workflow, which was
  amended to use the same group. Both workflows commit and push to `main`; without
  this, a commit touching both `notes/*.md` and `slides/*.qmd` starts two jobs that
  race, and the loser's push is rejected. The `git push || (git pull --rebase &&
  git push)` fallback — also added to the notes workflow — is the second layer of
  belt and braces.
- **The rendered HTML is committed.** The alternative, building fresh and
  deploying from the Action artifact, gives a cleaner history but means a broken
  workflow takes the slides *offline*. Since you will be pushing on class
  mornings, the committed HTML is worth the noisier diff: worst case the build
  fails and the previous version stays up.

`quarto render` in CI is the identical command you run locally in Step 5, so
there is no build that only works on one machine.

---

## 7. Pre-class checklist

Small enough to run in five minutes.

- [ ] `quarto render` exits 0
- [ ] Every slide checked in `?print-pdf` — nothing runs off the bottom
- [ ] Every `iframe` checked **live**, not in print mode
- [ ] Every deck has a unique `output-file`
- [ ] Closing slide links to the notes, with the bare slug
- [ ] `::: {.notes}` on any slide you would not want to ad-lib
- [ ] Pushed, and the live URL loads
- [ ] Schedule row updated with both links
- [ ] PDF fallback saved locally

---

## 8. What is still outstanding

Not slides, but on the same clock:

**The Carnap transformer.** `scripts/carnap_to_mc.py` converts only
`QualitativeProblem` blocks — 33 of them, all working. The other four block types
in the notes are untouched: `Translate` (115 instances), `TruthTable` (45),
`Playground` (10), `SynChecker` (3). That is 173 dead exercise blocks across the
notes.

The first two sessions are clean, and the Truth Tables session on **Wednesday 9
September** is the first one whose notes contain a block type that does not
render. That is the real deadline. `TruthTable` is also the highest-value one to
build, since the `prop-truth-table` app already does the work — the transformer
mostly needs to translate the Carnap block into the URL scheme used in §4 above.

**The `/220` redirect.** The repo's root `index.html` bounces `/220/` to `/courses/220` via
meta refresh. The commit landed (`3d150dc`) but the Pages build failed during the
GitHub outage on 6 August and has not been confirmed since. One page load
settles it.
