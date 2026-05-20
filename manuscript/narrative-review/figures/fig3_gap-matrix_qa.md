# Figure QA Report — fig3_gap-matrix.svg

**Detected type:** SVG (+ rendered raster PNG)
**Target journal:** Trends in Cognitive Sciences (TiCS / Cell Press)
**Programmatic JSON:** `/tmp/svg-report2.json`, `/tmp/raster-report.json`

---

## Programmatic findings

- **Fonts:** 0 of 36 explicitly-set text elements below journal minimum. 49 elements inherit `font-size="9"` from the parent `<g transform="translate(40,116)" font-size="9">`; effective size is 9 pt throughout the data grid, above the Cell Press 6 pt floor. Pass.
- **Palette:** 3 off-Okabe-Ito colors flagged (checker distance threshold ~80):
  - `#e7f0fa` (cinematic fMRI cell tint, dist 148 to nearest OI color). Intentional lightened derivative of OI blue `#0072B2`; acceptable as a fill tint.
  - `#fef0e7` (naturalistic EEG cell tint, dist 144). Intentional lightened derivative of OI vermillion `#D55E00`; acceptable.
  - `#8a3b00` (no-coverage text fill, dist 83 to OI vermillion). Custom dark-brown; the only genuinely non-OI color. See fix below.
- **Geometry:** Overlap and arrow-tip checks stubbed in this release; VLM judgment covers layering. No overlaps reported.
- **Alpha / background:** No alpha channel; all four corners pure white. Correct for a journal-margined PNG. Pass.
- **Resolution:** 1100 x 720 px; no DPI metadata embedded. At 600 dpi this maps to ~47 x 30 mm, smaller than the intended two-column TiCS width (~170 mm). Re-export at 170 mm width, 600 dpi (~4016 x 2630 px) before submission.

---

## VLM judgment (1-5 each)

| Dimension | Score | Note |
|---|---|---|
| Clarity | 5 | Slug text in filled cells and bold orange-bordered "no coverage" in empty cells make each cell instantly interpretable without a caption. |
| Hierarchy | 4 | Gap labels and column headers register first, data slugs second — correct reading order. Minor deduction: the subtitle line is nearly as visually prominent as the title due to its length. |
| Alignment | 4 | All 8 rows and 4 data columns are flush; 0.5 pt grey cell borders are consistent throughout. Single deduction: the row-label column (280 px) is 100 px wider than each data column (180 px), creating a left-heavy composition; tightening to ~240 px or widening data columns to 200 px would improve balance. |
| Palette coherence | 4 | The four column tints (light blue, light orange, light green, light mauve) read as one harmonised family. Deduction: the dark-brown `#8a3b00` no-coverage text is slightly muddy against white; replacing it with OI vermillion `#D55E00` (same hue as the dashed border) would unify the highlight element. |
| Journal-fit | 3 | The matrix is a competent Cell Press display figure overall, but the decreasing-opacity header strategy fails at the light end. Column 4 ("behavioural / eye-tracking") at `fill-opacity="0.46"` renders white text on an effective ~rgb(137,190,219) background, giving a contrast ratio of ~2.0:1; column 3 ("intracranial / MEG") at `fill-opacity="0.62"` yields ~2.7:1. Both fall well below the 4.5:1 WCAG AA threshold. The rendered PNG confirms both headers look pale and washed-out. |

---

## Recommendation

- **Status:** revise
  - `ship` criteria not met: column-3 and column-4 header contrast fails journal legibility standards.
  - Two concrete fixes (below) are sufficient to reach `ship`.

- **Highest-leverage fix (blocker):** Correct column-header contrast for columns 3 and 4. Options: (a) raise `fill-opacity` on column 3 to at least `0.82` and column 4 to `1.0` (full OI blue, white text at 5.2:1); or (b) keep the light tint but switch the text color to a dark shade of the same blue (e.g., `#003d6e`) on columns 3 and 4. The decreasing-opacity encoding communicates prior-effort prominence elegantly, but the two lightest steps currently sacrifice legibility.

- **Secondary fix:** Replace all 14 instances of `fill="#8a3b00"` (13 data cells + 1 legend entry) with `fill="#D55E00"`. This unifies no-coverage text color with its dashed border, eliminates the sole genuinely off-palette color, and keeps strong contrast against white cell backgrounds (~4.8:1 for 9 pt bold).

- **Advisory (non-blocker):** Embed DPI metadata in the PNG export and re-render at 170 mm width, 600 dpi (~4016 x 2630 px) for the final submission file to satisfy Cell Press print requirements.

---

*Programmatic scripts: `/Users/yahya/.claude/plugins/cache/research-skills/figures/0.9.0/agents/figure-qa-scripts/check_svg.py`, `check_raster.py`.*
*JSON reports: `/tmp/svg-report2.json`, `/tmp/raster-report.json`.*
