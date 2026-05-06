---
slug: lipkin-2022-language-atlas
type: paper
strand: language
year: 2022
authors: [Lipkin, Tuckute, Affourtit, Small, Mineroff, Kean, Jouravlev, Rakocevic, Pritchett, Siegelman, Hoeflin, Pongos, Blank, Struhl, Ivanova, Shannon, Sathe, Hoffmann, Nieto-Castanon, Fedorenko]
venue: Scientific Data
doi: 10.1038/s41597-022-01645-3
url: https://www.semanticscholar.org/paper/1be5a2186f0d4f4046f45a8b1703eb65dea8ba79
license: CC-BY-4.0
modalities: [fMRI, language-network, atlas, dataset]
tags: [language-network, probabilistic-atlas, precision-fMRI, localizer, inferior-frontal, temporal-cortex]
relevance: low
imported_from: null
added: 2026-05-06

# Archival fields
pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

# Probabilistic atlas for the language network based on precision fMRI data from >800 individuals

## TL;DR

Probabilistic atlas of the human language network derived from sentence-vs-nonword precision fMRI in 800+ individuals, providing voxel-level prior maps for downstream analyses.

## Summary

Lipkin, Tuckute, Affourtit, et al. aggregated localizer fMRI from over 800 adults running the Fedorenko sentence-vs-nonword paradigm. They derived a probabilistic atlas marking the canonical language network (inferior frontal gyrus, posterior temporal cortex) at high resolution. The atlas is released as a public resource and shows a frontotemporal language network that is left-dominant, individually variable, and dissociable from the multiple-demand network. Companion data and code are open.

## Relevance to the review

Low for ThePresent because the atlas is built on linguistic stimuli (sentences vs. nonwords) and the language network it defines is recruited only when language is processed. Useful as a region-of-interest mask for any analysis that wants to contrast "language network" against control networks; in a silent stimulus the prediction is that this network should be largely silent, which is itself a useful negative control.

## Notable details

- 800+ participants, sentence-vs-nonword localizer.
- Probabilistic atlas in MNI space, openly released.
- Confirms left-dominance and dissociation from multiple-demand network.
- Provides a parcellation comparable to Yeo for the language system.

## Open questions / limitations

- Localizer is reading-based (sentences vs. nonwords).
- Adult sample only.
- Strictly an fMRI atlas; no electrophysiological correlates.

## Citations

Primary BibTeX key: see `language.bib` (lipkin-2022-language-atlas entry).

Related works cited in this card:
- Hasson et al. 2004, naturalistic-vision ISC foundation.
- Lerner et al. 2011, temporal receptive windows.
- Hasson Process Memory 2015 (TICS), generalisation of TRWs.
- Magliano and Zacks 2011, continuity-editing event segmentation.
- Vanderwal et al. 2015, silent-animation paradigm comparison.
