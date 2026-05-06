---
slug: lalor-foxe-2010-natural-speech-trf
type: paper
strand: psychophysics
year: 2010
authors: [Lalor, Foxe]
venue: European Journal of Neuroscience
doi: 10.1111/j.1460-9568.2009.07055.x
url: https://onlinelibrary.wiley.com/doi/10.1111/j.1460-9568.2009.07055.x
license: publisher-paywall
modalities: [EEG, intracranial-EEG, naturalistic-speech, system-identification]
tags: [AESPA, VESPA, temporal-response-function, TRF, system-identification, natural-speech, continuous-stimulus, ecological-validity]
relevance: medium
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
Introduces the temporal response function (TRF) approach for natural continuous speech: assume the recorded electroencephalographic (EEG) signal is a convolution of the speech envelope with a to-be-estimated brain impulse response, and recover that impulse response via linear regression with regularization, giving a temporally precise component analysis of naturalistic listening.

## Summary
Lalor and Foxe extend the system-identification framework of their VESPA visual paradigm to natural speech. Treating the EEG channel as a linear filter applied to the speech amplitude envelope, they invert the convolution to obtain an impulse response (the AESPA, Auditory Evoked Spread Spectrum Analysis) with peaks reminiscent of the classical N1-P2 complex. They demonstrate the method on both scalp EEG and intracranial recordings during listening to a fiction reading, establishing that meaningful auditory evoked responses can be extracted from continuous, ecologically valid input rather than discrete trials. The methodology directly anticipates the multivariate temporal response function (mTRF) toolbox (Crosse et al. 2016) and the broader naturalistic system-identification literature.

## Relevance to the review
Methodological precedent. The TRF approach offers an alternative to the discrete-event epoching that "The Present" Phase 4 will use: instead of locking electroencephalography (EEG) to shot-onsets, one could regress channels against a continuous LLR (log luminance ratio) trace or motion-energy time series. We are not adopting TRF in the current pipeline (epoching plus event-related spectral perturbation, or ERSP, is locked in), but understanding the TRF alternative is necessary for Phase 3 synthesis: the boy-shot vs puppy-shot question can be reformulated as a contrast between condition-specific TRFs. This paper is the canonical naturalistic-EEG TRF reference.

## Notable details
- Linear-system framing: y(t) = (h ⊛ x)(t) + noise, where x is the speech envelope and h is the brain impulse response.
- Estimated TRF peaks resemble classical N1-P2 latencies (~100, ~200 ms post-onset).
- Both scalp and intracranial demonstrations in the same paper.
- Direct sibling of the VESPA visual paradigm (Lalor et al. 2006).
- Forerunner to mTRF toolbox; no public code released with this paper.

## Open questions / limitations
- The method assumes linearity; nonlinear interactions with attention or contrast-normalization (Carandini-Heeger) are absorbed into noise.
- Speech envelope is the only regressor; spectral and prosodic features need higher-dimensional TRFs (later work).
- Auditory only, not visual; transferring to "The Present" requires an analogous low-level visual regressor (LLR, motion energy).
- Wiley paywalled; reproducibility relies on the mTRF toolbox documentation rather than this manuscript's text.

## Citations
Primary BibTeX key: `Lalor2010NeuralRT` (in `psychophysics.bib`).

Related works:
- Lalor et al. (2006) NeuroImage 33:1063 — VESPA visual analogue.
- Crosse et al. (2016) Front Hum Neurosci 10:604 — mTRF toolbox built on this idea.
- Ding, Simon (2012) J Neurophysiol 107:78 — speech envelope tracking in MEG.
- Di Liberto et al. (2015) Curr Biol 25:2457 — TRFs to phonemes.
- Brodbeck, Simon (2020) Curr Opin Neurobiol 65:175 — review of continuous stimulus EEG.
