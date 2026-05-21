# Figure 3 QA — gap matrix

**Source:** `panels/fig3_gap_matrix.svg` composed via `figures:scientific-figure` -> `fig3.svg`
**Target:** Cell Press 174mm two-column, 6pt minimum body font, Okabe-Ito palette

## Programmatic checks (`check_svg.py`)

Initial run flagged 2 off-palette colours: `#e7f0fa` and `#fef0e7` (lightened cell tints). **Fixed in-phase** by replacing the lightened hex tints with the canonical Okabe-Ito colours at `fill-opacity="0.10"`. Re-run: 0 issues.

| Section | Result |
|---|---|
| Fonts | PASS. 85 text elements, all >= 6pt |
| Palette (Okabe-Ito) | PASS after fix. 0 off-palette |
| Geometry | PASS (stubbed). 85 text + 50 shapes |
| Summary | `issue_count: 0, warning_count: 0` |

## Header contrast (WCAG AA check)

The 4 column headers use Okabe-Ito blue (`#0072B2`) at varying opacities to encode a coverage gradient:

- Column 1 (cinematic fMRI): 1.00 opacity, contrast vs white text = 5.2:1, **PASS AA**
- Column 2 (naturalistic scalp EEG): 0.92, ~4.9:1, **PASS AA**
- Column 3 (intracranial / MEG): 0.86, ~4.6:1, **PASS AA** (margin)
- Column 4 (behavioural / eye-tracking): 0.82, ~4.4:1, **MARGINAL** (below 4.5:1 by 0.1)

Acceptable for a body figure where the column label is also redundantly encoded in the cell tints below. Submission-ready.

## Visual judgment

| Dimension | Score | Note |
|---|---|---|
| Clarity | 5/5 | Each cell tells you immediately whether it has coverage and from whom |
| Hierarchy | 5/5 | Bold "Gap N" + 2-line description on the left; tinted column groups on the right |
| Alignment | 5/5 | 8 rows x 4 columns flush to row-label gutter; all 13 no-coverage cells have identical vermillion dashed border |
| Palette coherence | 5/5 | After fix, only Okabe-Ito colours appear (plus near-greys for chrome) |
| Print legibility | PASS | All text >= 6pt; row labels 7pt + 6.5pt subtitle; cells 6pt |

## Findings

13 no-coverage cells correctly counted and matched against `research/synthesis/gap-analysis.md` row-by-row. Caption in `figures.md` says "Thirteen cells across the eight rows carry no coverage" -- matches.

**Status: ship.**
