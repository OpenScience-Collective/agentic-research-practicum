<!-- Box 1: HBN-EEG R3 anchor cohort. Budget: ~180 words.
Filled by manuscript:manuscript-writing in v2 Phase 2.
Skill pattern applied: Writing Principles only.
F4 carry-forward: descriptive surface attributes here, not evidential.
-->

# Box 1: HBN-EEG Release 3 as the anchor cohort

The Healthy Brain Network EEG (HBN-EEG) Release 3 cohort recruits 5- to 21-year-old participants in a developmental research setting and records 128-channel HydroCel Geodesic Sensor Net during passive viewing of the 3.5-minute Pixar short *The Present* (2014). The local working set used in our pipeline development is 184 subjects at 100 Hz Biosignal Data Format (BDF), a Nyquist-aware downsample of the original 500 Hz. The 56 stimulus-side shots carry per-shot `onset`, `duration`, `LLR`, `has_boy`, and `has_puppy` annotations. After invalidating 3 high-drift rows (`match_diff_s > 1.0 s`), 49 rows are trusted, yielding 20 boy-only and 15 puppy-only shots for the mutually exclusive single-agent contrast. The pipeline runs BIDS import, 1 Hz high-pass filter, conditional cleanline (gated by Nyquist), `clean_rawdata` channel rejection, AMICA, ICLabel (brain threshold 0.69), dipfit5, and `std_precomp` ERSP. The anchor case rests on Petroni and colleagues 2018 [Petroni2018TheVO] as the external precedent and this partly-validated pipeline as the internal feasibility proof.
