---
slug: antonello-2023-scaling-laws
type: paper
strand: language
year: 2023
authors: [Antonello, Vaidya, Huth]
venue: Advances in neural information processing systems
doi: 10.48550/arXiv.2305.11863
url: https://www.semanticscholar.org/paper/8376e50e81329b3db5049a90851cc0418d071e3d
license: preprint-cc-arxiv
modalities: [fMRI, language-model, narrative-listening]
tags: [scaling-laws, OPT, LLaMA, language-model, fMRI-encoding, brain-score, narrative-listening]
relevance: low
imported_from: null
added: 2026-05-06

# Archival fields
pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

# Scaling laws for language encoding models in fMRI

## TL;DR

Scaling language models from 125M to 30B parameters monotonically improves fMRI encoding scores in language cortex during narrative listening; the relationship follows a power law similar to LM perplexity scaling.

## Summary

Antonello, Vaidya, and Huth ran encoding-model analyses on 8 subjects who listened to 20+ hours of narrative each. Across LM families (OPT and LLaMA), brain-prediction performance scaled log-linearly with model size up to 30 B parameters. Effects localized to canonical language cortex and were robust across different stimulus subsets. The result extended the brain-LM alignment literature into the LLM-scaling regime.

## Relevance to the review

Low relevance for ThePresent. Like the rest of category 6, it depends on word-onset alignment to spoken text. Cited as the most recent representative of the LM-as-regressor paradigm and as a scaling-aware instance of the same speech-bound limitation.

## Notable details

- 8 subjects, 20+ hours of narrative listening each.
- Encoding-model brain-score scales log-linearly with LM parameter count.
- Effects localized to language network ROI.
- Tests both OPT and LLaMA families.

## Open questions / limitations

- Speech-only naturalistic listening.
- 8 subjects only; small N for population claims.
- No silent-stimulus equivalent.

## Citations

Primary BibTeX key: see `language.bib` (antonello-2023-scaling-laws entry).

Related works cited in this card:
- Hasson et al. 2004, naturalistic-vision ISC foundation.
- Lerner et al. 2011, temporal receptive windows.
- Hasson Process Memory 2015 (TICS), generalisation of TRWs.
- Magliano and Zacks 2011, continuity-editing event segmentation.
- Vanderwal et al. 2015, silent-animation paradigm comparison.
