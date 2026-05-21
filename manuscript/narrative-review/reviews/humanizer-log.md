# Humanizer pass log

**Skill:** `manuscript:humanizer` (research-skills marketplace, v0.5.0)
**Date:** 2026-05-21 (v2 Phase 4)
**Scope:** all per-section files under `manuscript/narrative-review/`

## Method

The skill loaded its 29-pattern catalogue plus research-writing calibrations. I scanned every per-section file via grep for the high-frequency patterns:

- Pattern 1 (significance inflation): pivotal, evolving landscape, groundbreaking, deeply rooted, indelible mark, marking/shaping the, focal point
- Pattern 3 (superficial -ing endings): showcasing, highlighting, underscoring, emphasising, emphasizing, fostering, encompassing, cultivating
- Pattern 4 (promotional): vibrant, rich, nestled, in the heart of
- Pattern 7 (AI vocabulary): delve, tapestry, intricate, showcase, boast, additionally, moreover, furthermore, notably
- Pattern 8 (copula avoidance): stands as, serves as, functions as, boasts, represents a [novel/key/...]
- Pattern 10 (rule of three): scanned visually
- Pattern 14 (em-dashes): grep for U+2014
- Pattern 18 (emojis): grep for emoji range
- Pattern 19 (curly quotes): grep for U+201C/D
- Pattern 23 (filler): in order to, due to the fact, it is worth noting, it is important to note
- Pattern 24 (excess hedging): could potentially, may possibly, might potentially
- Pattern 25 (generic positive conclusions): opens new avenues, paves the way, sets the stage, paradigm shift
- Pattern 27 (persuasive tropes): at its core, the real question, fundamentally, the heart of the matter
- Pattern 28 (signposting): let us dive, let us explore, here is what you need to know
- Pattern 20 (chatbot artifacts): I hope this, let me know, Of course, Certainly, Great question

## Findings

| File | Patterns matched | Fixes applied | Notes |
|---|---|---|---|
| `highlights.md` | 0 | 0 | 5 bullets all <=80 chars; no AI patterns |
| `abstract.md` | 0 | 0 | Clean |
| `sections/01_introduction.md` | 0 (pattern 28 candidate flagged for Phase 5) | 0 | Last sentence "Section 2 begins with..." is meta-tutorial signposting per pattern 28; paper-review m5 already scheduled for Phase 5 final assembly, so deferred (per task instructions: do not silently rewrite Phase 5 items) |
| `sections/02_scaffold.md` | 0 | 0 | Clean |
| `sections/03_psychophysics.md` | 0 | 0 | Methods-adjacent passage in paragraph 3 uses passive voice ("The HBN-EEG Release 3 cohort carries no synchronous eye tracker, which means a per-shot analysis cannot deconvolve..."). Per skill calibration, passive in methods-adjacent technical descriptions is acceptable; not flagged |
| `sections/04_action.md` | 1 (scientific use of "robust", not significance inflation) | 0 | "...which produce robust ones [Ben-Yakov2018TheHF]" describes hippocampal-response amplitude; citation-anchored scientific use, not pattern 1 |
| `sections/05_language.md` | 0 | 0 | 5a + 5b structure clean |
| `sections/06_emotion.md` | 1 (scientific use of "robust") | 0 | "alpha desynchronisation is a robust correlate of attentional engagement" describes the Codispoti review's conclusion; citation-anchored scientific use, not pattern 1 |
| `sections/07_synthesis.md` | 0 | 0 | Clean. Single hedges in 7.4 ("may therefore be confounded", "is the response") are legitimate research-writing usage per skill calibration |
| `boxes/box1_anchor.md` | 0 | 0 | Methods-style pipeline description; passive voice acceptable per skill calibration |
| `boxes/trends.md` | 0 | 0 | Pattern 16 (inline-header vertical list with bold leads) used here, but each bullet is a substantive recent development with citation, not generic boilerplate. Per skill: selective bold for callout headers is acceptable |
| `boxes/outstanding-questions.md` | 0 | 0 | 7 questions, each forward-looking and specific |
| `glossary.md` | 0 | 0 | Definitions are technical and grounded; no AI inflation |
| `figures.md` | 0 | 0 | Captions are descriptive, not promotional |

## Per-section word-count delta

Before pass: 3397 main-text words + 117 abstract + 60 highlights + 161 + 191 + 174 (boxes) + 417 glossary + 425 figure legends = 4942 words
After pass: identical (no rewrites applied)

## Why the pass was a no-op

The manuscript was drafted in Phase 2 with the v1 self-review's F1-F5 and I1-I5 carry-forwards already enforcing discipline against the worst AI-writing tells (signposted Section 1 transition, falsifiability discipline in 7.3, narrative-position objection in 7.4, perspective-driven Section 2 over theme-catalogue, parallel thesis sentences in 5a/5b). Additionally, the project style guide ([CLAUDE.md](../../../CLAUDE.md)) bans em-dashes, emojis, and AI attribution upfront. The manuscript-writing skill's IMRAD Writing Principles (Clarity, Precision, Flow, Citations) further constrain word choice. Together, these prevent the patterns from entering the prose in the first place.

The humanizer pass as a finishing step is therefore most useful in projects without an upstream style-guide layer; in this project it functions as an audit confirmation.

## Pattern-28 deferral note

The closing sentence of Section 1 paragraph 3 ("Section 2 begins with the four-perspective scaffold the rest of the review builds on") matches pattern 28 (signposting / meta-narration). The paper-review pass independently flagged this as concern **m5** for Phase 5 attention. Per the task instructions to preserve concerns scoped for Phase 5, this is not rewritten here.

## Final anti-AI audit

> "What makes the below so obviously AI generated?"

Re-reading the assembled manuscript with that prompt in mind:

- The prose is dense with citations (often 3-5 per sentence). Density is genre-appropriate for a TiCS Forum Review and not an AI tell.
- Sentence rhythm varies (short topic sentences alternating with longer evidence sentences); not the uniform pacing typical of AI text.
- No "key" / "crucial" / "vital" inflation.
- Section transitions are explicit but not tutorial-script ("Section 2 begins with..." flagged above).
- Single-paragraph perspective definitions read as an actual argumentative scaffold, not a "let me cover all the bases" enumeration.

> "Now make it not obviously AI generated."

No rewrites required. The manuscript reads as authored.

## Carry-forward to Phase 5

- Pattern 28 fix on Section 1 closing sentence (covered by paper-review m5).
- All other m1-m6 paper-review items.
- No humanizer-specific changes required.
