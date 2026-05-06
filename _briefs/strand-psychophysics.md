# Strand 1, Psychophysics (Phase 1 brief)

**Goal:** populate `research/collection/psychophysics/` with at least 14 paper-cards covering low-level visual feature responses and time-resolved electroencephalography (EEG) / magnetoencephalography (MEG) correlates of dynamic naturalistic input, sufficient to ground the bottom-up component of the HBN-EEG ThePresent boy-shot vs puppy-shot event-related spectral perturbation (ERSP) contrast.

## Scope

Cover six categories. Aim for breadth first, depth where it bears on log-luminance ratio (LLR) and shot-onset transients in animated stimuli.

### 1. Low-level scene statistics in dynamic stimuli
- Bell, Sejnowski (1997) on natural-image statistics and independent components
- Simoncelli, Olshausen (2001) review of natural image statistics and neural representation
- Dorr, Vig, Barth on natural movie eye-movement and saliency statistics
- Carandini, Heeger normalization model evidence in natural scenes
- Tobimatsu and Celesia (2006) Clin Neurophysiol review of luminance and contrast visual evoked potentials

### 2. Motion / optic flow and MT/V5 responses to natural motion
- Born, Bradley (2005) Annu Rev Neurosci on MT/MST
- Bartels, Zeki naturalistic-movie fMRI of motion areas
- Hasson et al. on cortical specificity to dynamic scenes
- Nishimoto et al. (2011) Curr Biol movie reconstruction from V1/MT
- Adelson-Bergen energy model and successors as MT regressors

### 3. Time-resolved EEG/MEG to dynamic naturalistic input
- Dmochowski et al. on EEG inter-subject correlation during movies
- Lalor, Foxe, Reilly system-identification / VESPA approach to natural stimuli
- Ki, Kelly, Parra (2016) attention modulates EEG to movies
- Cohen, Parra (2016) memorable events evoke stronger EEG responses
- Madsen, Parra naturalistic-EEG reliability and ISC

### 4. Inter-subject correlation (ISC) driven by stimulus-locked low-level features
- Hasson et al. (2004) ISC in naturalistic fMRI
- Dmochowski et al. (2012) Front Hum Neurosci EEG ISC during natural viewing
- Dmochowski et al. (2014) Nat Commun audience preferences predicted by neural reliability
- Nentwich et al. EEG ISC across movies with different feature loads
- Kaneshiro et al. EEG ISC in music vs film
- Madsen, Parra ISC dependence on stimulus type

### 5. Free-viewing EEG with eye-movement coregistration
- Dimigen, Sommer fixation-related potentials in natural reading and scenes
- Dandekar, Privitera, Carney, Klein eye-EEG in free viewing
- Plöchl, Ossandón, König gaze-contingent EEG analysis
- EYE-EEG toolbox papers and evaluation work

### 6. Computational regressors of low-level features
- Energy / motion-energy models as MT/V1 regressors (Adelson, Bergen)
- HMAX (Riesenhuber, Poggio) hierarchical low-level features
- DeepGaze and saliency CNNs for fixation prediction
- Khaligh-Razavi, Kriegeskorte deep CNN early-layer fits to early visual cortex
- Hubel, Wiesel canonical receptive-field grounding

## Per-entry deliverable

Create folder `research/collection/psychophysics/<slug>/` containing:
- `card.md` from the schema (`type` ∈ {paper, dataset, tool}; `strand: psychophysics`)
- `source.pdf` only if redistributable (open access, preprint, repo copy)
- `source.md` always required; markdown extraction or canonical README
- `meta.json` with provenance (DOI / URL, retrieved_at, license, sha256 if PDF archived, redistribution_ok)
- BibTeX entry appended to `research/collection/psychophysics/psychophysics.bib`
- One-line entry in `research/collection/psychophysics/INDEX.md` under the right category heading

Use `opencite:opencite` for DOI lookup, PDF retrieval (where licensing permits), and PDF→markdown conversion.

## Seed material

- `project_brief.md`, boy-shot vs puppy-shot ERSP question; LLR and shot-event columns
- `.context/research.md`, HBN-EEG dataset DOI, sampling rate, 100 Hz vs 500 Hz tradeoffs
- `.context/ideas.md`, LLR as continuous regressor of no interest in the group-level GLM
- `shot_events.tsv`, per-shot annotations including LLR

Imported entries from these seeds must set `imported_from: <relative path>` in `card.md`.

## Skills to use

- `opencite:opencite` for paper retrieval, DOI lookup, BibTeX export
- `manuscript:manuscript-writing` for prose discipline (no em-dashes, abbreviations on first use)

## Acceptance criteria

- [ ] >= 14 entries across the six categories
- [ ] Each category has >= 2 entries
- [ ] Every entry folder has `card.md`, `source.md`, and `meta.json`
- [ ] All entries have BibTeX in `psychophysics.bib`
- [ ] `INDEX.md` fully populated with categorized one-liners
- [ ] No prose synthesis in this phase; that is Phase 2

## Out of scope

- Static-image psychophysics (gratings, isolated icons) unless directly bridging to dynamic naturalistic stimuli
- Object-category decoding from ventral stream (belongs to action or emotion strands)
- Resting-state EEG without stimulus
- Gamma-band findings that require sampling rates above 100 Hz, unless cited as comparator for the future 500 Hz validation run
- Drafting the direction paper or any synthesis prose
- Comparing or ranking entries; collection only
