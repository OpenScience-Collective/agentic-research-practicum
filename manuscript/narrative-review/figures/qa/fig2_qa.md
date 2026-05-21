# Figure 2 QA — naturalness gradient

**Source:** `panels/fig2_plot.svg` composed via `figures:scientific-figure` -> `fig2.svg`
**Target:** Cell Press 174mm two-column, 6pt minimum body font, Okabe-Ito palette
**Embedded icons:** 6 transparent PNGs from `figures:transparent-icons` (Codex gpt-image-2 backend), inlined as base64 data URIs (rsvg-convert blocks external image refs as a CVE-2023-38633 mitigation; data URIs are the cross-renderer-portable workaround)

## Programmatic checks (`check_svg.py`)

| Section | Result |
|---|---|
| Fonts | PASS. 30 text elements, all >= 6pt |
| Palette (Okabe-Ito) | PASS. 12 distinct colours, 0 off-palette |
| Geometry | PASS (stubbed). 30 text + 33 shapes; 0 bbox overlaps |
| Summary | `issue_count: 0, warning_count: 0` |

## Visual judgment

| Dimension | Score | Note |
|---|---|---|
| Clarity | 5/5 | Stimulus icons + cohort rows + modality-encoded markers communicate three axes at once |
| Hierarchy | 4/5 | Title, axes, data markers, icons, legend stack cleanly. Empty-cell yellow box pulls focus appropriately |
| Alignment | 5/5 | Icons centred above their x-axis labels; data markers within their column gridlines |
| Icon set consistency | 5/5 | All 6 icons share the same line-drawing aesthetic and silhouette weight |
| Palette coherence | 5/5 | Okabe-Ito blue (fMRI), vermillion (EEG), green (MEG), reddish-purple (iEEG); yellow target-cell highlight is the only off-palette colour and serves as alert chrome |
| Print legibility at 174mm Cell width | PASS | All text >= 6pt; icons at 14mm physical size; markers at 1-2mm |

## Findings

The "target: per-shot EEG ERSP" highlight text sits inside the empty-cell rectangle and slightly overlaps the markers in that cell (the Inscapes pediatric circle + Petroni partial EEG square). This is intentional: the target is the empty per-shot ERSP measurement, and the existing partial-coverage markers being adjacent to the label reinforces "current coverage is whole-clip ISC, not per-shot ERSP". Not a bug.

**Status: ship.**
