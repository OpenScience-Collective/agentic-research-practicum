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
- **Q3:** Mu-band 8-13 Hz overlaps the alpha band. The Aims use "mu-band" but Phase 2 Innovation should clearly state how we distinguish mu from posterior alpha (IC topography + dipole location, AMICA + ICLabel pipeline).
