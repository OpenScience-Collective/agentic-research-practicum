# Figure QA Report — fig4_predictions.svg

**Detected type:** SVG (+ rendered PNG at 600 dpi)
**Target journal:** Trends in Cognitive Sciences (TiCS) -- generic journal profile used for programmatic checks
**Programmatic JSON paths:** `/tmp/svg-report.json`, `/tmp/raster-report.json`
**Date:** 2026-05-20

---

## Programmatic findings

- **Fonts:** 61 text elements checked, 0 flagged by the script (5 pt generic minimum). See critical print-size note below. 19 elements skipped (inherit from group context).
- **Palette:** 9 distinct colors seen, 0 off-palette. All four perspective fills are canonical Okabe-Ito: psychophysics `#0072B2` (blue), action `#D55E00` (vermillion), language `#009E73` (green), emotion `#CC79A7` (reddish-purple). PASS.
- **Geometry:** Overlap and arrow-tip checks stubbed in this release. VLM judgment covers layered-element correctness.
- **Alpha / background:** No alpha channel; all four corners pure white. Consistent with opaque TiCS PNG. PASS.
- **Resolution:** PNG is 1100x600 px with no embedded DPI metadata. At TiCS two-column (174 mm), effective raster DPI = 1100 / (174/25.4) = ~160 DPI, below the Cell Press 300 DPI minimum. FAIL.

### Critical print-size calculation

The SVG canvas is 1100 px wide with no explicit physical-unit `width` attribute. At TiCS two-column (174 mm = 6.85 in), 1 SVG px = 6.85/1100 x 72 = 0.448 pt. Effective print sizes:

| SVG font-size | Effective pt | TiCS/Cell Press minimum | Status |
|---|---|---|---|
| 8 px (head-schematic labels) | 3.6 pt | 5 pt labels | FAIL |
| 9 px (perspective subtitles, falsification text) | 4.0 pt | 6 pt body | FAIL |
| 10 px (band/latency values, row titles) | 4.5 pt | 6 pt body | FAIL |
| 11 px (column headers) | 4.9 pt | 6 pt body | FAIL |
| 15 px (figure title) | 6.7 pt | 6 pt | PASS |

The README style budget targets 7-9 pt for labels. Every text element except the figure title will be below the TiCS/Cell Press floor at two-column print width.

---

## VLM judgment (1-5 each)

| Dimension | Score | Note |
|---|---|---|
| Clarity | 4 | Band and latency cells are immediately readable; topographic foci communicate spatial predictions at a glance. The psychophysics row label carries two qualifying clauses that slow parsing but are substantively necessary. |
| Hierarchy | 4 | Dark-grey column headers and per-perspective color fills on the leftmost column form a clear primary layer; falsification narratives read as secondary body copy, which is the correct visual priority for this figure type. |
| Alignment | 4 | Cell boundaries are consistent across all rows and columns; the deliberate height difference between 100 px and 120 px rows is driven by text volume and does not feel arbitrary. |
| Palette coherence | 5 | Okabe-Ito fills at low opacity (0.18) for row backgrounds and higher opacity (0.45-0.95) for topographic foci create a unified tint-to-saturated progression within each hue, reinforcing per-perspective color coding throughout. |
| Journal-fit | 3 | At screen resolution the figure reads clearly. At TiCS two-column print size the light row tints, small grey secondary text, and minimal cell borders will appear washed out and under-dense relative to Cell Press visual standards. |

---

## Criterion pass/fail (per figure spec)

| Criterion | Status | Notes |
|---|---|---|
| Head-schematic legibility at print size | FAIL | Head outline ellipse (~30 pt tall) will be visible. Topographic focus ellipses are 8-20 pt wide; occipital focus (8 pt tall) and frontal bilateral circles (4.5 pt diameter) are at or below the legibility threshold. Label text below each schematic (8 px = 3.6 pt) will be illegible in print. |
| Topographic foci visually distinct between rows | PASS | Occipital (bottom, blue), central-rolandic (mid-head wide ellipse, vermillion), left-frontotemporal (offset 9 pt left, green, lower opacity), frontal bilateral circles plus occipital ellipse (pink) are spatially and chromatically separable. No two rows are confusable. |
| Text legibility: band and latency columns | FAIL | 4.0-4.5 pt effective. Both primary-tier values and secondary annotations fail the 6 pt body minimum. |
| Text legibility: falsification column | FAIL | 9 px = 4.0 pt effective. Text fits within the 390 px cell without overflow but will be unreadable at TiCS print size. |
| Sans-serif font | PASS | Root element declares font-family Helvetica, Arial, sans-serif; all elements inherit this. |
| Okabe-Ito palette | PASS | All four perspective colors are canonical Okabe-Ito; zero off-palette colors detected. |
| PNG resolution | FAIL | No DPI metadata embedded; effective ~160 DPI at two-column print size. Must be re-exported at 300-600 DPI. |

---

## Recommendation

- **Status:** revise
- **Highest-leverage fix:** Add physical dimensions to the SVG root element (`width="174mm" height="95mm"`) and scale all font sizes 1.5x (8 px to 12 px, 9 px to 14 px, 10 px to 15 px, 11 px to 17 px). This brings body text to ~6.3 pt and label text to ~5.4 pt, clearing the TiCS/Cell Press minimum. Expand logical canvas height to ~900 px so text does not overflow row cells after the scale. Re-export the PNG at 600 DPI with explicit metadata (`--export-dpi 600` in Inkscape or `dpi=600` in a programmatic export). No layout, palette, or topographic-focus changes are required; the figure structure and color encoding are sound.
