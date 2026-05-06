---
slug: riesenhuber-poggio-1999-hmax
type: paper
strand: psychophysics
year: 1999
authors: [Riesenhuber, Poggio]
venue: Nature Neuroscience
doi: 10.1038/14819
url: https://www.nature.com/articles/nn1199_1019
license: publisher-paywall
modalities: [computational-vision, biological-modeling, V1-IT-hierarchy]
tags: [HMAX, hierarchical-model, max-pooling, simple-complex-cells, V1, V4, IT, translation-invariance, scale-invariance, foundational]
relevance: low
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
HMAX (Hierarchical Model and X) extends the Hubel-Wiesel simple-to-complex hierarchy with a MAX-like pooling operation between feature-tuning layers, producing translation- and scale-invariant object representations matching inferotemporal (IT) cortex selectivity, and seeding modern feedforward models of ventral-stream object recognition.

## Summary
Riesenhuber and Poggio formalize the long-assumed cortical-hierarchy view of object vision into a quantitative model with alternating "S" (feature-tuning) and "C" (max-pooling) layers. S1 cells are Gaussian-tuned oriented filters approximating V1 simple cells. C1 cells take the maximum over a small pool of S1 cells across nearby scales and positions, approximating V1 complex cells. S2 cells combine C1 outputs into prototype features (V4-like), and C2 cells pool S2 over the whole image (IT-like). The maximum operation is the central proposal: it produces robust position- and scale-invariance without averaging out features, matching the qualitative profile of IT cells. The architecture pre-dates and conceptually anticipates modern feedforward deep CNNs.

## Relevance to the review
Background only for "The Present" project. We are not running HMAX or any deep model in Phase 1-6 (per project policy). The paper is included as the canonical hierarchical-model reference cited by every later object-recognition paper, including Khaligh-Razavi & Kriegeskorte 2014 (this strand), and as the historical pivot from biological-receptive-field theory to computational object-vision modeling.

## Notable details
- S/C layer alternation: feature tuning then max pooling.
- MAX over scale and position is the key invariance mechanism.
- 4 layers (S1, C1, S2, C2) rather than the modern many-layer CNNs.
- Predicts IT cell selectivity to specific object views with limited variation in scale and position.
- Foundational for modern object-recognition models.

## Open questions / limitations
- No learning rule is specified; S2 prototypes are fixed once chosen.
- Static images only; motion processing is outside scope (the dorsal stream).
- The MAX operation is biologically simpler than the actual nonlinearities and gain control documented in V1-V4 since.
- Nature Neuroscience paywalled; replication relies on the public reimplementations (Serre, Wolf, Poggio 2007).

## Citations
Primary BibTeX key: `Riesenhuber1999HierarchicalMO` (in `psychophysics.bib`).

Related works:
- Hubel, Wiesel (1962) J Physiol 160:106, simple/complex cell foundation.
- Serre, Wolf, Bileschi, Riesenhuber, Poggio (2007) IEEE TPAMI 29:411, HMAX object recognition.
- Khaligh-Razavi, Kriegeskorte (2014) PLoS Comput Biol 10:e1003915, HMAX vs deep CNN on IT.
- Yamins et al. (2014) PNAS 111:8619, modern hierarchical models match IT.
- Cadieu et al. (2014) PLoS Comput Biol 10:e1003963, deep nets beat HMAX on object recognition.
