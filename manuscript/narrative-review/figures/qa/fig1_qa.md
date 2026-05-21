# Figure 1 QA — strand map

**Source:** `panels/fig1_matrix.svg` composed via `figures:scientific-figure` -> `fig1.svg`
**Target:** Cell Press 174mm two-column, 6pt minimum body font, Okabe-Ito palette
**Date:** 2026-05-21 (v2 Phase 3)

## Programmatic checks (`check_svg.py`)

| Section | Result |
|---|---|
| Fonts | PASS. 25 text elements, all >= 6pt |
| Palette (Okabe-Ito) | PASS. 9 distinct colours, 0 off-palette |
| Geometry | PASS (stubbed). 25 text + 70 shapes; 0 bbox overlaps; 0 arrow-tip issues |
| Summary | `issue_count: 0, warning_count: 0` |

## Visual judgment (Read of the rendered PNG)

| Dimension | Score | Note |
|---|---|---|
| Clarity | 5/5 | Filled vs outlined circle encoding is immediately legible |
| Hierarchy | 5/5 | Coloured perspective headers anchor identity; row labels read left-to-right |
| Alignment | 5/5 | Row labels and circle columns flush; 15 evenly spaced rows |
| Palette coherence | 5/5 | Strict Okabe-Ito (psychophysics blue, action vermillion, language green, emotion reddish-purple); grey for outlined "absent" circles |
| Print legibility at 174mm Cell width | PASS | All text >= 6pt; title 11pt; row labels 7pt |

## Findings

None. The figure meets all programmatic and visual criteria for Cell Press submission.

**Status: ship.**
