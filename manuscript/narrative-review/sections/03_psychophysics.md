<!-- Section 3: Psychophysics. Budget: ~500 words.
Filled by manuscript:manuscript-writing in v2 Phase 2.
-->

# 3. Psychophysics: the bottom-up floor

[Paragraph 1 (~150 words): lineage of bottom-up visual feature processing.
- V1 receptive fields (Hubel and Wiesel 1962).
- Divisive normalisation (Carandini and Heeger 2011).
- Natural-image statistics + spatiotemporal energy (Bell and Sejnowski 1997; Simoncelli and Olshausen 2001; Adelson and Bergen 1985).
- MT/MST motion machinery (Born and Bradley 2005; Bartels and Zeki 2008).
- Nishimoto et al. 2011: movie reconstruction from BOLD via Adelson-Bergen feature bank (existence proof for motion-energy reconstructability).
- Clinical VEP (Tobimatsu and Celesia 2006): luminance/contrast steps produce reliable scalp signatures with magno/parvo pathway assignment.]

[Paragraph 2 (~150 words): closest electrophysiological analogue.
- Nentwich et al. 2023 iEEG: triple-regressor (motion, saccades, cuts) shows motion outranks luminance for occipitoparietal cortex.
- Per-shot LLR is one of several low-level features that needs accounting; LLR is the minimum partialling for any social claim.
- Whole-clip EEG ISC tracks low-level features at occipital electrodes more strongly than higher-order content (Dmochowski et al. 2012; Madsen and Parra 2022; Cohen and Parra 2016). Attention modulates this baseline (Ki et al. 2016).
- Envelope-only auditory control (Kaneshiro et al. 2021) is the methodological template the LLR-as-covariate plan inherits.]

[Paragraph 3 (~200 words): eye-movement caveat.
- Free-viewing EEG depends on eye-movement coregistration to separate stimulus-onset from saccade-locked and fixation-related potentials (Dimigen et al. 2011; Plöchl et al. 2012). Regression deconvolution is the state of the art (Dimigen and Ehinger 2021).
- Gaze coherence varies with stimulus class: highest on Hollywood trailers, lowest on natural movie clips and static images (Dorr et al. 2010); a Pixar short sits between these extremes.
- HBN-EEG R3 has no synchronous eye tracker. Per-shot ERSP cannot deconvolve overlapping saccade-locked transients from shot-onset responses.
- ICA-based artifact rejection through AMICA and ICLabel is the operating compromise (Bell and Sejnowski 1997 for ICA foundation).
- Motion energy computed offline from the stimulus video is the named first follow-up regressor (Nishimoto et al. 2011; Nentwich et al. 2023).
- mTRF toolbox (Crosse et al. 2016) supplies the production regression framework.
- Forward-reference Figure 2 (naturalness gradient).]
