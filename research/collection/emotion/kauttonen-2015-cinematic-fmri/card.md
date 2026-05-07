---
slug: kauttonen-2015-cinematic-fmri
type: paper
strand: emotion
year: 2015
authors: [Kauttonen, Hlushchuk, Tikka]
venue: NeuroImage
doi: 10.1016/j.neuroimage.2015.01.063
url: https://doi.org/10.1016/j.neuroimage.2015.01.063
license: publisher-copyright (Elsevier)
modalities: [fMRI, naturalistic, film, computer-vision]
tags: [cinematic-features, ISC, naturalistic-fMRI, regression, low-level, high-level, engagement, adult-only]
relevance: medium
imported_from: null
added: 2026-05-06

pdf_status: not-redistributable
pdf_path: null
md_path: source.md
md_quality: abstract-only
---

## TL;DR

Linking computational descriptors of cinematic content (low-level audiovisual features and higher-level shot, character, scene-change features) to inter-subject correlated brain activity reveals which film features drive shared neural responses across viewers and provides a methodological template for content-aware fMRI of film.

## Summary

Kauttonen, Hlushchuk, and Tikka extracted multi-level cinematic features from a feature-length film (luminance, motion, audio energy at the low level; shot-cut frequency, character presence, scene transitions at the higher level) and regressed them against time-resolved fMRI brain activity from viewers. Different feature classes mapped onto different cortical networks: low-level audiovisual features dominated early sensory cortex, while higher-level narrative descriptors mapped to dorsal attention and default-mode regions. Inter-subject correlation (ISC) magnitudes also varied across feature classes. The paper offers a workflow for linking annotated cinematic events to brain activity.

## Relevance to the review

Provides a methodological template directly applicable to The Present analysis: shot-level descriptors (boy presence, puppy presence, shot-cut frequency, log luminance ratio) are exactly the kind of features Kauttonen regresses against fMRI. The HBN ERSP design uses log luminance ratio as a covariate of no interest by analogy. Marked `relevance: medium` because the modality (fMRI) and stimulus (different film) are not directly equivalent.

Developmental-justification rule: adult sample. The feature-to-brain mapping methodology is age-agnostic in principle and has been adapted for child fMRI data in subsequent work. Mark `relevance: medium` and note developmental gap.

## Notable details

- Adult viewers, single feature-length film.
- Multi-level feature annotation: physical (audiovisual energy), structural (shot, scene), and narrative (character).
- Feature regression against time-resolved fMRI ISC.
- Distinct cortical networks for different feature classes.
- Methodological focus on linking computational annotations to neural responses.

## Open questions / limitations

- Adult-only.
- Single film, single sample.
- fMRI temporal resolution (~2 s TR) limits temporal precision.
- Higher-level features are coarse (presence/absence rather than continuous intensity).

## Citations

Primary BibTeX key: `KauttonenOptimizingMF`

Related works:
- Hasson 2004 / 2008: original ISC and "neurocinematics" work.
- Schmalzle 2020 J Media Psychol: theoretical synthesis of audience captivation.
- Petroni, Cohen et al. 2018 eNeuro: EEG-ISC age effects on naturalistic videos.
- Nummenmaa 2012 PNAS: emotion-driven brain synchrony during film viewing.
- Lahnakoski 2012 Front Hum Neurosci: superior temporal sulcus during social perception.
