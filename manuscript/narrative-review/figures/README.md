# Figure plan — TiCS narrative review

Four figures, SVG source + 600 dpi PNG export per Cell Press image requirements. Authored in Phase 2 with `figures:svg-figure`. Each figure has a `figure-qa` report saved alongside.

## Figure 1 — Four-perspective strand map

**Purpose.** Visual scaffold of the central thesis. Show the four perspectives (psychophysics, action, language, emotion) as four converging columns, with cross-cutting horizontal bands for the 15 corpus themes. Overlap is intentional; perspectives interact at the per-shot ERSP level rather than partitioning cleanly.

**Encoding.**
- X-axis: perspective (psychophysics, action, language, emotion).
- Y-axis: 15 corpus themes from `research/synthesis/science-map.md`.
- Cell content: filled if the perspective contributes substantially to the theme.
- Annotation: arrows from psychophysics to action and emotion ("partialling enables"), arrow from language to action and emotion ("comparator of non-transfer"), arrow from emotion to action ("co-modulation").

**Source data.** Combine the four `*-ontology.md` files and `science-map.md`. No new data collection.

**Dimensions.** Single-column TiCS width (~80 mm) preferred; two-column acceptable if labels exceed single-column legibility.

**File.** `fig1_strand-map.svg`, `fig1_strand-map.png`, `fig1_strand-map_qa.md`.

## Figure 2 — Naturalness gradient with cohort overlay

**Purpose.** Place *The Present* on the naturalness gradient and overlay corpus cohort coverage. Make the developmental EEG ERSP cell visibly empty.

**Encoding.**
- X-axis: naturalness gradient (controlled gratings -> static photos -> Heider-Simmel triangles -> abstract animation [Inscapes] -> character animation [*The Present*, Pixar shorts] -> live-action film).
- Y-axis: cohort coverage (adult, adolescent, child).
- Marker per corpus card placed at intersection (size encodes number of cards, colour encodes modality: fMRI, MEG, EEG, iEEG, behavioural).
- Highlight the (child, character-animation, EEG, per-shot ERSP) cell as the empty cell of interest.

**Source data.** Combine `dataset-hierarchy.md`, `science-map.md` Theme 3, and per-strand `*-ontology.md`. Use card-level cohort age fields.

**Dimensions.** Two-column width (~170 mm) likely required to label all gradient steps.

**File.** `fig2_naturalness-gradient.svg`, `fig2_naturalness-gradient.png`, `fig2_naturalness-gradient_qa.md`.

## Figure 3 — Gap matrix

**Purpose.** Operationalise the gap analysis in a single visual. Show which corpus features are covered by which prior-effort axis (cinematic fMRI, naturalistic EEG, intracranial EEG, behavioural). Identify the uncovered cells.

**Encoding.**
- Rows: 8 named gaps from `gap-analysis.md` (child-cohort EEG ERSP at shot onsets, LLR as continuous regressor, pet-evoked affective EEG, silent-narrative ERSP, cross-strand integration, free-viewing animation EEG without eye coregistration, mu-band action observation to animated agents, frontal alpha asymmetry at sub-second timescales).
- Columns: prior-effort axes (cinematic fMRI, naturalistic scalp EEG, iEEG, behavioural).
- Cell content: filled if coverage exists, with a card-slug label; empty cell highlighted in colour.

**Source data.** `gap-analysis.md` three-column coverage table.

**Dimensions.** Two-column width.

**File.** `fig3_gap-matrix.svg`, `fig3_gap-matrix.png`, `fig3_gap-matrix_qa.md`.

## Figure 4 — Predictions table-figure

**Purpose.** Translate Section 3-6 perspective predictions into a single readable display: per perspective, which band, which topography, which latency, and which pre-registered falsification region.

**Encoding.**
- Rows: four perspectives.
- Columns: band (frequency range), topography (electrode group or IC cluster), latency (ms window), falsification region (band-and-topography rejection criterion).
- Annotation: thumbnail head schematic per row showing the topography.
- Cell content: text + colour-coded band.

**Source data.** Sections 3-6 of `manuscript.md` plus self-review F5 falsifiability region.

**Dimensions.** Two-column width.

**File.** `fig4_predictions.svg`, `fig4_predictions.png`, `fig4_predictions_qa.md`.

## Style budget

- Colourblind-safe palette throughout (Cell Press recommends Wong/Okabe-Ito or viridis).
- Sans-serif fonts (Helvetica or equivalent) at 7-9 pt for axis labels, 10-11 pt for figure titles.
- Line weight: 0.5-1.0 pt for axes, 1.5 pt for highlighted elements.
- No reliance on colour alone to convey information (use shape, label, or shading redundantly).

## Caption length budget

Cell Press allows ~150-200 words per caption (concise; rules described in figure body). Draft captions in Phase 3 manuscript writing.
