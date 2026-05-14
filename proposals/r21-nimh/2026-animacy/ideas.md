# R21 Animacy, Design Decisions and Iteration Log

## 2026-05-13, Aims framing

**Decision: 2 aims, exploratory R21 format.**

R21 reviewers expect 2 aims, occasionally 3. With $275K direct over 2 years and an observational re-analysis of an existing open cohort, 2 aims is the right granularity. A third aim on autism-stratification or attention-stratification was considered and deferred to a follow-on R01.

**Decision: Aims 1 and 2 are independent (failure of one does not block the other).**

- Aim 1 maps the developmental trajectory under existing literature framing (mu rhythm action observation, frontal alpha asymmetry affective).
- Aim 2 is the methodological-rigor aim (LLR partialling, animacy versus luminance).

Per R21 best practice, neither aim depends on the other's success. Aim 1 produces a developmental ERSP map regardless of whether LLR partialling cleanly removes low-level variance. Aim 2's GLM produces interpretable estimates even if Aim 1's age-by-condition interaction is null.

**Decision: Hypothesis structure deliberately committed to falsification.**

The Aims explicitly state two falsification conditions in Aim 2 (surviving signal in left-frontotemporal language-network sites; no surviving signal at corrected alpha). This is unusual on an Aims page but matches the direction-paper thesis structure that locked on 2026-04-21 in [`.context/ideas.md`](../../../.context/ideas.md) and reads as scientific rigor rather than risk to reviewers when it follows from the literature gap.

## 2026-05-13, Scope decisions

**Decision: Animacy framed as a within-stimulus gradient, not a between-stimulus contrast.**

The boy-only versus puppy-only contrast inside *The Present* is the cleanest available, with mutually exclusive conditions (20 vs 15 shots after `match_diff_s > 1.0 s` QC), shared visual style, shared narrative arc, and a controlled LLR distribution. This avoids the confounds that plague between-movie animacy comparisons (Heider-Simmel triangles versus live action, etc.). The within-stimulus design is also reproducible by anyone with HBN-EEG R3, requiring no new data collection.

**Decision: Developmental cohort is HBN-EEG R3 as-is (ages 5-21), no clinical stratification at this R21.**

HBN includes participants with documented psychiatric diagnoses (autism, attention deficit, anxiety). The exploratory R21 deliberately treats the full developmental sample as a single curve to be characterized. Clinical stratification is the R01 follow-on.

**Decision: 100 Hz local data is the working set; 500 Hz S3 pull is validation only.**

Per repo CLAUDE.md, the local 184-subject 100 Hz BDF set is the dev data, and we validate against the full 500 Hz S3 release only after the pipeline lands. The R21 proposes the same: pipeline development on 100 Hz, group-level analysis on the 500 Hz release.

## 2026-05-13, NOFO decisions

**Decision: PA-25-304 (Parent R21) as primary; PA-25-150 (NINDS/NIMH joint) as alternate.**

See `NOFO.md`. PA-25-150 has a 2026-05-08 renewal notice (NOT-NS-26-007) that the NIMH funding page has not yet reconciled. Targeting the parent R21 removes this uncertainty without sacrificing reviewer fit.

## 2026-05-13, Aims word budget

Target under 650 words (NIH soft cap for 1 page at Helvetica 11pt, 0.5 inch margins, 4pt paragraph spacing). Current draft is approximately 470 words, leaving margin to expand the opening with one additional citation if Phase 2 lit expansion finds a stronger animacy-development anchor than Petroni-Cohen 2018 or Richardson-Saxe 2018.

## Open questions to revisit before Phase 5 freeze

- **Q1:** Should the R01 connector in Expected Impact name specific clinical conditions (autism spectrum, social anxiety) or stay generic ("clinical cohorts where animacy perception is altered")? Current draft is specific. Reviewer trade-off: specific is concrete but commits us to a particular follow-on, generic is safer but reads as boilerplate.
- **Q2:** Frontal asymmetry's reliability is contested ([reznik-allen-2018-frontal-asymmetry](../../../research/collection/emotion/reznik-allen-2018-frontal-asymmetry/card.md) vs the [davidson-2000-affective-style](../../../research/collection/emotion/davidson-2000-affective-style/card.md) framework). H1B is exploratory in the gap-analysis and is presented as such in the Aims. Decide in Phase 3 whether to keep H1B in the Aim or push it to a secondary analysis.
- **Q3:** Mu-band 8-13 Hz overlaps the alpha band. The Aims use "mu-band" but Phase 2 Innovation should clearly state how we distinguish mu from posterior alpha (IC topography + dipole location, AMICA + ICLabel pipeline). **Addressed in Phase 2 Innovation**: AMICA source clusters + ICLabel non-brain rejection separates central-rolandic mu IC clusters from posterior alpha IC clusters by topography and dipole.

## 2026-05-13, Phase 2 decisions

**Decision: Significance lands at ~420 words, not the planned 600.**

The R21 1-page Significance budget is ~600-650 words at 11pt Helvetica with 0.5" margins. The draft came in at 423 words across three tight paragraphs. Each paragraph maps to one reviewer question (importance, gap, route). Holding the line at 423 leaves margin for Phase 5 polish without page-bleed. If reviewer feedback in Phase 5 suggests under-developed clinical or developmental anchors, candidate expansions are: extra paragraph on transdiagnostic NIMH portfolio fit (cites [happe-frith-2013-atypical-social-cognition], [lord-2020-autism-primer]); a sentence each on attention or social anxiety in HBN.

**Decision: Innovation at 396 words across three labeled paragraphs (Conceptual, Technical, Methodological).**

Within the 0.75 page budget (~400-500 words). The "Methodological" paragraph leads with the falsification commitment from the Aims page rather than presenting it as an afterthought; this elevates the pre-registration norm from boilerplate to a reviewer-visible rigor signal.

**Decision: 14 new references added via opencite, not the 10-15 originally planned (target hit).**

Curated from 73 candidate entries across 7 queries (`lit-review/r21-annex.md`). Drop ratio 80%. Largest sources of useful additions: HBN protocol ([alexander-2017-hbn-protocol]), HED/BIDS infrastructure (`pernet-2019-eeg-bids`, `robbins-2021-hed`, `hermes-2023-hed-schema`), and developmental-EEG methods reviews (`buzzell-2023-eeg-developmental-tool`, `matusz-2018-real-world-neuroscience`). Notable: `hermes-2023-hed-schema` carries the PI on the author list, supporting Approach-section claims of technical capability in Phase 3.

**Decision: Per-query .bib outputs kept under `lit-review/` for audit trail.**

Q1-Q7 .bib files committed alongside `r21-annex.md` so reviewers can trace any kept reference back to its opencite query. The 59 dropped entries are documented in the annex under "Notable rejections" with rationale.

**Decision: Existing `direction-papers/movie-ersp-direction.md` is not modified.**

The direction paper stays as the comprehensive 4-perspective reference; the R21 Significance and Innovation extract a focused, reviewer-paced subset. Re-writing the direction paper would create maintenance burden across the analysis epic (#1) and the grant epic (#35) for no reviewer benefit.

## 2026-05-13, Phase 3 decisions

**Decision: Approach at ~1774 words across 5 sections.**

Below the 2400-2900 word plan target but the figures bring total page count to ~4 pages, within the 4.25-page Approach budget. Each section (Overview/Preliminary, Aim 1, Aim 2, Rigor, Timeline) hits its sub-target. The Approach is the proposal's longest section but no reviewer reward for verbosity; lean prose beats padded prose. Phase 5 humanizer pass can trim further if needed.

**Decision: Preliminary Data scoped to pilot pipeline feasibility on 3 subjects, not preliminary effects.**

Honest framing: we have a working preprocessing + AMICA + dipole pipeline on 3 randomly sampled HBN subjects, validated by per-stage PSD progression and ICLabel + dipole-localization outputs. We do NOT have group-level ERSP, IC clustering across subjects, or condition contrasts. Approach.md states explicitly: "We do not claim hypothesis-level evidence for H1A, H1B, or H2 at the proposal stage; we claim that the pipeline that will produce that evidence is feasible at scale." This protects against the common R21 failure mode of overclaiming pilot data.

**Decision: 5 figures planned, 3 generated as PNG in Phase 3, 2 deferred.**

Generated now:
- Fig 2 (`fig2-preliminary-data.png`, 1.3 MB): 2x3 composite of 3-subject IC topographies and dipole fits, built via `fig2-preliminary-data.py` from existing `derivatives/amica/` artifacts.
- Fig 3 (`fig3-stimulus-annotation.png`, 183 KB): 3-panel diagram (shot-onset timeline, LLR distribution, duration histogram) built via `fig3-stimulus-annotation.py` from `shot_events.tsv`.

Deferred (Mermaid markdown source / table for now, PNG render at Phase 5):
- Fig 1 (`fig1-pipeline-schematic.md`, Mermaid): pipeline schematic with done-vs-proposed coloring.
- Fig 5 (`fig5-timeline.md`, table): 24-month milestone Gantt as a markdown table; matplotlib Gantt at Phase 5 assembly.
- Fig 4 (ERSP exemplar): placeholder until Epic #1 Phase 5 lands a real exemplar; can substitute a sketched panel at Phase 5 if Epic #1 Phase 5 has not produced one by then.

**Decision: Shot-count reconciled with actual data (51, not 49).**

`shot_events.tsv` at the repo root has 58 rows. With `match_diff_s` quality control (excluding rows with `|match_diff_s| > 1.0`, treating NaN as trusted), 51 shots survive: 20 boy-only, 15 puppy-only, 16 mixed-or-empty. The `49 trusted` claim in repo CLAUDE.md and Phase 1's `.context/ideas.md` is data-drift from an earlier QC pass. Approach.md uses the actual count (51); analysis-side documentation reconciliation (`CLAUDE.md`, `.context/ideas.md`) is logged as a Phase 5 hygiene item but not gating.

**Decision: Falsification region is locked via `lipkin-2022-language-atlas` ±15 mm.**

R21 Aim 2.D commits to the falsification region pre-registration on OSF at month 6. The locked criterion is "IC cluster dipole centroid within ±15 mm of any `lipkin-2022-language-atlas` peak coordinate". This is concrete enough for a reviewer to verify and tight enough to be a genuine commitment.

**Decision: Blinded GLM protocol committed to month 6.**

`tests/matlab/blinded_glm_protocol.m` does not exist yet in the analysis epic; Approach.md commits to implementing it in month 6 of the funded period. The analysis-epic phase 4-6 work informs the production implementation but the blinding wrapper is R21-specific.

## 2026-05-13, Phase 3 unresolved items for Phase 5

- **Fig 1 PNG render**: Mermaid source is in `fig1-pipeline-schematic.md`; needs render via `mmdc` CLI or web rasterizer at Phase 5.
- **Fig 4 ERSP exemplar**: blocked on Epic #1 Phase 5. If Phase 5 of the grant epic comes first, substitute a sketched IC exemplar with explicit "schematic" labeling.
- **Fig 5 Gantt PNG**: convert the Markdown timeline table to a horizontal Gantt bar chart via matplotlib at Phase 5.
- **Shot-count reconciliation**: Update repo `CLAUDE.md` and `.context/ideas.md` from "49 trusted" to "51 trusted" in a separate small PR (analysis-epic hygiene, not R21-blocking).

## 2026-05-13, Phase 4 decisions

**Decision: All 9 supplemental files drafted with `[BRACKETED]` placeholders.**

PI institution, named co-Is, statistical consultant, F&A rate, and specific cluster names are bracketed throughout the supplemental docs. The user customizes by find-replace before submission. This was selected over pre-filling UCSD / SCCN because (a) PI affiliation is not formally locked, (b) bracketed placeholders force explicit attention and prevent stale defaults from slipping through to submission.

**Decision: Bibliography is consolidated, not slug-rewritten.**

`bibliography.bib` concatenates all 4 strand `.bib` files plus `refs.bib` plus 4 new entries for slugs missing from the corpus (Delorme & Makeig 2004 EEGLAB, Hamlin 2013 infant social cognition, Palmer 2008 AMICA, Plöchl 2012 eye-EEG artifact). Total 117 BibTeX entries. The R21 markdown uses citation slugs; `bibliography.md` documents the slug-to-key mapping. Phase 5 LaTeX assembly does the slug-to-key resolution at render time. This was selected over rewriting all entries with slug keys because (a) faster (no per-entry rewrite), (b) preserves the strand bibs as the source of truth, (c) deduplication and NIH-numbering happen once at Phase 5 rather than twice.

**Decision: Budget is 5+6 modules ($125K Y1 + $150K Y2).**

Front-loads pipeline validation in Year 1 (lower expenses, higher PI effort drafting / preregistering); back-loads group-level analyses, manuscript production, statistical consulting, replication, and depositions in Year 2. This split is defended in `budget/budget.md` against the alternative symmetric split. R21 cap of $200K/year is respected at both years.

**Decision: F&A indirect cost rate left bracketed.**

The F&A rate varies by institution and rate agreement date. `budget/budget.md` shows the `[CALCULATED AT PI INSTITUTION F&A RATE]` placeholder for both years; the **[PI INSTITUTION]** grants office computes the final total cost figure at submission. Indirect costs do not count against the $275K direct-cost cap.

**Decision: Bibliography render to NIH-numbered style happens at Phase 5.**

The markdown slug citations in Aims, Significance, Innovation, and Approach remain readable in source. At Phase 5 LaTeX assembly, a build step converts slug references to NIH-numbered citations (Vancouver-like, no author-year), keeping the source readable while producing reviewer-format output.

**Decision: Letters of support are queued, not drafted in Phase 4.**

`REQUEST_QUEUE.md` lists 5 named targets with explicit asks, draft-language file references (`templates/los-*.md`), solicit dates, and follow-up dates. The actual letter templates are deferred to a follow-up commit when the user provides named contacts; this avoids stale draft language that would be re-written for each named target.

**Decision: Biosketch placeholders use NIH format but call out SciENcv export at submission.**

`PI-Shirazi.md` is a substantial NIH-format draft with `[BRACKETED]` fields for degrees, positions, honors, and citation lists; **the actual submission biosketch is exported from SciENcv** by the PI at submission time. The Phase 4 markdown serves as a planning document for what to populate in SciENcv. Co-investigator and senior-advisor biosketches are skeletons only.
