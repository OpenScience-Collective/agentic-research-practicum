---
slug: nentwich-2023-semantic-novelty-cuts
type: paper
strand: psychophysics
year: 2023
authors: [Nentwich, Leszczynski, Russ, Hirsch, Markowitz, Sapru, Schroeder, Mehta, Bickel, Parra]
venue: Nature Communications
doi: 10.1038/s41467-023-38576-5
url: https://www.nature.com/articles/s41467-023-38576-5
license: CC-BY-4.0
modalities: [iEEG, eye-tracking, naturalistic-movies, multiple-regression]
tags: [film-cuts, saccades, optical-flow, semantic-novelty, event-boundaries, intracranial-EEG, scene-cuts, social-stimuli, MTL]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

## TL;DR
Intracranial electroencephalography (iEEG) across 6328 electrodes in 23 patients while watching short film clips shows that film-cut and saccade-locked responses are widespread across the whole brain, with film cuts at semantic event boundaries especially effective in temporal and medial temporal lobe and saccades selectively modulated by visual novelty in the saccade target.

## Summary
Nentwich, Parra, and colleagues recorded iEEG and eye movements simultaneously while patients viewed 43.6 minutes of film clips. Using multiple-regression with three regressors (optical-flow magnitude, saccade onsets, film-cut onsets), they showed that saccade-locked and film-cut-locked responses span the whole brain, while motion-locked responses concentrate in low-level visual cortex. They then dissociated low-level from high-level semantic novelty: a deep-network feature-difference between consecutive saccade fixations indexed low-level visual novelty, and human-rated event boundaries indexed high-level semantic novelty. Saccades modulate by low-level novelty; film cuts modulate by high-level event-boundary novelty, with specific higher-order association regions selective for one or the other. Critically, motion is shown to be a stronger driver than luminance and contrast for occipitoparietal cortex.

## Relevance to the review
Direct dependency. This is the closest published analogue of "The Present" boy-shot vs puppy-shot pipeline: regressors for cuts, motion, and saccades, with semantic-novelty modulation. Specific implications: 1) the LLR (log luminance ratio) regressor in our pipeline is a luminance/contrast variable, but Nentwich shows motion is the dominant low-level driver, so we should consider adding a motion-energy regressor; 2) film cuts at semantic event boundaries activate temporal and medial temporal lobe, predicting that boy-vs-puppy shot transitions may engage temporal IC clusters in the HBN-EEG R3 sample; 3) the saccade-locked component is widespread, and we lack saccade timing on R3 which is a known limitation. The paper also confirms that "shot onset" is a strong neural event regardless of content, supporting our shot-onset epoching choice in Phase 4.

## Notable details
- 23 patients, 6328 intracranial contacts; 43.6 min of film clips.
- Three regressors: optical-flow magnitude, saccade onsets, film-cut onsets.
- Saccades and cuts drive whole-brain responses; motion is largely confined to occipitoparietal cortex.
- Semantic novelty defined two ways: deep-net feature distance for saccade-target novelty, human-rated event boundaries for cut novelty.
- Higher-order association areas selectively prefer high or low novelty saccades.
- Motion > luminance/contrast as a low-level driver (this is the key result for "The Present" framing).

## Open questions / limitations
- iEEG sampling is sparse (clinical electrode placement); generalization to scalp electroencephalography (EEG) source clusters is approximate.
- Adult clinical patients (epilepsy); generalization to the developmental HBN sample needs caution.
- "The Present" cuts often occur with characters present in both shots; semantic-novelty distinctions used here may not map cleanly.
- Motion regressor uses optical-flow magnitude, not a full Adelson-Bergen energy bank; so the "motion > luminance" claim needs replication with a richer motion-energy model.

## Citations
Primary BibTeX key: `Nentwich2023SemanticNM` (in `psychophysics.bib`).

Related works:
- Bartels, Zeki, Logothetis (2008) Cereb Cortex 18:705, motion vs residual decomposition in fMRI.
- Hasson et al. (2008) Neuron 57:452, event boundaries in fMRI.
- Russ, Leopold (2015) NeuroImage 109:84, saccade-locked responses in monkey.
- Dimigen, Sommer et al. (2011) J Exp Psychol Gen 140:552, fixation-related potentials.
- Itti, Koch (2001) Nat Rev Neurosci 2:194, saliency and visual novelty.
