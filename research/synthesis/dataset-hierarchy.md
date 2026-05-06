# Dataset Hierarchy

Naturalistic-paradigm dataset inventory referenced across the four-strand corpus. Datasets and stimulus sets are grouped by primary modality (electroencephalography (EEG), magnetoencephalography (MEG), functional magnetic resonance imaging (fMRI), intracranial EEG, multimodal). Sample size, age range, and stimulus character are noted where the establishing card states them. Each dataset is followed by the corpus cards that use or reference it.

This is a coverage inventory, not a ranking. The Healthy Brain Network EEG (HBN-EEG) Release 3 dataset that hosts the planned ThePresent boy-shot vs puppy-shot ERSP analysis sits at the head of the EEG section.

Abbreviations: event-related spectral perturbation (ERSP), inter-subject correlation (ISC), default-mode network (DMN), theory of mind (ToM), Healthy Brain Network (HBN), Brain Imaging Data Structure (BIDS).

## EEG datasets and stimuli

### HBN-EEG R3 (ds005507, ThePresent and other tasks)

- ~3.5-min Pixar animated short ThePresent in passive viewing, plus other paradigms.
- 184 subjects in the local 100 Hz Biosemi Data Format (BDF) working set; full release 183 subjects at 500 Hz on S3 (per `project_brief.md`); ages roughly 5-21.
- 128-channel HydroCel Geodesic Sensor Net.
- Project's primary dataset; not used as the data source in any corpus card directly.
- The closest paradigmatic match within the corpus is the developmental EEG-ISC sample of [petroni-cohen-2018-isc-naturalistic-videos](../collection/emotion/petroni-cohen-2018-isc-naturalistic-videos/card.md), which spans ages 6-44 across naturalistic videos with a similar protocol but a different montage (64-channel) and sampling rate.

### Petroni and Cohen developmental EEG-ISC (custom)

- Six naturalistic videos including animated and live-action shorts, durations 1-5 minutes.
- N = 114 healthy participants ages 6-44, cross-sectional.
- 64-channel EEG, 500 Hz.
- Used by [petroni-cohen-2018-isc-naturalistic-videos](../collection/emotion/petroni-cohen-2018-isc-naturalistic-videos/card.md). Reference dataset for child-cohort naturalistic EEG-ISC.

### Dmochowski / Parra naturalistic EEG (custom, multiple)

- Repeated movie viewing (short film clips, "The Walking Dead" pilot, Super Bowl ads, biographical narratives).
- N ranges 16 to 72; adult samples.
- 64-channel scalp EEG.
- Used by [dmochowski-2012-correlated-eeg-engagement](../collection/psychophysics/dmochowski-2012-correlated-eeg-engagement/card.md), [dmochowski-2014-audience-preferences-isc](../collection/psychophysics/dmochowski-2014-audience-preferences-isc/card.md), [ki-kelly-parra-2016-attention-eeg-narrative](../collection/psychophysics/ki-kelly-parra-2016-attention-eeg-narrative/card.md), [cohen-parra-2016-memorable-narratives](../collection/psychophysics/cohen-parra-2016-memorable-narratives/card.md), [madsen-parra-2022-brain-heart-eyes-sync](../collection/psychophysics/madsen-parra-2022-brain-heart-eyes-sync/card.md). Foundational lineage for EEG correlated component analysis.

### Kaneshiro music EEG (custom)

- Single cello-concerto excerpt plus envelope-matched control.
- N = 23 adult musicians.
- 60-channel EEG.
- Used by [kaneshiro-2021-music-eeg-isc](../collection/psychophysics/kaneshiro-2021-music-eeg-isc/card.md). The envelope-control logic informs the LLR-as-covariate strategy planned for ThePresent.

### Lalor and Foxe natural-speech EEG (custom)

- Continuous natural speech and audiovisual narrative, system-identification paradigm.
- Adult listeners.
- Used by [lalor-foxe-2010-natural-speech-trf](../collection/psychophysics/lalor-foxe-2010-natural-speech-trf/card.md). Provides the temporal response function (TRF) toolkit example dataset that downstream work (mTRF toolbox, [crosse-2016-mtrf-toolbox](../collection/psychophysics/crosse-2016-mtrf-toolbox/card.md)) generalizes.

### Free-viewing eye-EEG datasets (Dimigen, Plöchl)

- Natural reading and natural scene viewing with simultaneous eye tracking.
- Adult participants; N varies by study.
- Used by [dimigen-2011-frp-natural-reading](../collection/psychophysics/dimigen-2011-frp-natural-reading/card.md), [ploechl-2012-eye-eeg-artifact-correction](../collection/psychophysics/ploechl-2012-eye-eeg-artifact-correction/card.md), [dimigen-ehinger-2021-deconvolution-eye-eeg](../collection/psychophysics/dimigen-ehinger-2021-deconvolution-eye-eeg/card.md). HBN-EEG R3 lacks an eye tracker, so these datasets are methodological precedents only.

### IAPS-style EEG affective-picture studies

- International Affective Picture System and similar emotion-evoking still images.
- Adult samples across many studies.
- Used by [schubring-schupp-2023-alpha-emotion](../collection/emotion/schubring-schupp-2023-alpha-emotion/card.md). The closest EEG analogue to ThePresent's 0-500 ms window for affective stimuli, although the stimulus is static.

### Frontal-asymmetry EEG corpus

- Diverse adult and child samples viewing emotional pictures or films, plus resting EEG.
- Used by [davidson-2000-affective-style](../collection/emotion/davidson-2000-affective-style/card.md), [coan-allen-2004-frontal-asymmetry](../collection/emotion/coan-allen-2004-frontal-asymmetry/card.md), [reznik-allen-2018-frontal-asymmetry](../collection/emotion/reznik-allen-2018-frontal-asymmetry/card.md). Consolidated as a literature, not a single dataset.

### Mu-rhythm EEG action-observation studies

- Hand-action videos and naturalistic hand-action observation paradigms.
- Adult samples (Pineda, Oberman); N small (Hari = 8 in MEG variant).
- Used by [pineda-2005-mu-rhythm-mirror](../collection/action/pineda-2005-mu-rhythm-mirror/card.md), [oberman-2006-mu-mirror-autism](../collection/action/oberman-2006-mu-mirror-autism/card.md). MEG analogue listed under MEG section below.

### N400 ERP corpus

- Single-word reading and sentence-context paradigms; adult samples.
- Used by [kutas-2011-n400-review](../collection/language/kutas-2011-n400-review/card.md), [delong-2005-n400-prediction](../collection/language/delong-2005-n400-prediction/card.md). Outside ThePresent's silent-stimulus scope but indexed for boundary discussion.

## MEG datasets

### Hari and Salenius rolandic-rebound MEG

- Hand-action observation and execution, median-nerve stimulation.
- N = 8 adults.
- 122-channel Neuromag.
- Used by [hari-1998-mep-action-observation](../collection/action/hari-1998-mep-action-observation/card.md). Foundational electrophysiological evidence for human action-observation networks; non-naturalistic stimulus.

### Lankinen MEG movie viewing (Crash excerpt)

- 7-minute audiovisual and silent-visual excerpts of "Crash".
- N = 8 adults.
- Source-space MEG.
- Used by [lankinen-2014-meg-movie-consistency](../collection/language/lankinen-2014-meg-movie-consistency/card.md). One of the closest electrophysiological analogues to the ThePresent paradigm; explicit silent-visual condition.

### Heilbron and Brennan naturalistic-listening MEG and intracranial EEG

- Spoken and read narratives with language-model surprisal regressors.
- Adult samples.
- Used by [heilbron-2022-hierarchy-predictions](../collection/language/heilbron-2022-hierarchy-predictions/card.md), [brennan-2017-phrase-structure-meg](../collection/language/brennan-2017-phrase-structure-meg/card.md). Boundary cases that establish what cannot transfer to silent animation.

## fMRI datasets

### Sherlock fMRI (BBC Sherlock pilot)

- 50-minute clip of BBC Sherlock pilot, audiovisual.
- N = 17 adults (Chen) and similar for related studies.
- Open dataset on OpenNeuro / Princeton.
- Used by [chen-2017-shared-memories](../collection/action/chen-2017-shared-memories/card.md), [chen-2017-shared-memories](../collection/language/chen-2017-shared-memories/card.md), [baldassano-2017-event-boundaries](../collection/action/baldassano-2017-event-boundaries/card.md). The most cited naturalistic-fMRI dataset across the corpus; stimulus is live-action and language-rich, so transfer to silent animation is partial.

### Studyforrest 7T fMRI

- 2-hour audio-described version of Forrest Gump (and audiovisual extensions in subsequent releases).
- N = 20 adults; German-speaking sample.
- Public, BIDS-compatible, audio annotations included.
- Used by [hanke-2014-studyforrest-7t](../collection/language/hanke-2014-studyforrest-7t/card.md), [benyakov-2018-hippocampal-film-editor](../collection/language/benyakov-2018-hippocampal-film-editor/card.md). Foundational reference for releasing naturalistic-stimulation neuroimaging data with rich annotations.

### Inscapes fMRI

- 7-minute silent abstract animation, purpose-built rest substitute.
- Adult and pediatric extensions; widely used in HBN.
- Used by [vanderwal-2015-inscapes](../collection/language/vanderwal-2015-inscapes/card.md). The closest paradigmatic precedent for ThePresent at the methodological (silent + animation) level; fMRI rather than EEG.

### Partly Cloudy Pixar fMRI (Richardson and Saxe)

- 5.5-minute Pixar short Partly Cloudy.
- N = 155 (122 children ages 3-12, 33 adults).
- Used by [richardson-saxe-2018-social-brain-development](../collection/emotion/richardson-saxe-2018-social-brain-development/card.md). Genre-equivalent to ThePresent and the strongest direct methodological precedent in the corpus for using a Pixar short with a child cohort.

### Hasson natural-vision fMRI (The Good, the Bad and the Ugly)

- 30-minute clip of "The Good, the Bad and the Ugly" feature film.
- N = 5 adults.
- Used by [hasson-2004-isc-natural-vision](../collection/psychophysics/hasson-2004-isc-natural-vision/card.md), [hasson-2004-intersubject-synchronization](../collection/language/hasson-2004-intersubject-synchronization/card.md). Foundational for ISC.

### Hasson Sherlock-style ISC and reliability work

- Movie-watching fMRI from multiple subsequent studies.
- Used by [hasson-2010-natural-stimulation](../collection/action/hasson-2010-natural-stimulation/card.md) (review-level synthesis of multiple ISC datasets).

### Naci Hitchcock 8-min excerpt fMRI

- 8-minute excerpt of "Bang! You're Dead" (Hitchcock).
- Adult healthy samples plus single patient with disorder of consciousness.
- Used by [naci-2014-suspenseful-movie](../collection/language/naci-2014-suspenseful-movie/card.md). Largely visually driven despite being audiovisual.

### Hasson narrative-listening fMRI (Pieman, Wonderful Story, etc.)

- Spoken narratives in fMRI.
- Adult samples; used in scrambling and TRW work.
- Used by [lerner-2011-temporal-receptive-windows](../collection/action/lerner-2011-temporal-receptive-windows/card.md), [lerner-2011-temporal-receptive-windows](../collection/language/lerner-2011-temporal-receptive-windows/card.md), [yeshurun-2017-same-story-different](../collection/language/yeshurun-2017-same-story-different/card.md), [simony-2016-dmn-narrative-fc](../collection/language/simony-2016-dmn-narrative-fc/card.md).

### Castelli Heider-Simmel silent-animation fMRI

- Silent geometric-shape animations (random, goal-directed, mentalising).
- N = 6 adults (original); N = 10 adults plus 10 patients for autism extension.
- Used by [castelli-2000-animations-mentalising](../collection/language/castelli-2000-animations-mentalising/card.md), [castelli-2000-heider-simmel](../collection/action/castelli-2000-heider-simmel/card.md), [castelli-2002-autism-animations](../collection/language/castelli-2002-autism-animations/card.md). The cleanest silent-animation precedent in the corpus.

### Sliwa macaque social-interaction fMRI

- Short videos of social interactions, single-agent action, and physical-object interactions.
- N = 4 awake macaques with contrast agent fMRI.
- Used by [sliwa-2017-macaque-social-network](../collection/action/sliwa-2017-macaque-social-network/card.md). Comparative neuroscience anchor.

### Saarimaki emotion-induction fMRI

- Emotional movie clips and emotional mental imagery, six basic emotions.
- N = 18 adults.
- Used by [saarimaki-2016-discrete-emotions](../collection/emotion/saarimaki-2016-discrete-emotions/card.md).

### Nummenmaa emotion-modulated ISC fMRI

- 137 short emotional movie clips.
- N = 71 adults.
- Used by [nummenmaa-2012-emotion-synchrony](../collection/emotion/nummenmaa-2012-emotion-synchrony/card.md).

### Kragel EmoNet emotion-video fMRI

- 20 brief emotion-evoking videos plus EmoNet training set of 137,000 emotion-labelled video frames.
- N = 18 fMRI subjects, 20 emotion categories.
- Used by [kragel-2019-emonet-visual](../collection/emotion/kragel-2019-emonet-visual/card.md).

### Cowen and Keltner 27-emotion video set

- 2185 short evocative videos rated by 853 participants.
- Behavioral, no neural data.
- Used by [cowen-keltner-2017-27-emotions](../collection/emotion/cowen-keltner-2017-27-emotions/card.md).

### Kauttonen cinematic-feature fMRI

- One feature-length film with multi-level cinematic-feature annotations.
- Adult sample.
- Used by [kauttonen-2015-cinematic-fmri](../collection/emotion/kauttonen-2015-cinematic-fmri/card.md). Methodological template for the LLR regressor planned in ThePresent.

### Stoeckel mother-child-dog photograph fMRI

- Custom photo sets per participant (own child, own dog, unfamiliar child, unfamiliar dog).
- N = 14 mothers; static stimuli.
- Used by [stoeckel-2014-mother-child-dog](../collection/emotion/stoeckel-2014-mother-child-dog/card.md). Load-bearing source for the puppy-shot interpretation, although the stimulus is static photographs rather than naturalistic motion.

### Glocker baby-schema infant-photograph fMRI

- 60 morphed infant photographs (low/medium/high baby schema).
- N = 16 nulliparous women.
- Used by [glocker-2009-baby-schema](../collection/emotion/glocker-2009-baby-schema/card.md).

### Borgi baby-schema-children behavioral

- Morphed infant, puppy, and kitten faces.
- N = 75 children ages 3-6, N = 161 adults.
- Behavioral and eye-tracking, no neural data.
- Used by [borgi-2014-baby-schema-children](../collection/emotion/borgi-2014-baby-schema-children/card.md). Developmental anchor for the puppy-shot interpretation.

### Lindquist coordinate-based emotion meta-analysis

- 91 PET/fMRI studies, ~1600 participants total.
- Used by [lindquist-2012-emotion-meta-analysis](../collection/emotion/lindquist-2012-emotion-meta-analysis/card.md).

### Sergerie amygdala meta-analysis

- 385 functional neuroimaging studies of amygdala response.
- Used by [sergerie-2008-amygdala-meta-analysis](../collection/emotion/sergerie-2008-amygdala-meta-analysis/card.md).

### Singer empathy-pain fMRI

- Spousal-couple paradigm with painful stimulation.
- Adult sample.
- Used by [singer-2004-empathy-pain](../collection/emotion/singer-2004-empathy-pain/card.md).

### Saxe TPJ ToM localiser

- False-belief and physical-state stories.
- Adult sample.
- Used by [saxe-kanwisher-2003-tpj-tom](../collection/emotion/saxe-kanwisher-2003-tpj-tom/card.md).

### Lipkin language-network probabilistic atlas

- Sentence-vs-nonword precision-fMRI localizer.
- N > 800 adults.
- Used by [lipkin-2022-language-atlas](../collection/language/lipkin-2022-language-atlas/card.md). MNI-space probabilistic atlas, openly released.

### Huth Moth Radio Hour fMRI

- 2 hours per subject of narrated stories.
- N = 7 adults.
- Used by [huth-2016-semantic-atlas](../collection/language/huth-2016-semantic-atlas/card.md). Speech-based; cannot transfer to silent animation.

### Wager neurologic pain signature fMRI

- Multi-study, somatic-pain paradigms.
- Adult samples.
- Used by [wager-2013-neurologic-pain-signature](../collection/emotion/wager-2013-neurologic-pain-signature/card.md).

### Mar narrative comprehension review

- Review across multiple narrative-fMRI studies.
- Used by [mar-2011-narrative-social-cognition](../collection/emotion/mar-2011-narrative-social-cognition/card.md).

### Tamir fiction reading fMRI

- Fictional and non-fictional matched passages.
- Adult sample.
- Used by [tamir-2015-fiction-default-network](../collection/emotion/tamir-2015-fiction-default-network/card.md).

### Buckner default-mode-network synthesis

- Multi-study DMN review.
- Used by [buckner-2008-default-network](../collection/language/buckner-2008-default-network/card.md).

### Etkin ACC and mPFC review

- Multi-study review of medial prefrontal emotion regulation.
- Used by [etkin-2011-acc-mpfc-emotion](../collection/emotion/etkin-2011-acc-mpfc-emotion/card.md).

### LeDoux amygdala "many roads" review

- Multi-study amygdala review.
- Used by [ledoux-2010-amygdala-many-roads](../collection/emotion/ledoux-2010-amygdala-many-roads/card.md).

### Bartels and Zeki natural-vision fMRI

- Continuous natural-movie viewing with motion-vs-cut decomposition.
- Adult sample.
- Used by [bartels-zeki-2008-natural-vision-mt](../collection/psychophysics/bartels-zeki-2008-natural-vision-mt/card.md). Direct methodological precursor for the cut-onset and motion-energy regressors planned in ThePresent.

### Nishimoto natural-movie reconstruction fMRI

- Hours of natural-movie viewing per subject for encoding-model training.
- N = 3 adults.
- Used by [nishimoto-2011-movie-reconstruction](../collection/psychophysics/nishimoto-2011-movie-reconstruction/card.md). Foundational motion-energy encoding model.

## Intracranial EEG datasets

### Nentwich film-clip iEEG

- 43.6 minutes of film clips with simultaneous eye tracking and 6328 contacts in 23 patients.
- Adult clinical (epilepsy) sample.
- Used by [nentwich-2023-semantic-novelty-cuts](../collection/psychophysics/nentwich-2023-semantic-novelty-cuts/card.md). The closest published analogue of the ThePresent ERSP pipeline at the regressor level.

### Goldstein podcast ECoG

- 30-minute naturalistic podcast.
- Epilepsy patient sample.
- Used by [goldstein-2022-shared-computational](../collection/language/goldstein-2022-shared-computational/card.md).

### Brennan and colleagues sentence-comprehension iEEG / ECoG

- Sentence-reading paradigms.
- Used by [brennan-2017-phrase-structure-meg](../collection/language/brennan-2017-phrase-structure-meg/card.md).

## Multimodal and ancillary datasets

This section gathers naturalistic-paradigm datasets that combine more than one recording channel (e.g., EEG plus eye tracking plus pupillometry) and reference cohorts that do not fit neatly under a single modality heading above. Reviews and meta-analyses that aggregate across many studies rather than report a single dataset are listed here as cross-strand reference rather than as a single primary dataset.

### Madsen and Parra brain-body-eyes naturalistic videos

- Informative naturalistic videos with attentive vs distracted manipulation.
- N = 60 adults; EEG plus eye tracking, electrocardiogram (ECG), pupillometry, respiration, head motion.
- Used by [madsen-parra-2022-brain-heart-eyes-sync](../collection/psychophysics/madsen-parra-2022-brain-heart-eyes-sync/card.md). Largest multimodal naturalistic-EEG corpus in the cards; HBN-EEG R3 lacks the peripheral channels.

### Dorr eye-movement public dataset

- 18 high-resolution outdoor videos plus stop-motion and Hollywood-trailer controls.
- 54 adult observers.
- Public at https://www.inb.uni-luebeck.de/tools-demos/gaze.
- Used by [dorr-2010-eye-movements-natural-movies](../collection/psychophysics/dorr-2010-eye-movements-natural-movies/card.md). Free-viewing benchmark for saliency models.

### Klin autism fixation video corpus

- Live-action movie clips ("Who's Afraid of Virginia Woolf?") and audiovisual contingency stimuli.
- Adolescent and toddler autism samples.
- Used by [klin-2002-visual-fixation-autism](../collection/action/klin-2002-visual-fixation-autism/card.md), [klin-2009-biological-motion-autism](../collection/action/klin-2009-biological-motion-autism/card.md). Behavioral / eye tracking only.

## Tools and computational stimulus models cited as data

### mTRF MATLAB toolbox

- Software, not a dataset.
- Used by [crosse-2016-mtrf-toolbox](../collection/psychophysics/crosse-2016-mtrf-toolbox/card.md). Reference implementation for naturalistic-EEG TRF analysis.

### unfold deconvolution toolbox

- Software, not a dataset.
- Used by [dimigen-ehinger-2021-deconvolution-eye-eeg](../collection/psychophysics/dimigen-ehinger-2021-deconvolution-eye-eeg/card.md). Candidate Phase 5 alternative if `std_precomp` ERSP is insufficiently flexible for overlapping shot events.

### DeepGaze II saliency model

- Software / pretrained model trained on MIT300.
- Used by [kummerer-2016-deepgaze-ii](../collection/psychophysics/kummerer-2016-deepgaze-ii/card.md). Candidate for fixation-prior regressors when no eye tracker is available.

### Adelson-Bergen, HMAX, and deep CNN feature pipelines

- Computational vision-model libraries used as regressors.
- Used by [adelson-bergen-1985-spatiotemporal-energy](../collection/psychophysics/adelson-bergen-1985-spatiotemporal-energy/card.md), [riesenhuber-poggio-1999-hmax](../collection/psychophysics/riesenhuber-poggio-1999-hmax/card.md), [khaligh-razavi-kriegeskorte-2014-deep-cnn-it](../collection/psychophysics/khaligh-razavi-kriegeskorte-2014-deep-cnn-it/card.md). Provide candidate motion-energy and feature regressors.

### Hubel-Wiesel cat V1 single-unit canonical reference

- Classical electrophysiology, not a dataset in the modern sense.
- Used by [hubel-wiesel-1962-receptive-fields-cat-v1](../collection/psychophysics/hubel-wiesel-1962-receptive-fields-cat-v1/card.md). Mechanistic anchor only.

### Bell and Sejnowski natural-image patches

- Patch-based natural-image dataset for ICA training.
- Used by [bell-sejnowski-1997-ica-natural-scenes](../collection/psychophysics/bell-sejnowski-1997-ica-natural-scenes/card.md).

### Carandini-Heeger normalization model survey

- Theoretical-review synthesis across many datasets.
- Used by [carandini-heeger-2011-normalization](../collection/psychophysics/carandini-heeger-2011-normalization/card.md).

### Born-Bradley MT/MST review

- Single-unit MT/MST literature synthesis.
- Used by [born-bradley-2005-mt-mst](../collection/psychophysics/born-bradley-2005-mt-mst/card.md).

### Tobimatsu and Celesia visual evoked potential (VEP) review

- Clinical VEP literature synthesis.
- Used by [tobimatsu-celesia-2006-vep-pathophysiology](../collection/psychophysics/tobimatsu-celesia-2006-vep-pathophysiology/card.md).

### Simoncelli and Olshausen natural-image-statistics review

- Multi-dataset theoretical review.
- Used by [simoncelli-olshausen-2001-natural-image-stats](../collection/psychophysics/simoncelli-olshausen-2001-natural-image-stats/card.md).

### Iacoboni mirror-system review

- Multi-study fMRI synthesis.
- Used by [iacoboni-2009-mirror-empathy](../collection/action/iacoboni-2009-mirror-empathy/card.md).

### Rizzolatti and Craighero mirror-neuron review

- Multi-study macaque single-unit and human fMRI synthesis.
- Used by [rizzolatti-2004-mirror-neuron-system](../collection/action/rizzolatti-2004-mirror-neuron-system/card.md).

### Kilner predictive-coding mirror-system theory

- Theoretical paper, no primary dataset.
- Used by [kilner-2007-predictive-coding-mirror](../collection/action/kilner-2007-predictive-coding-mirror/card.md).

### Schmälzle and Grall ISC-captivation review

- Theoretical media-psychology synthesis.
- Used by [schmalzle-2020-coupled-brains](../collection/emotion/schmalzle-2020-coupled-brains/card.md).

### Caucheteux brains-and-algorithms multi-dataset benchmark

- Multiple naturalistic-listening fMRI and MEG datasets reanalyzed for transformer-layer alignment.
- Used by [caucheteux-2022-brains-algorithms](../collection/language/caucheteux-2022-brains-algorithms/card.md), [caucheteux-2023-predictive-hierarchy](../collection/language/caucheteux-2023-predictive-hierarchy/card.md).

### Schrimpf and Antonello brain-score language benchmark

- Multi-dataset re-analysis for language-model-to-brain alignment.
- Used by [schrimpf-2021-neural-architecture](../collection/language/schrimpf-2021-neural-architecture/card.md), [antonello-2023-scaling-laws](../collection/language/antonello-2023-scaling-laws/card.md).

### Toneva and Wehbe natural-reading dataset

- Word-by-word fMRI and MEG of natural reading.
- Adult sample.
- Used by [toneva-2019-interpreting-nlp-brain](../collection/language/toneva-2019-interpreting-nlp-brain/card.md).

### vanWassenhove audiovisual-speech EEG

- McGurk-like syllable stimuli with visible mouth movement.
- Adult sample.
- Used by [vanwassenhove-2005-visual-speech](../collection/language/vanwassenhove-2005-visual-speech/card.md).

### Senkowski and Schroeder cross-modal oscillation reviews

- Multi-study reviews of cross-modal coherence and low-frequency entrainment.
- Used by [senkowski-2008-crossmodal-coherence](../collection/language/senkowski-2008-crossmodal-coherence/card.md), [schroeder-2009-low-frequency-oscillations](../collection/language/schroeder-2009-low-frequency-oscillations/card.md).

### Magliano and Zacks continuity-editing behavioral

- Behavioral event-segmentation work on edited narrative film.
- Used by [magliano-2011-continuity-editing](../collection/language/magliano-2011-continuity-editing/card.md). Paradigm-general, transfers to silent narrative.

### Saygin lesion-symptom mapping cohort

- N = 60 unilateral stroke patients with biological-motion battery.
- Used by [saygin-2007-sts-lesions](../collection/action/saygin-2007-sts-lesions/card.md).

### Johansson point-light walker stimuli

- Classical psychophysics stimuli.
- Used by [johansson-1973-biological-motion](../collection/action/johansson-1973-biological-motion/card.md).

### Speer narrative event-boundary fMRI

- Narrative listening with event-boundary annotations.
- Adult sample.
- Used by [speer-2007-narrative-event-boundaries](../collection/action/speer-2007-narrative-event-boundaries/card.md).

### Zacks event-segmentation theory survey

- Multi-study behavioral and fMRI synthesis.
- Used by [zacks-2007-event-segmentation](../collection/action/zacks-2007-event-segmentation/card.md).

### Pessoa-Adolphs amygdala "many roads" review

- See LeDoux entry above.

### Zaki-Ochsner empathy review

- Multi-study fMRI review.
- Used by [zaki-ochsner-2012-empathy-neural](../collection/emotion/zaki-ochsner-2012-empathy-neural/card.md).

## Datasets relevant to the project but absent from the corpus

The corpus does not contain a paper-card whose primary data are the Naturalistic Neuroimaging Database (NNDb), the Healthy Brain Network MRI release, the EEG-NEMAR ThePresent subset, or any large-N child-EEG naturalistic-stimulus dataset other than [petroni-cohen-2018-isc-naturalistic-videos](../collection/emotion/petroni-cohen-2018-isc-naturalistic-videos/card.md). These absences are flagged in `gap-analysis.md`.
