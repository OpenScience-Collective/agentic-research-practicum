# Emotion Ontology

A hierarchical view of the emotion strand corpus for the Healthy Brain Network (HBN) ThePresent boy-shot vs puppy-shot literature review. Each leaf links to its paper-card with a one-line role statement. The corpus contains 25 entries. The HBN cohort is children and adolescents (ages 5-21), so a `developmental-status` cross-cutting tag is provided for every entry; pet and infant baby-schema work that anchors the puppy-shot interpretation is also flagged with `puppy-relevant`.

Refactoring note: the original brief specified seven categories. This ontology merges social cognition / theory of mind (brief Cat 2) with empathy and mentalising in narrative consumption (brief Cat 7) into a single "Social-affective brain" branch (Category B), since the corpus shows that both rely on the same default-mode network and theory-of-mind machinery (Mar 2011, Zaki and Ochsner 2012). The remaining brief categories survive as natural joints. Adult-versus-child status, modality, and access cut across the tree and are surfaced as cross-cutting tags rather than embedded in the hierarchy.

## Top-level categories

### Category A: Affective dynamics in cinematic stimuli

- Sub-category A.1: Discrete-emotion neural patterns during film
  - [saarimaki-2016-discrete-emotions](../collection/emotion/saarimaki-2016-discrete-emotions/card.md): multi-voxel pattern analysis (MVPA) decodes six basic emotions during emotional movie viewing and imagery, anchoring the cinematic-emotion-induction literature.
  - [kragel-2019-emonet-visual](../collection/emotion/kragel-2019-emonet-visual/card.md): EmoNet deep-learning model shows that emotion schemas are encoded in early visual cortex, motivating an early-latency content-driven prediction for the 0-500 ms window.
- Sub-category A.2: Emotion taxonomies from naturalistic video
  - [cowen-keltner-2017-27-emotions](../collection/emotion/cowen-keltner-2017-27-emotions/card.md): self-report taxonomy of 27 distinguishable emotion categories from short video clips, supplying a high-dimensional vocabulary for any post-hoc per-shot affect annotation.

### Category B: Social-affective brain (theory of mind, empathy, narrative comprehension)

- Sub-category B.1: Theory-of-mind localisers and developmental anchor
  - [saxe-kanwisher-2003-tpj-tom](../collection/emotion/saxe-kanwisher-2003-tpj-tom/card.md): right temporo-parietal junction (TPJ) selectively engaged by mental-state reasoning, the canonical adult theory-of-mind (ToM) localiser.
  - [richardson-saxe-2018-social-brain-development](../collection/emotion/richardson-saxe-2018-social-brain-development/card.md): Pixar short-film fMRI in 122 children aged 3-12 showing ToM and pain networks present from age 3 and refining with age, the load-bearing developmental anchor for naturalistic social-cognitive engagement.
- Sub-category B.2: Narrative comprehension and the default-mode network
  - [mar-2011-narrative-social-cognition](../collection/emotion/mar-2011-narrative-social-cognition/card.md): synthesises overlap between narrative comprehension and ToM networks, framing story watching as a social-cognitive activity.
  - [tamir-2015-fiction-default-network](../collection/emotion/tamir-2015-fiction-default-network/card.md): fiction reading preferentially engages the default-mode network (DMN) and lifetime fiction exposure predicts engagement, supplying an individual-differences moderator.
- Sub-category B.3: Empathy systems
  - [singer-2004-empathy-pain](../collection/emotion/singer-2004-empathy-pain/card.md): observing a partner in pain engages affective (anterior insula, anterior cingulate cortex) but not sensory pain regions, foundational evidence for shared affective representation.
  - [zaki-ochsner-2012-empathy-neural](../collection/emotion/zaki-ochsner-2012-empathy-neural/card.md): tripartite empathy model (experience sharing, mental-state attribution, regulation), bridging sub-categories B.1 and B.3.

### Category C: Affective brain regions and distributed signatures

- Sub-category C.1: Amygdala
  - [ledoux-2010-amygdala-many-roads](../collection/emotion/ledoux-2010-amygdala-many-roads/card.md): Pessoa and Adolphs many-roads update of the LeDoux low-road, arguing for cortically integrated amygdala evaluation rather than a privileged subcortical shortcut.
  - [sergerie-2008-amygdala-meta-analysis](../collection/emotion/sergerie-2008-amygdala-meta-analysis/card.md): meta-analysis of 385 studies confirms bivalent amygdala response with strongest engagement for face stimuli.
- Sub-category C.2: Medial prefrontal cortex and emotion regulation
  - [etkin-2011-acc-mpfc-emotion](../collection/emotion/etkin-2011-acc-mpfc-emotion/card.md): proposes a dorsal anterior cingulate cortex (dACC) versus ventromedial prefrontal cortex (vmPFC) dissociation for appraisal of negative affect versus regulation and positive affect.
- Sub-category C.3: Distributed-network and multivariate-signature accounts
  - [lindquist-2012-emotion-meta-analysis](../collection/emotion/lindquist-2012-emotion-meta-analysis/card.md): meta-analysis arguing for distributed networks rather than one-to-one localisation, the canonical regional-vocabulary reference for Category C.
  - [wager-2013-neurologic-pain-signature](../collection/emotion/wager-2013-neurologic-pain-signature/card.md): neurologic pain signature (NPS), the methodological exemplar for distributed multivariate signatures of affect.

### Category D: Inter-subject correlation (ISC) and audience engagement

- Sub-category D.1: Emotion-driven neural synchrony
  - [nummenmaa-2012-emotion-synchrony](../collection/emotion/nummenmaa-2012-emotion-synchrony/card.md): emotion intensity modulates inter-subject correlation in midline cortex during film viewing, the foundational fMRI ISC-by-emotion result.
- Sub-category D.2: ISC in development and EEG
  - [petroni-cohen-2018-isc-naturalistic-videos](../collection/emotion/petroni-cohen-2018-isc-naturalistic-videos/card.md): EEG ISC during naturalistic videos varies with viewer age and sex across 6-44, the developmental anchor for EEG ISC in the HBN age range.
- Sub-category D.3: Cinematic-feature regression and theoretical synthesis
  - [kauttonen-2015-cinematic-fmri](../collection/emotion/kauttonen-2015-cinematic-fmri/card.md): regresses multi-level cinematic features against fMRI ISC, supplying a methodological template for shot-level feature annotation.
  - [schmalzle-2020-coupled-brains](../collection/emotion/schmalzle-2020-coupled-brains/card.md): media-psychology synthesis of ISC as an audience-captivation metric, theoretical companion to the empirical ISC literature.

### Category E: Pet, infant, and baby-schema responses (puppy-shot anchor)

- Sub-category E.1: Baby schema and reward
  - [glocker-2009-baby-schema](../collection/emotion/glocker-2009-baby-schema/card.md): parametric baby-schema modulation of nucleus accumbens reward response in nulliparous women, foundational for cuteness-driven mesolimbic engagement.
  - [borgi-2014-baby-schema-children](../collection/emotion/borgi-2014-baby-schema-children/card.md): children aged 3-6 show parametric cuteness ratings and gaze bias for human infant, puppy, and kitten faces, the load-bearing developmental anchor for the puppy-shot interpretation.
- Sub-category E.2: Pet bonding and own-pet versus own-child contrasts
  - [stoeckel-2014-mother-child-dog](../collection/emotion/stoeckel-2014-mother-child-dog/card.md): mothers viewing own child versus own dog show partly shared affiliative network with ventral tegmental area / substantia nigra (VTA/SN) child-specific and fusiform gyrus dog-specific, the precise primary source for the boy-shot vs puppy-shot framing.

### Category F: EEG markers of affective processing

- Sub-category F.1: Frontal alpha asymmetry
  - [davidson-2000-affective-style](../collection/emotion/davidson-2000-affective-style/card.md): canonical approach-withdrawal framework, with frontal alpha asymmetry as the primary EEG index of affective style.
  - [coan-allen-2004-frontal-asymmetry](../collection/emotion/coan-allen-2004-frontal-asymmetry/card.md): trait-versus-state asymmetry capability model, supplying interpretive vocabulary for any short-window asymmetry shift.
  - [reznik-allen-2018-frontal-asymmetry](../collection/emotion/reznik-allen-2018-frontal-asymmetry/card.md): updated review documenting smaller effect sizes and substantial reliability concerns, a methodological caution.
- Sub-category F.2: Alpha-band oscillations during emotional perception
  - [schubring-schupp-2023-alpha-emotion](../collection/emotion/schubring-schupp-2023-alpha-emotion/card.md): comprehensive review of alpha desynchronisation as an arousal-modulated correlate of attentional engagement, the most directly applicable Category F entry for the 0-500 ms event-related spectral perturbation (ERSP) window.

## Cross-cutting tags

Tags that apply across categories.

### developmental-status

- `validated-in-children`: corpus entries that include child or developmental data and do not require bridging reasoning to apply to HBN ages 5-21.
  - [richardson-saxe-2018-social-brain-development](../collection/emotion/richardson-saxe-2018-social-brain-development/card.md)
  - [petroni-cohen-2018-isc-naturalistic-videos](../collection/emotion/petroni-cohen-2018-isc-naturalistic-videos/card.md)
  - [borgi-2014-baby-schema-children](../collection/emotion/borgi-2014-baby-schema-children/card.md)
- `adult-only-bridged`: adult-only studies whose card supplies an explicit bridging argument (citing developmental work, citing maturation timelines, or pointing at an in-corpus developmental anchor) for transfer to HBN ages 5-21.
  - [saarimaki-2016-discrete-emotions](../collection/emotion/saarimaki-2016-discrete-emotions/card.md)
  - [nummenmaa-2012-emotion-synchrony](../collection/emotion/nummenmaa-2012-emotion-synchrony/card.md)
  - [kragel-2019-emonet-visual](../collection/emotion/kragel-2019-emonet-visual/card.md)
  - [cowen-keltner-2017-27-emotions](../collection/emotion/cowen-keltner-2017-27-emotions/card.md)
  - [saxe-kanwisher-2003-tpj-tom](../collection/emotion/saxe-kanwisher-2003-tpj-tom/card.md)
  - [ledoux-2010-amygdala-many-roads](../collection/emotion/ledoux-2010-amygdala-many-roads/card.md)
  - [lindquist-2012-emotion-meta-analysis](../collection/emotion/lindquist-2012-emotion-meta-analysis/card.md)
  - [sergerie-2008-amygdala-meta-analysis](../collection/emotion/sergerie-2008-amygdala-meta-analysis/card.md)
  - [etkin-2011-acc-mpfc-emotion](../collection/emotion/etkin-2011-acc-mpfc-emotion/card.md)
  - [wager-2013-neurologic-pain-signature](../collection/emotion/wager-2013-neurologic-pain-signature/card.md)
  - [schmalzle-2020-coupled-brains](../collection/emotion/schmalzle-2020-coupled-brains/card.md)
  - [kauttonen-2015-cinematic-fmri](../collection/emotion/kauttonen-2015-cinematic-fmri/card.md)
  - [stoeckel-2014-mother-child-dog](../collection/emotion/stoeckel-2014-mother-child-dog/card.md)
  - [glocker-2009-baby-schema](../collection/emotion/glocker-2009-baby-schema/card.md)
  - [davidson-2000-affective-style](../collection/emotion/davidson-2000-affective-style/card.md)
  - [coan-allen-2004-frontal-asymmetry](../collection/emotion/coan-allen-2004-frontal-asymmetry/card.md)
  - [reznik-allen-2018-frontal-asymmetry](../collection/emotion/reznik-allen-2018-frontal-asymmetry/card.md)
  - [schubring-schupp-2023-alpha-emotion](../collection/emotion/schubring-schupp-2023-alpha-emotion/card.md)
  - [mar-2011-narrative-social-cognition](../collection/emotion/mar-2011-narrative-social-cognition/card.md)
  - [tamir-2015-fiction-default-network](../collection/emotion/tamir-2015-fiction-default-network/card.md)
  - [singer-2004-empathy-pain](../collection/emotion/singer-2004-empathy-pain/card.md)
  - [zaki-ochsner-2012-empathy-neural](../collection/emotion/zaki-ochsner-2012-empathy-neural/card.md)
- `adult-only-unbridged`: adult-only entries whose cards offer no explicit developmental bridging reasoning. The corpus contains none; every adult-only card in this strand carries a bridging clause (in-corpus anchor, cited developmental work, or a documented maturation gap).
  - (none)

### puppy-relevant

Cards that bear directly on the boy-shot vs puppy-shot Category 5 contrast through pet, infant, or baby-schema content.

- [stoeckel-2014-mother-child-dog](../collection/emotion/stoeckel-2014-mother-child-dog/card.md)
- [borgi-2014-baby-schema-children](../collection/emotion/borgi-2014-baby-schema-children/card.md)
- [glocker-2009-baby-schema](../collection/emotion/glocker-2009-baby-schema/card.md)

### Access (open vs paywalled)

- `open-access` (CC-BY family licensing in the card metadata):
  - [richardson-saxe-2018-social-brain-development](../collection/emotion/richardson-saxe-2018-social-brain-development/card.md)
  - [kragel-2019-emonet-visual](../collection/emotion/kragel-2019-emonet-visual/card.md)
  - [petroni-cohen-2018-isc-naturalistic-videos](../collection/emotion/petroni-cohen-2018-isc-naturalistic-videos/card.md)
  - [stoeckel-2014-mother-child-dog](../collection/emotion/stoeckel-2014-mother-child-dog/card.md)
  - [borgi-2014-baby-schema-children](../collection/emotion/borgi-2014-baby-schema-children/card.md)
- `paywalled` (publisher-copyright in the card metadata):
  - [saarimaki-2016-discrete-emotions](../collection/emotion/saarimaki-2016-discrete-emotions/card.md)
  - [nummenmaa-2012-emotion-synchrony](../collection/emotion/nummenmaa-2012-emotion-synchrony/card.md)
  - [cowen-keltner-2017-27-emotions](../collection/emotion/cowen-keltner-2017-27-emotions/card.md)
  - [saxe-kanwisher-2003-tpj-tom](../collection/emotion/saxe-kanwisher-2003-tpj-tom/card.md)
  - [ledoux-2010-amygdala-many-roads](../collection/emotion/ledoux-2010-amygdala-many-roads/card.md)
  - [lindquist-2012-emotion-meta-analysis](../collection/emotion/lindquist-2012-emotion-meta-analysis/card.md)
  - [sergerie-2008-amygdala-meta-analysis](../collection/emotion/sergerie-2008-amygdala-meta-analysis/card.md)
  - [etkin-2011-acc-mpfc-emotion](../collection/emotion/etkin-2011-acc-mpfc-emotion/card.md)
  - [wager-2013-neurologic-pain-signature](../collection/emotion/wager-2013-neurologic-pain-signature/card.md)
  - [schmalzle-2020-coupled-brains](../collection/emotion/schmalzle-2020-coupled-brains/card.md)
  - [kauttonen-2015-cinematic-fmri](../collection/emotion/kauttonen-2015-cinematic-fmri/card.md)
  - [glocker-2009-baby-schema](../collection/emotion/glocker-2009-baby-schema/card.md)
  - [davidson-2000-affective-style](../collection/emotion/davidson-2000-affective-style/card.md)
  - [coan-allen-2004-frontal-asymmetry](../collection/emotion/coan-allen-2004-frontal-asymmetry/card.md)
  - [reznik-allen-2018-frontal-asymmetry](../collection/emotion/reznik-allen-2018-frontal-asymmetry/card.md)
  - [schubring-schupp-2023-alpha-emotion](../collection/emotion/schubring-schupp-2023-alpha-emotion/card.md)
  - [mar-2011-narrative-social-cognition](../collection/emotion/mar-2011-narrative-social-cognition/card.md)
  - [tamir-2015-fiction-default-network](../collection/emotion/tamir-2015-fiction-default-network/card.md)
  - [singer-2004-empathy-pain](../collection/emotion/singer-2004-empathy-pain/card.md)
  - [zaki-ochsner-2012-empathy-neural](../collection/emotion/zaki-ochsner-2012-empathy-neural/card.md)

### Modality

- `modality: fMRI` (primary or co-primary modality):
  - [saarimaki-2016-discrete-emotions](../collection/emotion/saarimaki-2016-discrete-emotions/card.md)
  - [nummenmaa-2012-emotion-synchrony](../collection/emotion/nummenmaa-2012-emotion-synchrony/card.md)
  - [kragel-2019-emonet-visual](../collection/emotion/kragel-2019-emonet-visual/card.md)
  - [saxe-kanwisher-2003-tpj-tom](../collection/emotion/saxe-kanwisher-2003-tpj-tom/card.md)
  - [richardson-saxe-2018-social-brain-development](../collection/emotion/richardson-saxe-2018-social-brain-development/card.md)
  - [ledoux-2010-amygdala-many-roads](../collection/emotion/ledoux-2010-amygdala-many-roads/card.md)
  - [lindquist-2012-emotion-meta-analysis](../collection/emotion/lindquist-2012-emotion-meta-analysis/card.md)
  - [sergerie-2008-amygdala-meta-analysis](../collection/emotion/sergerie-2008-amygdala-meta-analysis/card.md)
  - [etkin-2011-acc-mpfc-emotion](../collection/emotion/etkin-2011-acc-mpfc-emotion/card.md)
  - [wager-2013-neurologic-pain-signature](../collection/emotion/wager-2013-neurologic-pain-signature/card.md)
  - [kauttonen-2015-cinematic-fmri](../collection/emotion/kauttonen-2015-cinematic-fmri/card.md)
  - [stoeckel-2014-mother-child-dog](../collection/emotion/stoeckel-2014-mother-child-dog/card.md)
  - [glocker-2009-baby-schema](../collection/emotion/glocker-2009-baby-schema/card.md)
  - [mar-2011-narrative-social-cognition](../collection/emotion/mar-2011-narrative-social-cognition/card.md)
  - [tamir-2015-fiction-default-network](../collection/emotion/tamir-2015-fiction-default-network/card.md)
  - [singer-2004-empathy-pain](../collection/emotion/singer-2004-empathy-pain/card.md)
  - [zaki-ochsner-2012-empathy-neural](../collection/emotion/zaki-ochsner-2012-empathy-neural/card.md)
- `modality: EEG`:
  - [petroni-cohen-2018-isc-naturalistic-videos](../collection/emotion/petroni-cohen-2018-isc-naturalistic-videos/card.md)
  - [davidson-2000-affective-style](../collection/emotion/davidson-2000-affective-style/card.md)
  - [coan-allen-2004-frontal-asymmetry](../collection/emotion/coan-allen-2004-frontal-asymmetry/card.md)
  - [reznik-allen-2018-frontal-asymmetry](../collection/emotion/reznik-allen-2018-frontal-asymmetry/card.md)
  - [schubring-schupp-2023-alpha-emotion](../collection/emotion/schubring-schupp-2023-alpha-emotion/card.md)
  - [schmalzle-2020-coupled-brains](../collection/emotion/schmalzle-2020-coupled-brains/card.md)
- `modality: MEG`: no entries in this corpus.
- `modality: behavioral`:
  - [cowen-keltner-2017-27-emotions](../collection/emotion/cowen-keltner-2017-27-emotions/card.md)
  - [borgi-2014-baby-schema-children](../collection/emotion/borgi-2014-baby-schema-children/card.md)
