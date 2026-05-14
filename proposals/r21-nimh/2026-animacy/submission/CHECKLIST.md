# Pre-Submission Checklist, R21 Animacy

Generated 2026-05-13 at the end of Phase 5. Based on the `grant-writing` SKILL.md Step 7 pre-submission checklist, adapted for the R21 mechanism and the current draft state.

Legend:
- `[x]` complete
- `[ ]` outstanding, blocks submission
- `[?]` deferred to submitter (PI customization or institutional grants office)

## Content completeness

- [x] Specific Aims (1 page, 435 words; under the 650-word soft cap)
- [x] Significance (~1 page, 423 words)
- [x] Innovation (~0.75 page, 396 words)
- [x] Approach (~4.25 pages, 1781 words across 5 subsections)
- [x] Bibliography and References Cited (117 BibTeX entries in `bibliography.bib`; slug-to-key map in `bibliography.md`)
- [x] Aims-to-Approach traceability (every method in Approach maps to H1A, H1B, or H2)
- [x] Rigor and Reproducibility addressed (sex as biological variable, age stratification, analyst blinding, replication, BIDS/HED standards)
- [x] Timeline with quarterly milestones (24 months, 8 quarters)
- [x] All abbreviations defined on first use (EEG, ERSP, IC, AMICA, BIDS, HED, GLM, LLR, GAM, MNI, OSF, ICLabel verified per section)
- [x] Figures referenced in Approach (Figures 1, 2, 3, 5)
- [?] Figure 4 (ERSP exemplar) deferred to Epic #1 Phase 5 output; substitute or omit at submission
- [x] All citations have corresponding BibTeX entries; slug map in `bibliography.md`

## Budget and administrative

- [x] Modular budget summary (`budget/budget.md`, 5 modules Y1 + 6 modules Y2 = 11 modules = $275K direct; respects $200K/year cap)
- [x] Budget justification (`budget/justification.md`, ~3 pages, covers Personnel / Consultant / Services / Travel / Publication / Other)
- [x] Budget-narrative alignment with Approach timeline (cross-reference table in `budget/justification.md`)
- [x] Data Management and Sharing Plan (`dms-plan.md`, all 6 NIH DMS Policy elements covered, 2 pages)
- [x] Facilities and Other Resources (`facilities.md`)
- [x] Equipment (`equipment.md`)
- [x] Letters of Support request queue (`letters-of-support/REQUEST_QUEUE.md`, 5 targets named with asks and dates)
- [ ] Actual letters of support (solicit 8 weeks before NIH receipt; deadline 2025-12-22 for the 2026-02-16 receipt cycle)
- [?] PI biosketch SciENcv export (Phase 4 draft in `biosketches/PI-Shirazi.md`; final SciENcv PDF at submission)
- [?] Co-I / Senior advisor biosketches (placeholders in `biosketches/`)
- [?] PI institution name, F&A rate, named co-investigators, statistical consultant identity (bracketed throughout; PI substitutes by find-replace)
- [?] Human Subjects section (Exempt-4 per secondary HBN analysis; **[PI INSTITUTION]** IRB confirms before submission)
- [?] Vertebrate Animals: not applicable
- [?] Inclusion of Children, Women, Minorities: HBN cohort is inherently inclusive of children (ages 5 to 21); cite cohort demographics from `alexander-2017-hbn-protocol`

## Formatting

- [x] Font: Helvetica 11pt body (Arial substitute via `fontspec` in `build/header.tex`)
- [x] Margins: 0.5 inch all sides
- [x] Paragraph spacing: 4 pt (`build/header.tex` `\setlength{\parskip}{4pt}`)
- [x] No paragraph indentation (`\setlength{\parindent}{0pt}`)
- [x] Justified text (xelatex default, reaffirmed via `\sloppy`)
- [x] Page numbers in footer (`build/header.tex` fancyhdr config)
- [x] PDF renders without missing-glyph warnings (after switching Mermaid → arrow to "then" in approach.md Timeline)
- [x] Total Specific Aims + Research Strategy = 8 pages (1 cover + 1 Aims + 6 Research Strategy); within NIH limits
- [x] Build pipeline (`submission/build.sh`) is documented and reproducible
- [?] File naming conventions for the submission package (per NIH ASSIST or PI institution grants-office guidance)

## Review pass outputs (Phase 5)

- [x] `reviews/grant-review-2026-05-13.md` (independent grant review, scores 3/3/3 for Significance/Innovation/Approach, with concrete fixes per concern)
- [x] `reviews/grant-figure-qa-2026-05-13.md` (figure compliance, PASS-WITH-FINDINGS on figures 1, 2, 3, 5; figure 4 documented as deferred)
- [x] `reviews/humanizer-2026-05-13.md` (humanizer pattern check, 2 light edits recommended)

## Outstanding items (block submission until resolved)

1. **[ ]** Actual letters of support, solicited from the 5 named targets in `letters-of-support/REQUEST_QUEUE.md`. Solicit by 2025-12-22.
2. **[ ]** Figure 2 regenerate at true 300 dpi (currently 288 effective dpi at 7-inch width). Update `figures/fig2-preliminary-data.py` with `dpi=300, figsize=(7, 4.5)`.
3. **[ ]** Figure 3 fix: either add `axvline` calls for class-conditional medians in `figures/fig3-stimulus-annotation.py`, OR remove "class-conditional medians" from the README.md caption (per figure-qa finding).
4. **[ ]** README.md figure caption: change "49 trusted shots" to "51 trusted shots" (per shot-count reconciliation in Phase 3).

## Recommended edits before submission (not blocking)

Apply at the user's discretion. From the three review-pass outputs:

- **Grant review**: widen H1A effect-size prediction range; acknowledge wider attrition uncertainty in 1.A; add motion-energy primary-choice rationale in 2.F; add citation anchor in Innovation Technical for "novel at the group level"; tighten clinical-translation in Significance.
- **Figure QA**: regenerate Figure 2 at 300 dpi; fix Figure 3 Panel B; render Figures 1 and 5 to PNG before submission; reconcile 49 vs 51 shot count in figures/README.md.
- **Humanizer**: tighten Innovation Methodological closing ("an enabling rather than rhetorical innovation" → "deposited as a community resource"); tighten Significance Paragraph 1 ("Naturalistic stimuli are the right probe" → "Naturalistic stimuli probe").

## Submitter customization checklist

Before the PI submits, find-replace these placeholders consistently across all files under `proposals/r21-nimh/2026-animacy/`:

- `[PI INSTITUTION]` → actual institution name
- `[INSTITUTIONAL MEDICAL CENTER]` → affiliated medical center
- `[DEPARTMENT / CENTER]` → home department/center
- `[CLUSTER NAME]` → institutional HPC cluster name
- `[PARTITION]` → cluster partition name
- `[GPU PARTITION]` or `[GPU PARTITION OR NODE TYPE]` → GPU resource identifier
- `[PI INSTITUTION RATE %]` and `[PI INSTITUTION RATE]` → F&A indirect cost rate
- `[F&A AGREEMENT DATE]` → institution F&A rate agreement date
- `[STATISTICAL CONSULTANT NAME]`, `[STATISTICAL CONSULTANT AFFILIATION]`, `[STATISTICAL CONSULTANT POSITION]`, `[CONSULTANT HOURLY RATE]`, `[N HOURS]` → consultant details
- `[SENIOR ADVISOR NAME]`, `[SENIOR ADVISOR AFFILIATION]`, etc. → if named
- `[POSITION TITLE]`, `[PHD INSTITUTION]`, `[MSC INSTITUTION]`, `[BS INSTITUTION]`, `[YEAR-RANGE]` → CV / biosketch substitutions
- `[HBN DATA STEWARD CONTACT]`, `[SCCN CONTACT]`, `[OPENNEURO CONTACT]` → named letter-of-support contacts
- `[WORKSTATION MODEL / CPU / RAM / STORAGE]` → workstation specs
- `[SQ FT]`, `[NAS TIER]`, `[N TB]` → facility specifics

Find-replace via shell: `grep -rln '\[PI INSTITUTION\]' proposals/r21-nimh/2026-animacy/ | xargs sed -i '' 's/\[PI INSTITUTION\]/Actual Institution Name/g'`.

## Submission pathway

1. Customize all `[BRACKETED]` placeholders per above.
2. Apply review-pass recommended edits at PI discretion.
3. Generate biosketch PDFs via SciENcv.
4. Solicit letters of support per `REQUEST_QUEUE.md`.
5. Verify Human Subjects section with **[PI INSTITUTION]** IRB (Exempt-4 confirmation).
6. Generate final SF424 R&R Modular Budget Form via grants-office workflow.
7. Build the submission PDF via `bash submission/build.sh`.
8. Assemble the submission package (Specific Aims PDF + Research Strategy PDF + supplemental PDFs + biosketches + budget + letters + DMS + facilities + equipment + human subjects narrative).
9. Submit via NIH ASSIST or grants.gov by 2026-02-16 (or June 16 renewal cycle).

Good luck.
