---
slug: caucheteux-2022-brains-algorithms
type: paper
strand: language
year: 2022
authors: [Caucheteux, King]
venue: Communications Biology
doi: 10.1038/s42003-022-03036-1
url: https://www.semanticscholar.org/paper/83a491b6dfab0a9f30ce66d7dad1d7409e4d6e4d
license: CC-BY-4.0
modalities: [fMRI, MEG, language-model]
tags: [language-model, GPT-2, brain-score, fMRI, MEG, narrative-listening, partial-convergence]
relevance: low
imported_from: null
added: 2026-05-06

# Archival fields
pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

# Brains and algorithms partially converge in natural language processing

## TL;DR

Across multiple naturalistic-listening fMRI and MEG datasets, intermediate transformer layers best predict brain responses, suggesting brains and language models partially share representational geometry but diverge in long-range integration.

## Summary

Caucheteux and King aggregated fMRI and MEG data across multiple narrative-listening datasets and computed encoding-model brain-scores against GPT-2 layer activations. Intermediate layers (around layer 6-12 of 24) best predict brain activity in temporal and inferior-frontal cortex; deepest layers under-predict. The pattern is consistent across fMRI and MEG and survives controls for word frequency and acoustic features. They argue that current LMs capture local linguistic computations well but miss long-range, slow-timescale integration that the brain performs.

## Relevance to the review

Comparator: this is the paper that operationalises "language model as regressor" most cleanly. The alignment claim depends entirely on aligning model activations to spoken-word onsets. For ThePresent the method is inapplicable; cited here to make the argument that LM-as-regressor is a speech-bound paradigm. Marked low because no part of the pipeline survives removal of audio.

## Notable details

- Aggregated several naturalistic-listening datasets (Narratives, Pieman, Le Petit Prince).
- Intermediate transformer layers > final layers for brain prediction.
- Pattern stable across fMRI and MEG.
- Public code released.

## Open questions / limitations

- Speech-only paradigm; the silent-stimulus case is not addressed.
- Brain-score saturates with model size, raising questions about whether the convergence is mechanistic or statistical.
- Dependency on accurate word-onset alignment.

## Citations

Primary BibTeX key: see `language.bib` (caucheteux-2022-brains-algorithms entry).

Related works cited in this card:
- Hasson et al. 2004, naturalistic-vision ISC foundation.
- Lerner et al. 2011, temporal receptive windows.
- Hasson Process Memory 2015 (TICS), generalisation of TRWs.
- Magliano and Zacks 2011, continuity-editing event segmentation.
- Vanderwal et al. 2015, silent-animation paradigm comparison.
