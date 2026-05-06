---
slug: adelson-bergen-1985-spatiotemporal-energy
type: paper
strand: psychophysics
year: 1985
authors: [Adelson, Bergen]
venue: Journal of the Optical Society of America A
doi: 10.1364/JOSAA.2.000284
url: https://opg.optica.org/josaa/abstract.cfm?uri=josaa-2-2-284
license: publisher-paywall
modalities: [vision, motion-perception, computational-model]
tags: [spatiotemporal-energy, motion-energy, quadrature-filters, V1, MT, Reichardt-detector, opponent-motion, foundational]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
Motion in x-y-t space corresponds to oriented structure; a quadrature pair of oriented spatiotemporal linear filters, squared and summed, computes phase-invariant motion energy at one direction-speed combination, with an opponent stage giving the canonical motion detector that underlies most subsequent biological and computational motion-perception models.

## Summary
Adelson and Bergen formulate motion perception as orientation detection in three-dimensional space-time. They show that a quadrature pair of linear filters tuned to a given orientation in x-y-t, with outputs squared and summed, gives a phase-invariant readout proportional to the energy at that direction and speed. Subtracting the energies of opposite-direction filter pairs yields an opponent motion detector matching human psychophysical and primary visual cortex (V1) physiological data. They connect their formulation to Reichardt detectors and Watson-Ahumada motion sensors, and show how it explains apparent-motion limits, Type 1 versus Type 2 plaid motion, and direction-selective adaptation. The paper has anchored every subsequent motion-energy regressor in computational and imaging neuroscience.

## Relevance to the review
Indirect dependency. "The Present" is animated and motion-rich at the level of camera moves and character action; any low-level confound in the boy versus puppy condition contrast must include motion energy. Phase 5 may include a motion-energy regressor computed via this formulation (Gabor wavelet quadrature pairs at multiple orientations, scales, and temporal frequencies, integrated over each shot's first 500 ms) to partial out V1/MT-driven event-related spectral perturbation (ERSP) before testing for social-content effects. The model is the implicit substrate of every "motion regressor" we may write.

## Notable details
- Quadrature pair gives phase invariance: output is independent of carrier phase within the receptive field.
- Opponent stage subtracts opposite-direction energies; this matches MT direction-selective opponent suppression.
- Multiple speed-tuned channels needed to span the speed range; this is the motion-energy filter bank.
- Equivalent in the limit to Reichardt elementary motion detectors and to Watson-Ahumada motion sensors.
- Foundational reference cited by every subsequent motion-energy paper, including Nishimoto et al. (2011) and Bartels et al. (2008) entries in this strand.

## Open questions / limitations
- Linear front-end; does not include divisive normalization (covered later by Carandini-Heeger).
- Static contrast and luminance gain are not modeled; energy is in mean-luminance-removed contrast units.
- Phase invariance implies the model cannot explain second-order motion (drift-balanced stimuli) without contrast or texture preprocessing.
- Direct mapping to electroencephalography (EEG) frequency bands and time-frequency dynamics requires post-hoc assumptions not in the paper.

## Citations
Primary BibTeX key: `Adelson1985SpatiotemporalEM` (in `psychophysics.bib`).

Related works:
- Watson, Ahumada (1985) JOSA A 2:322 — companion motion-sensor model.
- van Santen, Sperling (1985) JOSA A 2:300 — elaborated Reichardt model.
- Heeger (1987) JOSA A 4:1455 — biologically plausible motion-energy implementation.
- Simoncelli, Heeger (1998) Vis Res 38:743 — MT model built on motion energy.
- Nishimoto et al. (2011) Curr Biol 21:1641 — motion-energy regressor decodes BOLD movies.
