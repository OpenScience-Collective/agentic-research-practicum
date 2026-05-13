# Figure 5, 24-month timeline

## Milestone table

| Quarter | Months | Phase | Milestones |
|---|---|---|---|
| Q1 | 1-3 | Pipeline validation | AMICA stability on N=20; IC clustering pilot; ERSP precompute parameters locked; blinded-GLM protocol implemented |
| Q2 | 4-6 | Pipeline validation | N=50 expansion; OSF pre-registration of Aim 1 and Aim 2 plans (month 6) |
| Q3 | 7-9 | Aim 1 group analysis | Full N≈160 H1A (mu-band ERD x age); H1B (frontal asymmetry x condition x age) preliminary results |
| Q4 | 10-12 | Aim 1 group analysis | Aim 1 manuscript draft (month 11); Aim 1 manuscript submission (month 12) |
| Q5 | 13-15 | Aim 2 group analysis | LLR-partialled GLM; falsification-region localization; age moderator analysis |
| Q6 | 16-18 | Aim 2 group analysis | Internal 60/40 replication; cross-cohort replication on adult EEG-fMRI (`telesford-2023-eeg-fmri-naturalistic`); OpenNeuro + NEMAR deposition (month 18) |
| Q7 | 19-21 | Closeout | Aim 2 manuscript draft; R01 outline targeting NIMH autism portfolio |
| Q8 | 22-24 | Closeout | Aim 2 manuscript submission (month 22); R01 application submission (month 24) |

## Risk and contingency

- If AMICA fails on more than 10% of subjects (Q1-Q2 risk), fall back to Infomax (`run_infomax.m`, already implemented). Quarter slippage: 1 month max.
- If group-level effects in Aim 1 are null at corrected alpha, Aim 1 manuscript reports the null with effect-size bounds (negative results are publishable in *Cortex*, *Imaging Neuroscience*, *Developmental Cognitive Neuroscience*, and *eLife* per current journal policies).
- If falsification region carries the surviving Aim 2 effect (Q5-Q6 risk), Aim 2 manuscript reports the falsification result and re-frames the discussion around silent-stimulus engagement of language-network nodes; the science is still publishable, the framing changes.

## Phase 5 render plan

This Markdown table will be converted to a horizontal Gantt chart via matplotlib at Phase 5 assembly, sized for half-column placement. Quarters Q1 through Q8 become bars on the x-axis (months 1-24), one row per analytic phase (Pipeline validation, Aim 1, Aim 2, Closeout).
