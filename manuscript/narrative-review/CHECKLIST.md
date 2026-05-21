# Submission readiness checklist (TiCS Forum Review)

**Status: v2 Phase 5 final assembly complete.**

## Manuscript text

- [x] Title <= 80 characters (76)
- [x] Highlights: 5 bullets, max 80 chars each (Cell Press / Elsevier <= 85 limit)
- [x] Abstract: 116 words (TiCS 80-120 target)
- [x] Main text sections 1-7: 3393 words (TiCS Forum Review ~4000-word ceiling)
- [x] Trends Box: 191 words
- [x] Outstanding Questions Box: 7 forward-looking questions
- [x] Glossary: 15 defined terms, <=50 words each
- [x] Box 1 (HBN-EEG R3 anchor): 161 words
- [x] Abbreviations defined on first use (fMRI, EEG, iEEG, ISC, ERSP, LLR, AMICA, ICLabel, ToM, ERD, MEG, DMN, STS, MRI, ECoG, LM, BIDS, GLM, mTRF, BDF)
- [x] No em-dashes (CLAUDE.md global rule)
- [x] No emojis (CLAUDE.md global rule)
- [x] *The Present* italicised throughout
- [x] All F1-F5 critical findings from v1 self-review applied in prose
- [x] manuscript:paper-review pass (0 critical, 0 major, 6 minor; all 6 addressed in v2 Phase 5)
- [x] manuscript:humanizer pass (0 patterns matched; manuscript was clean upstream)

## References

- [x] Numbered references in references.md (82 entries, ordered by first appearance)
- [x] refs.bib (93 entries after F3 stray-key removal + F2 verification + Castelli2000MovementAM dedupe)
- [x] F2 (Schubring/Codispoti DOI) verified and resolved; body cites Codispoti
- [x] F3 (3 stray refs) removed from refs.bib
- [x] Castelli2000MovementAM deduplicated against castelli2000heider (same DOI; consolidated to action-strand canonical key)
- [x] Body cites converted from cite-card slug `[Key]` form to numbered `[N]` form (100 in-body cites converted)
- [x] All 82 cited refs match entries in refs.bib

## Figures

- [x] 4 figures built via figures:scientific-figure composer
- [x] All in Okabe-Ito colourblind-safe palette (0 off-palette after Phase 3 fix)
- [x] All shapes encode information redundantly (not colour-only)
- [x] Cell Press 174mm two-column width applied to all figures
- [x] PNG exports at 300 dpi
- [x] figure-qa reports under figures/qa/ (4 reports; all ship)
- [x] 211 of 211 text elements pass Cell 6pt minimum
- [x] All figures referenced from body
- [x] Embedded transparent-icon thumbnails (Fig 2: 6 stimulus thumbnails; Fig 4: 4 brain-topography icons)

## Style discipline (CLAUDE.md + Cell Press)

- [x] No em-dashes (project rule)
- [x] No emojis (project rule)
- [x] No AI attribution in commits or PRs
- [x] Atomic commits with concise messages (<50 chars)
- [x] Highlights and Trends Box use sentence-case headers (Cell Press body convention)

## Paper-review minor concerns (m1-m6) addressed in v2 Phase 5

- [x] m1: Highlight #2 now names the four perspectives ("Psychophysics, action, language, emotion diverge on per-shot EEG predictions")
- [x] m2: Abstract sampling-rate clause expanded for clarity ("the local 100 Hz cohort caps beta-band and gamma-band claims pending a 500 Hz validation")
- [x] m3: Section 4 Hickok critique now names substance ("mu suppression also reflects general attention to moving stimuli rather than a one-to-one mirror-system signature")
- [x] m5: Section 1 closing meta-narration removed ("Section 2 begins with..." dropped)
- [x] m6: Castelli2000MovementAM deduplicated against castelli2000heider
- [ ] m4: Section 6 social-cognition density (third paragraph reads as citation dump). DEFERRED to human author polish; restructuring requires content judgment beyond the skill pipeline.

## Submission package files

```
manuscript/narrative-review/
  manuscript.md            <- single assembled file (frontmatter + Highlights + Abstract + sections 1-7 + Box 1 + Trends Box + Outstanding Questions + Glossary + Figure legends)
  references.md            <- 82 numbered references in Cell Press format
  refs.bib                 <- 93-entry BibTeX (post-dedupe)
  STRUCTURE.md             <- table of contents + skill checklist (v1 Phase 1)
  frontmatter.yaml         <- title, authors, affiliations, ORCID placeholder
  highlights.md            <- per-section source file
  abstract.md              <- per-section source file
  sections/01..07_*.md     <- per-section source files
  boxes/box1_anchor.md, trends.md, outstanding-questions.md
  glossary.md              <- 15-term glossary
  figures.md               <- 4 figure legends
  figures/
    fig1-4.svg + .png      <- composed figures at 300 dpi
    panels/figN_*.svg      <- panel sources
    icons/*.png            <- 10 transparent-icon PNGs
    configs/figN.json      <- composer configs
    qa/figN_qa.md          <- figure-qa reports
  reviews/
    internal-review.md     <- paper-review output (v2 Phase 4)
    humanizer-log.md       <- humanizer audit log (v2 Phase 4)
```

## Out of scope (post-PR)

- Author ORCID
- Cover letter (manuscript:manuscript-formatting provides a template; apply once author confirms PI list)
- Final copy-edit by human author (including m4 social-cognition density)
- LaTeX export (use pandoc per manuscript-formatting skill if a LaTeX-mandatory submission portal is selected)
- Word .docx export (pandoc; Cell Press accepts .docx for submission)
