# Humanizer pass log

**Skill:** `manuscript:humanizer` (research-skills marketplace, v0.5.0)
**Date:** 2026-05-20
**Phase:** 4 (paper-review + humanizer)

## Detection summary

Scanned the full manuscript (sections 1-7, Box 1, Trends Box, Outstanding Questions, Glossary, figure legends) for the 29 humanizer patterns. The manuscript already showed strong baseline humanizer discipline because the project style guide enforces several patterns upfront:

| Pattern | Status | Notes |
|---|---|---|
| 14: em-dash overuse | clean | Project rule "no em-dashes"; grep for `—` and `--` returned no body matches |
| 18: emojis | clean | Project rule "no emojis"; none present |
| 17: title case headings | clean | Sentence-case throughout (matches Cell Press house style for body headings) |
| 19: curly quotes | clean | Straight quotes only |
| 7: AI vocabulary (delve, intricate, tapestry, underscore, pivotal, vital, crucial filler, showcase, boast) | clean | grep returned 0 matches in body; "robust" appears once in a scientific context (alpha desynchronisation as "robust correlate") and was kept |
| 8: copula avoidance | clean | grep for "stands as / serves as / functions as / represents a" returned 0 body matches |
| 23: filler phrases | clean | No "it is important to note", "in order to", "due to the fact that" |
| 24: excessive hedging | clean | Single hedges in Discussion (legitimate); no stacked "could potentially possibly" |
| 25: generic positive conclusions | clean | No "opens exciting new avenues" or "the future is bright" |
| 20: collaborative artifacts | clean | No "I hope this helps" |
| 22: sycophantic tone | clean | No "great question" patterns |

Two minor patterns were detected and rewritten.

## Patterns detected and fixes applied

### Pattern 3 (superficial -ing endings) — minor instance in Section 5

**Detected:** Section 5b closing paragraph had "Their independent-component-cluster analogues in EEG are the search regions the per-shot ERSP analysis targets" with the implicit -ing in "targets" pulling a verb-as-rhetorical-flourish.

**Fix:** Tightened to "...are the search regions for the per-shot ERSP analysis", removing the verb-as-action framing.

### Pattern 25 (anthropomorphic / soft assertions) — Section 7.4

**Detected:** "The corpus is honest about what it cannot say." This is an anthropomorphic framing (corpora are not honest); softer than the rest of the section.

**Fix:** Rewrote to "Several gaps in the corpus limit what this Review can claim." Direct, claim-bounded, and not anthropomorphic.

### Pattern 11 light touch (synonym cycling) — Section 5

**Detected:** "The language perspective therefore enters our review twice" uses "enters" as a quasi-metaphor that could read as filler.

**Fix:** Rewrote to "The language perspective therefore plays two roles" plus "The 5a sub-thread isolates..." and "The 5b sub-thread supplies..." giving each sub-thread an explicit subject and verb.

## Patterns explicitly preserved per research-writing calibration

- Passive voice in methods-adjacent claims (Box 1 pipeline description): preserved.
- Single hedges in Section 7.5 ("may", "suggests", "is consistent with"): kept.
- Established compound modifiers ("event-related spectral perturbation", "log luminance ratio", "default-mode network"): hyphenation preserved per scientific style.
- Selective bold in Trends Box bullet leads ("**Whole-brain shot-cut response in adult intracranial EEG.**"): preserved per pattern 15 calibration (selective bold for callout headers is fine).
- Cite-card slug citations in `[KeyYYYY...]` form: preserved per task instructions; Cell Press numbered conversion happens in Phase 5.

## Net effect on word count

Before humanizer pass (after M1-M4 paper-review fixes):
- Main text sections 1-7 total: 3255 words

After humanizer pass:
- Main text sections 1-7 total: 3249 words (six words trimmed via pattern 3 and pattern 25 fixes)

## Carry-forward to Phase 5

- Cell Press numbered reference conversion (Phase 5).
- Final TiCS-specific formatting (Phase 5).
- Font-size + DPI fixes on figures (Phase 5).
- Stimulus thumbnails (Fig 2) + brain icons (Fig 4) via figures:transparent-icons (Phase 5b).
