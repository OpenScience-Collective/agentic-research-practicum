# Figures, R21 Animacy

Inventory of figures referenced in `submission/research-strategy/approach.md`. Each figure has a source (script or composite recipe), a target render path, and the section reference where it lives in the manuscript.

| # | File (target) | Source | Approach section | Caption (draft) |
|---|---|---|---|---|
| 1 | `fig1-pipeline-schematic.{md,png}` | `fig1-pipeline-schematic.md` (Mermaid) | Overview | Pipeline schematic, BIDS to cluster-level statistics, with stage labels and per-stage QA artifacts. |
| 2 | `fig2-preliminary-data.png` (composite) | `fig2-build.sh` (ImageMagick montage of `derivatives/amica/sub-*/figures/{ic-topos,dipoles}.png`) | Preliminary data | 3-subject AMICA IC topographies and dipole fits. Top row: IC topographies for `sub-NDARAA948VFH`, `sub-NDARAC853DTE`, `sub-NDARAD774HAZ`. Bottom row: corresponding dipole-fit results. |
| 3 | `fig3-stimulus-annotation.png` | `fig3-stimulus-annotation.py` (matplotlib) | Preliminary data, Aim 2.A | Three panels, (A) shot-onset timeline showing 49 trusted shots colored by class (boy-only, puppy-only, mixed), (B) log luminance ratio (LLR) distribution histogram with class-conditional medians, (C) duration histogram per class. |
| 4 | `fig4-ersp-exemplar.png` | placeholder until Epic #1 Phase 5 lands | Aim 1.C | Single-subject ERSP exemplar at a central-rolandic IC cluster, -600 to +600 ms around shot onset, 2 to 30 Hz, baseline -500 to -100 ms. To be generated in month 9 of the funded period. |
| 5 | `fig5-timeline.{md,png}` | `fig5-timeline.md` (Markdown table; matplotlib Gantt at Phase 5) | Timeline | 24-month milestone chart with 4 quarters (pipeline validation, Aim 1 group analysis, Aim 2 group analysis, closeout + R01 prep). |

## Render order at Phase 5 assembly

1. `fig1-pipeline-schematic.md` rendered to PNG via Mermaid CLI.
2. `fig2-build.sh` run to produce `fig2-preliminary-data.png` from existing AMICA derivatives.
3. `fig3-stimulus-annotation.py` run via `uv run` to produce `fig3-stimulus-annotation.png`.
4. `fig4-ersp-exemplar.png` produced by Epic #1 Phase 5 output (path: `derivatives/ersp/cluster-*/exemplar.png`). At submission time, the latest available exemplar is composited.
5. `fig5-timeline.md` rendered as a Gantt chart via matplotlib at Phase 5 assembly.

## NIH formatting requirements

- Width: 7 inches at 0.5-inch margins on letter paper.
- Resolution: 300 dpi.
- Font size in figure text: minimum 8 pt at printed size.
- Color-blind safe palette (Wong palette or matplotlib `colorblind`).
