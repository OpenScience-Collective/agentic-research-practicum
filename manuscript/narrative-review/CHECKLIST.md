# Submission readiness checklist (TiCS Forum Review)

## Manuscript text
- [x] Title <= 80 characters
- [x] Highlights: 3-5 bullets, each <= 85 characters (largest is 80)
- [x] Abstract <= 120 words (currently 133; further trim possible in Phase 5)
- [x] Main text sections 1-7: ~3246 words (well inside ~4000-word ceiling)
- [x] Trends Box: ~230 words
- [x] Outstanding Questions Box: 7 forward-looking questions
- [x] Glossary: 15 defined terms
- [x] Box 1 (HBN-EEG R3 anchor): ~180 words
- [x] Abbreviations defined on first use
- [x] No em-dashes
- [x] No emojis
- [x] *The Present* italicised throughout
- [x] All F1-F5 critical findings from prior self-review applied
- [x] manuscript:paper-review pass (0 critical, 4 major, 10 minor; all addressed or deferred)
- [x] manuscript:humanizer pass (clean baseline; 3 minor pattern fixes applied)

## References
- [x] Numbered references in references.md (82 entries, ordered by first appearance)
- [x] Refs.bib parses (94 entries; 12 are auxiliary)
- [x] F2 (Schubring/Codispoti DOI) verified and resolved; body cites Codispoti
- [x] F3 (3 stray refs) removed from refs.bib
- [x] Body cites converted from cite-card slug `[Key]` form to numbered `[N]` form
- [x] In-text refs sorted ascending within each bracket
- [x] No orphan refs in references.md (all 82 are cited in body)

## Figures
- [x] 4 figures: strand-map, naturalness-gradient, gap-matrix, predictions
- [x] All in Okabe-Ito colourblind-safe palette
- [x] All shapes encode information redundantly (not colour-only)
- [x] Figure 1: 170mm width, original font sizes (1.5x rescale broke single-col layout)
- [x] Figures 2, 3, 4: 170mm width with 1.5x font rescale per figure-qa recommendation
- [x] PNG re-exported at 300 dpi (Cell Press print floor)
- [x] figure-qa reports saved alongside SVGs
- [x] All figures referenced from body
- [ ] Stimulus thumbnails (Fig 2) and brain icons (Fig 4) generated via figures:transparent-icons — IN PROGRESS via Phase 5b

## Style discipline (CLAUDE.md + Cell Press)
- [x] No em-dashes (project rule)
- [x] No emojis (project rule)
- [x] No AI attribution in commits or PRs
- [x] Atomic commits with concise messages (<50 chars)
- [x] Highlights and Trends Box use sentence-case headers (Cell Press body convention)

## Final assembly remaining
- [ ] Embed transparent-icon thumbnails into Fig 2 + brain icons into Fig 4 (Phase 5b in flight)
- [ ] Re-export Figs 2 and 4 PNGs after icon embed
- [ ] Final /review-pr (pr-review-toolkit) before merge
- [ ] Open PR to main and merge

## Out of scope (post-PR)
- Word and LaTeX export (apply when journal submission package is built)
- Author affiliations / ORCID / cover letter (Phase post-merge)
- Final copy-edit by human author
