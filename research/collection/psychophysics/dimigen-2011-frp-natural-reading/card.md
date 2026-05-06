---
slug: dimigen-2011-frp-natural-reading
type: paper
strand: psychophysics
year: 2011
authors: [Dimigen, Sommer, Hohlfeld, Jacobs, Kliegl]
venue: Journal of Experimental Psychology General
doi: 10.1037/a0023885
url: https://psycnet.apa.org/doi/10.1037/a0023885
license: publisher-paywall
modalities: [EEG, eye-tracking, natural-reading, FRP]
tags: [fixation-related-potentials, N400, word-predictability, cloze-probability, free-viewing-EEG, methodological-review, EEG-eye-tracker-synchronization]
relevance: medium
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
Simultaneous electroencephalographic (EEG) and eye-tracker recordings during free reading recover the classical N400 word-predictability effect on fixation-related potentials (FRPs) and motivate a four-part methodological review (synchronization, artifact removal, temporal overlap, and oculomotor confounds) that defines the field.

## Summary
Dimigen and colleagues recorded EEG and video-based eye tracking while subjects read German sentences naturally. They time-locked the EEG to first-pass fixations and replicated the N400 effect of word predictability (cloze probability), demonstrating that fixation-related potentials capture the same predictability-driven processing as classical word-by-word event-related potentials (ERPs). They then mapped fixation-duration, gaze-duration, and N400 amplitude relations across trials. The bulk of the paper's lasting impact is its extended methodological review of four problems endemic to free-viewing eye-EEG: synchronization of data streams, removal of large eye-movement artifacts, temporal overlap of consecutive FRPs, and confounds from saccade amplitude and stimulus position. This is the canonical reference for the FRP analysis paradigm.

## Relevance to the review
Tangential to "The Present" mainline because the HBN-EEG R3 dataset has no synchronous eye tracker. However, the four methodological warnings in this paper apply to any free-viewing electroencephalography (EEG) study, including ours: (1) we synchronize via stimulus event channel rather than eye tracker; (2) we use AMICA + ICLabel for artifact removal; (3) overlap of shot-onset transients across short shots in "The Present" is a real concern in the -0.6 to +0.6 s epoching window; (4) we cannot control for saccade-amplitude confounds. The paper is an honest accounting of what one gives up when forced to operate without eye tracking, which we are.

## Notable details
- N400 word-predictability effect replicates under free-reading conditions.
- Four canonical FRP analysis problems articulated: synchronization, ocular artifact, temporal overlap, oculomotor covariate.
- 32-channel EEG plus video eye tracking; sampling and electrode count typical of mid-2000s reading research.
- This paper is the predecessor to Dimigen-Ehinger 2021's deconvolution framework that addresses problems 3 and 4.

## Open questions / limitations
- Reading is a discrete-saccade paradigm; "The Present" elicits a different saccade distribution (longer fixations, larger amplitudes).
- N400 is a semantic-prediction component; it has no direct analogue in our shot-onset event-related spectral perturbation (ERSP) targets.
- Methodological warnings are diagnostic only; the paper does not give the regression-based deconvolution solution (that is Dimigen-Ehinger 2021).
- Adult reading sample; FRPs in young children, the lower end of the HBN age range, may differ.

## Citations
Primary BibTeX key: `Dimigen2011CoregistrationOE` (in `psychophysics.bib`).

Related works:
- Dimigen, Ehinger (2021) J Vis 21:3 — deconvolution-based FRP analysis.
- Plöchl, Ossandón, König (2012) Front Hum Neurosci 6:278 — eye-artifact correction with ICA.
- Kretzschmar et al. (2009) Psychophysiology 46:387 — early FRP reading paper.
- Nikolaev, Meghanathan, van Leeuwen (2016) Psychophysiology 53:1659 — FRP review.
- Sereno, Rayner (2003) Trends Cogn Sci 7:489 — eye movements and word processing.
