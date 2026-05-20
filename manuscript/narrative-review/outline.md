# Narrative Review Outline (TiCS Forum Review)

## Target

**Journal**: *Trends in Cognitive Sciences* (Cell Press)
**Article type**: Forum Review (the long-form review).
**Working title**: "Per-shot EEG during naturalistic film: a four-perspective developmental review"
**Backup titles**:
- "Four perspectives on shot-locked EEG in silent character animation"
- "Beyond language-model regressors: per-shot EEG of silent film in development"

## Format constraints (Cell Press / TiCS)

| Element | Target |
|---|---|
| Main text | ~3500-4000 words, excluding boxes, abstract, references, figure legends |
| Abstract | ~100-120 words, no citations |
| Highlights | 3-5 bullets, <= 85 characters each (Elsevier house style) |
| Trends Box | "Key recent developments", 1 box, ~200-250 words |
| Outstanding Questions Box | 5-7 forward-looking questions |
| Glossary | 10-15 defined terms |
| Figures | 4 (locked in epic plan) |
| References | ~80-100, numbered, Cell Press style |
| Boxes (optional content) | Up to 2 inline boxes for case studies (used here for Box 1: HBN-EEG R3 as the anchor cohort) |

## Section budget

| Section | Words | Cited cards (target) |
|---|---|---|
| Abstract | ~110 | 0 |
| 1. Introduction: the per-shot turn | ~450 | ~12 |
| 2. The four-perspective scaffold | ~600 | ~10 |
| 3. Psychophysics: the bottom-up floor | ~500 | ~12 |
| 4. Action: mu-band ERD and event segmentation | ~500 | ~12 |
| 5. Language: non-transfer plus silent-narrative sub-thread (split per F-review I5) | ~600 | ~15 |
| 6. Emotion: two predictions at different latencies | ~500 | ~14 |
| 7. Synthesis: integration, falsifiability, open questions | ~450 | ~6 |
| **Main-text total** | **~3610** | **~81** |
| Trends Box | ~230 | 0 (inline) |
| Outstanding Questions Box | n/a | 0 |
| Box 1 (HBN-EEG R3 anchor) | ~180 | ~5 |
| Glossary | ~600 (definitions, not counted in main) | 0 |
| Figure legends | ~400 (not in main count) | 0 |

Total main-text + Trends Box + Box 1 ~ 4020 words; comfortably inside the 4000-5000-word TiCS Forum Review window.

## Section sketches

### 1. Introduction — the per-shot turn (~450 words)

- Open with two-wave history: fMRI ISC -> EEG ISC.
- Frame the per-shot turn: iEEG cuts (Nentwich), event-segmentation HMM (Baldassano), hippocampal cut-vs-boundary (Ben-Yakov), Pixar shorts in development (Richardson-Saxe, Vanderwal, Petroni-Cohen).
- State the central claim: per-shot EEG in development viewing silent animation is the empty cell where four perspectives diverge.
- Preview the four perspectives.
- One-paragraph statement of method footprint (LLR partialling, ICA-only artifact rejection, no eye tracker).
- End with thesis sentence and a roadmap of the remaining sections.

### 2. The four-perspective scaffold (~600 words)

- One paragraph defending the scaffold as structural, not decorative (each perspective makes a different *kind* of prediction).
- Brief tour of the 15 themes from the science-map (compressed; expanded in Box 1).
- Forward-reference to Figure 1 (strand map).
- Forward-reference to Figure 4 (predictions table).

### 3. Psychophysics: the bottom-up floor (~500 words)

- Adelson-Bergen + V1 + divisive normalisation + MT/MST anchors.
- Nishimoto and Bartels: motion-energy alone reconstructs natural movies.
- Nentwich iEEG: motion outranks luminance/contrast in occipitoparietal cortex.
- VEP literature: LLR as the simplest scalp signature.
- Implication: per-shot LLR is the minimum partialling for any social-content claim.
- Eye-movement caveat: HBN has no synchronous eye tracker; ICA-only artifact rejection is the operating compromise.
- Forward-reference to Figure 2 (naturalness gradient).

### 4. Action: mu-band ERD and event segmentation (~500 words)

- Hari, Pineda, Oberman mu-band lineage.
- Saygin lesion + Johansson biological motion.
- Kilner: predictive-coding reformulation of mirror system; Hickok-style critique acknowledged (F-review I3).
- Event-segmentation theory: Zacks, Baldassano, Speer, Lerner.
- Hippocampal dissociation between within-event cuts and across-event boundaries (Ben-Yakov).
- Sliwa macaque two-agent network as motivation for single-agent vs two-agent contrast design.
- Implication: mu-band ERD is the strongest specific oscillatory prediction in the corpus, but extrapolation from human-hand-action observation to animated agents is untested in EEG.

### 5. Language: non-transfer plus silent-narrative sub-thread (~600 words)

Following F-review I5, split into two clearly separated sub-sections:

**5a. Language-model regressors are structurally non-transferable** (~250 words)
- Goldstein, Caucheteux, Schrimpf, Antonello, Heilbron, Toneva: word-alignment-dependent.
- Huth voxelwise semantic atlas: requires transcripts.
- N400 family: bridges to picture-context, but at the cost of dynamic stimulus.
- Apply F1 fix: "All seven Category-G language cards (12 corpus-wide) land at transfer-to-silent: no."
- Vision-side analogue (multimodal VLM embeddings, scene-difference deep features) does not yet exist in the corpus for scalp-EEG ERSP.

**5b. Silent-narrative neural correlates that do transfer** (~350 words)
- Castelli Heider-Simmel; Castelli autism.
- Vanderwal Inscapes (used by HBN itself).
- Naci Hitchcock as covert assessment.
- Lankinen silent-visual MEG ISC (the closest electrophysiological precedent with a deliberate silent-visual condition).
- Schroeder cross-modal phase alignment to event onsets — mechanism for shot-onset ERSP independent of speech.
- DMN narrative integration: Buckner, Simony, Yeshurun, Mar, Tamir.
- Forward-reference to Figure 3 (gap matrix).

### 6. Emotion: two predictions at different latencies (~500 words)

- Early visual-cortex emotion-schema: Kragel EmoNet, Saarimaki, Lindquist, Cowen-Keltner.
- Sub-second alpha desynchronisation: Schubring/Codispoti (apply F2 — verify and disambiguate authorship vs DOI).
- Frontal asymmetry tradition: Davidson, Coan-Allen, Reznik-Allen critique.
- Cuteness / baby-schema: Stoeckel (identity-level), Glocker (adult NAcc), Borgi (children 3-6).
- Mar narrative as social cognition; Richardson-Saxe Pixar pediatric ToM.
- Implication: two predictions, incompatible latencies and topographies; the LLR-partialled per-shot GLM adjudicates between them.

### 7. Synthesis: integration, falsifiability, open questions (~450 words)

- Apply F4: anchor case rebuilt around Petroni-Cohen 2018 (external precedent) + a class of partly-validated developmental EEG pipelines (internal feasibility). Drop the six-feature uniqueness list (move to Appendix or just to Box 1).
- Apply F5: pre-registerable topographic-and-band falsification region — central-rolandic (action) or frontal-asymmetric (emotion) confirms; left-frontotemporal (Lipkin language atlas as negative control) falsifies; null at pre-registered alpha falsifies by exhaustion.
- Apply I2: narrative-position objection (boy-only clusters in early-act setup; puppy-only in resolution); response is shot-index-in-narrative covariate + within-act stratified follow-up.
- Apply I1: drop wishlist commitments; only firm scheduled extensions get named.
- Close with the Outstanding Questions Box.

## Figures (built in Phase 2)

| Figure | Concept | Source |
|---|---|---|
| Fig 1 | Four-perspective strand map with theme overlap | `science-map.md`, four `*-ontology.md` |
| Fig 2 | Naturalness gradient (gratings -> Heider-Simmel -> animation -> live-action) crossed with developmental cohort coverage | `science-map.md` Theme 3, `dataset-hierarchy.md` |
| Fig 3 | Gap matrix: corpus features (cohort, modality, stimulus, regressor) x coverage | `gap-analysis.md`, `dataset-hierarchy.md` |
| Fig 4 | Predictions table: perspective x band x topography x falsification region | Sections 3-6 of this manuscript |

## Box 1: HBN-EEG R3 as the anchor cohort (~180 words)

Inline box, not displayed prominently. Describes the 184-subject 100 Hz BDF working set, 56-shot annotated stimulus, 20 boy-only / 15 puppy-only contrast, and the LLR partialling decision. Cites Petroni-Cohen 2018 as the external precedent and the EEGLAB AMICA + ICLabel pipeline (no specific software version in the body; cited in Glossary).

## Trends Box (~230 words)

Lists the recent developments that make the per-shot framing newly tractable:

- Whole-brain shot-cut response in adult iEEG (Nentwich 2023)
- HMM-based event-state recovery from fMRI (Baldassano 2017)
- Cross-sectional developmental EEG-ISC (Petroni 2018)
- Inscapes-style silent animation for MRI compliance (Vanderwal 2015)
- Multi-level cinematic-feature regression (Kauttonen 2015)
- Open developmental EEG releases (HBN-EEG, Studyforrest)

## Outstanding Questions Box (5-7 questions)

Draft questions:

1. Does per-shot EEG ERSP in a developmental cohort viewing silent animation survive partialling for log luminance ratio and motion energy at the 0-500 ms window?
2. Is mu-band ERD over central rolandic clusters elicited by animated-character action observation, as it is by hand-action observation in adults?
3. Does cuteness-driven affective response in children produce a sub-second EEG signature distinguishable from generic arousal in the alpha band?
4. What is the falsifiable topographic-and-band rejection region for the four-perspective ranking, and can it be pre-registered before group analysis?
5. Can a vision-side multimodal embedding regressor substitute for the language-model-surprisal regressor framework on silent stimuli?
6. Does the within-stimulus narrative position (three-act trajectory) explain condition-level effects that survive low-level partialling?
7. What is the residual saccade-locked variance contamination in shot-onset ERSP without a synchronous eye tracker, and at what scale does it affect inferences?

## Glossary terms (target 10-15)

- event-related spectral perturbation (ERSP)
- inter-subject correlation (ISC)
- log luminance ratio (LLR)
- adaptive mixture independent component analysis (AMICA)
- independent component classification (ICLabel)
- mu rhythm
- event-related desynchronisation (ERD)
- frontal alpha asymmetry
- default-mode network (DMN)
- theory of mind (ToM)
- temporal response function (TRF)
- baby schema
- naturalistic stimulus
- event segmentation
- temporal receptive window

## Reference policy

- Source: combine `research/collection/{psychophysics,action,language,emotion}/*.bib` into `manuscript/narrative-review/refs.bib`.
- Apply F2: verify DOI 10.1111/psyp.14438 authorship; reconcile `schubring-schupp-2023-alpha-emotion` cite-card slug with `Codispoti2023AlphabandOA` BibTeX entry. Choose the canonical authorship and align slug + body citation.
- Apply F3: remove uncited stray keys `Pessoa2010EmotionPA`, `Lerner2011TopographicMO`, `Chen2016SharedMR`, `Nelson2017NeurophysiologicalDO`. Sample 5-10 additional BibTeX keys against body citations to catch other strays.
- Numbering: Cell Press numbered citations in body; combine bib at compile time in Phase 5.

## Critical-finding mapping (F-review carry-forward)

| Self-review finding | Disposition in this scaffold | Phase enforced |
|---|---|---|
| F1 (Category-G cardinality 12 -> 7 with 12 corpus-wide) | Phrasing locked in Section 5a outline | Phase 3 draft |
| F2 (Schubring/Codispoti DOI) | refs.bib step verifies authorship | Phase 1 (this phase) |
| F3 (stray refs) | refs.bib step removes 4 known stray keys + samples for more | Phase 1 (this phase) |
| F4 (anchor case circular) | Anchor case rebuilt in Section 7 + Box 1 around Petroni + feasibility class | Phase 3 draft |
| F5 (falsifiability asymmetric) | Topographic-and-band rejection region named in Section 7 | Phase 3 draft |
| I1 (wishlist commitments) | Outline drops the soft commitments; only firm scheduled extensions appear | Phase 3 draft |
| I2 (narrative-position objection) | Added to Section 7 synthesis | Phase 3 draft |
| I3 (mu-system critique) | Section 4 names the critique tradition explicitly; weight on mu prediction tempered | Phase 3 draft |
| I4 (themes section cohesion) | Section 2 written with explicit bridge sentence to thesis | Phase 3 draft |
| I5 (language framing) | Section 5 split into 5a (non-transfer) + 5b (silent-narrative positive) | Phase 3 draft (outline already split) |
| S1 (event-state regressor) | Outstanding Questions Box only; not promised in main text | Phase 3 draft |
| S2 (ThePresent token) | Use *The Present* italicised throughout | Phase 3 draft |
| S3-S4 (sentence length, phrasing) | Copy-edit in Phase 4 | Phase 4 |
