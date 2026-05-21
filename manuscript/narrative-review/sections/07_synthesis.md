<!-- Section 7: Synthesis. Budget: ~450 words.
Filled by manuscript:manuscript-writing in v2 Phase 2.

Carry-forwards from v1 self-review:
- F4 (anchor case): rebuild around Petroni 2018 + partly-validated pipeline (NOT the six-feature uniqueness conjunction).
- F5 (falsifiability): name a concrete topographic-and-band rejection region.
- I1 (commitments): only firm scheduled extensions; no wishlist.
- I2 (narrative-position): add the objection and the corpus-grounded response.
-->

# 7. Synthesis: integration, falsifiability, and open questions

## 7.1 Integration

[Budget: ~100 words.
- Restate the four-perspective ranking by depth of prior evidence.
- Psychophysics: deepest precedent, simplest operationalisation (partial LLR, optionally motion energy, before any condition claim).
- Action: deepest specific oscillatory prediction (mu-band ERD over central rolandic clusters), no animated-agent precedent in EEG.
- Language: structurally non-transferable for LM regressors but supplies cortical priors via the 5b sub-thread (mPFC, TPJ, STS, DMN).
- Emotion: two predictions (early occipital alpha; later frontal-asymmetric alpha) with cuteness anchored developmentally by Borgi 2014.
- Forward-reference Figure 4 (predictions table).]

## 7.2 Anchor case (F4 carry-forward)

[Budget: ~100 words.
- External precedent: Petroni et al. 2018 recorded 64-channel EEG at 500 Hz from 114 viewers across ages 6-44 during passive viewing of six naturalistic videos including animated and live-action shorts. They did not analyse shot-onset ERSP, but they demonstrated scalp-EEG signal exists during developmental naturalistic viewing.
- Internal feasibility: a partly-validated developmental EEG pipeline on HBN-EEG R3 brings 184 subjects through BIDS import, 1 Hz HPF, conditional cleanline, channel rejection, AMICA, ICLabel, dipfit5, std_precomp ERSP. 100 Hz local working set; 500 Hz S3 validation pass scheduled after pipeline validation.
- The two anchor assertions are independent and not interchangeable.]

## 7.3 Falsifiability (F5 carry-forward)

[Budget: ~150 words.
- Pre-registerable topographic-and-band rejection region:
  - Surviving central-rolandic mu-band cluster (electrodes C3, Cz, C4; 8-13 Hz) confirms action.
  - Surviving frontal-asymmetric alpha cluster (electrodes F3, F4; 8-13 Hz) confirms emotion.
  - Surviving cluster in left frontotemporal IC space, overlapping the Lipkin et al. 2022 language-network atlas used as negative-control mask, falsifies the four-perspective ranking.
  - Null result on LLR-partialled GLM at pre-registered cluster-level alpha (p < 0.05 corrected by mass-univariate cluster-based permutation; mTRF toolbox precedent: Crosse et al. 2016) falsifies by bottom-up exhaustion.
- Pinning the rejection region before data analysis constrains analyst degrees of freedom.]

## 7.4 Open questions and limitations (I1 + I2 carry-forward)

[Budget: ~100 words.
- I2: narrative-position objection. Boy-only and puppy-only shots differ on three-act position (boy-only in early-act setup, puppy-only in late-act resolution). Add shot-index-in-narrative as continuous covariate; fit within-act stratified analysis as named follow-up (Magliano 2011; Baldassano 2017; Chen 2017).
- Hickok-style mu-system critique gap (I3 carry-forward repeated here).
- Klin et al. 2002, 2009 autism subsample considerations (moved from Section 4 per v1 m8 carry-forward).
- Emotion literature predominantly adult; three pet-evoked affective cards are fMRI/behavioural.
- Frontal asymmetry at sub-second timescales is unprecedented and reliability-limited.
- 100 Hz local working set caps beta/gamma claims until 500 Hz pass.
- Outstanding Questions Box collects forward-looking adjudication targets.]
