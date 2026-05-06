---
slug: heilbron-2022-hierarchy-predictions
type: paper
strand: language
year: 2020
authors: [Heilbron, Armeni, Schoffelen, Hagoort, Lange]
venue: Proceedings of the National Academy of Sciences of the United States of America
doi: 10.1073/pnas.2201968119
url: https://www.semanticscholar.org/paper/4b2d04556f7d3377998f4f236b57086a1be74f23
license: publisher-paywall (PNAS); preprint copy not archived
modalities: [MEG, language-model, natural-speech]
tags: [MEG, GPT-2, predictive-coding, narrative-listening, syntactic-surprisal, lexical-surprisal]
relevance: low
imported_from: null
added: 2026-05-06

# Archival fields
pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

# A hierarchy of linguistic predictions during natural language comprehension

## TL;DR

During naturalistic story listening, magnetoencephalography (MEG) responses align with a hierarchy of linguistic predictions, including word, syntax, and semantic surprisal extracted from neural language models.

## Summary

Heilbron, Armeni, Schoffelen, Hagoort, and de Lange recorded MEG from adults listening to audiobook narrative. They regressed source-space MEG against word-level surprisal estimates from GPT-2 (lexical), parser-derived syntactic surprisal, and semantic-vector dissimilarity. All three regressors explained independent variance in temporal-cortex MEG, with distinct latencies and source distributions. The result extends the N400 prediction literature into the continuous-listening setting.

## Relevance to the review

Important comparator paper showing how language-model-derived regressors carve up natural electrophysiology. Low relevance for ThePresent: every regressor in the model depends on word-level alignment to spoken text. Cited here to make the argument explicit: the influential "LM-derived predictive-coding hierarchy" results do not survive removal of speech.

## Notable details

- Three regressor families: lexical, syntactic, semantic surprisal.
- GPT-2 used for lexical/semantic; constituent parser for syntactic.
- Source-space MEG; effects localized to superior temporal and inferior frontal cortex.
- Distinct latencies separate the prediction hierarchies.

## Open questions / limitations

- Audiobook listening only; no visual narrative.
- Requires word-onset transcripts and a parser.
- GPT-2 surprisal correlates strongly with surface frequency; partialing not fully resolved.

## Citations

Primary BibTeX key: see `language.bib` (heilbron-2022-hierarchy-predictions entry).

Related works cited in this card:
- Hasson et al. 2004, naturalistic-vision ISC foundation.
- Lerner et al. 2011, temporal receptive windows.
- Hasson Process Memory 2015 (TICS), generalisation of TRWs.
- Magliano and Zacks 2011, continuity-editing event segmentation.
- Vanderwal et al. 2015, silent-animation paradigm comparison.
