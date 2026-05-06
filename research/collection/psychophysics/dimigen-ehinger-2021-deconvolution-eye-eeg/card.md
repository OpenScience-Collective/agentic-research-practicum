---
slug: dimigen-ehinger-2021-deconvolution-eye-eeg
type: paper
strand: psychophysics
year: 2021
authors: [Dimigen, Ehinger]
venue: Journal of Vision
doi: 10.1167/jov.21.1.3
url: https://jov.arvojournals.org/article.aspx?articleid=2772165
license: CC-BY-NC-ND-4.0
modalities: [EEG, eye-tracking, fixation-related-potentials, deconvolution]
tags: [fixation-related-potentials, FRP, deconvolution, regression-ERP, overlap-correction, microsaccades, free-viewing, EYE-EEG, unfold]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

## TL;DR
Linear (and nonlinear) deconvolution regression on the continuous electroencephalographic (EEG) signal solves two persistent problems in free-viewing eye-EEG analysis: temporal overlap between consecutive fixation-related potentials (FRPs) and confounding effects of low-level saccade parameters on post-saccadic neural responses, with worked examples for face perception, scene viewing, and reading.

## Summary
Dimigen and Ehinger present a unified regression-based deconvolution framework for fixation-related potentials in free-viewing electroencephalography. They formalize the EEG channel as a sum of overlapping impulse responses convolved with event onset times (saccades, fixations, stimulus events), and recover unbiased per-event waveforms by solving a regularized regression on the design matrix. They also show how to absorb low-level saccade parameters (saccade amplitude, fixation duration, position on screen) as continuous covariates so that condition-locked FRPs are not confounded by these factors. Three worked applications cover face perception (where small microsaccades to face features confound the N170), natural scene viewing (where saccade parameters covary with scene content), and parafoveal preview reading (where average fixation time differs between conditions). The framework is implemented in the unfold and EYE-EEG MATLAB toolboxes.

## Relevance to the review
Important methodological reference even though we lack eye tracking on R3. Dimigen-Ehinger's deconvolution framework is the right tool when shot-onset events overlap with saccade-locked or fixation-locked transients within a 1.2-second epoch (-0.6 to +0.6 s in our Phase 4 plan). Even without simultaneous eye tracking, the principle that nuisance event-related contributions overlap and bias condition contrasts is directly applicable to the LLR (log luminance ratio) covariate in our pipeline: a continuous LLR regressor partials out the luminance-onset transient the same way Dimigen and Ehinger partial out saccade-amplitude effects on FRPs. The paper is also the canonical reference for the unfold toolbox, a likely Phase 5 alternative if std_precomp ERSP turns out to be insufficiently flexible.

## Notable details
- Linear deconvolution: `EEG(t) = sum_i (h_i ⊛ delta_{t_i}) + noise`; recover h_i by least squares.
- Nonlinear extensions via spline regressors handle saccade-amplitude and fixation-duration confounds.
- Worked face-perception, scene-viewing, and reading examples.
- unfold toolbox (open source) implements the framework.
- Open Access (CC BY-NC-ND 4.0).

## Open questions / limitations
- Requires sufficient event count to estimate the regression; "The Present" has only 49 trusted shot events per subject, which limits per-subject deconvolution power.
- Linearity in the temporal-overlap model is an assumption; very fast events with shared neural generators may violate it.
- The framework is for time-domain ERPs/FRPs; extension to time-frequency (event-related spectral perturbation, ERSP) is left as future work.
- Eye tracker is required for the saccade-deconvolution path; HBN-EEG R3 has no eye tracker, limiting the technique to stimulus-event-only deconvolution on our data.

## Citations
Primary BibTeX key: `Dimigen2021RegressionbasedAO` (in `psychophysics.bib`).

Related works:
- Smith, Kutas (2015) Psychophysiology 52:157 — regression ERP framework.
- Dimigen et al. (2011) J Exp Psychol Gen 140:552 — FRP review.
- Ehinger, Dimigen (2019) PeerJ 7:e7838 — unfold toolbox paper.
- Plöchl, Ossandón, König (2012) Front Hum Neurosci 6:278 — eye-artifact correction with ICA.
- Nikolaev, Meghanathan, van Leeuwen (2016) Psychophysiology 53:1659 — coregistration review.
