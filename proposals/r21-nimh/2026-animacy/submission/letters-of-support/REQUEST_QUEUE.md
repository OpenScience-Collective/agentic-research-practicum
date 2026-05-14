# Letters of Support, Request Queue

Each row is a named target. Solicit letters 8 weeks before the NIH receipt date; follow up 4 weeks before. The target NIH receipt date is **2026-02-16** (standard new-application receipt for parent R21 cycles); the corresponding letter-solicitation deadline is **2025-12-22** and follow-up deadline is **2026-01-19**. Adjust by 4 months if targeting the June 2026 renewal cycle instead.

| # | Target | Affiliation | Role on project | Ask (what the letter should confirm) | Draft language reference | Solicit by | Follow-up by | Status |
|---|---|---|---|---|---|---|---|---|
| 1 | **[HBN DATA STEWARD NAME]** | Child Mind Institute, Healthy Brain Network biobank | Data provider | Healthy Brain Network EEG Release 3 (HBN-EEG R3) data are available for the proposed secondary re-analysis under the existing public data-use agreement; no IRB approval beyond Exempt-4 is needed for the work described in the Approach. | `templates/los-hbn.md` (to be drafted) | 2025-12-22 | 2026-01-19 | pending |
| 2 | **Arnaud Delorme** or **Scott Makeig** | Swartz Center for Computational Neuroscience (SCCN), University of California San Diego; NEMAR | Methodological advisor; NEMAR deposition support | (a) NEMAR will accept the pipeline and derivatives for deposition by month 18; (b) the SCCN team is available for methodological consultation on AMICA, ICLabel, and EEGLAB pipeline decisions throughout the funded period. | `templates/los-nemar.md` (to be drafted) | 2025-12-22 | 2026-01-19 | pending |
| 3 | **Russ Poldrack** or **Chris Markiewicz** | Stanford Center for Reproducible Neuroscience; OpenNeuro | OpenNeuro deposition support | OpenNeuro will accept the BIDS-EEG derivatives and the per-stage QA artifacts for deposition by month 18, under the existing OpenNeuro convention of Creative Commons Attribution 4.0 (CC-BY-4.0) licensing. | `templates/los-openneuro.md` (to be drafted) | 2025-12-22 | 2026-01-19 | pending |
| 4 | **[STATISTICAL CONSULTANT NAME]** | **[STATISTICAL CONSULTANT AFFILIATION]** | Statistical consultant (Year 2) | (a) Availability to consult on Aim 1 and Aim 2 GLM design and pre-registration review at month 6, the blinded-protocol sign-off at month 13, and the cluster-corrected permutation methodology audit; (b) hourly rate and total hours align with the budget justification. | `templates/los-consultant.md` (to be drafted) | 2025-12-22 | 2026-01-19 | pending |
| 5 | **[DEPARTMENT CHAIR OR SENIOR ADVISOR NAME]** | **[PI INSTITUTION]**, **[DEPARTMENT / CENTER]** | Institutional commitment | (a) Institutional commitment to the PI's calendar effort as specified in the budget; (b) compute-cluster allocation on **[CLUSTER NAME]** is sufficient for the proposed analyses; (c) graduate program or recruitment pathway for the funded postdoctoral researcher. | `templates/los-institutional.md` (to be drafted) | 2025-12-22 | 2026-01-19 | pending |

## Template files

Per-target draft language is kept in `templates/los-*.md` (to be added in a follow-up commit when the user provides the named targets). Each template contains:
1. A salutation block matched to the target.
2. A one-paragraph project summary recyclable across all letters.
3. Target-specific bullet points covering the items in the "Ask" column above.
4. A closing block with signatory expectations (NIH letters are signed and dated on institutional letterhead).

## Notes for the user

- The named contacts in rows 2 and 3 are public points of contact for SCCN/NEMAR and OpenNeuro respectively, based on the institutions' published team rosters. Verify before solicitation.
- Row 5 (institutional commitment letter) is the most schedule-sensitive; the **[PI INSTITUTION]** grants office typically processes these in 2-3 weeks once requested, so solicit earliest.
- Letters are submitted as a single concatenated PDF in the NIH submission package under the "Letters of Support" attachment slot.
