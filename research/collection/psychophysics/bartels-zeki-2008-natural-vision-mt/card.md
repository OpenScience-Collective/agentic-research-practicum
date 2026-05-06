---
slug: bartels-zeki-2008-natural-vision-mt
type: paper
strand: psychophysics
year: 2008
authors: [Bartels, Zeki, Logothetis]
venue: Cerebral Cortex
doi: 10.1093/cercor/bhm107
url: https://academic.oup.com/cercor/article/18/3/705/305478
license: publisher-paywall
modalities: [fMRI, naturalistic-movies, motion-energy]
tags: [MT, V5, V3A, mPPC, V6, global-flow, local-motion, predictive-coding, motion-energy-regressor, free-viewing-fMRI]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
Decomposing feature-film input into global flow, local motion, and residual changes (illumination, cuts) and regressing each against blood-oxygen-level-dependent (BOLD) signal reveals that V5/MT+ tracks contrast-dependent local motion, medial posterior parietal cortex (mPPC) tracks contrast-invariant global flow, and early visual cortex responds only to residuals, consistent with predictive coding.

## Summary
Bartels, Zeki, and Logothetis recorded BOLD signal while observers free-viewed feature-film clips and used a custom motion-decomposition pipeline to extract three regressors per frame: global flow induced by camera motion, local/differential flow due to object motion, and a residual that captures illumination changes including shot cuts. Voxel-wise general linear models showed that primary visual cortex (V1) and V2 tracked only residual variance, while V5/MT+ tracked local motion in a contrast-dependent way and mPPC tracked global flow in a contrast-invariant way. V6 was functionally segregated from mPPC in this analysis. The work is a key methodological reference for separating low-level motion-energy from cut-related residuals in naturalistic movies.

## Relevance to the review
Direct dependency for "The Present" preprocessing logic. Their residual regressor is essentially a generalization of our log luminance ratio (LLR) plus shot-cut event regressor: cuts and illumination changes form most of the residual variance not absorbed by motion-energy. The fact that V1/V2 BOLD is dominated by residual rather than motion supports the decision to model shot-onset transients as the primary bottom-up driver in early occipital event-related spectral perturbation (ERSP). It also predicts that any contrast-invariant component of the boy versus puppy condition contrast would localize to mPPC-like dorsal areas, not occipital, which sets a hypothesis for cluster-level statistics in Phase 5.

## Notable details
- Camera-motion-induced global flow versus object-motion local flow versus residual change is the key decomposition.
- V1/V2 tracks only residual variance; this is interpreted as predictive coding eliminating self-motion-explained signal.
- V5/MT+ response to local motion scales with image contrast; mPPC global-flow response does not.
- mPPC versus V6 segregation is functional in the residual versus flow contrast.
- 7 subjects, 12 minutes of feature-film footage; analysis is voxel-wise.

## Open questions / limitations
- BOLD has poor temporal resolution; this paper cannot speak directly to the 0-500 ms event-related spectral perturbation (ERSP) window that "The Present" Phase 5 targets. Latency claims must come from electroencephalography (EEG) work.
- The animation in "The Present" lacks the camera-motion structure of Hollywood films, so the global-flow versus local-motion partition may compress.
- Predictive-coding interpretation of V1/V2 residual response depends on the specific motion model used and is contested in later work.

## Citations
Primary BibTeX key: `Bartels2008NaturalVR` (in `psychophysics.bib`).

Related works:
- Hasson et al. (2004) Science 303:1634 — naturalistic-movie inter-subject correlation; foundational.
- Nishimoto et al. (2011) Curr Biol 21:1641 — motion-energy encoding/decoding from BOLD; cites this work.
- Smith et al. (2006) J Neurosci 26:773 — V6 and self-motion processing.
- Pitzalis et al. (2010) J Neurosci 30:1962 — V6 and visual flow.
- Whittingstall et al. (2010) Magn Reson Imaging 28:1478 — EEG-fMRI integration on natural movies.
