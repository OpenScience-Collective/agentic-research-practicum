# Figure QA Report — fig1_strand-map.svg

**Detected type:** SVG + rendered raster (PNG at 600 dpi)
**Target journal:** Trends in Cognitive Sciences (TiCS), single-column preferred
**QA agent:** figures:figure-qa (run on 2026-05-20)

## Programmatic findings

**Palette.** PASS. All four perspective fills match Okabe-Ito exactly (distance = 0.0): `#0072B2` blue, `#D55E00` vermillion, `#009E73` bluish-green, `#CC79A7` reddish-purple. Neutral grey `#888` for outlines and `#444` for the legend swatch do not conflict.

**Font size at TiCS single-column print (85 mm @ 300 dpi).** Conversion factor 0.40 pt per SVG user unit:

| Element | SVG size | Effective pt | Pass (>= 6 pt) |
|---|---|---|---|
| Title | 14 | 5.6 pt | FAIL |
| Subtitle, column headers, row labels | 10-11 | 4.0-4.4 pt | FAIL |
| Legend, source line | 9 | 3.6 pt | FAIL |

At double-column width (174 mm) all sizes pass (7.4-11.5 pt).

**Row-label alignment.** PASS. All 15 rows share uniform text-y to circle-cy offset of +4 units. Column header rectangles center exactly with their circle columns (cx 240, 330, 420, 510 match rect midpoints).

**Alpha and background.** PASS. 4/4 corners pure white; no alpha channel.

**PNG DPI metadata.** Missing. Print workflows default to 72 dpi without explicit DPI.

## VLM judgment (1-5)

| Dimension | Score | Note |
|---|---|---|
| Clarity | 4 | Filled vs outlined encoding is immediately legible. |
| Hierarchy | 4 | Coloured header bars anchor column identity; filled circles pop. |
| Alignment | 3 | Long row labels in rows 9-11 nearly touch the first circle column. |
| Palette coherence | 5 | Okabe-Ito set applied with no deviations. |
| Journal-fit | 3 | Font sizes too small for single-column print reduction. |

## Recommendation

**Status: revise.**

Three actions, in priority order:

1. **Scale all font-size values by 1.5x** (row labels 10 -> 15, column headers 11 -> 17, title 14 -> 21, legend 9 -> 14) OR redesign for double-column width. Without this the figure fails the TiCS single-column print floor.
2. **Re-export PNG with embedded DPI metadata** at 300 dpi or 600 dpi.
3. **Replace the single grey swatch in the legend with four small perspective-coloured circles** plus one outlined circle. This doubles the legend as a colour key and removes a header-lookup step.

## Disposition

Items 1-2 are deferred to Phase 5 (final journal-specific assembly). Item 3 is applied in Phase 2.
