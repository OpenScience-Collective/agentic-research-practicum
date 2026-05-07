---
slug: nishimoto-2011-movie-reconstruction
type: paper
strand: psychophysics
year: 2011
authors: [Nishimoto, Vu, Naselaris, Benjamini, Yu, Gallant]
venue: Current Biology
doi: 10.1016/j.cub.2011.08.031
url: https://www.cell.com/current-biology/fulltext/S0960-9822(11)00937-7
license: publisher-paywall
modalities: [fMRI, naturalistic-movies, encoding-decoding, motion-energy]
tags: [motion-energy-model, Adelson-Bergen, V1, MT, encoding-model, Bayesian-decoder, movie-reconstruction, voxel-wise-modeling]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
A spatiotemporal motion-energy encoding model fit per voxel to functional magnetic resonance imaging (fMRI) blood-oxygen-level-dependent (BOLD) responses during natural-movie viewing supports voxel-wise decoding good enough to reconstruct viewed clips, validating Adelson-Bergen-style filter banks as the canonical low-level regressor for movie BOLD.

## Summary
Nishimoto and colleagues addressed the challenge that BOLD is too slow to fit dynamic naturalistic stimuli directly. Their solution factors the encoding model into a fast spatiotemporal motion-energy filter bank (a la Adelson-Bergen 1985) and a slow hemodynamic linear system. They fit per-voxel weights across V1 through MT+ in three subjects using hours of natural-movie footage, then validated a Bayesian decoder that recombines these fits with a natural-movie prior to reconstruct held-out clips. The reconstructions are recognizably similar to the held-out movies and constitute the canonical demonstration that motion-energy regressors capture most of the early-visual BOLD variance in naturalistic conditions.

## Relevance to the review
Direct dependency for the bottom-up regressor design in Phase 5 of the "The Present" pipeline. If a motion-energy regressor explains most of the early-visual variance in dynamic naturalistic viewing, then any boy-shot vs puppy-shot ERSP effect that survives motion-energy partialing must reflect higher-level (social or attentional) processing. This paper is the strongest published case for motion-energy as the right low-level confound to subtract; it also locates the regressor's predictive power primarily in V1 through MT+, which corresponds to occipital and lateral occipital electroencephalography (EEG) source clusters.

## Notable details
- Encoding model: Gabor wavelet motion-energy filters at multiple spatial scales and temporal frequencies, summed by quadrature pairs.
- Hemodynamic response is convolved separately to bridge the time-scale gap.
- 3 subjects, hours of held-out movie data; cross-validated.
- Bayesian decoder uses a sampled natural-movie prior; reconstructions degrade gracefully outside V1-MT+.
- Cited heavily as evidence for an Adelson-Bergen-style motion-energy code in human early visual cortex.

## Open questions / limitations
- BOLD captures slow population activity; the 0-500 ms event-related spectral perturbation (ERSP) regime is not directly probed by this paper.
- Model assumes linearity of population summing; nonlinear normalization (Carandini-Heeger) is not explicitly built in.
- Human subjects are extremely well-trained and participate in long sessions; generalization to brief clinical-grade datasets like "The Present" (a few minutes per subject) is not tested.

## Citations
Primary BibTeX key: `Nishimoto2011ReconstructingVE` (in `psychophysics.bib`).

Related works:
- Adelson, Bergen (1985) JOSA A 2:284, motion-energy model used here.
- Naselaris et al. (2011) NeuroImage 56:400, encoding/decoding methodology review.
- Bartels, Zeki, Logothetis (2008) Cereb Cortex 18:705, naturalistic-movie fMRI of motion.
- Huth et al. (2012) Neuron 76:1210, semantic encoding model on natural movies.
- Han et al. (2019) NeuroImage 198:125, encoding models in naturalistic EEG.
