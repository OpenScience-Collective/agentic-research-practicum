# Psychophysics Ontology

A hierarchical view of the 26 psychophysics paper-cards. Each leaf links to its card with a one-line role statement. The structure refactors the brief's six flat categories into four top-level branches that follow the natural joints of the corpus: visual-system foundations, dynamic naturalistic-vision benchmarks, time-resolved naturalistic neurophysiology, and free-viewing eye-EEG (electroencephalography) coregistration. Inter-subject correlation (ISC) is treated as a sub-tree under naturalistic neurophysiology rather than a top-level peer, because every ISC entry is also a naturalistic neurophysiology entry, and the ISC literature itself splits into sub-genres (stimulus-locked, attention-modulated, memory-linked, multi-modal, cross-domain). Computational regressor models are distributed across the foundations and dynamic-vision branches according to whether they explain static or dynamic input; toolbox entries are placed near the methods they instantiate.

Abbreviations defined on first use: event-related spectral perturbation (ERSP), independent components analysis (ICA), inter-subject correlation (ISC), log luminance ratio (LLR), middle temporal area (MT, also V5), middle superior temporal area (MST), primary visual cortex (V1), inferotemporal cortex (IT), fixation-related potential (FRP), visual evoked potential (VEP), temporal response function (TRF), magnetic resonance imaging (fMRI when functional), magneto-encephalography (MEG), intracranial electroencephalography (iEEG).

## Top-level categories

### Category A: Visual-system foundations and low-level scene statistics

Static or scale-free substrate that any naturalistic-vision pipeline inherits, organized by what it claims about the visual front end.

- Sub-category A.1: Single-unit anatomy and canonical receptive fields
  - [hubel-wiesel-1962-receptive-fields-cat-v1](../collection/psychophysics/hubel-wiesel-1962-receptive-fields-cat-v1/card.md): foundational simple/complex-cell hierarchy and columnar V1 organization that anchors every later edge-and-orientation argument.
  - [tobimatsu-celesia-2006-vep-pathophysiology](../collection/psychophysics/tobimatsu-celesia-2006-vep-pathophysiology/card.md): clinical review mapping luminance and contrast VEP components onto magnocellular versus parvocellular pathways and striate versus extrastriate generators, the bridge from single-unit anatomy to scalp electrophysiology.
- Sub-category A.2: Canonical neural computations
  - [carandini-heeger-2011-normalization](../collection/psychophysics/carandini-heeger-2011-normalization/card.md): divisive normalization as a canonical gain-control computation across cortex, the substrate that converts raw stimulus energy into a contrast-invariant LLR-relevant response.
- Sub-category A.3: Natural-image statistics and efficient coding
  - [bell-sejnowski-1997-ica-natural-scenes](../collection/psychophysics/bell-sejnowski-1997-ica-natural-scenes/card.md): ICA on natural-image patches yields V1-like Gabor filters, the algorithmic and theoretical backbone of the AMICA decomposition used downstream.
  - [simoncelli-olshausen-2001-natural-image-stats](../collection/psychophysics/simoncelli-olshausen-2001-natural-image-stats/card.md): canonical review of natural-image statistics, sparse coding, ICA, and divisive normalization as a unified efficient-coding agenda.
- Sub-category A.4: Hierarchical static-feature models as biological regressors
  - [riesenhuber-poggio-1999-hmax](../collection/psychophysics/riesenhuber-poggio-1999-hmax/card.md): HMAX hierarchical model with MAX-pooling that derives IT-cell invariance from V1-like building blocks, the pre-deep-learning ancestor of CNN-based ventral-stream models.
  - [khaligh-razavi-kriegeskorte-2014-deep-cnn-it](../collection/psychophysics/khaligh-razavi-kriegeskorte-2014-deep-cnn-it/card.md): supervised deep convolutional neural network best explains IT representational geometry across 37 candidate models, motivating CNN-derived features as ventral-stream regressors.
  - [kummerer-2016-deepgaze-ii](../collection/psychophysics/kummerer-2016-deepgaze-ii/card.md): DeepGaze II uses VGG-19 features with a small readout to predict free-viewing fixations on the MIT300 benchmark, an off-the-shelf saliency regressor for eye-movement modeling.

### Category B: Dynamic naturalistic vision: motion, optic flow, and movie-driven cortex

Cards that move from static substrate to time-varying naturalistic input, ordered from foundational motion machinery to whole-brain movie responses.

- Sub-category B.1: Motion-energy and pattern-motion machinery
  - [adelson-bergen-1985-spatiotemporal-energy](../collection/psychophysics/adelson-bergen-1985-spatiotemporal-energy/card.md): foundational spatiotemporal-energy model implementing motion as orientation in x-y-t, the canonical V1/MT regressor reused downstream.
  - [born-bradley-2005-mt-mst](../collection/psychophysics/born-bradley-2005-mt-mst/card.md): canonical review of MT and MST direction tuning, opponent suppression, pattern-motion selectivity, and microstimulation evidence, defining the dorsal-stream motion machinery.
- Sub-category B.2: Naturalistic-movie fMRI of motion and dynamic scenes
  - [bartels-zeki-2008-natural-vision-mt](../collection/psychophysics/bartels-zeki-2008-natural-vision-mt/card.md): natural-movie fMRI separates global flow, local motion, and residual; V5/MT+ is the contrast-dependent local-motion driver while medial parieto-occipital cortex (mPPC) is the contrast-invariant global-flow driver.
  - [nishimoto-2011-movie-reconstruction](../collection/psychophysics/nishimoto-2011-movie-reconstruction/card.md): motion-energy encoding model decodes viewed natural movies from BOLD activity in occipitotemporal cortex, the existence proof that an Adelson-Bergen front end suffices to reconstruct movies.
- Sub-category B.3: Eye movements and gaze coherence on dynamic stimuli
  - [dorr-2010-eye-movements-natural-movies](../collection/psychophysics/dorr-2010-eye-movements-natural-movies/card.md): gaze coherence is highest on Hollywood trailers, intermediate on natural footage, lowest on stop-motion and stills; quantifies how stimulus class drives eye-movement convergence relevant to the animated short The Present.

### Category C: Time-resolved naturalistic neurophysiology (EEG, MEG, iEEG)

The corpus' methodological core: stimulus-locked recordings during continuous naturalistic input, organized by what is being measured and what controls each variant.

- Sub-category C.1: System identification and TRF methods
  - [lalor-foxe-2010-natural-speech-trf](../collection/psychophysics/lalor-foxe-2010-natural-speech-trf/card.md): TRF-based system identification on continuous natural speech, the auditory analogue of the visual-evoked-spread-spectrum-analysis (VESPA) approach and the conceptual ancestor of stimulus-feature regression on continuous EEG.
  - [crosse-2016-mtrf-toolbox](../collection/psychophysics/crosse-2016-mtrf-toolbox/card.md): mTRF MATLAB toolbox for regularized linear regression of EEG/MEG against continuous stimulus features, the production tool that operationalizes Lalor-style TRF analysis.
- Sub-category C.2: Inter-subject correlation, foundational frame
  - [hasson-2004-isc-natural-vision](../collection/psychophysics/hasson-2004-isc-natural-vision/card.md): foundational fMRI ISC paper; free viewing of a feature film synchronizes voxel responses across subjects and defines reverse-correlation as a tool for naturalistic stimuli.
  - [dmochowski-2012-correlated-eeg-engagement](../collection/psychophysics/dmochowski-2012-correlated-eeg-engagement/card.md): introduces correlated component analysis for EEG ISC during repeated movie viewing, with theta increases and alpha/beta decreases at engagement peaks, the EEG analogue of Hasson 2004.
- Sub-category C.3: Attention as ISC modulator
  - [ki-kelly-parra-2016-attention-eeg-narrative](../collection/psychophysics/ki-kelly-parra-2016-attention-eeg-narrative/card.md): attentional state strongly modulates EEG ISC to audiovisual narratives, with single-trial classification near ceiling, establishing attention as a confound and a signal for ISC measurements.
- Sub-category C.4: Memory and prediction as ISC outcomes
  - [cohen-parra-2016-memorable-narratives](../collection/psychophysics/cohen-parra-2016-memorable-narratives/card.md): supramodal EEG synchrony during narrative encoding predicts free recall three weeks later, linking instantaneous neural reliability to durable memory.
  - [dmochowski-2014-audience-preferences-isc](../collection/psychophysics/dmochowski-2014-audience-preferences-isc/card.md): EEG-ISC of small in-lab samples predicts audience preferences of millions on broadcast television; fMRI fusion localizes the predictive signal to higher-order visual and auditory cortices.
- Sub-category C.5: Multi-modal sync and peripheral physiology
  - [madsen-parra-2022-brain-heart-eyes-sync](../collection/psychophysics/madsen-parra-2022-brain-heart-eyes-sync/card.md): EEG, gaze, pupil, and heart-rate ISC co-modulate with attention and predict recall, unifying the brain-body sync framework and enlarging ISC beyond cortex.
- Sub-category C.6: Cross-domain ISC, music and feature controls
  - [kaneshiro-2021-music-eeg-isc](../collection/psychophysics/kaneshiro-2021-music-eeg-isc/card.md): time-resolved EEG-ISC during a cello concerto peaks during tension build, not at climax, with an envelope-only control isolating the low-level acoustic contribution from higher-level structure.
- Sub-category C.7: Intracranial coverage of cuts, saccades, and event boundaries
  - [nentwich-2023-semantic-novelty-cuts](../collection/psychophysics/nentwich-2023-semantic-novelty-cuts/card.md): intracranial EEG across 6328 contacts shows whole-brain saccade-locked and cut-locked responses, with cuts at semantic event boundaries especially effective in temporal and medial-temporal regions, the most direct neural evidence on the shot-onset transient.

### Category D: Free-viewing EEG with eye-movement coregistration

Methods and exemplars for stimulus-locked EEG when eyes move freely, organized from artifact correction to deconvolved fixation-related responses.

- Sub-category D.1: Eye-artifact correction with eye-tracker timing
  - [ploechl-2012-eye-eeg-artifact-correction](../collection/psychophysics/ploechl-2012-eye-eeg-artifact-correction/card.md): ICA-based eye-artifact removal automated against eye-tracker timing, area-under-curve above 0.99 against expert labels, the production-quality artifact-rejection step before any FRP analysis.
- Sub-category D.2: Fixation-related potentials and overlap correction
  - [dimigen-2011-frp-natural-reading](../collection/psychophysics/dimigen-2011-frp-natural-reading/card.md): FRPs replicate the N400 word-predictability effect under free reading and lay out the four methodological problems of free-viewing EEG.
  - [dimigen-ehinger-2021-deconvolution-eye-eeg](../collection/psychophysics/dimigen-ehinger-2021-deconvolution-eye-eeg/card.md): regression-based deconvolution framework for FRPs that simultaneously handles temporal overlap of overlapping events and saccade-parameter confounds, the current methodological state of the art.

## Cross-cutting tags

Tags that apply across categories. Each card surfaces under at least one tag.

### Open access (PDF archived in repo or open-license preprint)

Cards whose `pdf_status: archived` lets us cite freely from the local copy.

- [bell-sejnowski-1997-ica-natural-scenes](../collection/psychophysics/bell-sejnowski-1997-ica-natural-scenes/card.md)
- [cohen-parra-2016-memorable-narratives](../collection/psychophysics/cohen-parra-2016-memorable-narratives/card.md)
- [crosse-2016-mtrf-toolbox](../collection/psychophysics/crosse-2016-mtrf-toolbox/card.md)
- [dimigen-ehinger-2021-deconvolution-eye-eeg](../collection/psychophysics/dimigen-ehinger-2021-deconvolution-eye-eeg/card.md)
- [dmochowski-2012-correlated-eeg-engagement](../collection/psychophysics/dmochowski-2012-correlated-eeg-engagement/card.md)
- [dmochowski-2014-audience-preferences-isc](../collection/psychophysics/dmochowski-2014-audience-preferences-isc/card.md)
- [khaligh-razavi-kriegeskorte-2014-deep-cnn-it](../collection/psychophysics/khaligh-razavi-kriegeskorte-2014-deep-cnn-it/card.md)
- [ki-kelly-parra-2016-attention-eeg-narrative](../collection/psychophysics/ki-kelly-parra-2016-attention-eeg-narrative/card.md)
- [kummerer-2016-deepgaze-ii](../collection/psychophysics/kummerer-2016-deepgaze-ii/card.md)
- [madsen-parra-2022-brain-heart-eyes-sync](../collection/psychophysics/madsen-parra-2022-brain-heart-eyes-sync/card.md)
- [nentwich-2023-semantic-novelty-cuts](../collection/psychophysics/nentwich-2023-semantic-novelty-cuts/card.md)
- [ploechl-2012-eye-eeg-artifact-correction](../collection/psychophysics/ploechl-2012-eye-eeg-artifact-correction/card.md)

### Paywalled or abstract-only locally

Cards held only as `source.md` abstract because licensing forbids PDF redistribution or no PDF was available.

- [adelson-bergen-1985-spatiotemporal-energy](../collection/psychophysics/adelson-bergen-1985-spatiotemporal-energy/card.md)
- [bartels-zeki-2008-natural-vision-mt](../collection/psychophysics/bartels-zeki-2008-natural-vision-mt/card.md)
- [born-bradley-2005-mt-mst](../collection/psychophysics/born-bradley-2005-mt-mst/card.md)
- [carandini-heeger-2011-normalization](../collection/psychophysics/carandini-heeger-2011-normalization/card.md)
- [dimigen-2011-frp-natural-reading](../collection/psychophysics/dimigen-2011-frp-natural-reading/card.md)
- [dorr-2010-eye-movements-natural-movies](../collection/psychophysics/dorr-2010-eye-movements-natural-movies/card.md)
- [hasson-2004-isc-natural-vision](../collection/psychophysics/hasson-2004-isc-natural-vision/card.md)
- [hubel-wiesel-1962-receptive-fields-cat-v1](../collection/psychophysics/hubel-wiesel-1962-receptive-fields-cat-v1/card.md)
- [kaneshiro-2021-music-eeg-isc](../collection/psychophysics/kaneshiro-2021-music-eeg-isc/card.md)
- [lalor-foxe-2010-natural-speech-trf](../collection/psychophysics/lalor-foxe-2010-natural-speech-trf/card.md)
- [nishimoto-2011-movie-reconstruction](../collection/psychophysics/nishimoto-2011-movie-reconstruction/card.md)
- [riesenhuber-poggio-1999-hmax](../collection/psychophysics/riesenhuber-poggio-1999-hmax/card.md)
- [simoncelli-olshausen-2001-natural-image-stats](../collection/psychophysics/simoncelli-olshausen-2001-natural-image-stats/card.md)
- [tobimatsu-celesia-2006-vep-pathophysiology](../collection/psychophysics/tobimatsu-celesia-2006-vep-pathophysiology/card.md)

### EEG-, MEG-, or iEEG-specific (electrophysiology)

Cards whose primary modality is scalp or invasive electrophysiology in humans.

- [cohen-parra-2016-memorable-narratives](../collection/psychophysics/cohen-parra-2016-memorable-narratives/card.md)
- [crosse-2016-mtrf-toolbox](../collection/psychophysics/crosse-2016-mtrf-toolbox/card.md)
- [dimigen-2011-frp-natural-reading](../collection/psychophysics/dimigen-2011-frp-natural-reading/card.md)
- [dimigen-ehinger-2021-deconvolution-eye-eeg](../collection/psychophysics/dimigen-ehinger-2021-deconvolution-eye-eeg/card.md)
- [dmochowski-2012-correlated-eeg-engagement](../collection/psychophysics/dmochowski-2012-correlated-eeg-engagement/card.md)
- [dmochowski-2014-audience-preferences-isc](../collection/psychophysics/dmochowski-2014-audience-preferences-isc/card.md)
- [kaneshiro-2021-music-eeg-isc](../collection/psychophysics/kaneshiro-2021-music-eeg-isc/card.md)
- [ki-kelly-parra-2016-attention-eeg-narrative](../collection/psychophysics/ki-kelly-parra-2016-attention-eeg-narrative/card.md)
- [lalor-foxe-2010-natural-speech-trf](../collection/psychophysics/lalor-foxe-2010-natural-speech-trf/card.md)
- [madsen-parra-2022-brain-heart-eyes-sync](../collection/psychophysics/madsen-parra-2022-brain-heart-eyes-sync/card.md)
- [nentwich-2023-semantic-novelty-cuts](../collection/psychophysics/nentwich-2023-semantic-novelty-cuts/card.md)
- [ploechl-2012-eye-eeg-artifact-correction](../collection/psychophysics/ploechl-2012-eye-eeg-artifact-correction/card.md)
- [tobimatsu-celesia-2006-vep-pathophysiology](../collection/psychophysics/tobimatsu-celesia-2006-vep-pathophysiology/card.md)

### fMRI-specific

Cards whose primary modality is functional magnetic resonance imaging.

- [bartels-zeki-2008-natural-vision-mt](../collection/psychophysics/bartels-zeki-2008-natural-vision-mt/card.md)
- [hasson-2004-isc-natural-vision](../collection/psychophysics/hasson-2004-isc-natural-vision/card.md)
- [nishimoto-2011-movie-reconstruction](../collection/psychophysics/nishimoto-2011-movie-reconstruction/card.md)

### Single-unit, computational, or theory (no human in vivo recording)

Cards whose evidence base is animal physiology or pure modeling and whose role here is to ground the human-recording entries.

- [adelson-bergen-1985-spatiotemporal-energy](../collection/psychophysics/adelson-bergen-1985-spatiotemporal-energy/card.md)
- [bell-sejnowski-1997-ica-natural-scenes](../collection/psychophysics/bell-sejnowski-1997-ica-natural-scenes/card.md)
- [born-bradley-2005-mt-mst](../collection/psychophysics/born-bradley-2005-mt-mst/card.md)
- [carandini-heeger-2011-normalization](../collection/psychophysics/carandini-heeger-2011-normalization/card.md)
- [hubel-wiesel-1962-receptive-fields-cat-v1](../collection/psychophysics/hubel-wiesel-1962-receptive-fields-cat-v1/card.md)
- [khaligh-razavi-kriegeskorte-2014-deep-cnn-it](../collection/psychophysics/khaligh-razavi-kriegeskorte-2014-deep-cnn-it/card.md)
- [kummerer-2016-deepgaze-ii](../collection/psychophysics/kummerer-2016-deepgaze-ii/card.md)
- [riesenhuber-poggio-1999-hmax](../collection/psychophysics/riesenhuber-poggio-1999-hmax/card.md)
- [simoncelli-olshausen-2001-natural-image-stats](../collection/psychophysics/simoncelli-olshausen-2001-natural-image-stats/card.md)

### LLR or luminance-step relevance

Cards that bear directly on the LLR continuous regressor or on luminance-step transients at shot onset.

- [adelson-bergen-1985-spatiotemporal-energy](../collection/psychophysics/adelson-bergen-1985-spatiotemporal-energy/card.md): luminance contrast is the input variable to the energy filters.
- [bartels-zeki-2008-natural-vision-mt](../collection/psychophysics/bartels-zeki-2008-natural-vision-mt/card.md): contrast dependence of V5/MT+ versus contrast invariance of mPPC defines the LLR sensitivity gradient across motion regions.
- [carandini-heeger-2011-normalization](../collection/psychophysics/carandini-heeger-2011-normalization/card.md): divisive normalization predicts compressive response to luminance steps and motivates the log transform of the luminance ratio.
- [nentwich-2023-semantic-novelty-cuts](../collection/psychophysics/nentwich-2023-semantic-novelty-cuts/card.md): cut-locked responses are partially explained by stimulus-side optical flow and luminance change, the closest analogue to a shot-onset luminance regressor.
- [tobimatsu-celesia-2006-vep-pathophysiology](../collection/psychophysics/tobimatsu-celesia-2006-vep-pathophysiology/card.md): luminance and contrast VEP latencies and pathway assignment, the clinical reference for what scalp signals a luminance step should produce.

### Computational regressor candidates

Cards that supply concrete feature regressors a continuous EEG analysis could plug in.

- [adelson-bergen-1985-spatiotemporal-energy](../collection/psychophysics/adelson-bergen-1985-spatiotemporal-energy/card.md): motion-energy regressor for V1/MT.
- [bell-sejnowski-1997-ica-natural-scenes](../collection/psychophysics/bell-sejnowski-1997-ica-natural-scenes/card.md): ICA basis as a sparse-code regressor on raw images.
- [crosse-2016-mtrf-toolbox](../collection/psychophysics/crosse-2016-mtrf-toolbox/card.md): production toolbox that takes any continuous regressor to a TRF.
- [khaligh-razavi-kriegeskorte-2014-deep-cnn-it](../collection/psychophysics/khaligh-razavi-kriegeskorte-2014-deep-cnn-it/card.md): deep CNN intermediate layers as ventral-stream regressors.
- [kummerer-2016-deepgaze-ii](../collection/psychophysics/kummerer-2016-deepgaze-ii/card.md): saliency map as a fixation-prediction regressor.
- [lalor-foxe-2010-natural-speech-trf](../collection/psychophysics/lalor-foxe-2010-natural-speech-trf/card.md): TRF as the modeling pattern for any continuous-feature regression on EEG.
- [nishimoto-2011-movie-reconstruction](../collection/psychophysics/nishimoto-2011-movie-reconstruction/card.md): existence proof that motion-energy features carry enough information for movie reconstruction.
- [riesenhuber-poggio-1999-hmax](../collection/psychophysics/riesenhuber-poggio-1999-hmax/card.md): HMAX hierarchical features as a pre-deep-learning regressor.

### Foundational reviews and canonical references

Cards labeled `foundational` or framed as canonical reviews; these anchor the methodological narrative.

- [adelson-bergen-1985-spatiotemporal-energy](../collection/psychophysics/adelson-bergen-1985-spatiotemporal-energy/card.md)
- [born-bradley-2005-mt-mst](../collection/psychophysics/born-bradley-2005-mt-mst/card.md)
- [carandini-heeger-2011-normalization](../collection/psychophysics/carandini-heeger-2011-normalization/card.md)
- [hasson-2004-isc-natural-vision](../collection/psychophysics/hasson-2004-isc-natural-vision/card.md)
- [hubel-wiesel-1962-receptive-fields-cat-v1](../collection/psychophysics/hubel-wiesel-1962-receptive-fields-cat-v1/card.md)
- [riesenhuber-poggio-1999-hmax](../collection/psychophysics/riesenhuber-poggio-1999-hmax/card.md)
- [simoncelli-olshausen-2001-natural-image-stats](../collection/psychophysics/simoncelli-olshausen-2001-natural-image-stats/card.md)
- [tobimatsu-celesia-2006-vep-pathophysiology](../collection/psychophysics/tobimatsu-celesia-2006-vep-pathophysiology/card.md)

### Tools, toolboxes, and software-carrying entries

Cards whose `type` is tool, plus papers that are de facto tool releases.

- [crosse-2016-mtrf-toolbox](../collection/psychophysics/crosse-2016-mtrf-toolbox/card.md): mTRF MATLAB toolbox.
- [dimigen-ehinger-2021-deconvolution-eye-eeg](../collection/psychophysics/dimigen-ehinger-2021-deconvolution-eye-eeg/card.md): unfold and EYE-EEG toolboxes for deconvolved FRPs.
- [kummerer-2016-deepgaze-ii](../collection/psychophysics/kummerer-2016-deepgaze-ii/card.md): DeepGaze II saliency model with public weights.
- [ploechl-2012-eye-eeg-artifact-correction](../collection/psychophysics/ploechl-2012-eye-eeg-artifact-correction/card.md): EYE-EEG plug-in for EEGLAB.

### Eye-movement, saccade, or gaze coregistration

Cards that explicitly use, model, or correct for eye-movement signals as part of the visual-cortex measurement.

- [dimigen-2011-frp-natural-reading](../collection/psychophysics/dimigen-2011-frp-natural-reading/card.md)
- [dimigen-ehinger-2021-deconvolution-eye-eeg](../collection/psychophysics/dimigen-ehinger-2021-deconvolution-eye-eeg/card.md)
- [dorr-2010-eye-movements-natural-movies](../collection/psychophysics/dorr-2010-eye-movements-natural-movies/card.md)
- [kummerer-2016-deepgaze-ii](../collection/psychophysics/kummerer-2016-deepgaze-ii/card.md)
- [madsen-parra-2022-brain-heart-eyes-sync](../collection/psychophysics/madsen-parra-2022-brain-heart-eyes-sync/card.md)
- [nentwich-2023-semantic-novelty-cuts](../collection/psychophysics/nentwich-2023-semantic-novelty-cuts/card.md)
- [ploechl-2012-eye-eeg-artifact-correction](../collection/psychophysics/ploechl-2012-eye-eeg-artifact-correction/card.md)
