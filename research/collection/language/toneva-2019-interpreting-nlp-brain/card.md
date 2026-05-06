---
slug: toneva-2019-interpreting-nlp-brain
type: paper
strand: language
year: 2019
authors: [Toneva, Wehbe]
venue: arXiv (Cornell University)
doi: 10.48550/arxiv.1905.11833
url: https://doi.org/10.48550/arxiv.1905.11833
license: preprint-cc-arxiv
modalities: [fMRI, MEG, language-model, reading]
tags: [BERT, transformer, reading, fMRI, MEG, natural-language-processing, attention-heads]
relevance: low
imported_from: null
added: 2026-05-06

# Archival fields
pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

# Interpreting and improving natural-language processing (in machines) with natural language-processing (in the brain)

## TL;DR

Brain recordings during natural reading can be predicted by intermediate transformer layers; ablating transformer attention heads that read out brain-relevant information degrades NLP task performance, suggesting two-way interpretability between brains and language models.

## Summary

Toneva and Wehbe predicted fMRI and MEG responses during natural-text reading from layerwise BERT representations. Intermediate layers best explained brain activity. They then performed targeted attention-head ablations on heads that read out brain-relevant features and showed that NLP downstream task performance dropped. The bidirectional analysis is influential for the broader brain-LM literature and was an early demonstration that LM internals can be calibrated against brain data.

## Relevance to the review

Low for ThePresent. Reading-based paradigm with text stimuli; no analogue in silent animation. Cited as foundational example of LM-as-regressor work and as further evidence that the LM-brain alignment paradigm is text-bound.

## Notable details

- Reading-based fMRI and MEG datasets from prior Wehbe-lab work.
- BERT layerwise encoding analysis.
- Targeted attention-head ablations link brain-prediction to NLP performance.
- Cited heavily in subsequent transformer-brain alignment papers.

## Open questions / limitations

- Reading-only paradigm.
- BERT is bidirectional, not strictly autoregressive; conclusions may be specific to this architecture.
- No silent-stimulus equivalent.

## Citations

Primary BibTeX key: see `language.bib` (toneva-2019-interpreting-nlp-brain entry).

Related works cited in this card:
- Hasson et al. 2004, naturalistic-vision ISC foundation.
- Lerner et al. 2011, temporal receptive windows.
- Hasson Process Memory 2015 (TICS), generalisation of TRWs.
- Magliano and Zacks 2011, continuity-editing event segmentation.
- Vanderwal et al. 2015, silent-animation paradigm comparison.
