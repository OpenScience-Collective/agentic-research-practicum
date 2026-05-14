# Grant Review, R21 Animacy

Independent review pass on the assembled R21 (Specific Aims + Research Strategy = 7 pages text + supplemental sections). Scores use the NIH 1 (exceptional) to 9 (poor) scale; the fundable range is 1 to 3, payline typically near 2.

## Significance, score 3

**Rationale.** Three reviewer questions (importance, gap, route) are answered in three matched paragraphs. The gap claim ("zero scalp-EEG studies report per-shot ERSP in a developmental cohort viewing animation") is concrete and verifiable from the cited gap analysis. The clinical translation (autism, social anxiety, conduct disorder) is plausible without overreach.

**Concerns.**

1. The clinical-translation paragraph names three conditions but cites only the autism literature (`lord-2020-autism-primer`, `marco-2011-sensory-autism`). Either tighten to autism or add one citation each for social anxiety and conduct disorder.
2. The "developmental window matters because the social-cognitive networks mature non-monotonically through childhood and adolescence" claim cites only `happe-frith-2013-atypical-social-cognition` and `richardson-saxe-2018-social-brain-development`. A reviewer might want a maturation-curve citation specifically; consider `petroni-cohen-2018-isc-naturalistic-videos` (already cited elsewhere) as a developmental-trajectory anchor.

**Suggested fixes (no scientific change).**

- Paragraph 3 reads as method-heavy; move the AMICA + ICLabel + LLR-GLM mechanic to Innovation and use the freed sentence to deepen the developmental-window argument.
- Define "log luminance ratio (LLR)" on first use in Significance rather than carrying the abbreviation in from Aims.

## Innovation, score 3

**Rationale.** Three innovations are cleanly separated (conceptual, technical, methodological). The pre-registration falsification commitment is the standout: it elevates the proposal from "another naturalistic EEG study" to a falsification-shaped exploratory R21, which scores well on the NIH Approach-rigor subscore. The PI's authorship on `hermes-2023-hed-schema` is appropriately leveraged in Technical without being self-congratulatory.

**Concerns.**

1. The "novel at the group level" claim in Technical needs sharper bound. Reviewer thinking: "Are you sure no one has done this in EEG?" Cite a published systematic review or your `gap-analysis.md` Gap 2 directly.
2. The Methodological paragraph's last sentence ("an enabling rather than rhetorical innovation") is borderline promotional. Consider tightening to "deposited as a community resource".

**Suggested fixes.**

- Add a sentence in Technical clarifying that LLR is one of three feasible low-level regressors (motion energy, optical flow being the others) and that the choice is principled, not arbitrary; reference `kauttonen-2015-cinematic-fmri` for the per-shot-feature-as-regressor framework.

## Approach, score 3

**Rationale.** Approach is methodically complete: cohort + inclusion, preprocessing pipeline, ERSP analysis, group-level GLM specification, expected outcomes, problems and alternatives, then Rigor and Timeline. The pre-registered falsification region (`lipkin-2022-language-atlas` ±15 mm) is concrete enough to verify. The 24-month timeline distributes milestones evenly across 8 quarters.

**Concerns.**

1. The expected effect size for H1A (mu-band ERD "1 to 2 dB") is borrowed from `oberman-2006-mu-mirror-autism`, an adult sample. The developmental effect size at age 5-21 is likely smaller; a sensitivity analysis citing the expected range would strengthen 1.E.
2. The cohort retention assumption (N≈160 after 16% attrition) is on the optimistic side for naturalistic-viewing pediatric data; `buzzell-2023-eeg-developmental-tool` reports higher attrition in some pediatric naturalistic protocols. Consider widening the expected-N range to "approximately 140-170".
3. The motion-energy regressor in 2.F is named as a sensitivity check; reviewers may push to include it as a primary covariate. Consider adding a sentence about why LLR alone is the primary choice (stimulus-side simplicity, no per-frame video processing needed for the primary analysis).
4. Aim 2.D falsification-region radius (±15 mm) is locked but the justification is implicit. Add one sentence on why ±15 mm rather than ±10 or ±20 (e.g., "matches the spatial resolution of dipole-localization in `lipkin-2022-language-atlas`-derived studies").

**Suggested fixes.**

- Move the GLM equation in 2.B to a numbered display block; reviewers skim equations and a centered display helps.
- The "Implementation in MATLAB under `src/matlab/+hbn/`" parenthetical in Preliminary Data is internal; either drop or rephrase as "open at `[GitHub URL]`" for reviewer-visible reproducibility.
- The 60/40 internal replication seed in `params.json` mention is implementation detail; defer to the DMS plan.

## Investigators (PI Shirazi), deferred

PI biosketch is bracketed-placeholder in Phase 4. Final review at submission after SciENcv export. Note: a senior collaborator (named, with letter of support) is recommended for an R21 with a single-PI structure; addressed via `senior-advisor.md` biosketch placeholder (optional in current draft).

## Environment, deferred

`facilities.md` and `equipment.md` are bracketed. Final review at submission after PI institution fill-in.

## Overall impact, projected score 3

The proposal hits the R21 criteria (exploratory + developmental + high-risk/high-reward) and demonstrates technical capability via the working pipeline pilot. Major concerns:

1. **Single-PI risk**: R21 reviewers sometimes flag single-PI structures on exploratory grants. The senior-advisor letter of support (queued in `REQUEST_QUEUE.md`) partially mitigates; consider naming a co-investigator (statistical or methodological) for the budget.
2. **Effect-size adult anchor**: H1A's effect-size prediction is adult-anchored; widen the range.
3. **Significance clinical-translation breadth**: autism is cited adequately; social anxiety and conduct disorder are named without a citation each.

None of these are scientific objections, all are revision-tractable.

## Specific concerns by section, with locations

| Section | Issue | Where | Severity |
|---|---|---|---|
| Significance | Clinical translation breadth | Paragraph 1, sentence 2 | low |
| Significance | Method content overlapping with Innovation | Paragraph 3 | low |
| Innovation | "novel at the group level" needs citation anchor | Technical paragraph | medium |
| Innovation | promotional last sentence | Methodological paragraph | low |
| Approach 1.E | adult-anchored effect size | Expected outcomes | medium |
| Approach 1.A | optimistic retention | Cohort and inclusion | medium |
| Approach 2.F | motion-energy framing | Problems and alternatives | low |
| Approach 2.D | falsification radius justification | A priori region definition | low |
| Approach 1.C | GLM display formatting | Display equation | low |
| Approach overview | internal-only reproducibility hint | Preliminary Data | low |

## Suggested edits not requiring scientific change

- Tighten clinical-translation phrasing in Significance opening
- Add citation anchor in Innovation Technical
- Display GLM equation in Approach 2.B
- Drop internal MATLAB path mentions

## Suggested edits requiring scientific change

- Widen H1A effect-size prediction range
- Acknowledge wider attrition uncertainty in Approach 1.A
- Add motion-energy primary-choice rationale in Approach 2.F

## Notes for the user

These findings are documented for triage. None are blocking for the current draft; all are tractable in a single revision pass. The "score 3" projections are encouraging but not a guarantee; the **[PI INSTITUTION]** grants office may have a separate internal review with different emphasis.
