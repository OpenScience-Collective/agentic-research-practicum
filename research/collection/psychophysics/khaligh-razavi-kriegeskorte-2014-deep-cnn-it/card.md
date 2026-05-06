---
slug: khaligh-razavi-kriegeskorte-2014-deep-cnn-it
type: paper
strand: psychophysics
year: 2014
authors: [Khaligh-Razavi, Kriegeskorte]
venue: PLOS Computational Biology
doi: 10.1371/journal.pcbi.1003915
url: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003915
license: CC-BY-4.0
modalities: [computational-vision, fMRI, ECoG-monkey, RSA]
tags: [HMAX, deep-CNN, supervised-learning, IT-cortex, representational-similarity-analysis, object-recognition, ventral-stream, GIST, SIFT, model-comparison]
relevance: low
imported_from: null
added: 2026-05-06

pdf_status: archived
pdf_path: source.pdf
md_path: source.md
md_quality: clean
---

## TL;DR
Across 37 computational object-vision models including HMAX and a deep convolutional neural network (CNN), the deep CNN best explains the representational geometry of human and monkey inferotemporal (IT) cortex on the same stimulus set, and the categorical structure in IT requires supervised training rather than unsupervised feature learning.

## Summary
Khaligh-Razavi and Kriegeskorte compared 37 computational vision models against representational dissimilarity matrices (RDMs) from human IT (functional magnetic resonance imaging, fMRI) and monkey IT (cell recordings) for a shared stimulus set of objects. Models ranged from biologically inspired hierarchies (HMAX, VisNet) through low-level features (SIFT, GIST, self-similarity) to a deep CNN trained on ImageNet. Deep CNN performed best on both categorization and IT-RDM correlation, but no single model fully captured IT structure; combining the deep CNN with supervised animate/inanimate and face-versus-other linear weights closed the gap. The unsupervised models (e.g., HMAX) explained earlier-layer / lower-level structure but not the categorical clustering characteristic of IT. The work is a touchstone for the deep-CNN-as-model-of-ventral-stream literature.

## Relevance to the review
Tangential to "The Present" boy-shot vs puppy-shot ERSP project. We are not using deep networks in Phase 1-6 (per the project NEVER list), so this paper is reference-only. It is included for two narrow reasons: 1) it documents the limits of HMAX-style hierarchical low-level features in explaining cortical responses to objects (relevant if Phase 3 synthesis evaluates HMAX as a regressor); 2) the categorical animate/inanimate and face-versus-other distinction maps onto the boy versus puppy condition contrast (both animate, both face-like), so the result that IT requires supervised category training to fit is a hint that low-level features alone won't explain any condition difference. This is a Phase 3 synthesis prompt, not a Phase 1-2 dependency.

## Notable details
- 37 models compared on the same image set against IT RDMs.
- Deep CNN trained with ImageNet supervision is the best single model.
- Adding supervised animate/inanimate and face/other linear margins to the CNN fully explains the IT RDM in this dataset.
- HMAX and other unsupervised hierarchies cannot explain the categorical structure.
- Open Access (CC BY 4.0).

## Open questions / limitations
- Static images, not movies; transfer to "The Present" requires spatiotemporal extensions.
- IT cortex is the focus; early visual cortex (where shot-onset transients live) is not the comparison target.
- Only one CNN architecture tested (the AlexNet-era network); modern transformer or self-supervised models are not in the comparison.
- The work establishes correspondence at the representational-geometry level, not at the time-resolved EEG level.

## Citations
Primary BibTeX key: `Khaligh-Razavi2014DeepSB` (in `psychophysics.bib`).

Related works:
- Riesenhuber, Poggio (1999) Nat Neurosci 2:1019 — HMAX original.
- Yamins et al. (2014) PNAS 111:8619 — companion CNN-IT paper.
- Cadieu et al. (2014) PLoS Comput Biol 10:e1003963 — deep nets matching IT.
- Kriegeskorte (2015) Annu Rev Vis Sci 1:417 — deep nets and brain review.
- Schrimpf et al. (2018) bioRxiv 407007 — Brain-Score model benchmark.
