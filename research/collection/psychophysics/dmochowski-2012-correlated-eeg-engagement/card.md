---
slug: dmochowski-2012-correlated-eeg-engagement
type: paper
strand: psychophysics
year: 2012
authors: [Dmochowski, Sajda, Dias, Parra]
venue: Frontiers in Human Neuroscience
doi: 10.3389/fnhum.2012.00112
url: https://www.frontiersin.org/articles/10.3389/fnhum.2012.00112
license: CC-BY-3.0
modalities: [EEG, naturalistic-movies, ISC, time-frequency]
tags: [correlated-component-analysis, EEG-ISC, engagement, naturalistic-stimuli, alpha-decrease, beta-decrease, theta-increase, sLORETA, generalized-eigenvalue]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

## TL;DR
Introduces correlated component analysis (a regularized generalized-eigenvalue solver akin to canonical correlation analysis without the orthogonality constraint) and applies it to scalp electroencephalography (EEG) recorded during repeated movie viewing, showing that peaks of cross-viewing neural correlation track arousing scenes, drop with second viewing or scrambled order, and co-vary with frontal theta increases plus parietal-occipital alpha and beta decreases.

## Summary
Dmochowski and colleagues set up the EEG analogue of Hasson-style fMRI inter-subject correlation. Standard canonical correlation analysis requires orthogonal spatial filters, which is anatomically unmotivated; they relax this and pose component extraction as a generalized eigenvalue problem on the sum of cross-covariances divided by the pooled within-set covariance, regularized by truncating the principal-component spectrum. Applying this to EEG from repeated viewings of short film clips, they recover correlated components whose strength is highest during arousing moments, drops on second viewing, drops further when the narrative is scrambled in time, and is near zero in amateur footage of everyday life. Spectral co-variation analysis on the same components shows frontal theta power up and parietal-occipital alpha and beta power down at correlation peaks. Standardized low-resolution brain electromagnetic tomography (sLORETA) localizes the dominant correlated components to cingulate and orbitofrontal cortex.

## Relevance to the review
Direct dependency. This paper is the canonical reference for time-resolved EEG inter-subject correlation under naturalistic viewing, the methodological frame "The Present" boy-shot vs puppy-shot ERSP project sits inside. Specific implications: 1) the spatial filter approach (correlated components) is an alternative to AMICA-derived IC clustering for the cross-subject contrast in Phase 5; 2) the spectral co-variation (theta up, alpha-beta down at engagement peaks) parallels the ERSP regime we will compute on shot-locked epochs; 3) cingulate/orbitofrontal sLORETA localization motivates including a frontal IC cluster, not just occipital, in the cluster-level statistics. Repetition and scrambling controls also inform whether one should worry about boy-versus-puppy shots being "first viewings" if subjects watch the film once.

## Notable details
- 5-s sliding window with 1-s shift gives time resolution down to ~1 s, an order of magnitude better than fMRI ISC.
- Correlated-component analysis (CorCA) is a generalized eigenvalue problem: `(R11 + R22)^-1 (R12 + R21) w = lambda w`.
- Theta band 4-8 Hz, alpha 8-13 Hz, beta 13-30 Hz; instantaneous power via Morlet filters.
- Cingulate and orbitofrontal sources are not the typical ISC suspects from fMRI; the EEG perspective adds frontal generators.
- Operationalizes "engagement" as emotion-laden attention; this is the conceptual ancestor of the Madsen-Parra 2022 multi-modal sync results.

## Open questions / limitations
- Subjects are healthy adults watching short clips, not the heterogeneous developmental sample (~6-21 years old) of HBN-EEG R3 ThePresent.
- Spectral analysis uses Morlet filters at fixed center frequencies, not a full time-frequency decomposition; the boy-vs-puppy ERSP design needs a finer-grained event-related spectral perturbation (ERSP) computation locked to shot onsets.
- Engagement is operationalized post-hoc; the paper does not provide a direct test of how stimulus-locked low-level features (luminance, motion energy) versus high-level narrative features drive correlated components.
- 100 Hz sampling (the local R3 dataset) caps the upper-band reliability of beta findings; a future 500 Hz validation run is needed for the beta-decrease replication.

## Citations
Primary BibTeX key: `dmochowski2012correlated` (in `psychophysics.bib`).

Related works:
- Hasson et al. (2004) Science 303:1634, fMRI ISC parent paradigm.
- Dmochowski et al. (2014) Nat Commun 5:4567, audience preferences from EEG ISC.
- Ki, Kelly, Parra (2016) J Neurosci 36:3092, attention modulates EEG correlated components.
- Cohen, Parra (2016) eNeuro 3:0203, memorable narratives and EEG sync.
- Madsen, Parra (2022) PNAS Nexus 1:pgac020, brains, hearts, and eyes synchronization.
