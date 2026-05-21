# Figure 4 QA — predictions table

**Source:** `panels/fig4_predictions.svg` composed via `figures:scientific-figure` -> `fig4.svg`
**Target:** Cell Press 174mm two-column, 6pt minimum body font, Okabe-Ito palette
**Embedded icons:** 4 transparent PNG brain-topography icons from `figures:transparent-icons`, inlined as base64 data URIs

## Programmatic checks (`check_svg.py`)

| Section | Result |
|---|---|
| Fonts | PASS. 71 text elements, all >= 6pt |
| Palette (Okabe-Ito) | PASS. 9 distinct colours, 0 off-palette |
| Geometry | PASS (stubbed). 71 text + 26 shapes |
| Summary | `issue_count: 0, warning_count: 0` |

## Visual judgment

| Dimension | Score | Note |
|---|---|---|
| Clarity | 5/5 | Each row maps perspective -> topography (with brain icon) -> band -> latency -> falsification region |
| Brain icon legibility | 5/5 | Top-down head silhouette with coloured region per perspective. Each topographic focus is spatially distinct: occipital (blue, back), central rolandic (vermillion, mid horizontal band), left frontotemporal (green, left-front patch), occipital+frontal (reddish-purple, dual regions) |
| Hierarchy | 5/5 | Dark grey column headers; tinted row backgrounds per perspective; cell text within each cell |
| Alignment | 5/5 | 4 row x 5 col grid flush; icon centred horizontally in 78pt-wide topography column |
| Palette coherence | 5/5 | Strict Okabe-Ito |
| Print legibility | PASS | All text >= 6pt |

## Findings

The brain icons in the topography column visually communicate the falsification region named in Section 7.3 of the manuscript. The icon for "occipital-and-frontal" (emotion) shows the two-region prediction's incompatible-latency framing better than text alone.

**Status: ship.**
