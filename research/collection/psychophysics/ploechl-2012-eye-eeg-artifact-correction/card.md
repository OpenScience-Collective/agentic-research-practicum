---
slug: ploechl-2012-eye-eeg-artifact-correction
type: paper
strand: psychophysics
year: 2012
authors: [Plöchl, Ossandón, König]
venue: Frontiers in Human Neuroscience
doi: 10.3389/fnhum.2012.00278
url: https://www.frontiersin.org/articles/10.3389/fnhum.2012.00278
license: CC-BY-3.0
modalities: [EEG, eye-tracking, artifact-correction, ICA]
tags: [eye-movement-artifacts, blink, saccadic-spike-potential, ICA, EYE-EEG, regression-vs-ICA, automated-IC-rejection, eye-tracking-coregistration]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

## TL;DR
Independent component analysis (ICA) outperforms regression-based subtraction for removing electroencephalographic (EEG) eye-movement artifacts because the corneo-retinal dipole, saccadic spike potential, and eyelid artifact arise from independent sources; an algorithm that uses simultaneous eye-tracker timing to flag and remove eye-artifact ICs is proposed and matches human-expert IC labels with area under the receiver operating characteristic curve (AUC) above 0.99.

## Summary
Plöchl, Ossandón, and König systematically characterize three classes of eye-movement EEG artifact (corneo-retinal dipole, saccadic spike potential, eyelid contamination), show that they project onto different scalp distributions and depend on gaze direction, electrode site, and reference, and demonstrate via simultaneous 64-channel EEG plus eye tracking that ICA decomposes them into separable components. They compare ICA against linear regression-based subtraction and show that regression necessarily over- or under-corrects when multiple independent eye sources are present. They propose an automated algorithm: variance-against-saccade-onset for each IC, thresholded to label ocular components, and demonstrate near-perfect agreement with expert manual labeling (AUC > 0.99). Removal of identified ICs preserves underlying neural signal including microsaccade-locked spectral content.

## Relevance to the review
Direct dependency for "The Present" preprocessing. We are not coregistering eye tracking on R3, but the AMICA + ICLabel decomposition in Phase 2-3 of the pipeline is the fallback for the same artifact classes Plöchl identifies. This paper is the canonical justification for trusting ICA-based eye-artifact removal when no eye-tracker is available, and for using ICLabel's "Eye" classification as the rejection criterion. It also flags microsaccadic spike potentials as a confound that survives traditional eye-blink corrections; given that "The Present" likely drives microsaccades during shot transitions, this is non-negligible. The paper supports our reliance on the ICLabel brain threshold for IC selection in Phase 3.

## Notable details
- 64-channel EEG plus simultaneous eye tracker; guided eye-movement paradigm.
- Three artifact classes: corneo-retinal dipole (slow drift with gaze direction), saccadic spike potential (fast transient at saccade onset), eyelid artifact (blink-locked).
- ICA decomposes these into separable components; regression cannot.
- Automated IC labeling via saccade-onset variance: AUC > 0.99 vs human experts.
- Open Access (CC BY 3.0).

## Open questions / limitations
- Subjects make guided large-amplitude eye movements; the artifact spectrum during free movie viewing (microsaccades dominant) is closer to but not identical to this paradigm.
- 64 channels; ICA performance scales roughly with channel count, so the local 100 Hz BDF dataset (often 64-128 channels) sits in the validated range.
- The proposed automated algorithm requires eye-tracker timestamps; the HBN-EEG R3 dataset has no synchronous eye tracking. We must rely on ICLabel scalp-topography classification instead.
- 100 Hz sampling severely limits saccadic-spike-potential resolution: the spike is a few-millisecond transient and will alias under 100 Hz, so its removal benefit is reduced.

## Citations
Primary BibTeX key: `Plöchl2012CombiningEA` (in `psychophysics.bib`).

Related works:
- Dimigen et al. (2011) J Exp Psychol Gen 140:552, fixation-related potentials with eye-EEG.
- Yuval-Greenberg et al. (2008) Neuron 58:429, induced gamma is microsaccadic spike potential.
- Pion-Tonachini, Kreutz-Delgado, Makeig (2019) NeuroImage 198:181, ICLabel automated IC classification.
- Hoffmann, Falkenstein (2008) PLoS ONE 3:e3004, regression-based EOG correction.
- Olbrich et al. (2009) NeuroImage 45:319, ICA for eye-artifact removal.
