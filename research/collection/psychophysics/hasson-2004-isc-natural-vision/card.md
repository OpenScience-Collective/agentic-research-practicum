---
slug: hasson-2004-isc-natural-vision
type: paper
strand: psychophysics
year: 2004
authors: [Hasson, Nir, Levy, Fuhrmann, Malach]
venue: Science
doi: 10.1126/science.1089506
url: https://www.science.org/doi/10.1126/science.1089506
license: publisher-paywall
modalities: [fMRI, naturalistic-movies, ISC]
tags: [inter-subject-correlation, naturalistic-stimuli, reverse-correlation, FFA, PPA, free-viewing-fMRI, voxel-synchronization, foundational]
relevance: high
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
Free-viewing of a 30-minute feature film synchronizes blood-oxygen-level-dependent (BOLD) activity across subjects voxel-by-voxel in primary sensory and broad association cortices, founding the inter-subject correlation (ISC) paradigm for naturalistic neuroimaging.

## Summary
Hasson and colleagues had five subjects watch 30 minutes of a feature film during functional magnetic resonance imaging (fMRI), then computed voxel-wise correlations between subjects. Despite the lack of any explicit task, large swathes of cortex showed strikingly reliable across-subject time courses, including primary visual and auditory cortex but also association cortices. They introduced a reverse-correlation method that uses each voxel's high-activity moments to characterize the stimulus features driving it, recovering known category specializations (fusiform face area for faces, parahippocampal place area for places) and identifying broader networks tracking emotional arousal. The work established naturalistic-stimulus paradigms as a tractable approach to mapping cortical function and seeded the inter-subject correlation literature in fMRI and downstream electroencephalography (EEG).

## Relevance to the review
Direct conceptual dependency. The boy-shot vs puppy-shot ERSP question on "The Present" is an electroencephalographic (EEG) instance of the ISC logic: stimulus-locked structure should drive shared variance across subjects, and condition-specific shared variance is the signal we want. This paper is the foundational reference for treating naturalistic-stimulus responses as locked to the input rather than to a controlled trial structure, which justifies the shot-onset epoching approach in Phase 4 and the cross-subject cluster-statistic logic in Phase 5. The face- and place-selective findings also predict that boy- and puppy-related shots will drive ventral stream responses we may pick up in occipitotemporal electroencephalography (EEG) IC clusters.

## Notable details
- 5 subjects, half-hour clip from "The Good, the Bad and the Ugly".
- ~29% of cortex shows significant across-subject synchronization at the voxel level.
- Reverse-correlation approach: take above-threshold frames in each voxel, characterize the visual content; inverts conventional GLM design.
- Distinguishes high-synchrony "extrinsic" cortex (sensory and category-selective) from low-synchrony "intrinsic" prefrontal regions.
- Predates time-resolved EEG ISC by about 8 years.

## Open questions / limitations
- BOLD temporal resolution is in seconds; naturalistic ISC at the 0-500 ms ERSP scale (this project's target) requires the EEG follow-ups (Dmochowski 2012, Madsen-Parra 2022).
- 5 subjects and a single film limit generalization; later work (e.g., Naturalistic Neuroimaging Database) addresses this.
- ISC magnitude depends on stimulus properties not characterized in detail; "The Present" is animated and short, and its ISC profile is not directly predictable from this paper.

## Citations
Primary BibTeX key: `Hasson2004IntersubjectSO` (in `psychophysics.bib`).

Related works:
- Hasson et al. (2010) Trends Cogn Sci 14:40 — review of naturalistic neuroimaging.
- Nastase, Goldstein, Hasson (2020) NeuroImage 222:117254 — ISC methodology in 2020.
- Dmochowski et al. (2012) Front Hum Neurosci 6:112 — EEG ISC analogue.
- Lerner, Honey, Silbert, Hasson (2011) J Neurosci 31:2906 — temporal receptive windows.
- Aly et al. (2018) Cereb Cortex 28:4441 — ISC and event boundaries.
