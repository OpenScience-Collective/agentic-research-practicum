---
slug: crosse-2016-mtrf-toolbox
type: tool
strand: psychophysics
year: 2016
authors: [Crosse, Di Liberto, Bednar, Lalor]
venue: Frontiers in Human Neuroscience
doi: 10.3389/fnhum.2016.00604
url: https://www.frontiersin.org/articles/10.3389/fnhum.2016.00604
license: CC-BY-4.0
modalities: [EEG, MEG, naturalistic-stimuli, system-identification, MATLAB]
tags: [mTRF, temporal-response-function, regularized-regression, ridge-regression, encoding-decoding, stimulus-reconstruction, MATLAB-toolbox, naturalistic-EEG]
relevance: medium
imported_from: null
added: 2026-05-06

pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

## TL;DR
The mTRF toolbox provides a MATLAB implementation of regularized linear regression for fitting forward (encoding) and backward (decoding) temporal response functions between continuous stimuli and EEG/MEG, including ridge regularization with leave-one-out cross-validation, multivariate stimulus features, and stimulus-reconstruction utilities.

## Summary
Crosse and colleagues describe the mTRF toolbox: an open-source MATLAB package implementing regularized ridge regression to estimate temporal response functions (TRFs) relating any continuous stimulus feature (envelope, spectrogram, motion energy) to electroencephalography (EEG) or magnetoencephalography (MEG) channels. The package supports both forward (predict response from stimulus) and backward (reconstruct stimulus from response) modeling, multivariate stimulus features, and per-subject regularization via leave-one-out cross-validation on a held-out portion of training data. The paper walks through the math of system identification by linear regression, the importance of regularization to control over-fitting on neural data, and worked examples with auditory speech envelope. The toolbox is the de facto standard for naturalistic-EEG TRF analyses in the auditory and visual domains.

## Relevance to the review
Methodological alternative for "The Present" Phase 5. The locked plan is shot-onset ERSP, but we may want a TRF baseline that regresses electroencephalography (EEG) channels against a continuous LLR (log luminance ratio) trace per shot or against a shot-onset impulse train; the mTRF toolbox is the standard tool for this. Even if we do not deploy mTRF in the primary analysis, knowing what the baseline approach delivers is necessary for Phase 3 synthesis. As a tool entry it is `relevance: medium`: useful and directly applicable, not strictly required.

## Notable details
- Ridge regression (L2 regularization) with closed-form solution; per-feature lambda search.
- Forward and backward modeling supported in one API.
- Multivariate stimulus features handled by stacking columns.
- Open Access (CC BY 4.0); MATLAB code on GitHub at https://github.com/mickcrosse/mTRF-Toolbox.
- Frontiers in Human Neuroscience, methods article.

## Open questions / limitations
- MATLAB-only (Python ports exist but are not part of the toolbox).
- Strictly linear; nonlinear interactions between stimulus features must be precomputed.
- Sample-by-sample regression assumes synchronized stimulus and response sampling; for HBN-EEG R3 at 100 Hz this aligns with shot-event durations but limits high-frequency feature use.
- The toolbox is silent on event-related spectral perturbation (ERSP) analyses; TRF outputs are evoked-response-like, not time-frequency.

## Citations
Primary BibTeX key: `Crosse2016TheMT` (in `psychophysics.bib`).

Related works:
- Lalor, Foxe (2010) Eur J Neurosci 31:189, AESPA forerunner.
- Ding, Simon (2012) J Neurophysiol 107:78, speech-envelope tracking with TRFs.
- de Cheveigné et al. (2018) NeuroImage 172:206, joint stimulus-response decomposition.
- Brodbeck, Simon (2020) Curr Opin Neurobiol 65:175, TRF review.
- Drennan, Lalor (2019) Eur J Neurosci 49:1430, visual contrast TRF.
