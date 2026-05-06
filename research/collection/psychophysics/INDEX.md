# Psychophysics Strand Collection Index

26 entries spanning low-level scene statistics in dynamic stimuli, motion processing, time-resolved naturalistic-EEG, inter-subject correlation, free-viewing eye-EEG coregistration, and computational regressors of low-level features. The collection grounds the bottom-up component of the HBN-EEG ThePresent boy-shot vs puppy-shot event-related spectral perturbation (ERSP) project.

## 1. Low-level scene statistics in dynamic stimuli

- [bell-sejnowski-1997-ica-natural-scenes](./bell-sejnowski-1997-ica-natural-scenes/card.md): independent components analysis on natural images yields V1-like edge filters (`relevance: low`, 1997)
- [simoncelli-olshausen-2001-natural-image-stats](./simoncelli-olshausen-2001-natural-image-stats/card.md): canonical review of natural-image statistics and efficient-coding theory (`relevance: medium`, 2001)
- [dorr-2010-eye-movements-natural-movies](./dorr-2010-eye-movements-natural-movies/card.md): gaze coherence is highest on Hollywood trailers, intermediate on natural footage, lowest on stop-motion and stills (`relevance: medium`, 2010)
- [carandini-heeger-2011-normalization](./carandini-heeger-2011-normalization/card.md): divisive normalization as the canonical neural computation across cortex and modalities (`relevance: medium`, 2011)
- [tobimatsu-celesia-2006-vep-pathophysiology](./tobimatsu-celesia-2006-vep-pathophysiology/card.md): clinical review mapping luminance and contrast VEPs to magno- versus parvocellular pathways and striate versus extrastriate generators (`relevance: medium`, 2006)

## 2. Motion / optic flow and MT/V5 responses to natural motion

- [born-bradley-2005-mt-mst](./born-bradley-2005-mt-mst/card.md): canonical review of MT/V5 anatomy, direction tuning, opponent suppression, and microstimulation evidence (`relevance: medium`, 2005)
- [bartels-zeki-2008-natural-vision-mt](./bartels-zeki-2008-natural-vision-mt/card.md): natural-movie fMRI separates global flow, local motion, and residual; V5/MT+ is contrast-dependent local-motion driver, mPPC is contrast-invariant global-flow driver (`relevance: high`, 2008)
- [hasson-2004-isc-natural-vision](./hasson-2004-isc-natural-vision/card.md): foundational fMRI inter-subject correlation paper, free viewing of a feature film synchronizes voxel responses across subjects (`relevance: high`, 2004)
- [nishimoto-2011-movie-reconstruction](./nishimoto-2011-movie-reconstruction/card.md): motion-energy encoding model decodes viewed natural movies from BOLD activity in occipitotemporal cortex (`relevance: high`, 2011)
- [adelson-bergen-1985-spatiotemporal-energy](./adelson-bergen-1985-spatiotemporal-energy/card.md): foundational spatiotemporal-energy model implementing motion as orientation in x-y-t (`relevance: high`, 1985)

## 3. Time-resolved EEG/MEG to dynamic naturalistic input

- [dmochowski-2012-correlated-eeg-engagement](./dmochowski-2012-correlated-eeg-engagement/card.md): introduces correlated-component analysis for EEG inter-subject correlation; theta up, alpha-beta down at engagement peaks (`relevance: high`, 2012)
- [lalor-foxe-2010-natural-speech-trf](./lalor-foxe-2010-natural-speech-trf/card.md): TRF-based system identification on continuous natural speech, the auditory analogue of VESPA (`relevance: medium`, 2010)
- [ki-kelly-parra-2016-attention-eeg-narrative](./ki-kelly-parra-2016-attention-eeg-narrative/card.md): attentional state strongly modulates EEG inter-subject correlation to narratives, classification approaches ceiling (`relevance: high`, 2016)
- [cohen-parra-2016-memorable-narratives](./cohen-parra-2016-memorable-narratives/card.md): supramodal EEG synchrony during narrative encoding predicts memory three weeks later (`relevance: medium`, 2016)
- [madsen-parra-2022-brain-heart-eyes-sync](./madsen-parra-2022-brain-heart-eyes-sync/card.md): EEG, gaze, pupil, heart-rate ISC co-modulate with attention and predict recall, unifying the brain-body sync framework (`relevance: high`, 2022)
- [crosse-2016-mtrf-toolbox](./crosse-2016-mtrf-toolbox/card.md): mTRF MATLAB toolbox for regularized linear regression of EEG/MEG against continuous stimuli (`relevance: medium`, 2016)

## 4. Inter-subject correlation (ISC) driven by stimulus-locked features

- [dmochowski-2014-audience-preferences-isc](./dmochowski-2014-audience-preferences-isc/card.md): EEG-ISC of small samples predicts audience preferences of millions; fusion with fMRI localizes to higher-order visual and auditory cortices (`relevance: medium`, 2014)
- [nentwich-2023-semantic-novelty-cuts](./nentwich-2023-semantic-novelty-cuts/card.md): intracranial EEG across 6328 contacts shows whole-brain saccade- and cut-locked responses, with film cuts at semantic event boundaries especially effective in temporal/MTL (`relevance: high`, 2023)
- [kaneshiro-2021-music-eeg-isc](./kaneshiro-2021-music-eeg-isc/card.md): time-resolved EEG-ISC during music peaks during tension build, not at climaxes; envelope-only control isolates low-level contribution (`relevance: medium`, 2021)

> Also part of this category: hasson-2004-isc-natural-vision, dmochowski-2012-correlated-eeg-engagement, ki-kelly-parra-2016-attention-eeg-narrative, cohen-parra-2016-memorable-narratives, madsen-parra-2022-brain-heart-eyes-sync (all listed under their primary categories above).

## 5. Free-viewing EEG with eye-movement coregistration

- [dimigen-2011-frp-natural-reading](./dimigen-2011-frp-natural-reading/card.md): fixation-related potentials replicate the N400 word-predictability effect under free reading; introduces the four-problem methodological framework (`relevance: medium`, 2011)
- [ploechl-2012-eye-eeg-artifact-correction](./ploechl-2012-eye-eeg-artifact-correction/card.md): ICA-based eye-artifact removal automated against eye-tracker timing, AUC > 0.99 against expert labels (`relevance: high`, 2012)
- [dimigen-ehinger-2021-deconvolution-eye-eeg](./dimigen-ehinger-2021-deconvolution-eye-eeg/card.md): regression-based deconvolution framework for FRPs that handles temporal overlap and saccade-parameter confounds (`relevance: high`, 2021)

## 6. Computational regressors of low-level features

- [riesenhuber-poggio-1999-hmax](./riesenhuber-poggio-1999-hmax/card.md): foundational hierarchical model with MAX-pooling capturing IT-cell invariance from V1-like building blocks (`relevance: low`, 1999)
- [khaligh-razavi-kriegeskorte-2014-deep-cnn-it](./khaligh-razavi-kriegeskorte-2014-deep-cnn-it/card.md): supervised deep CNN best explains IT representational geometry across 37 candidate models (`relevance: low`, 2014)
- [kummerer-2016-deepgaze-ii](./kummerer-2016-deepgaze-ii/card.md): DeepGaze II uses VGG-19 features with a small readout to predict free-viewing fixations on the MIT300 benchmark (`relevance: low`, 2016)
- [hubel-wiesel-1962-receptive-fields-cat-v1](./hubel-wiesel-1962-receptive-fields-cat-v1/card.md): foundational simple/complex cell hierarchy and columnar V1 organization (`relevance: low`, 1962)

> Also part of this category: adelson-bergen-1985-spatiotemporal-energy (listed under its primary category 2 above).
