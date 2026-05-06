---
slug: goldstein-2022-shared-computational
type: paper
strand: language
year: 2022
authors: [Goldstein, Zada, Buchnik, Schain, Price, Aubrey, Nastase, Feder, Emanuel, Cohen, Jansen, Gazula, Choe, Rao, Kim, Casto, Fanda, Doyle, Friedman, Dugan, Melloni, Reichart, Devore, Flinker, Hasenfratz, Levy, Hassidim, Brenner, Matias, Norman, Devinsky, Hasson]
venue: Nature Neuroscience
doi: 10.1038/s41593-022-01026-4
url: https://www.semanticscholar.org/paper/b4206dd288958affeb314aee0ec1397de5c74c23
license: CC-BY-4.0
modalities: [ECoG, language-model, natural-speech]
tags: [language-model, GPT-2, ECoG, naturalistic-listening, next-word-prediction, autoregressive, word-by-word]
relevance: medium
imported_from: null
added: 2026-05-06

# Archival fields
pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

# Shared computational principles for language processing in humans and deep language models

## TL;DR

Word-by-word electrocorticography (ECoG) during naturalistic narrative listening reveals three signatures shared with autoregressive language models: predictive context aggregation before the word, surprise responses on the word, and contextual-embedding-based representation around it.

## Summary

Goldstein, Zada, Buchnik, et al. recorded ECoG from epilepsy patients listening to a 30-minute podcast. They aligned each word to GPT-2 next-word prediction probabilities and contextual embeddings. Three signatures replicated within the language network: spontaneous next-word pre-activation up to 800 ms before word onset, post-word surprise scaling with cross-entropy, and contextual-embedding-based encoding of word identity. The pattern parallels the autoregressive prediction-and-update loop in deep language models, providing a candidate computational equivalence.

## Relevance to the review

Methodologically central to category 6 (LMs as regressors) but operationally the alignment depends on word-onset timing and a transcript. For ThePresent there are no words to align; the regressor pipeline does not transfer. Useful as a reminder that "LM as regressor" claims about brain-language alignment are stimulus-dependent. The boundary case is failure: the silent animation has no transcript, so the GPT-2 alignment paradigm has no analogue.

## Notable details

- Word-onset locked ECoG, ~30 minutes of naturalistic podcast.
- GPT-2 contextual embeddings used to encode each word.
- Three temporally separable signatures: pre-onset prediction, post-onset surprise, contextual embedding.
- Alignment effect localized to language network electrodes.

## Open questions / limitations

- Intracranial epilepsy sample; coverage uneven.
- Requires high-quality word-onset transcripts.
- No silent-stimulus equivalent; fundamentally a speech-based paradigm.

## Citations

Primary BibTeX key: see `language.bib` (goldstein-2022-shared-computational entry).

Related works cited in this card:
- Hasson et al. 2004, naturalistic-vision ISC foundation.
- Lerner et al. 2011, temporal receptive windows.
- Hasson Process Memory 2015 (TICS), generalisation of TRWs.
- Magliano and Zacks 2011, continuity-editing event segmentation.
- Vanderwal et al. 2015, silent-animation paradigm comparison.
