<!-- Figure legends. ~400 words total (not counted in main text).
Figures themselves are built in v2 Phase 3 via /figures:scientific-figure composer.
Figure legends drafted by manuscript:manuscript-writing in v2 Phase 2.
Skill pattern applied: "Figures are referenced in text in order" from
revision checklist; legends written for non-specialist readers per
the skill's Writing Principles -> Clarity guidance.
-->

# Figure legends

## Figure 1. Four-perspective strand map

Four research perspectives (psychophysics, action, language, emotion) mapped against 15 corpus themes. Filled coloured circles indicate substantial contribution from the perspective to the theme; outlined circles indicate absence or peripheral relevance. The four columns are colour-coded by perspective and the legend doubles as a colour key. Theme overlap is intentional: the perspectives interact at the per-shot ERSP level rather than partitioning variance cleanly.

## Figure 2. Naturalness gradient and developmental cohort coverage

Stimulus naturalness on the x-axis (controlled gratings, static photographs, Heider-Simmel triangles, abstract animation, character animation, live-action film) versus participant cohort on the y-axis (adult, adolescent, child). Markers are sized by number of corpus cards and shaped and coloured by modality (fMRI as circle, EEG as square, MEG as triangle, intracranial EEG as diamond; behavioural-only entries as the letter b). The dashed yellow rectangle at (child, character animation) marks the target cell for per-shot EEG ERSP at the 0 to 500 ms window: existing coverage is whole-clip ISC, not per-shot ERSP.

## Figure 3. Gap matrix

Eight named gaps from the four-strand corpus (rows) versus four prior-effort axes (cinematic fMRI, naturalistic scalp EEG, intracranial and MEG, behavioural and eye-tracking; columns). Filled cells list a representative card slug; cells marked "no coverage" with a vermillion dashed border indicate uncovered combinations. Thirteen cells across the eight rows carry no coverage, defining the design space for per-shot developmental EEG ERSP.

## Figure 4. Predictions and falsification regions, per perspective

Each perspective (row) is named with its predicted topography (with a head schematic showing the topographic focus), band, latency, and pre-registered falsification region. Psychophysics is the covariate, not the prediction. Action predicts central-rolandic mu-band (8 to 13 Hz) ERD over electrodes C3, Cz, and C4, with possible beta rebound (15 to 25 Hz). Language predicts no signal locally; a surviving cluster in left-frontotemporal IC space (Lipkin atlas negative-control mask) falsifies the four-perspective ranking. Emotion predicts early occipital alpha desynchronisation (80 to 300 ms) and later frontal F3/F4 asymmetry (200 to 500 ms), at incompatible latencies and topographies. The cluster-level alpha for falsification is p < 0.05 corrected by mass-univariate permutation.

## Figure assembly notes (for Phase 3)

- **Composer**: `/figures:scientific-figure` (multi-panel; the recommended composer per its skill description).
- **Panel sources**: `/figures:svg-figure` for matrix-style schematic panels (Figs 1, 3); `/figures:transparent-icons` for stimulus thumbnails (Fig 2 x-axis) and brain-topo icons (Fig 4 topography column); `/figures:plot-styling` only if any panel needs data plotting.
- **QA**: `/figures:figure-qa` on every panel and on the composed figure. Address all findings before completion. No deferrals.
