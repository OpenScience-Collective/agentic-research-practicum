# Strand 3, Language (Phase 1 brief)

**Goal:** populate `research/collection/language/` with at least 12 paper-cards covering narrative-comprehension neural correlates and the silent-film boundary case relevant to the HBN ThePresent paradigm. ThePresent is a wordless animated short, so this strand serves primarily as comparator and boundary, naming what cannot transfer from speech-rich naturalistic paradigms to a silent stimulus.

## Scope

Cover six categories. Categories 5 and 6 are load-bearing for the HBN-relevance argument and should be at least as deep as categories 1-4.

### 1. Narrative comprehension neural correlates
- Hasson et al. naturalistic listening fMRI (Wonderful Story, Pieman, etc.)
- Lerner, Honey, Hasson temporal receptive windows (J Neurosci 2011)
- Brennan, Hale syntactic and semantic predictors during story listening
- Huth et al. (2016) Nature, semantic atlas from natural narrative listening
- Tikka, Saarimäki naturalistic narrative MEG / EEG

### 2. Semantic prediction in naturalistic context
- Kutas, Federmeier N400 review (2011) Annu Rev Psychol
- DeLong, Kutas N400 prediction effects
- Goldstein et al. predictive surprisal from large language models in EEG / electrocorticography (ECoG)
- Caucheteux, King brain-language alignment with language models
- Heilbron et al. predictive processing in story comprehension MEG

### 3. Audiovisual integration in cinematic stimuli
- van Wassenhove, Grant, Poeppel audiovisual speech integration
- Schroeder, Lakatos cross-modal entrainment
- Senkowski, Engel multisensory neural oscillations review
- Ferrari, Kalmus film-cut and audiovisual integration findings
- Lankinen et al. naturalistic audiovisual MEG

### 4. Story network: temporo-parietal, default-mode, language-network
- Buckner, Andrews-Hanna, Schacter default-mode network and narrative
- Simony et al. dynamic functional connectivity during stories
- Yeshurun, Hasson individual variation in narrative interpretation
- Chen et al. narrative-induced default-mode synchronization
- AlSaid et al. language-network parcellation under naturalistic listening

### 5. Silent-film and wordless storytelling neural correlates
- Castelli, Happé, Frith Heider-Simmel animations and theory-of-mind fMRI
- Naci, Owen Hitchcock silent-clip task as covert assessment
- Ben-Yakov, Henson event boundaries in silent narrative
- Studyforrest German-dubbed Forrest Gump cohort papers including silent-only contrasts
- Vodrahalli, Norman Sherlock release with audio vs visual ablations

### 6. Language models as regressors in naturalistic neuroimaging
- Goldstein et al. (2022) Nature Neurosci shared computational principles
- Caucheteux, King (2022) brains and algorithms partially converge
- Schrimpf et al. neural predictivity and language-model alignment
- Tikochinski, Barzilay representational alignment in MEG
- Antonello et al. transformer features as regressors

## Per-entry deliverable

Create folder `research/collection/language/<slug>/` containing:
- `card.md` from the schema (`type` ∈ {paper, dataset, tool}; `strand: language`)
- `source.pdf` only if redistributable
- `source.md` always required
- `meta.json` with provenance (DOI / URL, retrieved_at, license, sha256 if PDF archived, redistribution_ok)
- BibTeX entry appended to `research/collection/language/language.bib`
- One-line entry in `research/collection/language/INDEX.md` under the right category heading

Use `opencite:opencite` for DOI lookup, PDF retrieval, and PDF→markdown conversion.

## Seed material

- `project_brief.md` — silent-stimulus framing of ThePresent
- `.context/research.md` — HBN-EEG dataset DOI, no audio track in ThePresent stream
- `.context/ideas.md` — language as comparator strand rather than primary fit
- `shot_events.tsv` — onset-aligned shot annotations (no transcript, no dialogue)

Imported entries from these seeds must set `imported_from: <relative path>` in `card.md`.

## Skills to use

- `opencite:opencite` for paper retrieval, DOI lookup, BibTeX export
- `manuscript:manuscript-writing` for prose discipline (no em-dashes, abbreviations on first use)

## Acceptance criteria

- [ ] >= 12 entries across the six categories
- [ ] Each category has >= 2 entries; categories 5 and 6 each >= 3
- [ ] Every entry folder has `card.md`, `source.md`, and `meta.json`
- [ ] All entries have BibTeX in `language.bib`
- [ ] `INDEX.md` fully populated with categorized one-liners
- [ ] No prose synthesis in this phase

## Out of scope

- Single-word or isolated-sentence linguistic neuroscience without naturalistic context
- Phonological or articulatory-motor speech production
- Bilingual switching unless paired with a naturalistic stimulus
- Reading-only N400 work disconnected from auditory or audiovisual paradigms
- Drafting the direction paper or any synthesis prose
- Comparing or ranking entries; collection only

## Note on framing

When writing each `card.md` Relevance section, name explicitly whether the paper transfers to a silent animated stimulus. A paper that depends on speech onsets, transcript timing, or dialogue surprisal does not transfer cleanly; it should be marked `relevance: medium` or `low` and the limitation noted in the card. Boundary-case papers in categories 5 and 6 may be `relevance: high` if they demonstrate generalizable narrative neural correlates without speech.
