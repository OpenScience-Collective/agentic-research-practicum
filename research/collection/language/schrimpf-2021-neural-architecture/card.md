---
slug: schrimpf-2021-neural-architecture
type: paper
strand: language
year: 2021
authors: [Schrimpf, Blank, Tuckute, Kauf, Hosseini, Kanwisher, Tenenbaum, Fedorenko]
venue: Proceedings of the National Academy of Sciences
doi: 10.1073/pnas.2105646118
url: https://doi.org/10.1073/pnas.2105646118
license: publisher-paywall (PNAS); preprint copy not archived
modalities: [fMRI, ECoG, language-model, review]
tags: [language-model, GPT-2, transformer, brain-score, integrative-modeling, next-word-prediction]
relevance: low
imported_from: null
added: 2026-05-06

# Archival fields
pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

# The neural architecture of language: Integrative modeling converges on predictive processing

## TL;DR

Across multiple human language datasets (fMRI, ECoG, behavior), models trained for next-word prediction, especially transformer architectures, predict brain activity better than other model classes, supporting predictive processing as a unifying account.

## Summary

Schrimpf, Blank, Tuckute, Kauf, Hosseini, Kanwisher, Tenenbaum, and Fedorenko evaluated 43 language models against multiple human language datasets. Transformer-based models trained for next-word prediction (especially GPT-2) achieved the highest brain-score across fMRI, ECoG, and self-paced reading benchmarks. Performance correlated with the model's next-word prediction quality, not with other linguistic tasks. They argued that predictive processing is the dominant computational signature shared between brains and LMs. Cited as the integrative argument behind LM-as-regressor work.

## Relevance to the review

Low relevance for ThePresent because every benchmark requires word-level alignment to spoken or written stimuli. Critical comparator: the paper is explicit that the brain-LM convergence is a property of next-word prediction, which has no counterpart in a wordless animation. Cited so that the silent-stimulus argument can name this paper as a paradigm that does not transfer.

## Notable details

- 43 models evaluated; transformers dominate.
- Next-word-prediction performance is the strongest predictor of brain-score.
- Spans fMRI, ECoG, and reading-time data.
- Foundational integrative argument for category 6.

## Open questions / limitations

- Reading and listening only; no visual narrative.
- Brain-score depends on word-level alignment.
- No silent-stimulus equivalent.

## Citations

Primary BibTeX key: see `language.bib` (schrimpf-2021-neural-architecture entry).

Related works cited in this card:
- Hasson et al. 2004, naturalistic-vision ISC foundation.
- Lerner et al. 2011, temporal receptive windows.
- Hasson Process Memory 2015 (TICS), generalisation of TRWs.
- Magliano and Zacks 2011, continuity-editing event segmentation.
- Vanderwal et al. 2015, silent-animation paradigm comparison.
