# Specific Aims

Naturalistic-stimulus neuroscience has shifted to continuous audiovisual narratives, yet two assumptions persist: adults are the appropriate cohort, and speech is the dominant high-level regressor. The result is a literature where the developmental trajectory of *animacy perception*, the brain's distinction between agentive and non-agentive entities, is virtually untested under dynamic, silent, character-driven stimulation, despite its centrality to social cognition and its alteration in autism and developmental disorders.

**The overarching goal of this R21 is to characterize the developmental trajectory of animacy-locked electroencephalographic (EEG) oscillatory responses to dynamic naturalistic stimuli, using shot-aligned event-related spectral perturbation (ERSP) in viewers of Pixar's silent short *The Present*.** We exploit a uniquely positioned open resource: the Healthy Brain Network EEG Release 3 (HBN-EEG R3), N approximately 184, ages 5 to 21, 128-channel HydroCel net, whose annotated stimulus contains a within-clip animacy gradient (20 boy-only shots, 15 puppy-only shots, log-luminance-controlled).

**Aim 1. Map the developmental trajectory of animacy-locked oscillatory responses.**

*Hypothesis 1A: Mu-band event-related desynchronization (8 to 13 Hz) over central-rolandic independent-component (IC) clusters is larger for animate-agent shots than for non-animate baselines, and scales non-monotonically with viewer age, peaking in late childhood.* We test 1A with **single-trial ERSP aligned to shot onset in adaptive-mixture-ICA (AMICA) decomposed source clusters**, contrasting agent-present versus agent-absent shots and modeling age as a continuous covariate.

*Hypothesis 1B: Frontal alpha asymmetry differentiates human-agent (boy) from non-human-agent (puppy) shots and shifts across age, indexing maturation of affiliative responses.* We test 1B with paired-condition asymmetry at frontal IC clusters within the same shot-locked window.

**Aim 2. Dissociate animacy from luminance contributions to the developmental effect.**

*Hypothesis 2: After partialling per-shot log luminance ratio (LLR) via a group-level generalized linear model (GLM), surviving condition-level signal localizes to central-rolandic and frontal-asymmetric IC clusters, not language-network left-frontotemporal sites; effect magnitude correlates with age.* We test 2 with **a shot-onset GLM that enters LLR as a continuous covariate and age as a moderator on the boy-only versus puppy-only contrast**, cluster-corrected over IC clusters by mass-univariate permutation. A negative result, with surviving signal in left-frontotemporal sites, would relocate the explanation to silent-stimulus engagement of language-network nodes and falsify the animacy framing.

**Expected Impact.** This R21 will deliver (1) **the first scalp-EEG developmental map of animacy-locked oscillations in naturalistic viewing**, closing a documented gap in eight catalogued areas of prior cinematic-fMRI and adult naturalistic-EEG work; (2) a Brain Imaging Data Structure (BIDS) and Hierarchical Event Descriptor (HED) compliant shot-aligned ERSP pipeline, deposited on OpenNeuro and NEMAR for community reuse across HBN releases; (3) a developmentally calibrated baseline against which clinical cohorts (autism spectrum, social anxiety) can be compared in a future R01.
