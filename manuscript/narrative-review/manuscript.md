---
title: "Per-shot EEG during naturalistic film: a four-perspective developmental review"
short_title: "Per-shot EEG in development"
article_type: "Forum Review"
target_journal: "Trends in Cognitive Sciences"
authors:
  - name: "Seyed Yahya Shirazi"
    affiliation: 1
    email: "shirazi@ieee.org"
    orcid: ""
affiliations:
  - id: 1
    name: "Open Science Collective"
status: "draft scaffold (Phase 1)"
date: "2026-05-20"
word_budget:
  main_text: 4000
  abstract: 120
  highlights_chars_per_bullet: 85
  references_target: 80-100
---

<!-- Title is set in YAML front matter; the H1 is omitted to satisfy MD025. -->

## Highlights

<!-- TiCS Highlights: 3-5 bullets, <= 85 characters each (Cell Press / Elsevier house style). Verify lengths at Phase 5 assembly. -->

- Naturalistic-stimulus EEG has shifted from whole-clip ISC to shot-locked spectral metrics
- Four perspectives, psychophysics, action, language, emotion, diverge on per-shot predictions
- Language-model-as-regressor methods structurally cannot transfer to silent character animation
- Per-shot EEG ERSP in children viewing animation has no published precedent
- HBN-EEG Release 3 sits at this empty intersection and is positioned to test the predictions

## Abstract

<!-- ~110 words, no in-text citations. -->

[Phase 3 placeholder] One paragraph that opens with the two-wave history of naturalistic-stimulus neuroscience, names the per-shot turn enabled by intracranial cuts work and event-segmentation theory, states the central claim that four research perspectives (psychophysics, action, language, emotion) make divergent and partly-testable predictions about the 0 to 500 ms post-shot-onset EEG spectral perturbation window, identifies developmental cohorts viewing silent character animation as the empty cell that exposes the divergence, and previews the synthesis: psychophysics dominates the bottom-up variance and must be partialled, action makes the strongest specific oscillatory prediction, language enters as comparator-of-non-transfer plus a silent-narrative positive sub-thread, emotion supplies two predictions at different latencies and topographies.

## 1. Introduction: the per-shot turn

<!-- ~450 words, ~12 cite-card links. Cell Press numbered refs at compile time. -->

[Phase 3] Open with two-wave history: fMRI ISC ([Hasson2004IntersubjectSO]; [Hasson2010ReliabilityOC]); EEG ISC and correlated-component analysis ([dmochowski2012correlated]; [Ki2016AttentionSM]; [Cohen2016MemorableAN]; [Dmochowski2014AudiencePA]; [Madsen2022CognitivePO]). Frame the per-shot turn: whole-brain shot-cut iEEG ([Nentwich2023SemanticNM]); event-segmentation theory and HMM event-state recovery ([zacks2007event]; [baldassano2017event]; [speer2007narrative]); hippocampal cut-vs-boundary dissociation ([Ben-Yakov2018TheHF]); developmental cinematic fMRI ([Richardson2018DevelopmentOT]; [Vanderwal2015InscapesAM]); cross-sectional EEG-ISC across ages ([Petroni2018TheVO]). Central claim and four-perspective preview. Brief methods footprint (LLR partialling; ICA-only artifact rejection given no synchronous eye tracker in HBN-EEG R3). Roadmap.

## 2. The four-perspective scaffold

<!-- ~600 words. Bridge from Section 1 thesis -> theme catalogue -> Section 3. (Apply I4 bridge sentence.) -->

[Phase 3] Defend the four-perspective scaffold as structural rather than decorative: each perspective makes a different *kind* of prediction (regressor-of-no-interest, band-and-topography hypothesis, regressor that structurally cannot apply, exploratory contrast). Compressed tour of the 15 corpus themes (Theme 1: ISC as reliability metric; Theme 2: event boundaries and segmentation; Theme 3: naturalness gradient; Theme 4: low-level feature regressors; Theme 5: time-resolved EEG/MEG; Theme 6: mu rhythm and action observation; Theme 7: affective dynamics; Theme 8: social cognition and ToM; Theme 9: language models as comparator; Theme 10: audiovisual integration; Theme 11: free-viewing EEG with eye coregistration; Theme 12: pet, animal, and baby-schema; Theme 13: developmental neuroimaging; Theme 14: distributed multivariate signatures; Theme 15: predictive processing). Forward-reference to Figure 1 (strand map) and Figure 4 (predictions table). Bridge sentence to Section 3: "Sections 3 to 6 develop the four perspectives in order, naming the band-by-topography signature each makes and the falsification region attached to each."

## 3. Psychophysics: the bottom-up floor

<!-- ~500 words. -->

[Phase 3] Adelson-Bergen spatiotemporal energy ([Adelson1985SpatiotemporalEM]); V1 receptive fields ([Hubel1962ReceptiveFB]); divisive normalisation ([Carandini2011NormalizationAA]); MT/MST motion machinery ([Born2005StructureAF]; [Bartels2008NaturalVR]); natural-image statistics ([Bell1997TheC]; [Simoncelli2001NaturalIS]). Nishimoto movie reconstruction from motion-energy features ([Nishimoto2011ReconstructingVE]). Nentwich iEEG triple-regressor: motion outranks luminance/contrast in occipitoparietal cortex ([Nentwich2023SemanticNM]). Clinical VEP supports LLR as the simplest scalp signature ([Tobimatsu2006StudiesOH]). Eye-movement caveat: FRP and deconvolution depend on synchronous eye tracking ([Dimigen2011CoregistrationOE]; [Plöchl2012CombiningEA]; [Dimigen2021RegressionbasedAO]); gaze coherence varies with stimulus class ([Dorr2010VariabilityOE]); HBN-EEG R3 has no synchronous eye tracker, so ICA-only artifact rejection through AMICA and ICLabel is the operating compromise. Implication: per-shot LLR is the minimum partialling for any social-content claim; motion-energy regression is the named first follow-up. Forward-reference to Figure 2 (naturalness gradient).

## 4. Action: mu-band ERD and event segmentation

<!-- ~500 words. -->

[Phase 3] Hari, Pineda, Oberman mu-band lineage ([hari1998action]; [pineda2005mu]; [oberman2007mirror]). Saygin lesion-symptom mapping for biological motion ([saygin2007sts]; [johansson1973biological]). Predictive-coding reformulation ([kilner2007predictive]; [rizzolatti2004mirror]; [iacoboni2009mirror]). Apply I3: name the mirror-system critique tradition explicitly, including Hickok-style objections, and temper the weight on the mu-band prediction accordingly. Event-segmentation theory ([zacks2007event]; [baldassano2017event]; [speer2007narrative]; [lerner2011temporal]; [chen2017shared]). Hippocampal dissociation between within-event camera cuts and across-event narrative boundaries ([Ben-Yakov2018TheHF]); behavioural foundation that viewers segment edited films along cuts independent of dialogue ([Magliano2011TheIO]). Macaque two-agent network ([sliwa2017macaque]) as motivation for the single-agent vs two-agent design choice. Heider-Simmel and naturalness-gradient placement of character animation ([castelli2000heider]; [hasson2010natural]). Klin biological-motion autism findings as a moderator candidate ([klin2002visual]; [klin2009biological]). Implication: mu-band ERD over central rolandic clusters is the strongest specific oscillatory prediction in the corpus, but the extrapolation from human-hand-action observation to animated agents is untested at scalp-EEG resolution.

## 5. Language: comparator of non-transfer plus silent-narrative sub-thread

<!-- ~600 words. Per F-review I5, split into two clearly separated sub-sections. -->

### 5a. Language-model regressors are structurally non-transferable

<!-- ~250 words. -->

[Phase 3] Goldstein word-by-word ECoG and contextual embeddings ([Goldstein2022SharedCP]); Caucheteux transformer-to-brain mapping ([Caucheteux2022BrainsAA]; [Caucheteux2023EvidenceOA]); Schrimpf next-word-prediction drives brain-score ([schrimpf2021the]); Toneva BERT attention-head ablations ([toneva2019interpreting]); Antonello LM-parameter scaling laws ([Antonello2023ScalingLF]); Heilbron hierarchy of MEG audiobook surprisal predictions ([Heilbron2020AHO]); Huth voxelwise semantic atlas ([Huth2016NaturalSR]). Each method depends on speech-onset alignment to spoken or read transcripts. The N400 family bridges to picture-context paradigms at the cost of dynamic stimulus ([Kutas2011ThirtyYA]; [DeLong2005ProbabilisticWP]). Nelson and colleagues' phrase-structure-building intracranial work is intracranial, reading-based, and word-aligned ([Nelson2017NeurophysiologicalDO]).

Apply F1: all seven Category-G language-strand cards (and 12 cards corpus-wide) land at `transfer-to-silent: no`. Body prose: "all seven Category-G language cards (and 12 cards corpus-wide) carry `transfer-to-silent: no`". The vision-side analogue, multimodal vision-language model embeddings or scene-difference deep-network features as continuous regressors, does not yet exist in the corpus for scalp-EEG ERSP. Lipkin frontotemporal language network atlas ([Lipkin2022ProbabilisticAF]) is included as the negative-control region of interest in the falsification region of Section 7.

### 5b. Silent-narrative neural correlates that do transfer

<!-- ~350 words. -->

[Phase 3] Castelli Heider-Simmel silent geometric animation engages mPFC, TPJ, STS ([Castelli2000MovementAM]; [castelli2000heider]); same paradigm in autism shows reduced engagement ([Castelli2002AutismAS]). Vanderwal Inscapes silent abstract animation improves MRI compliance and is used by HBN itself ([Vanderwal2015InscapesAM]). Naci Hitchcock excerpt as a covert assessment ([Naci2014ACN]). Lankinen silent-visual MEG ISC with a deliberate silent condition ([Lankinen2014IntersubjectCO]) is the closest electrophysiological precedent. Studyforrest infrastructure ([Hanke2014AH7]). Schroeder cross-modal phase alignment to attended event onsets is a mechanistic frame for shot-onset ERSP independent of speech ([Schroeder2009LowfrequencyNO]); Senkowski cross-modal gamma and low-frequency phase coupling ([Senkowski2008CrossmodalBT]). Van Wassenhove visual-speech facilitation does not transfer because *The Present* has no dialogue ([Wassenhove2005VisualSS]). DMN narrative integration: Buckner, Simony, Yeshurun, Mar, Tamir ([Buckner2008TheBD]; [Simony2016DynamicRO]; [Yeshurun2017SameSD]; [Mar2011TheNB]; [Tamir2016ReadingFA]). Implication: silent-narrative engages mPFC, TPJ, STS, and DMN; their EEG IC-cluster analogues are the search regions for the per-shot ERSP signal. Forward-reference to Figure 3 (gap matrix).

## 6. Emotion: two predictions at different latencies

<!-- ~500 words. -->

[Phase 3] Early visual-cortex emotion-schema response: Kragel EmoNet ([Kragel2018EmotionSA]); Saarimaki MVPA emotion decoding ([Saarimäki2016DiscreteNS]); Cowen-Keltner 27-emotion taxonomy ([Cowen2017SelfreportC2]); Lindquist meta-analysis arguing distributed signatures ([Lindquist2012TheBB]); Wager neurologic pain signature ([Wager2013AnFN]). Sub-second alpha desynchronisation: Codispoti and colleagues (2023) review of alpha-band oscillations during emotional picture perception, Psychophysiology DOI 10.1111/psyp.14438 ([Codispoti2023AlphabandOA]). (Apply F2: body prose names Codispoti and colleagues, not Schubring.) Frontal asymmetry tradition: Davidson ([Davidson2000AffectiveSP]); Coan-Allen ([Coan2004FrontalEA]); Reznik-Allen reliability critique ([Reznik2018FrontalAA]). Cuteness and baby-schema: Stoeckel mother-child-dog identity-level pair-bonding ([Stoeckel2014PatternsOB]); Glocker baby-schema NAcc reward in nulliparous adults ([Glocker2009BabySM]); Borgi parametric cuteness in 3-6 year olds with puppies and kittens ([Borgi2014BabySI]). Richardson-Saxe pediatric ToM-network development with Pixar shorts ([Richardson2018DevelopmentOT]) is the load-bearing developmental anchor. Mar narrative comprehension as social-cognitive activity ([Mar2011TheNB]); Tamir fiction-reading and DMN ([Tamir2016ReadingFA]); Singer empathy and observed pain ([Singer2004EmpathyFP]); Zaki-Ochsner tripartite empathy model ([Zaki2012TheNO]); Nummenmaa emotion-modulated ISC ([Nummenmaa2012EmotionsPS]); Schmaelzle ISC as audience captivation ([Schmälzle2020TheCB]); Kauttonen multi-level cinematic feature fMRI ([Kauttonen2015OptimizingMF]). Regional reviews flesh out the vocabulary ([LeDoux2010EmotionalCT]; [Sergerie2008TheRO]; [Etkin2011EmotionalPI]). Implication: two predictions sit at incompatible latencies and topographies; the LLR-partialled per-shot GLM adjudicates between them.

## 7. Synthesis: integration, falsifiability, open questions

<!-- ~450 words. Apply F4, F5, I1, I2. -->

### 7.1 Integration

[Phase 3] Restate the four-perspective synthesis: psychophysics partialled; action provides the most specific positive prediction (mu-band ERD over central rolandic clusters); language is structurally non-transferable for LM regressors but supplies cortical priors for silent narrative; emotion provides two predictions, one early and occipital (Codispoti and colleagues; Kragel) and one later and frontal-asymmetric (Davidson; Borgi-anchored cuteness response). Distributed-multivariate-signature framing ([Lindquist2012TheBB]; [chen2017shared]) supports IC-cluster-level analyses over single-IC decoding.

### 7.2 Anchor case (apply F4)

External precedent: Petroni and colleagues 2018 recorded 64-channel EEG at 500 Hz from 114 viewers across ages 6 to 44 during passive viewing of six naturalistic videos including animated and live-action shorts ([Petroni2018TheVO]). They did not analyse shot-onset ERSP and did not factor stimulus-side regressors, but they demonstrated that scalp-EEG signal exists during developmental naturalistic viewing. They are the closest external existence proof in the four-strand corpus that the planned measurement class is feasible in adjacent territory.

Internal feasibility: a partly-validated developmental EEG pipeline on HBN-EEG R3 (BIDS import, 1 Hz high-pass filter, conditional cleanline gated by Nyquist, `clean_rawdata` channel rejection, AMICA + ICLabel + dipfit5, `std_precomp` ERSP) brings 184 subjects of 100 Hz BDF to the epoching stage. See Box 1.

The two anchor assertions are independent. The six-feature uniqueness conjunction from earlier versions of this argument is moved to Box 1 as a descriptive surface attribute, not as evidential support for the direction.

### 7.3 Falsifiability (apply F5)

A topographic-and-band rejection region for the four-perspective ranking can be pre-registered before group analysis. Central-rolandic mu-band (electrodes C3, Cz, C4; 8 to 13 Hz) confirms the action prediction; frontal-asymmetric alpha (electrodes F3, F4; 8 to 13 Hz) confirms the emotion prediction. A surviving cluster in left-frontotemporal IC space, overlapping the Lipkin language-network atlas ([Lipkin2022ProbabilisticAF]) used here as a negative-control mask, falsifies the four-perspective ranking by relocating the surviving signal into a perspective the thesis claims should not transfer. A null result on the LLR-partialled GLM at a pre-registered cluster-level alpha (p < 0.05 corrected by mass-univariate cluster-based permutation; the mTRF MATLAB toolbox framework supplies the precedent, [Crosse2016TheMT]) also falsifies the four-perspective ranking, by localising per-shot ERSP variance entirely to bottom-up features in this cohort.

### 7.4 Narrative-position objection (apply I2)

Boy-only and puppy-only shots may differ on three-act narrative position; boy-only clusters in the early-act setup, puppy-only clusters in the late-act resolution. Any boy-vs-puppy ERSP difference may therefore be confounded with prediction-error or arousal trajectories driven by narrative position. The corpus-grounded response is to add shot-index-in-narrative as a continuous covariate in the group GLM, and to fit a within-act stratified analysis as a named follow-up. Both are tractable from the existing shot-event annotation without new behavioural coding ([Magliano2011TheIO]; [zacks2007event]; [baldassano2017event]; [chen2017shared]).

### 7.5 Open questions

The Outstanding Questions Box (separate display element) names the forward-looking adjudication targets.

## Box 1: HBN-EEG Release 3 as the anchor cohort

<!-- ~180 words, inline box. -->

[Phase 3] The Healthy Brain Network electroencephalography (HBN-EEG) Release 3 cohort recruits 5- to 21-year-old participants in a research-grade research hospital paediatric setting and records 128-channel HydroCel Geodesic Sensor Net during passive viewing of the 3.5-minute Pixar short *The Present* (2014). The local working set is 184 subjects at 100 Hz BDF (a Nyquist-aware downsample of the original 500 Hz). The 56 stimulus-side shots carry per-shot `onset`, `duration`, `LLR`, `has_boy`, and `has_puppy` annotations; after invalidating 3 high-drift rows (`match_diff_s > 1.0 s`), 49 rows are trusted, yielding 20 boy-only and 15 puppy-only shots for the mutually exclusive single-agent contrast. Six surface features distinguish this design: (1) per-shot scalp EEG, (2) ERSP at 0 to 500 ms, (3) animated character agents, (4) developmental cohort, (5) silent stimulus, (6) per-shot LLR as continuous nuisance regressor. The list is descriptive rather than evidential; the anchor case is carried by Petroni and colleagues 2018 plus the partly-validated developmental EEG pipeline.

## Trends Box: recent developments enabling the per-shot framing

<!-- ~230 words, key recent developments. -->

[Phase 3] Recent advances make the per-shot framing newly tractable.

- **Whole-brain shot-cut response in adult intracranial EEG.** Nentwich and colleagues 2023 recorded 6328 contacts in 23 patients across 43.6 minutes of film clips and regressed responses against optical-flow magnitude, saccade onsets, and film-cut onsets simultaneously, finding whole-brain saccade- and cut-locked responses with motion concentrated in occipitoparietal cortex ([Nentwich2023SemanticNM]).
- **Hidden-Markov-model recovery of event states from fMRI.** Baldassano and colleagues 2017 recovered a hierarchy of event boundaries from Sherlock-movie fMRI, with hippocampal boundary signals predicting subsequent free recall ([baldassano2017event]).
- **Cross-sectional developmental EEG-ISC.** Petroni and colleagues 2018 reported whole-clip EEG-ISC reliability across ages 6 to 44 during passive viewing of six naturalistic videos, peaking in childhood ([Petroni2018TheVO]).
- **Silent abstract animation for MRI compliance.** Vanderwal and colleagues 2015 built Inscapes, used by HBN itself, with reliable network-level activity ([Vanderwal2015InscapesAM]).
- **Multi-level cinematic-feature regression.** Kauttonen and colleagues 2015 regressed multi-level cinematic features against fMRI ISC, supplying a methodological template for shot-level feature annotation ([Kauttonen2015OptimizingMF]).
- **Open developmental EEG releases.** HBN-EEG and Studyforrest ([Hanke2014AH7]) make large-N developmental datasets available for naturalistic-stimulus analysis at unprecedented scale.

## Outstanding Questions Box

<!-- 5-7 forward-looking questions. -->

1. Does per-shot EEG spectral perturbation in a developmental cohort viewing silent animation survive partialling for log luminance ratio and motion energy at the 0 to 500 ms window?
2. Is mu-band event-related desynchronisation over central rolandic clusters elicited by animated-character action observation, as it is by hand-action observation in adults?
3. Does cuteness-driven affective response in children produce a sub-second EEG signature distinguishable from generic arousal in the alpha band, and is the signature compatible with frontal asymmetry at sub-second timescales given the meta-analytic reliability concerns?
4. Can a topographic-and-band rejection region for the four-perspective ranking be pre-registered before group analysis, and is the central-rolandic-versus-frontal-asymmetric-versus-language-network discrimination operationalisable from EEG IC clusters?
5. Can a vision-side multimodal embedding regressor substitute for the language-model-surprisal regressor framework on silent stimuli, and what method bridges the syntactic and semantic granularity of the language-model framework into vision?
6. Does within-stimulus narrative position (three-act trajectory) explain condition-level effects that survive low-level partialling in single-stimulus designs, and how should shot-index-in-narrative be operationalised as a regressor?
7. What is the residual saccade-locked variance contamination in shot-onset EEG ERSP without a synchronous eye tracker, and at what cohort size does ICA-only artifact rejection become sufficient?

## Glossary

<!-- 10-15 defined terms. Each definition <= 50 words. -->

**Event-related spectral perturbation (ERSP)**: A time-frequency representation of the change in spectral power (and optionally inter-trial phase coherence) at each frequency and latency relative to an event, computed by averaging single-trial power spectrograms after subtracting a baseline window.

**Inter-subject correlation (ISC)**: The Pearson correlation between time-courses of different participants viewing the same stimulus, computed voxel-wise (fMRI) or component-wise (EEG/MEG); a stimulus-locked reliability metric.

**Log luminance ratio (LLR)**: The base-10 logarithm of the ratio of mean luminance in the first post-shot frame to the mean luminance in the last pre-shot frame; a per-shot stimulus-side regressor of the visual transient at shot onset.

**Adaptive mixture independent component analysis (AMICA)**: A multi-model extension of independent component analysis that estimates a mixture of ICA decompositions, used in EEGLAB-style pipelines for artifact-resistant source separation.

**IC classification (ICLabel)**: An automated classifier that labels independent components as brain, muscle, eye, heart, line noise, channel noise, or other; used to retain brain components and reject artifactual ones.

**Mu rhythm**: An 8 to 13 Hz oscillation over central rolandic electrodes (C3, Cz, C4 in the 10-20 system) that desynchronises during motor execution and during observation of others' actions.

**Event-related desynchronisation (ERD)**: A decrease in spectral power in a specific frequency band time-locked to an event, interpreted as cortical activation in the band's reference resting state.

**Frontal alpha asymmetry**: The difference between right and left frontal alpha-band (8 to 13 Hz) power, traditionally framed as an approach-withdrawal index; recent meta-analyses report smaller effects and reliability concerns.

**Default-mode network (DMN)**: A set of cortical regions including medial prefrontal cortex, posterior cingulate cortex, and lateral parietal cortex that show coordinated activity during internally directed cognition, narrative comprehension, and rest.

**Theory of mind (ToM)**: The cognitive capacity to attribute mental states (beliefs, desires, intentions) to self and others; localised to a network including the temporo-parietal junction and medial prefrontal cortex.

**Temporal response function (TRF)**: A linear filter that maps a continuous stimulus feature to a continuous neural response, fit via regularised regression; the methodological state of the art for continuous-EEG-to-stimulus analysis.

**Baby schema**: A set of infantile physical features (large head, large eyes, round cheeks) that elicit attentional, affective, and caregiving responses; characterised by Lorenz and parametrically modulated in modern neuroimaging.

**Naturalistic stimulus**: A continuous, ecologically valid stimulus (typically a film, audiobook, or video game) presented to participants without trial-by-trial structuring, eliciting brain dynamics that differ qualitatively from those evoked by isolated controlled events.

**Event segmentation**: The cognitive process of parsing continuous experience into discrete events at moments of high prediction error, organised hierarchically from fine-grained to coarse-grained boundaries.

**Temporal receptive window**: The span of preceding time over which a brain region integrates information; ranges from milliseconds in primary sensory cortex to tens of seconds in default-mode regions.

## Figure legends

<!-- Final legends written in Phase 3; placeholders here for word-budget tracking. -->

**Figure 1.** [Phase 3] Four-perspective scaffold with theme overlap. Psychophysics, action, language, and emotion perspectives intersect through 15 corpus themes; arrows denote prediction direction.

**Figure 2.** [Phase 3] Naturalness gradient (controlled gratings -> Heider-Simmel triangles -> abstract animation [Inscapes] -> character animation [*The Present*, Pixar shorts] -> live-action film) crossed with developmental cohort coverage from the corpus.

**Figure 3.** [Phase 3] Gap matrix: corpus coverage by feature (cohort, modality, stimulus class, regressor type, temporal grain). Empty cells in the developmental EEG ERSP row identify the principal gap addressed by the planned design.

**Figure 4.** [Phase 3] Predictions table-figure: each perspective by band, topography, latency, and pre-registered falsification region.

## References

References are managed in `refs.bib` (94 entries after F3 stray-key removal). Cell Press numbered style is applied at Phase 5 assembly. Body cite-card slugs are bracketed in this scaffold (e.g., `[Petroni2018TheVO]`) and resolved against `refs.bib` at compile time.

Note on F2: the body text cites the alpha-band-and-emotion review under Codispoti and colleagues (2023), Psychophysiology, DOI 10.1111/psyp.14438; the internal corpus slug `schubring-schupp-2023-alpha-emotion` is retained for cross-reference stability inside the research collection but does not appear in published prose.
