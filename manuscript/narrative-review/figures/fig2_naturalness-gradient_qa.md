# Figure QA Report — fig2_naturalness-gradient.svg

**Detected type:** SVG (+ rendered PNG at 600 dpi)
**Target journal:** Trends in Cognitive Sciences (TiCS) — generic rules applied (no dedicated journal flag)
**Programmatic JSON:** `/tmp/fig2-svg-report.json`, `/tmp/fig2-raster-report.json`

---

## Programmatic findings

- **Fonts:** All text elements use sizes 9–15 px (SVG user units, ~pt at 96 dpi). Minimum is 9 pt; TiCS print minimum is ~6–7 pt. No elements below threshold. The `fonts` section returned `null` (check_svg font parser did not traverse these inline attributes), but manual audit of all 31 text nodes confirms range {9, 10, 11, 14, 15} — all pass.
- **Palette:** 1 off-palette colour detected: `#8a3b00` (RGB 138,59,0), nearest Okabe-Ito is vermilion `#D55E00` at distance 82.8. This colour is used exclusively for the target-cell annotation text and the highlight-rect stroke colour. It is a deliberate darkened derivative of the EEG vermilion, not an arbitrary colour, but it falls outside the strict Okabe-Ito set and could confuse colour-vision-deficient readers who rely on the EEG-orange anchor.
- **Geometry:** Geometric bbox overlap checks are stubbed in this release (script reports `available: true` but findings are advisory only). Manual coordinate audit performed — see VLM section.
- **Alpha / background:** No alpha channel; all four corners are pure white (RGB 255,255,255). Correct for a journal-margined opaque figure.
- **Resolution:** PNG is 1100 × 660 px with no embedded DPI metadata. At the target print width of 170 mm, effective DPI = 1100 / (170/25.4) ≈ 164 dpi — below the 300 dpi TiCS requires for raster figures. The SVG is scalable and preferred; the PNG must be re-exported at ≥300 dpi if submitted as a raster file.
- **Plot-library recommendation:** Not applicable (SVG source, not a plot script).

---

## VLM judgment (1–5 each)

| Dimension | Score | Note |
|---|---|---|
| Clarity | 4 | The grid layout, axis labels, and legend make the panel-level message immediately readable; the "b = behavioural-only" footnote glyph is easy to miss on first pass. |
| Hierarchy | 4 | The dashed yellow target cell draws the eye appropriately; the annotation text ("target: per-shot EEG ERSP") inside it is the clearest call-out in the figure. |
| Alignment | 3 | Markers in multi-modal cells (especially adult live-action) are horizontally cascaded rather than centre-stacked, so they spill rightward and overlap each other; the visual impression is slightly untidy even though nothing overflows the cell boundary. |
| Palette coherence | 4 | The four Okabe-Ito modality colours read as a coherent set. The dark-brown `#8a3b00` annotation text creates a subtle dissonance with the EEG-orange markers. |
| Journal-fit | 3 | The figure reads clearly as a conceptual overview matrix, which suits a narrative review. However, the subtitle text is very small and the bottom source note at 9 pt will be illegible at typical print scale; TiCS figures tend toward cleaner whitespace with no inline source citations. |

---

## Detailed criterion checklist (per spec)

| Criterion | Result | Details |
|---|---|---|
| Marker placement vs gridlines | **PASS with note** | All circle and text markers are centred on cell-centre X/Y coordinates. The EEG-square in the adult live-action cell is correctly offset (top-left anchor, visually stacked). Two MEG triangles have their visual apex offset ~15 px right of the cell centre (abstract-animation adult: dx=+15; live-action adult leading triangle: dx=+16), making them appear slightly misaligned relative to the fMRI circle in the same cell. |
| X-axis label legibility | **PASS** | All six two-line labels are 10 pt, horizontally centred on their cell, and spaced 12 px apart vertically. Legible at rendered size. "Heider-Simmel triangles" is the widest and fits within the 150 px column width. |
| Legend non-overlap with axis labels | **PASS** | The legend sits at absolute y ≈ 570; the lowest x-axis element ("naturalness gradient" italic) is at y ≈ 528. The 42 px gap is sufficient. No collision. |
| Target-cell visibility | **PASS** | The dashed `#D55E00` border on `#F0E442` fill (32% opacity) is visually prominent without overwhelming the markers inside it. The two text lines at y=268 and y=280 (plot-local) are fully within the rect (y=252..380). |
| Shape-vs-colour redundant encoding | **PASS** | fMRI=circle/blue, EEG=square/orange, MEG=upward-triangle/green, iEEG=diamond/pink. Each modality has a unique shape AND a unique Okabe-Ito colour. Readable in greyscale via shape alone. |
| Visual ambiguity | **FAIL (minor)** | (1) Child / character-animation cell: the fMRI circle (cx=666) and the EEG square (x=676) are separated by only 2 px — they nearly touch. A reader must squint to see two distinct markers. (2) The iEEG diamond in the adult live-action cell partially overlaps the MEG triangle (bboxes intersect). (3) The `#8a3b00` annotation text shares the EEG-orange visual channel and could be misread as an EEG-modality label rather than a free-text annotation. |

---

## Recommendation

- **Status:** revise
  - All font sizes pass. One off-palette colour is present but intentional (darkened EEG anchor for annotation). PNG DPI metadata is missing. Three minor visual-ambiguity issues need addressing before submission.

- **Highest-leverage fixes (in priority order):**
  1. **Child / character-animation cell:** separate the fMRI circle and EEG square by at least 6–8 px (e.g., shift the EEG square to x=680 or nudge both markers away from centre in opposite directions).
  2. **Re-export the PNG with explicit `dpi=300`** (or submit the SVG directly; confirm with TiCS production).
  3. **Target-cell annotation text colour:** change `#8a3b00` to a neutral dark grey (e.g., `#333333` or `#444444`) so it is visually distinct from the EEG-orange markers — this also resolves the off-palette finding.
  4. **MEG triangle horizontal alignment:** shift both MEG triangles to be centred on their cell's X midpoint (adjust `polygon points` offsets) to eliminate the ~15 px rightward drift relative to co-located fMRI circles.
