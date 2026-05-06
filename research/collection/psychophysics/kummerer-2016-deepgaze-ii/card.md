---
slug: kummerer-2016-deepgaze-ii
type: paper
strand: psychophysics
year: 2016
authors: [Kümmerer, Wallis, Bethge]
venue: arXiv (preprint, ICCV-related)
doi: 10.48550/arXiv.1610.01563
url: https://arxiv.org/abs/1610.01563
license: preprint-cc-arxiv
modalities: [computational-vision, fixation-prediction, deep-learning]
tags: [DeepGaze, saliency-prediction, fixation-prediction, VGG-19, transfer-learning, MIT300, free-viewing, deep-features]
relevance: low
imported_from: null
added: 2026-05-06

pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

## TL;DR
DeepGaze II uses pretrained VGG-19 features with a small trainable readout to predict free-viewing fixation locations on natural images, capturing about 87% of the explainable information gain in fixation patterns and topping the MIT300 saliency benchmark via transfer learning rather than end-to-end training.

## Summary
Kümmerer, Wallis, and Bethge build on their DeepGaze I result by using VGG-19 features pretrained on ImageNet object recognition as a fixed feature extractor, learning only a small set of readout layers on top. With this transfer-learning architecture and conservative cross-validation, the model accounts for ~87% of the explainable information gain in human fixation patterns on the MIT300 benchmark, outperforming all then-state-of-the-art saliency models. The result demonstrates that deep features trained for object recognition transfer cleanly to fixation prediction, supporting the view that visual saliency in natural scenes is dominated by object-level structure as captured by deep CNNs. The model is available as a web service.

## Relevance to the review
Tangential to "The Present" mainline. The HBN-EEG R3 dataset has no eye tracker, so fixation prediction is not directly used in the pipeline. The paper is included for two reasons: 1) it documents the state of the art in computational saliency, which is one possible future regressor for naturalistic-EEG (a saliency-weighted attentional regressor on the boy versus puppy condition contrast); 2) Phase 3 synthesis may want to compare LLR (log luminance ratio) and motion energy with a CNN-saliency regressor on a future eye-tracked extension of the project. As a deep-learning approach it sits outside the project's stated avoidance of deep learning in Phase 1-6, hence `low` relevance.

## Notable details
- VGG-19 features pretrained on ImageNet; only readout layers trained for saliency.
- ~87% of explainable information gain on MIT300 fixation benchmark.
- Transfer learning argument: object-recognition features generalize to fixation prediction.
- Web service at http://deepgaze.bethgelab.org.
- arXiv preprint; openly redistributable.

## Open questions / limitations
- Static-image saliency, not dynamic-movie fixation prediction.
- "Explainable information gain" assumes a knowable upper bound on prediction accuracy (the inter-observer consistency); for "The Present" this would need to be re-estimated.
- No EEG involvement; the paper is purely computational behavior modeling.
- Model is deep-learning-based; project policy avoids deep learning in Phase 1-6.

## Citations
Primary BibTeX key: `kmmerer2016deepgaze` (in `psychophysics.bib`).

Related works:
- Itti, Koch (2001) Nat Rev Neurosci 2:194 — classical saliency model.
- Vig et al. (2014) CVPR — first deep-network saliency.
- Kümmerer, Theis, Bethge (2015) ICLR — DeepGaze I.
- Bylinskii et al. (2019) IEEE TPAMI 41:740 — saliency benchmark methodology.
- Cornia et al. (2018) IEEE TIP 27:5142 — alternative LSTM-based saliency.
