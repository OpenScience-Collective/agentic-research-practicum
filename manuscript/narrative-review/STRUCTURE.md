# Structure — TiCS Forum Review

Built by the `manuscript:manuscript-formatting` skill (v0.5.0) in v2 Phase 1. This document maps each file to the *Trends in Cognitive Sciences* (TiCS, Cell Press) Forum Review submission element it serves. The next phase (`manuscript:manuscript-writing`) fills the placeholders.

## Files and TiCS compliance map

| File | TiCS element | Word budget | Notes |
|---|---|---|---|
| `frontmatter.yaml` | Title, authors, affiliations, corresponding author, ORCID | n/a | Per skill's "Title page" checklist item |
| `highlights.md` | Highlights | 3-5 bullets, <=85 chars each | TiCS / Cell Press convention |
| `abstract.md` | Abstract | ~80-120 words, no citations | TiCS abstract limit |
| `sections/01_introduction.md` | Section 1: Introduction (the per-shot turn) | ~450 | |
| `sections/02_scaffold.md` | Section 2: Four-perspective scaffold | ~600 | |
| `sections/03_psychophysics.md` | Section 3: Psychophysics (bottom-up floor) | ~500 | |
| `sections/04_action.md` | Section 4: Action (mu-band ERD and event segmentation) | ~500 | |
| `sections/05_language.md` | Section 5: Language (5a non-transfer + 5b silent-narrative) | ~600 | I5 split applied |
| `sections/06_emotion.md` | Section 6: Emotion (two latency-distinct predictions) | ~500 | |
| `sections/07_synthesis.md` | Section 7: Synthesis (integration, falsifiability, open questions) | ~450 | F4/F5 applied |
| `boxes/box1_anchor.md` | Box 1 (HBN-EEG R3 anchor cohort) | ~180 | F4 anchor case rebuilt |
| `boxes/trends.md` | Trends Box (recent developments) | ~200-250 | TiCS convention |
| `boxes/outstanding-questions.md` | Outstanding Questions Box | 5-7 questions | TiCS convention |
| `glossary.md` | Glossary | 10-15 terms | TiCS convention |
| `figures.md` | Figure legends | ~400 (not in main count) | 4 figures planned (Phase 3) |
| `references.md` | References | 80-120 entries | Cell Press numbered (Vancouver-like) |
| `refs.bib` | Source BibTeX | 94 entries | Already built (Phase 1) |

## Main-text budget total

Sections 1-7: ~3610 words. Inside the TiCS Forum Review ~3500-4000-word ceiling.

## Submission checklist (from `manuscript:manuscript-formatting` SKILL.md)

This section tracks the submission checklist items the skill enumerates. Each item is marked with the phase that will satisfy it.

- [ ] **Manuscript formatted per journal template** — Phase 5 (final assembly via the formatting skill again)
- [x] **Title page: title, authors, affiliations, corresponding author, ORCID** — `frontmatter.yaml` (Phase 1; placeholders to be filled by author)
- [ ] **Abstract within word limit** — Phase 2 (manuscript-writing produces; Phase 5 verifies)
- [ ] **Keywords provided (if required)** — TiCS does not require keywords for Forum Reviews; not applicable
- [ ] **Main text within page/word limit** — Phase 2 budget + Phase 5 verification
- [ ] **Figures as separate high-resolution files (typically 300+ DPI)** — Phase 3 via `figures:scientific-figure` composer
- [ ] **Figure captions in a separate list** — `figures.md` (Phase 2 drafts; Phase 5 finalises)
- [ ] **Tables formatted per journal style** — no tables planned for this review
- [x] **References complete and consistently formatted** — `refs.bib` built (Phase 1); numbering applied in Phase 5
- [ ] **Supplementary materials prepared separately** — none planned
- [ ] **Cover letter drafted** — Phase 5 (skill's cover-letter template, then humanizer pass)
- [ ] **`manuscript:humanizer` natural-writing pass** — Phase 4
- [ ] **Conflict of interest statement** — Phase 5 (author-provided)
- [ ] **Data availability statement** — Phase 5 (HBN-EEG R3 is public; statement noted in Phase 5)
- [ ] **Ethics approval statement** — n/a (review article; no new data)
- [ ] **Author contributions (CRediT format if required)** — Phase 5
- [ ] **Suggested reviewers** — Phase 5 (author-provided)

## TiCS scaffolding decisions not covered by the skill

The skill provides a generic IMRAD framework plus journal-specific templates for IEEE / Nature / PNAS / PLoS ONE / Elsevier. TiCS (Cell Press) Forum Reviews use a non-IMRAD structure that the skill does not enumerate explicitly. The following TiCS-specific decisions are applied on top of the skill's framework based on public TiCS author guidelines:

- **No IMRAD.** TiCS Forum Reviews use thematic sections, not Introduction/Methods/Results/Discussion. The seven sections here are thematic (Introduction, Scaffold, Psychophysics, Action, Language, Emotion, Synthesis).
- **Highlights**: 3-5 short bullets at the top, each <=85 characters (Cell Press / Elsevier house style enforced via the skill's Elsevier checklist row).
- **Trends Box**: a callout box listing recent developments that make the topic timely.
- **Outstanding Questions Box**: 5-7 forward-looking research questions.
- **Glossary**: 10-15 defined terms accessible to non-specialist readers.

## Carry-forwards from v1 self-review

From `direction-papers/movie-ersp-direction-review.md` (kept in the project for reference):

- **F1 (Category G cardinality 12 -> 7)**: Section 5a will state "all seven Category G cards (and 12 cards corpus-wide) carry `transfer-to-silent: no`".
- **F2 (Schubring vs Codispoti DOI)**: `refs.bib` header documents; body prose cites Codispoti.
- **F3 (stray refs)**: 3 stray keys removed from `refs.bib` (already applied).
- **F4 (anchor case)**: Section 7.2 + Box 1 rebuild around Petroni-Cohen 2018 + partly-validated pipeline.
- **F5 (falsifiability)**: Section 7.3 names a topographic-and-band rejection region.
- **I1-I5**: handled in the per-section placeholders.
- **S2 (italicised *The Present*)**: enforced throughout via copy-edit.

## Next phase

`manuscript:manuscript-writing` is invoked per section file. Each invocation will receive the placeholders here, the source material under `direction-papers/` and `research/`, and the TiCS section budget for that file.
