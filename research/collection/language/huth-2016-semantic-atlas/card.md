---
slug: huth-2016-semantic-atlas
type: paper
strand: language
year: 2016
authors: [Huth, Heer, Griffiths, Theunissen, Gallant]
venue: Nature
doi: 10.1038/nature17637
url: https://www.semanticscholar.org/paper/ad22b61cb977377cc422b0b39a0bc5c58f1ab1ea
license: publisher-paywall (Nature); PMC version is HTML-only
modalities: [fMRI, spoken-narrative, word-embedding]
tags: [semantic-atlas, voxel-encoding, word-embeddings, natural-speech, cortical-tiling, narrative-listening]
relevance: low
imported_from: null
added: 2026-05-06

# Archival fields
pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

# Natural speech reveals the semantic maps that tile human cerebral cortex

## TL;DR

Voxelwise encoding models trained on hours of narrated stories produce a semantic tiling of human cortex, showing that distributed networks selectively respond to clusters of related word meanings.

## Summary

Huth and colleagues recorded fMRI from 7 participants listening to 2 hours of natural narrative speech (Moth Radio Hour stories). Each cortical voxel was modeled as a linear function of a 985-dimensional word-embedding feature space derived from a large text corpus. The result is a semantic atlas in which voxel tuning forms smoothly varying maps across temporal, parietal, and frontal cortex, with replicable clusters tuned to social, tactile, locational, numeric, and emotion-related concepts. The maps are individual but reproducible across the seven subjects.

## Relevance to the review

Iconic demonstration that naturalistic listening drives broadly distributed semantic cortex, anchoring the comparator strand. Marked low-relevance for ThePresent because the result is entirely speech-driven; without spoken words there is no obvious analogue of word-embedding regressors. Useful as a reference example of what cannot transfer to a silent animation: word-vector encoding models would need to be replaced by visual-scene or affect-based regressors.

## Notable details

- Two hours per subject of narrated stories during 7T-equivalent fMRI.
- 985-D semantic feature space derived from word co-occurrences.
- PrAGMatic cortical mapping yielded reproducible semantic clusters across subjects.
- Companion data and code released openly via Gallant lab.

## Open questions / limitations

- Speech-only paradigm; no visual narrative.
- Encoding model assumes word-aligned, transcript-anchored regressors.
- Seven adult subjects, no developmental sample, no clinical sample (limits transfer to HBN children).

## Citations

Primary BibTeX key: see `language.bib` (huth-2016-semantic-atlas entry).

Related works cited in this card:
- Hasson et al. 2004, naturalistic-vision ISC foundation.
- Lerner et al. 2011, temporal receptive windows.
- Hasson Process Memory 2015 (TICS), generalisation of TRWs.
- Magliano and Zacks 2011, continuity-editing event segmentation.
- Vanderwal et al. 2015, silent-animation paradigm comparison.
