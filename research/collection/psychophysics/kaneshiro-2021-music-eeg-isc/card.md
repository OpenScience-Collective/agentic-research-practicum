---
slug: kaneshiro-2021-music-eeg-isc
type: paper
strand: psychophysics
year: 2021
authors: [Kaneshiro, Nguyen, Norcia, Dmochowski, Berger]
venue: bioRxiv (preprint)
doi: 10.1101/2021.04.14.439913
url: https://www.biorxiv.org/content/10.1101/2021.04.14.439913v3
license: preprint-cc-biorxiv
modalities: [EEG, naturalistic-music, ISC, time-resolved]
tags: [intersubject-correlation, music-engagement, tension-buildup, cello-concerto, correlated-component-analysis, envelope-control, time-varying-ISC]
relevance: medium
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR
Time-resolved electroencephalography (EEG) inter-subject correlation during a single cello-concerto excerpt peaks during tension-build periods rather than at climactic highpoints, and persists in attenuated form when only the amplitude envelope is preserved, dissociating structural from low-level acoustic drivers of inter-subject correlation (ISC).

## Summary
Kaneshiro and colleagues recorded 60-channel EEG from 23 adult musicians listening to a cello-concerto movement plus an envelope-matched control that preserves the loudness profile but removes spectral and harmonic structure. Using time-resolved correlated-component analysis (Dmochowski 2012), they computed ISC time courses and found that ISC peaks during tension-build periods leading up to climactic highpoints but not at the highpoints themselves. The envelope-only control also drove significant ISC at reduced magnitude, indicating that part of the music ISC effect is driven by low-level amplitude dynamics and part by higher-level musical structure. The work is the first time-resolved music ISC report and a useful comparator for visual and audiovisual ISC studies.

## Relevance to the review
Cross-modality reference. "The Present" Phase 5 is fundamentally about time-resolved condition contrasts in stimulus-locked EEG; Kaneshiro et al. demonstrate that time-resolved ISC has the dynamic range to distinguish stimulus phases (tension build versus climax) within a single naturalistic excerpt. This validates the broader strategy of computing per-event reliability rather than collapsing across the full clip. The envelope-control comparison is also a useful template for our LLR (log luminance ratio) regressor: an envelope-only control isolates the low-level component of ISC the same way LLR isolates the luminance-onset component of shot-locked ERSP.

## Notable details
- 23 adult musicians; 60-channel EEG.
- Cello concerto and envelope-matched control.
- Time-resolved ISC via Dmochowski 2012 correlated-component analysis.
- Tension-build segments drive ISC; climactic highpoints do not.
- Envelope-only control elicits reduced but significant ISC.
- bioRxiv preprint (CC BY-NC-ND default); not committed as `source.pdf` due to redistribution restriction.

## Open questions / limitations
- Single musical work; generalization to other genres or to film is untested.
- Adult musicians; trained listeners may show stronger ISC than the developmental HBN cohort.
- Auditory only; visual ISC dynamics during shot transitions may differ in latency and magnitude.
- Preprint, not peer reviewed at the version archived; published version may differ.

## Citations
Primary BibTeX key: `Kaneshiro2021InterSubjectEC` (in `psychophysics.bib`).

Related works:
- Dmochowski et al. (2012) Front Hum Neurosci 6:112 — correlated-component analysis used here.
- Madsen et al. (2019) Sci Rep 9:3576 — peripheral and EEG sync to music.
- Cheung et al. (2019) Curr Biol 29:4084 — predictive uncertainty and music engagement.
- Kaneshiro, Nguyen, Norcia, Dmochowski, Berger (2020) Sci Rep 10:14959 — auditory ISC across listeners and excerpts.
- Sankaran et al. (2020) Front Neurosci 14:557 — EEG envelope tracking in music.
