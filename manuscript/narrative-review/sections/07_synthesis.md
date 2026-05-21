<!-- Section 7: Synthesis. Budget: ~450 words.
Filled by manuscript:manuscript-writing in v2 Phase 2.
Skill pattern applied: Discussion Template (Summary, Interpretation,
Limitations, Future) adapted to a non-empirical review.
- 7.1 Integration = Summary + Interpretation
- 7.2 Anchor case = grounding in prior precedent
- 7.3 Falsifiability = pre-registerable test (TiCS-specific extension)
- 7.4 Open questions = Limitations + Future directions
Carry-forwards from v1 self-review:
- F4 (anchor case rebuilt around Petroni + pipeline)
- F5 (topographic-and-band rejection region)
- I1 (no wishlist commitments)
- I2 (narrative-position objection)
- I3 (mu-system critique repeated in limitations)
- m8 (autism subsample lives here)
-->

# 7. Synthesis: integration, falsifiability, and open questions

## 7.1 Integration

The four perspectives rank by depth of prior evidence. Psychophysics has the deepest precedent and the simplest operationalisation: partial LLR, optionally motion energy, before any condition claim. Action has the deepest specific oscillatory prediction (mu-band ERD over central rolandic clusters) but no animated-agent precedent in EEG. Language is structurally non-transferable for LM regressors but supplies cortical priors for silent narrative through its 5b sub-thread (medial prefrontal cortex, the temporo-parietal junction, the STS, the default-mode network). Emotion supplies two predictions: early occipital alpha desynchronisation [Codispoti2023AlphabandOA; Kragel2018EmotionSA] and later frontal-asymmetric alpha [Davidson2000AffectiveSP], with the cuteness response anchored developmentally by Borgi [Borgi2014BabySI]. Distributed-multivariate-signature framing supports IC-cluster-level analyses over single-IC decoding [Lindquist2012TheBB; chen2017shared]. Figure 4 displays the four predictions in tabular form.

## 7.2 Anchor case

External precedent: Petroni and colleagues recorded 64-channel EEG at 500 Hz from 114 viewers across ages 6 to 44 during passive viewing of six naturalistic videos including animated and live-action shorts [Petroni2018TheVO]. They did not analyse shot-onset ERSP and did not factor stimulus-side regressors, but they demonstrated that scalp-EEG signal exists during developmental naturalistic viewing of short videos. They are the closest external existence proof that the measurement class is feasible in adjacent territory. Internal feasibility: a partly-validated developmental EEG pipeline on HBN-EEG Release 3 brings 184 subjects through Brain Imaging Data Structure (BIDS) import, 1 Hz high-pass filtering, conditional cleanline gated by Nyquist, `clean_rawdata` channel rejection, AMICA decomposition, ICLabel classification, dipole fitting, and `std_precomp` ERSP precomputation; the operating constraint is that the local working set is 100 Hz, with a 500 Hz validation pass on the full Amazon S3 R3 release scheduled after pipeline validation. The two anchor assertions are independent and not interchangeable.

## 7.3 Falsifiability

A topographic-and-band rejection region for the four-perspective ranking can be pre-registered before group analysis. A surviving central-rolandic mu-band cluster (electrodes C3, Cz, and C4; 8 to 13 Hz) confirms the action prediction. A surviving frontal-asymmetric alpha cluster (electrodes F3 and F4; 8 to 13 Hz) confirms the emotion prediction. A surviving cluster in left frontotemporal IC space, overlapping the Lipkin language-network atlas [Lipkin2022ProbabilisticAF] used as a negative-control mask, falsifies the four-perspective ranking by relocating the surviving signal into a perspective the thesis says should not transfer. A null result on the LLR-partialled GLM at a pre-registered cluster-level alpha (p < 0.05 corrected by mass-univariate cluster-based permutation, with the mTRF toolbox precedent [Crosse2016TheMT]) also falsifies the four-perspective ranking, by localising per-shot ERSP variance entirely to bottom-up features in this cohort. Pinning the rejection region before data analysis is the publication discipline that constrains analyst degrees of freedom.

## 7.4 Open questions and limitations

Narrative position is a within-stimulus confound. Boy-only and puppy-only shots in *The Present* differ on three-act position: boy-only clusters in the early-act setup, puppy-only in the late-act resolution. Any boy-vs-puppy ERSP difference may therefore be confounded with prediction-error or arousal trajectories. The response is to add shot-index-in-narrative as a continuous covariate in the group GLM and to fit a within-act stratified analysis as a named follow-up [Magliano2011TheIO; baldassano2017event; chen2017shared]. Beyond narrative position, several gaps in the corpus limit what this review can claim. The Hickok-style mu-system critique is not represented in our cards, which weakens the action prediction. Klin and colleagues showed that toddlers with autism orient to audiovisual contingency rather than upright biological motion [klin2009biological] and that adolescents with autism fixate eyes 50 percent as often during emotionally evocative viewing [klin2002visual]; the HBN cohort includes a substantial autism-spectrum subsample, so autism status is a candidate moderator, but stratified analyses (autism-spectrum, attention, social skill) are exploratory follow-ups rather than primary tests. The emotion literature is predominantly adult; the three pet-evoked affective cards are fMRI or behavioural, not EEG. Frontal asymmetry at sub-second timescales is unprecedented and reliability-limited. The single-stimulus design forbids generalisation beyond *The Present*. The 100 Hz local working set caps beta-band and gamma-band claims until the 500 Hz validation pass. The Outstanding Questions Box collects the forward-looking adjudication targets.
