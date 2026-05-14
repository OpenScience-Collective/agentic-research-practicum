# Budget Justification

R21 modular budget, $275,000 total direct costs over 2 years (Year 1, $125,000; Year 2, $150,000). The narrative below justifies each module category and ties it to the timeline milestones in Approach Section 5.

## Personnel

**Principal Investigator (Shirazi)**, **[CALENDAR MONTHS Y1]** calendar months Year 1 and **[CALENDAR MONTHS Y2]** calendar months Year 2 (proposed: 1.5 calendar months Y1, 1.2 calendar months Y2). The PI is methodological lead (Brain Imaging Data Structure (BIDS) and Hierarchical Event Descriptor (HED) contributor per `hermes-2023-hed-schema`; EEGLAB and AMICA expertise per the project's existing analysis epic), analysis lead, and corresponding author on both proposed manuscripts. PI effort drops slightly in Year 2 because Aim 2 group analysis and manuscript work delegate more to the funded postdoctoral researcher.

**Postdoctoral researcher**, 12 calendar months each year (1.0 full-time equivalent). The postdoc executes the group-level pipeline (Aim 1 mu-band and frontal asymmetry analyses, Aim 2 LLR-partialled generalized linear model (GLM) and falsification-region localization), co-authors both manuscripts, and leads the cross-cohort replication. Hired by month 1 from the **[PI INSTITUTION]** graduate program or external recruitment. Stipend per **[PI INSTITUTION]** postdoctoral salary scale.

**Statistical consultant (Year 2 only)**, 5 percent calendar months. The consultant reviews the pre-registered group-level GLM specification, signs off on the blinded analysis protocol (`tests/matlab/blinded_glm_protocol.m`, implemented in month 6), and reviews the cluster-corrected permutation procedure before unblinding (month 13). Sourced from **[PI INSTITUTION]** or a collaborating department.

## Consultant services

External statistical consultant fee at **[CONSULTANT HOURLY RATE]** per hour for approximately **[N HOURS]** hours of consultation in Year 2 (pre-registration review, blinded-protocol sign-off, and cluster-correction methodology audit). Total approximately $5,000.

## Computer services and supplies

Amazon Web Services (AWS) compute for the full Healthy Brain Network EEG Release 3 (HBN-EEG R3) 500 Hz cohort pull (months 7-12 of the funded period, after pipeline validation on the local 100 Hz set). Estimated $2,000-$5,000 total based on data-transfer and EC2 spot-instance pricing for 183 subjects × approximately 8 minutes recording each. Institutional **[CLUSTER NAME]** allocation is included as overhead; no marginal charge.

Open-source software (EEGLAB, AMICA, Fieldtrip-lite, ICLabel, dipfit, cleanrawdata, firfilt; Python ecosystem; R `mgcv` and `lme4`) carries no licensing cost. MATLAB is covered by the **[PI INSTITUTION]** site license.

Supplies (general lab supplies, printing, postage) are budgeted at approximately $500 per year.

## Travel

One conference per year for the PI and the postdoctoral researcher, alternating between the Society for Neuroscience (annual, US), the Organization for Human Brain Mapping (annual, alternating US and international), and the Cognitive Neuroscience Society (annual, US). Approximate budget $3,000 per year for two-person travel, supporting (1) presentation of Aim 1 results in Year 2 and (2) presentation of Aim 2 results in the closeout period.

## Publication costs

Two open-access manuscripts under the funded period: Aim 1 manuscript (drafted month 11, submitted month 12, projected open-access fee approximately $4,000) and Aim 2 manuscript (drafted month 21, submitted month 22, projected fee approximately $4,000). Both target field-appropriate open-access journals (*NeuroImage*, *Imaging Neuroscience*, or *Developmental Cognitive Neuroscience*).

## Other expenses

- Manuscript editing: a final humanizer pass (`manuscript:humanizer` skill in the project pipeline) and a copyedit pass before each manuscript submission. No external cost.
- Zenodo deposition: free service for code snapshots.
- OpenNeuro and NEMAR deposition: free service.
- R01 preparation support (Year 2 closeout): institutional grants-office support is included in F&A; no marginal cost.

## Cross-reference to Approach timeline

| Approach Section 5 milestone | Module category funding it |
|---|---|
| Pipeline validation, N=20 → N=50 (Q1-Q2) | Personnel (PI + postdoc); Cluster (overhead) |
| OSF pre-registration (month 6) | Statistical consultant pre-review |
| Full N≈160 Aim 1 group analysis (Q3) | Personnel (PI + postdoc); AWS compute |
| Aim 1 manuscript submission (Q4) | Publication cost (Manuscript 1) |
| Aim 2 LLR-partialled GLM (Q5) | Personnel (postdoc); Statistical consultant cluster-correction audit |
| Internal 60/40 replication + cross-cohort (Q6) | Personnel (postdoc); AWS compute |
| OpenNeuro + NEMAR deposition (month 18) | Other expenses (Zenodo; free) |
| Aim 2 manuscript submission (Q7-Q8) | Publication cost (Manuscript 2) |
| R01 preparation (Q8) | Personnel (PI senior author) |

Every module category in the budget maps to at least one milestone above; no line item is unexplained.
