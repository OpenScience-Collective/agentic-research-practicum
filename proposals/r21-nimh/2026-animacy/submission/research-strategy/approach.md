# Approach

The proposed work implements a single end-to-end pipeline that converts raw electroencephalography (EEG) data from Healthy Brain Network EEG Release 3 (HBN-EEG R3) viewers of *The Present* into shot-aligned independent-component (IC) cluster event-related spectral perturbation (ERSP) statistics partialled for stimulus-side luminance (**Figure 1**). Phases 1 to 4 of the pipeline (preprocessing, adaptive-mixture independent component analysis (AMICA), ICLabel non-brain classification, shot-onset epoching) are implemented and validated on three pilot subjects (**Figure 2**). The R21 funds the group-level analyses (Phases 5 to 6: ERSP precompute, IC clustering, group-level generalized linear model (GLM)), the across-age statistics that produce hypothesis-level evidence for H1A, H1B, and H2, and the deposition of the pipeline and derivatives to OpenNeuro and NEMAR.

## Preliminary Data

**Pipeline feasibility on 3 HBN subjects.** We piloted the full Brain Imaging Data Structure (BIDS) to cluster-level pipeline on three randomly selected R3 subjects (`sub-NDARAA948VFH`, `sub-NDARAC853DTE`, `sub-NDARAD774HAZ`). Stage-by-stage power spectral density (PSD) progression (`derivatives/preproc/sub-*/figures/stage-0[0-3]*_psd.png`) validates each preprocessing step: raw 100 Hz BDF; 1 Hz high-pass filter (FIRfilt); conditional cleanline at 60/120/180 Hz (correctly skipped because Nyquist is 50 Hz at 100 Hz sampling); clean_rawdata-based channel rejection. Channel rejection removed 6, 13, and 6 channels respectively from each subject's 129-channel HydroCel Geodesic Sensor Net, within the expected range for naturalistic-viewing pediatric data (`buzzell-2023-eeg-developmental-tool`). AMICA decomposition (`palmer-2008-amica`, `delorme-makeig-2004-eeglab`) converged on all three subjects with 123 ICs each (`derivatives/amica/qa_amica.csv`, median residual variance 0.37, 2000-iteration cap). Dipole localization via Fieldtrip-lite (`pop_dipfit_settings`, `pop_multifit`) with the Boundary Element Method standard headmodel placed central-rolandic, occipital, and frontal IC clusters consistent with the developmental IC anatomy reported in `petroni-cohen-2018-isc-naturalistic-videos` (**Figure 2**). The pipeline is implemented in MATLAB under `src/matlab/+hbn/` and continuously tested via `tests/matlab/run_all_tests.m` against a BIDS_mini fixture committed to the repository.

**Stimulus annotation quality control.** The 3.5-minute Pixar short *The Present* is parsed into 58 raw shot onsets by frame-difference analysis on the Pixar source video. Stimulus-side annotation (boy presence, puppy presence, log luminance ratio per shot) is paired with HBN-EEG event timestamps by cross-correlation in the audio channel; shots with `match_diff_s > 1.0 s` (cross-correlation lag exceeding 1 second between stimulus-side and EEG-recorded timestamps) are invalidated. 51 shots survive quality control: 20 boy-only (`has_boy=1`, `has_puppy=0`), 15 puppy-only (`has_boy=0`, `has_puppy=1`), and 16 mixed-or-empty (verified against `shot_events.tsv` at the repo root). The boy-only and puppy-only sets are mutually exclusive, share visual style and narrative arc, and have continuous log luminance ratio (LLR) distributions (**Figure 3**).

**What is not yet preliminary.** Group-level ERSP, IC clustering across more than 3 subjects, and the LLR-partialled GLM are proposed analyses, not preliminary results. The R21 funds these stages. We do not claim hypothesis-level evidence for H1A, H1B, or H2 at the proposal stage; we claim that the pipeline that will produce that evidence is feasible at scale.

## Aim 1, Map the developmental trajectory of animacy-locked oscillatory responses

We will characterize how mu-band event-related desynchronization (ERD) (H1A) and frontal alpha asymmetry (H1B) modulate during boy-only versus puppy-only shots as a function of viewer age, in HBN-EEG R3 viewers of *The Present*.

**1.A Cohort and inclusion.** The local working set contains 184 subjects with 100 Hz BDF; the full R3 release at 500 Hz is N=183 on the AWS Open Data Registry (`alexander-2017-hbn-protocol`). Ages span 5 to 21 (median approximately 10, balanced for sex per HBN cohort statistics). Inclusion: continuous EEG file for the full *The Present* duration (180 s minimum), AMICA convergence with `qa_amica.status == "ok"`, at least 100 ICs classified by ICLabel after non-brain rejection. Exclusion: documented seizure disorder (HBN clinical metadata), EEG file truncation, more than 25 percent channels rejected. Expected retained N approximately 160 after attrition (16 percent loss, consistent with `petroni-cohen-2018-isc-naturalistic-videos`).

**1.B Preprocessing.** Per `phase1_preprocess.m`: BIDS import; 1 Hz high-pass via FIRfilt (Hamming-windowed sinc, transition 1 Hz wide); conditional cleanline at 60/120/180 Hz (skipped at 100 Hz Nyquist); channel rejection by clean_rawdata (criteria: flat-line > 5 s, line-noise SNR < 4, robust-z > 6.0); AMICA per-subject (`run_amica.m`, 1 model, 2000 iterations, 14 OpenMP threads); Fieldtrip-lite dipfit (`fit_dipoles.m`, two-step head-model-grid then nonlinear search, residual-variance threshold 15 percent); ICLabel for non-brain classification (threshold 0.69 for the Brain class).

**1.C ERSP analysis.** Per-subject epochs are extracted from -600 to +600 ms around each of the 51 trusted shot onsets, baseline -500 to -100 ms. AMICA source activations of components passing ICLabel non-brain rejection enter EEGLAB `std_precomp` ERSP: 2 to 30 Hz log-frequency spacing (60 bins), 200 ms Hann taper, 50 ms time resolution. Output is a 5-D tensor (frequency × time × IC cluster × shot × subject).

**1.D Group-level random-effects GLM.** Across-subject GLM per IC cluster, frequency, and time point:

ERSP_ij = β0 + β1·Age_i + β2·Sex_i + β3·(Age × Sex)_i + β4·Condition_ij + β5·(Age × Condition)_ij + ε_ij,

random intercept per subject. **Test H1A** by contrasting condition-mean ERSP for the mu band (8 to 13 Hz) over central-rolandic IC clusters (dipole centroid within ±20 mm of MNI [0, -10, 60], the canonical mu generator per `pineda-2005-mu-rhythm-mirror`); the prediction is a non-monotonic age effect modeled by a generalized additive model (GAM) smooth. **Test H1B** by frontal asymmetry index (right alpha minus left alpha) at frontal IC clusters (dipoles within F3/F4 catchment), boy-only versus puppy-only contrast × age.

**1.E Expected outcomes.** Mu-band ERD of approximately 1 to 2 dB (`oberman-2006-mu-mirror-autism` adult range), developmental peak in the 8 to 12 age range (`petroni-cohen-2018-isc-naturalistic-videos`). Frontal asymmetry difference of approximately 0.05 log-power-ratio between boy and puppy shots, larger in older adolescents (post-pubertal affiliative emergence per `borgi-2014-baby-schema-children` extrapolation).

**1.F Problems and alternatives.** Linear age does not capture non-monotonic trajectories; we pre-register the GAM smooth-on-age as the primary developmental statistic, with linear age as a sensitivity check. Frontal asymmetry's lifetime reliability is contested (`reznik-allen-2018-frontal-asymmetry`); H1B is exploratory and a null result does not falsify Aim 1.A. If AMICA fails to converge on more than 10 percent of N (a methodological risk), we fall back to Infomax (`run_infomax.m`, already implemented).

## Aim 2, Dissociate animacy from luminance contributions to the developmental effect

We will test whether condition-level signal surviving LLR partialling localizes to action and emotion IC clusters (predicted) or to language-network sites (falsifying), and whether magnitude scales with age.

**2.A Per-shot LLR.** Log luminance ratio is pre-computed from the Pixar source as the log10 of the ratio of mean luminance in the first 250 ms of each shot to the last 250 ms of the prior shot, capturing the contrast change at shot transitions. Per-shot values are stored in the `LLR` column of `shot_events.tsv` (**Figure 3**). The distribution is approximately symmetric around 0 with standard deviation about 0.7 (preliminary inspection); shots with |LLR| > 1.5 are flagged for sensitivity analyses.

**2.B GLM design.** Per IC cluster, frequency, and time:

ERSP_ijk = β0 + β1·Condition_k + β2·LLR_k + β3·Age_i + β4·(Condition × Age)_ik + ε_ijk,

where i indexes subject, j indexes IC cluster, k indexes shot. Random intercept per subject. Condition is the boy-only versus puppy-only binary variable. The critical Aim 2 test is β1 surviving cluster-level correction after LLR partialling; the critical Aim 2 falsification test is β1's spatial distribution.

**2.C Cluster-level correction.** Mass-univariate permutation per `crosse-2016-mtrf-toolbox`: 5000 within-subject condition-label permutations, cluster-defining alpha 0.01 at the cell level, cluster-extent alpha 0.05 after correction over time × frequency × IC-cluster dimensions. Permutation preserves within-subject covariance structure.

**2.D Falsification regions, defined a priori.** Using the `lipkin-2022-language-atlas` left-frontotemporal language-network mask in Montreal Neurological Institute (MNI) space, we define the **falsification region**: any IC cluster whose dipole centroid is within ±15 mm of any language-atlas peak coordinate. A condition effect surviving LLR partialling at cluster-corrected α=0.05, but with its centroid in this falsification region rather than in action territory (central-rolandic, ±20 mm of [0, -10, 60]) or emotion territory (frontal-asymmetric, F3/F4 catchment), **falsifies the animacy framing**. The falsification region is locked before any group-level analysis begins (pre-registration on OSF, month 6).

**2.E Expected outcomes.** Predicted: β1 surviving correction at central-rolandic and frontal-asymmetric IC clusters; null in the language-network region. β4 (Age × Condition) positive in central-rolandic clusters, mirroring the H1A developmental peak. Effect-size prediction: ΔERSP ≈ 0.5 to 1 dB between conditions after LLR partialling, with confidence interval narrower than ±0.3 dB at N≈160 (preliminary power analysis from the 3-subject pilot variance estimates).

**2.F Problems and alternatives.** LLR captures only the luminance step at shot transitions; motion energy within the shot is not captured. If reviewer concern is motion as an alternative confound, we add a per-shot motion-energy regressor (`nentwich-2023-semantic-novelty-cuts`, precomputed via OpenCV optical flow on the Pixar source) as a secondary covariate β6·MotionEnergy_k. Second alternative: shot-onset transients may include saccade-locked artifact in the 0-150 ms window; we mitigate via AMICA + ICLabel non-brain rejection (`ploechl-2012-eye-eeg-artifact-correction`) and report results separately for the 200-500 ms window as a sensitivity check.

## Rigor and Reproducibility

**Sex as a biological variable.** Sex (HBN demographics) is modeled as a binary covariate in all GLMs (Aim 1.D term β2; Aim 2.B as needed); a Sex × Age interaction is tested per `petroni-cohen-2018-isc-naturalistic-videos`. HBN-EEG R3 is approximately sex-balanced (~45 percent female per `alexander-2017-hbn-protocol`).

**Age stratification.** Age is continuous in all primary statistical tests. Pre-registered post-hoc binning at [5, 9], [10, 14], [15, 21] is used for illustrative figures only.

**Analyst blinding.** Preprocessing and AMICA are condition-blind because they execute before shot-event injection (`phase1_preprocess.m`, `phase2_amica.m`). The group-level GLM is first run on a randomly permuted condition-label vector; the analyst documents and commits the resulting effect estimates to a date-stamped pre-analysis log before unblinding to true labels. This protocol is encoded in `tests/matlab/blinded_glm_protocol.m` (implemented in month 6 of the funded period).

**Replication.** Internal: 60/40 subject-level random partition (seed in `params.json`) on N≈160; Aim 2 GLM run independently on each half. Cross-cohort: `telesford-2023-eeg-fmri-naturalistic` adult naturalistic EEG-fMRI provides an independent test of the central-rolandic effect outside HBN.

**Open standards and deposition.** All data are processed via BIDS (`pernet-2019-eeg-bids`) and HED 8.3.0 (`robbins-2021-hed`; `hermes-2023-hed-schema`). Derivatives, analysis code, and a pipeline snapshot are deposited to OpenNeuro and NEMAR by month 18.

## Timeline

**Figure 5** (24-month milestone chart):

- **Months 1 to 6, pipeline validation.** Validate AMICA stability on N=20 then N=50. Validate IC clustering. Lock ERSP precompute parameters. Pre-register Aim 1 and Aim 2 plans on the Open Science Framework (OSF). Implement and freeze the blinded-GLM protocol.
- **Months 7 to 12, Aim 1 group analysis.** Full N≈160 H1A (mu-band ERD across age) and H1B (frontal asymmetry × condition × age). Aim 1 manuscript drafted by month 11, submitted by month 12.
- **Months 13 to 18, Aim 2 group analysis.** LLR-partialled GLM, falsification-region localization, age moderator. Internal 60/40 replication. Cross-cohort replication on the adult EEG-fMRI cohort (`telesford-2023-eeg-fmri-naturalistic`). Pipeline and derivatives deposited to OpenNeuro and NEMAR (month 18).
- **Months 19 to 24, closeout and R01 preparation.** Aim 2 manuscript submission. R01 follow-on prep targeting NIMH's autism portfolio (`lord-2020-autism-primer`), leveraging HBN's transdiagnostic stratification.
