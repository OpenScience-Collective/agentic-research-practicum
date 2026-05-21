<!-- Box 1: HBN-EEG R3 anchor cohort. Budget: ~180 words.
Filled by manuscript:manuscript-writing in v2 Phase 2.

Carry-forwards from v1 self-review:
- F4 (anchor case): descriptive surface attributes live here, NOT as evidential support for the direction.
-->

# Box 1: HBN-EEG Release 3 as the anchor cohort

[Paragraph (~180 words). Describe the HBN-EEG R3 cohort:
- 5-21-year-old participants in a developmental research setting.
- 128-channel HydroCel Geodesic Sensor Net.
- Passive viewing of the 3.5-minute Pixar short *The Present* (2014).
- Local working set: 184 subjects at 100 Hz BDF (Nyquist-aware downsample of original 500 Hz).
- 56 stimulus-side shots with per-shot `onset`, `duration`, `LLR`, `has_boy`, `has_puppy` annotations.
- After invalidating 3 high-drift rows (`match_diff_s > 1.0 s`), 49 trusted rows: 20 boy-only + 15 puppy-only shots for mutually exclusive single-agent contrast.
- Pipeline: BIDS import, 1 Hz HPF, conditional cleanline (gated by Nyquist), `clean_rawdata` channel rejection, AMICA, ICLabel (brain threshold 0.69), dipfit5, std_precomp ERSP.
- F4 carry-forward statement: the anchor case rests on Petroni-Cohen 2018 (external precedent) + this partly-validated pipeline (internal feasibility). The six-feature uniqueness conjunction is *descriptive*, not evidential.]
