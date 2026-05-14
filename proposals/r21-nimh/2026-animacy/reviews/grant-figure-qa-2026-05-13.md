# Grant Figure QA Report — R21 NIMH PA-25-304
Date: 2026-05-13
Proposal: proposals/r21-nimh/2026-animacy/submission/

---

## Figure 1: fig1-pipeline-schematic.md (Mermaid source, not yet rendered)

Status: PASS-WITH-FINDINGS

- Resolution/format: Not yet a raster file; renders to PNG via Mermaid CLI at Phase 5. No DPI issue to assess until rendered. The render step must target 300 dpi at 7-inch width (per README.md).
- Color accessibility: Three node classes use hex fill colors (#d4edda green, #fff3cd yellow, #cce5ff blue). All three are distinguishable by hue and lightness; grayscale contrast between green and yellow is marginal (both light). Before render, verify the three node fills remain distinguishable in a grayscale print preview.
- Caption: The caption in fig1-pipeline-schematic.md is complete and self-contained. The approach.md introduction references "Figure 1" correctly.
- Finding: The Mermaid source includes no explicit font-size directive. Default Mermaid node font is ~14 px in the SVG, which maps to approximately 10 pt at 300 dpi/7-inch width -- above the 8 pt minimum -- but this must be confirmed after render. If the Mermaid CLI scales the diagram to fit 7 inches, node labels inside the LR-flow boxes may shrink below 8 pt if more nodes are added in future revisions.

---

## Figure 2: fig2-preliminary-data.png (2018 x 1384 px, ~300 dpi)

Status: PASS-WITH-FINDINGS

- Resolution: 2018 x 1384 px at 299.9 dpi. At 7-inch target width the effective DPI is 288 (2018 / 7 = 288.3). This is below the NIH 300 dpi floor for photographs. The shortfall is 4%, within rounding tolerance, but the saved metadata reports 300 and the actual pixel count does not quite reach it. Regenerating at 300 dpi with figsize=(7, 4.5) and dpi=300 will produce 2100 x 1350 px.
- Format: PNG. Acceptable for NIH PDF embedding.
- Color accessibility: The IC topography panels use the EEGLAB default red-blue colormap. This colormap is not colorblind-safe for red-green deficiency (deuteranopia). The dipole panels use a rainbow/HSV-like palette. Both are inherited from EEGLAB's default rendering and cannot be changed in the fig2-preliminary-data.py composite script without modifying upstream EEGLAB output. This is a known limitation; the caption should acknowledge that color is supplementary and that component identity is established by location, not hue alone.
- Font legibility: The subplot title fontsize is 8 pt and the ylabel fontsize is 9 pt, both at the minimum threshold. The subject ID strings in the subplot titles (e.g., "sub-NDARAA948VFH") are long and render at 8 pt; they are legible on screen but may be tight when printed at 7 inches. The internal EEGLAB IC-number labels visible within each topography panel appear to be approximately 6-7 pt and will likely be illegible at print size; these are embedded in the source PNGs and cannot be changed via the composite script.
- Caption in README.md: States "Top row: IC topographies for sub-NDARAA948VFH, sub-NDARAC853DTE, sub-NDARAD774HAZ. Bottom row: corresponding dipole-fit results." The caption does not define abbreviations IC (independent component) or AMICA (adaptive mixture independent component analysis) -- both must be defined because NIH reviewers evaluate figures as standalone items. The caption also omits the color-bar interpretation for topographies and does not state the residual-variance threshold used to accept dipole fits.
- Axes/scale: Topography panels have no colorbar scale or units label. Dipole panels show dipoles on a brain MRI slice without a scale bar or MNI coordinate reference. These are acceptable conventions in the field but should be noted in the caption.

---

## Figure 3: fig3-stimulus-annotation.png (2134 x 1834 px, ~300 dpi)

Status: PASS-WITH-FINDINGS

- Resolution: 2134 x 1834 px at 299.9 dpi. At 7-inch width effective DPI is 304.9 -- passes the 300 dpi threshold. Printed height would be 6.11 inches; total figure height within the 10-inch page limit.
- Format: PNG. Acceptable.
- Color accessibility: The palette is the Wong colorblind-safe set (#0072B2 blue, #E69F00 orange, #999999 gray). This is correct and passes the colorblind safety check for both deuteranopia and protanopia. The blue/orange pair also separates cleanly in grayscale.
- Font legibility: Legend text and axis labels render at fontsize=8, panel titles at the default (approximately 10 pt via matplotlib rcParams). All are at or above the 8 pt floor.
- Panel B (LLR histogram): The histogram uses alpha=0.6 overlap. Because boy-only and puppy-only bins overlap, the overlapping region renders as a blend of blue and orange that in grayscale may be ambiguous. Hatching one of the two distributions (e.g., hatch='//' for puppy-only) would make the overlap region unambiguous in black-and-white print.
- Caption: The README.md caption for Figure 3 states "49 trusted shots." The actual data (shot_events.tsv, 58 total rows, 51 trusted after the match_diff_s <= 1.0 filter) yields 51 trusted shots, which matches approach.md and the rendered suptitle. The README.md caption is therefore stale and inconsistent. The caption also mentions "class-conditional medians" for the LLR panel, but the rendered figure does not draw median lines -- only the zero-LLR reference line (axvline at 0). The caption must be corrected to remove the median claim or the figure must add median markers.
- Panel A (eventplot): The eventplot y-axis has no label (yticks suppressed, which is correct for a raster), but the three color categories are clearly distinguished in the legend. Panel A title duplicates the suptitle's "trusted shots" language; minor redundancy.

---

## Figure 4: fig4-ersp-exemplar.png (not present)

Status: FAIL (expected absent -- placeholder)

- The file is not in the figures directory. This is documented as intentional in README.md ("placeholder until Epic #1 Phase 5 lands"). The approach.md caption states "To be generated in month 9 of the funded period."
- NIH impact: A missing figure that is referenced as "Figure 4" in the approach section will cause reviewer confusion unless the reference is explicitly flagged as a planned figure. Currently approach.md does NOT contain an in-text "(Figure 4)" citation -- search of the document finds no "Figure 4" reference. The README.md lists it under "Aim 1.C" section heading, but approach.md does not cross-reference it by number. This is acceptable for submission only if Figure 4 is entirely omitted from the submitted PDF (not shown as a blank or placeholder panel). Confirm the submission assembler skips fig4 and does not insert a blank page.

---

## Figure 5: fig5-timeline.md (Markdown table, not yet rendered to Gantt PNG)

Status: PASS-WITH-FINDINGS

- Not yet rendered. The Markdown table is complete and internally consistent (8 quarters covering months 1-24 with named milestones). Render as a matplotlib Gantt at Phase 5 per the render plan.
- The approach.md Timeline section references "Figure 5 (24-month milestone chart)" without a bold **(Figure 5)** inline citation matching the convention used for Figures 1-3. The reference is present but stylistically inconsistent.
- When rendered, ensure the Gantt font size is >= 8 pt at printed width. The milestone label text is long (e.g., "N=50 expansion; OSF pre-registration of Aim 1 and Aim 2 plans (month 6)") and may require wrapping or abbreviation to remain legible in a half-column placement.

---

## Cross-Reference Findings

1. **Shot count discrepancy (critical).** README.md figure inventory says "49 trusted shots" for Figure 3. approach.md and the actual shot_events.tsv both give 51 trusted shots (20 boy-only, 15 puppy-only, 16 mixed-or-empty). The rendered figure suptitle correctly shows 51. The README.md caption must be updated to 51.

2. **Figure 4 in-text citation absent.** approach.md has no "(Figure 4)" in-text citation. README.md assigns Figure 4 to the Aim 1.C section, but that section in approach.md does not cite Figure 4. This is defensible if the plan is to omit Figure 4 from submission; it becomes a problem only if the figure is later added without updating the cross-reference.

3. **Figure 5 citation style inconsistency.** Figures 1-3 are cited as bold **(Figure N)** inline. Figure 5 is referenced as "Figure 5 (24-month milestone chart)" in a section header sentence rather than an inline bold citation. Harmonize the style.

4. **No "Figure 4" in approach.md, yet README assigns it to Aim 1.C.** If the Phase 5 exemplar ERSP figure is added before submission, approach.md section 1.C must receive the corresponding "(Figure 4)" inline citation and a caption must be added to the submitted PDF.

---

## Top 3 Priority Fixes Before Submission

1. **Fix the 49 vs 51 shot count in README.md.** The figure inventory caption says 49; the data, the rendered figure, and approach.md all say 51. A reviewer who cross-checks the caption against the text will see an inconsistency. Update README.md line for Figure 3 to read "51 trusted shots."

2. **Add median lines to Figure 3 Panel B or remove the median claim from the caption.** The README.md caption promises "class-conditional medians" in the LLR histogram, but the rendered figure shows no median markers. Either add `axvline` calls for each class median in fig3-stimulus-annotation.py, or strike "class-conditional medians" from the caption. A caption that claims content the figure does not contain is a direct compliance risk.

3. **Regenerate Figure 2 at true 300 dpi and add colormap and dipole-fit caveats to its caption.** The current pixel count (2018 wide) falls 4% short of the 300 dpi target at 7-inch width. Regenerating with matplotlib dpi=300 and figsize=(7, 4.5) yields 2100 px wide (true 300 dpi). Simultaneously update the caption to define IC and AMICA on first use, note that the EEGLAB topography colormap is not colorblind-safe and that hue is supplementary to spatial location for component identification, and state the residual-variance threshold (15%) used to accept dipole fits.
