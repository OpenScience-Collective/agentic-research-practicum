<!-- Figure legends. ~400 words total (not counted in main text).
Figures themselves are built in v2 Phase 3 via /figures:scientific-figure composer.
Figure legends drafted by manuscript:manuscript-writing in v2 Phase 2.
-->

# Figure legends

## Figure 1. Four-perspective strand map

[Caption placeholder. Compose in Phase 2 after the Phase 3 figure-qa report is in. Reference the four perspectives, the 15 corpus themes, the colour code (Okabe-Ito), and the legend's redundant shape-and-colour encoding.]

## Figure 2. Naturalness gradient and developmental cohort coverage

[Caption placeholder. X-axis: stimulus naturalness gradient. Y-axis: participant cohort. Markers: size by number of corpus cards, shape by modality. Highlight the (child, character animation, EEG ERSP) empty cell.]

## Figure 3. Gap matrix

[Caption placeholder. 8 named gaps from `research/synthesis/gap-analysis.md` versus 4 prior-effort axes. Filled cells contain representative card slugs; empty cells highlighted.]

## Figure 4. Predictions and falsification regions, per perspective

[Caption placeholder. Each perspective (row) gives topography (with head schematic), band, latency, pre-registered falsification region. Reference the F5 carry-forward.]

## Figure assembly notes (for Phase 3)

- **Composer**: `/figures:scientific-figure` (multi-panel; the recommended composer per its skill description).
- **Panel sources**:
  - `/figures:svg-figure` for the matrix-style schematic panels (Figs 1, 3).
  - `/figures:transparent-icons` for stimulus thumbnails (Fig 2 x-axis: gratings, photographs, Heider-Simmel triangles, abstract animation, character animation, live-action film) and brain-topo icons (Fig 4 topography column).
  - `/figures:plot-styling` only if any panel needs data plotting; the current 4 figures are conceptual schematics, so it may not be needed.
- **QA**: `/figures:figure-qa` on every panel and on the composed figure. Address all findings before completion. No deferrals.
