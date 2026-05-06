---
slug: carandini-heeger-2011-normalization
type: paper
strand: psychophysics
year: 2011
authors: [Carandini, Heeger]
venue: Nature Reviews Neuroscience
doi: 10.1038/nrn3136
url: https://www.nature.com/articles/nrn3136
license: publisher-paywall
modalities: [theory-review, vision, multisensory]
tags: [divisive-normalization, gain-control, V1, MT, attention-modulation, cross-orientation-suppression, contrast-normalization, canonical-computation]
relevance: medium
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
Divisive normalization, where each neuron's drive is divided by a pool of related neurons' activity, is proposed as a canonical neural computation that explains contrast saturation, attentional gain, surround suppression, and many other phenomena across cortex.

## Summary
The review consolidates evidence that the divisive-normalization equation, with a half-saturation constant and a summed-pool denominator, recurs across primary visual cortex, extrastriate motion area MT/V5, the retina, the olfactory bulb, parietal cortex, and multisensory integration. The authors argue that normalization explains contrast saturation, cross-orientation suppression, surround suppression, and the multiplicative gain effects of attention with a single equation form, and that it is conserved from invertebrates to primates. The piece is influential in framing why low-level luminance and contrast processing should be expected to interact (rather than add linearly) with higher-level top-down signals.

## Relevance to the review
Important context for interpreting log luminance ratio (LLR) effects on early shot-onset event-related spectral perturbation (ERSP). Because cortical visual responses are normalized rather than linear in input contrast, the LLR regressor for "The Present" should be expected to act as a multiplicative modulator (not an additive offset) on responses driven by the boy versus puppy condition contrast. This is the principled justification for treating LLR as a continuous regressor of no interest in the group-level general linear model, rather than as a categorical confound. Not a direct dependency for any pipeline step, but the most cited canonical reference for the underlying nonlinearity.

## Notable details
- Articulates normalization as `R = D^n / (sigma^n + sum_j D_j^n)`, with `n` near 2 in primary visual cortex.
- Connects attentional gain to normalization: attention can be modeled as up-weighting the drive of attended units in the same pool.
- Reports normalization in retina, olfactory bulb, parietal cortex, and multisensory integration, not just visual cortex.
- Erratum in Nat Rev Neurosci 14(2):152, Feb 2013.
- Paywalled at Nature Reviews; PMC archive marked not Open Access; abstract reproduced in `source.md`.

## Open questions / limitations
- The review predates large-scale naturalistic-stimulus studies and does not directly address how normalization expresses itself in time-resolved electroencephalography (EEG) responses to dynamic input.
- Time-frequency dynamics (the regime where ERSP lives) are largely absent from the cited evidence, which is dominated by single-unit firing rates.
- Cross-temporal normalization across shot cuts (the LLR-relevant case for "The Present") is not explicitly discussed.

## Citations
Primary BibTeX key: `Carandini2011NormalizationAA` (in `psychophysics.bib`).

Related works:
- Heeger (1992) Vis Neurosci 9:181 — original normalization model in V1.
- Reynolds, Heeger (2009) Neuron 61:168 — normalization model of attention.
- Albrecht, Hamilton (1982) J Neurophysiol 48:217 — contrast saturation in V1.
- Geisler, Albrecht (1992) Vis Neurosci 8:413 — cross-orientation suppression.
- Olsen, Bhandawat, Wilson (2010) Neuron 66:287 — divisive normalization in olfactory bulb.
