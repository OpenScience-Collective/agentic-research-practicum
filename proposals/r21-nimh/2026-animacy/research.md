# Background Research, Pointers

This R21 reuses the literature and synthesis already assembled for the analysis epic. Phase 2 will expand the corpus on animacy-specific lines via the `opencite` skill.

## Existing assets

- **Direction paper:** [`direction-papers/movie-ersp-direction.md`](../../../direction-papers/movie-ersp-direction.md). 4-perspective thesis (psychophysics, action, language, emotion); 98-paper corpus; locked thesis statement and falsification conditions.
- **Direction paper review:** [`direction-papers/movie-ersp-direction-review.md`](../../../direction-papers/movie-ersp-direction-review.md).
- **Science map:** [`research/synthesis/science-map.md`](../../../research/synthesis/science-map.md). 15 themes, cross-strand contradictions.
- **Gap analysis:** [`research/synthesis/gap-analysis.md`](../../../research/synthesis/gap-analysis.md). 8 named gaps; each cites the bounding papers; each lists a Phase 3 commitment for the direction paper.
- **Per-perspective ontologies:** [`research/synthesis/action-ontology.md`](../../../research/synthesis/action-ontology.md), [`research/synthesis/emotion-ontology.md`](../../../research/synthesis/emotion-ontology.md), [`research/synthesis/language-ontology.md`](../../../research/synthesis/language-ontology.md), [`research/synthesis/psychophysics-ontology.md`](../../../research/synthesis/psychophysics-ontology.md).
- **Dataset and stimulus references:** [`research/synthesis/dataset-hierarchy.md`](../../../research/synthesis/dataset-hierarchy.md), [`research/synthesis/scope-diagram.md`](../../../research/synthesis/scope-diagram.md).
- **Paper cards:** [`research/collection/`](../../../research/collection/), four strands (action, emotion, language, psychophysics).

## R21-specific lit expansion plan (Phase 2)

The existing corpus is centered on adult naturalistic neuroscience plus a developmental anchor (Petroni-Cohen 2018 EEG-ISC; Richardson-Saxe 2018 Pixar fMRI). The R21 needs additional weight on:

1. **Animacy perception developmental literature.** Beyond Heider-Simmel and biological motion, target Spelke / Carey core-knowledge work on agency, baby-schema and infant face processing (already partial), and any recent EEG of animacy perception across age.
2. **Mu rhythm in pediatric populations.** Existing corpus has adult mu work; need pediatric mu development citations.
3. **Naturalistic-EEG time-resolved analyses with event-locked spectral methods.** Existing corpus is mostly ISC and TRF; need shot-locked or event-locked ERSP precedents (which are sparse, hence the R21 gap statement).
4. **Open-data developmental EEG.** Citations for HBN-EEG protocol papers (Alexander 2017, Shirazi 2024 if applicable) and methods papers establishing the cohort's validity for naturalistic analysis.

Phase 2 will run `opencite` queries against Semantic Scholar and OpenAlex on each line and integrate results into `refs.bib`.

## Citations already anchoring the Aims

Drawn from the direction paper and gap analysis:

- Mu-rhythm action observation: `hari-1998-mep-action-observation`, `pineda-2005-mu-rhythm-mirror`, `oberman-2006-mu-mirror-autism`, `kilner-2007-predictive-coding-mirror`.
- Frontal alpha asymmetry: `davidson-2000-affective-style`, `coan-allen-2004-frontal-asymmetry`, `reznik-allen-2018-frontal-asymmetry` (reliability caveat).
- Developmental naturalistic EEG: `petroni-cohen-2018-isc-naturalistic-videos`.
- Developmental naturalistic fMRI: `richardson-saxe-2018-social-brain-development`, `vanderwal-2015-inscapes`.
- Animal/pet affective: `stoeckel-2014-mother-child-dog`, `glocker-2009-baby-schema`, `borgi-2014-baby-schema-children`.
- Low-level regressors: `kauttonen-2015-cinematic-fmri`, `nentwich-2023-semantic-novelty-cuts`.
- Language-network negative control: `lipkin-2022-language-atlas`.
- Animacy / silent narrative: `castelli-2000-heider-simmel`, `castelli-2000-animations-mentalising`, `naci-2014-suspenseful-movie`.
- Inter-subject correlation lineage: `hasson-2004-isc-natural-vision`, `dmochowski-2012-correlated-eeg-engagement`, `madsen-parra-2022-brain-heart-eyes-sync`.

Full paths to paper cards under [`research/collection/`](../../../research/collection/).
