---
slug: kragel-2019-emonet-visual
type: paper
strand: emotion
year: 2019
authors: [Kragel, Reddan, LaBar, Wager]
venue: Science Advances
doi: 10.1126/sciadv.aaw4358
url: https://doi.org/10.1126/sciadv.aaw4358
license: CC-BY-NC-4.0
modalities: [fMRI, deep-learning, naturalistic-videos, computer-vision]
tags: [emotion-schemas, EmoNet, visual-cortex, deep-learning, video, multivariate-pattern-analysis, adult-only]
relevance: medium
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR

A deep convolutional neural network (EmoNet) trained on emotion-evoking videos predicts emotion-category-specific patterns in human occipital cortex during fMRI viewing, indicating that emotion schemas are represented within sensory visual cortex itself, not only in subsequent affective regions.

## Summary

Kragel and colleagues trained EmoNet, a deep convolutional neural network, on 137,000 emotion-labelled video frames spanning 20 emotion categories. EmoNet's category-prediction accuracy was high on held-out videos and matched human ratings. The authors then used EmoNet's intermediate representations to model fMRI activity in 18 participants viewing 20 brief videos. EmoNet's emotion-relevant features predicted activity in occipital cortex (V1 to lateral occipital complex), and category-specific neural patterns were detected with multi-voxel pattern analysis (MVPA) within visual cortex. The findings argue that emotion-related information is embedded in early visual processing rather than emerging only in downstream limbic and prefrontal regions.

## Relevance to the review

Important for interpreting any early-latency (0-500 ms) ERSP differences between boy-shot and puppy-shot in The Present. If emotion category is encoded in visual cortex, then early occipital ERSP differences in HBN could reflect content-specific affective representations rather than purely low-level luminance or motion energy. This refines the analysis framework: log luminance ratio (LLR) regressors absorb low-level brightness, but Kragel implies an additional, content-driven, early visual-cortex signal that may show up in the early window. Marked `relevance: medium` because the modality (fMRI) and the broader 20-category schema do not directly map onto the binary boy-vs-puppy contrast.

Developmental-justification rule: adult-only sample. Visual-cortex emotion encoding has not been formally tested in children, but visual cortex itself is mature by school age, so transfer is plausible. Mark `relevance: medium` and document developmental gap.

Note on confusion: EmoNet (Kragel 2019 Sci Adv) is distinct from Chikazoe et al. 2014 *Nature Neuroscience* on population coding of affect; do not conflate.

## Notable details

- Training set: 137,482 video frames, 20 emotion categories.
- Held-out test classification accuracies above human inter-rater agreement for several categories.
- N = 18 fMRI subjects; 20 short videos.
- EmoNet feature representations predicted occipital cortex activity, with category-specific patterns in V1, V2, V3, V4, lateral occipital complex.
- Argues against a strict "emotion = limbic" account; supports distributed, including visual, encoding.

## Open questions / limitations

- 20-category taxonomy chosen by the authors; alignment with Cowen-Keltner 2017 27-category space is partial.
- Adult sample, N = 18; no developmental data.
- Static frames within video, not full audiovisual stream.
- Causal role of visual-cortex emotion patterns is unclear (correlation, not necessity).

## Citations

Primary BibTeX key: `KragelEmotionSA`

Related works:
- Saarimaki 2016 Cereb Cortex: MVPA discrete emotion classifications.
- Cowen-Keltner 2017 PNAS: 27 emotion categories from short videos (training-set inspiration).
- Chikazoe 2014 Nat Neurosci: population coding of affective valence (separate, not the same paper).
- Lindquist 2012 BBS: brain basis of emotion meta-analysis (different account).
- Wager 2015 PLOS Biology: distributed neural representations of emotion.
