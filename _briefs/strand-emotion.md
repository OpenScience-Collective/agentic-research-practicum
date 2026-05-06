# Strand 4, Emotion (Phase 1 brief)

**Goal:** populate `research/collection/emotion/` with at least 14 paper-cards covering affective dynamics, social cognition, and electroencephalography (EEG) / functional magnetic resonance imaging (fMRI) markers of emotional engagement during cinematic stimuli, sufficient to evaluate whether affective and social-cognitive correlates dominate the HBN ThePresent boy-shot vs puppy-shot event-related spectral perturbation (ERSP) contrast.

## Scope

Cover seven categories. Category 5 (pet/animal-evoked affective response) is small but load-bearing for the puppy-shot interpretation.

### 1. Affective dynamics in cinematic stimuli
- Saarimäki et al. discrete emotions during movies (Cereb Cortex, 2016)
- Nummenmaa et al. emotional networks during film viewing
- Karjalainen, Nummenmaa naturalistic emotion categorization
- Kragel et al. (2019) population coding of affect from videos
- Cowen, Keltner emotion taxonomies from short videos

### 2. Social cognition and Theory of Mind during movie watching
- Saxe, Kanwisher temporo-parietal junction and theory of mind
- Wagner, Kelley default-mode network and social cognition
- Jacoby, Saxe theory of mind during narrative comprehension
- Richardson, Saxe ToM in development with naturalistic stimuli
- Kanske et al. empathy versus theory of mind dissociation

### 3. Amygdala, vmPFC, insula responses to affective film clips
- LeDoux amygdala canonical reviews
- Lindquist, Wager, Kober, Bliss-Moreau, Barrett (2012) brain basis of emotion meta-analysis
- Wager et al. neurologic affective signature work
- Sergerie, Chochol, Armony amygdala fMRI meta-analysis
- Etkin, Egner, Kalisch ventromedial prefrontal cortex and emotion regulation

### 4. Inter-subject correlation (ISC) and reliability driven by emotional content
- Nummenmaa et al. ISC modulated by emotion intensity
- Hasson, Yang, Vallines emotion-driven ISC patterns
- Cohen et al. memorable / engaging events drive EEG ISC
- Schmälzle et al. media psychology ISC during film
- Kauttonen et al. predictive ISC for engagement metrics

### 5. Pet / animal-evoked affective response
- Stoeckel et al. mother responses to baby vs puppy faces (PLOS ONE 2014)
- Borgi, Cogliati Dezza, Brelsford, Meints baby-schema and animal cuteness
- Glocker et al. baby schema activates nucleus accumbens
- Filippi et al. infant- and puppy-face fMRI meta-comparison
- Kringelbach, Stark, Alexander pet-bonding neuroimaging

### 6. Frontal alpha asymmetry and EEG affective markers
- Davidson, Tomarken frontal alpha asymmetry tradition
- Coan, Allen frontal asymmetry capability and approach motivation
- Reznik, Allen frontal alpha asymmetry meta-analytic critique
- Briesemeister, Tamm, Heekeren EEG of affective valence in naturalistic stimuli
- Schubring, Schupp emotion-modulated EEG oscillations

### 7. Empathy and mentalizing in narrative consumption
- Mar narrative and theory of mind review
- Tamir et al. fiction reading and social cognition
- Singer empathy and pain matrix studies
- Zaki, Ochsner empathy neural systems
- Kanske, Singer compassion and empathy training brain effects

## Per-entry deliverable

Create folder `research/collection/emotion/<slug>/` containing:
- `card.md` from the schema (`type` ∈ {paper, dataset, tool}; `strand: emotion`)
- `source.pdf` only if redistributable
- `source.md` always required
- `meta.json` with provenance (DOI / URL, retrieved_at, license, sha256 if PDF archived, redistribution_ok)
- BibTeX entry appended to `research/collection/emotion/emotion.bib`
- One-line entry in `research/collection/emotion/INDEX.md` under the right category heading

Use `opencite:opencite` for DOI lookup, PDF retrieval, and PDF→markdown conversion.

## Seed material

- `project_brief.md` — boy and puppy as primary affective agents; HBN child population
- `.context/research.md` — HBN cohort age range, EEG band coverage at 100 Hz
- `.context/ideas.md` — boy-only vs puppy-only as cleanest social-stimulus contrast
- `shot_events.tsv` — `has_boy`, `has_puppy` per-shot indicators

Imported entries from these seeds must set `imported_from: <relative path>` in `card.md`.

## Skills to use

- `opencite:opencite` for paper retrieval, DOI lookup, BibTeX export
- `manuscript:manuscript-writing` for prose discipline (no em-dashes, abbreviations on first use)

## Acceptance criteria

- [ ] >= 14 entries across the seven categories
- [ ] Each category has >= 2 entries
- [ ] Every entry folder has `card.md`, `source.md`, and `meta.json`
- [ ] All entries have BibTeX in `emotion.bib`
- [ ] `INDEX.md` fully populated with categorized one-liners
- [ ] No prose synthesis in this phase

## Out of scope

- Static facial-expression decoding from photographs without naturalistic context
- Affective text processing without stimulus context
- Clinical mood-disorder studies unrelated to film paradigms
- Adult-only paradigms unless they generalize to a child or adolescent cohort with a clear bridging argument
- Drafting the direction paper or any synthesis prose
- Comparing or ranking entries; collection only

## Note on developmental relevance

HBN is a heterogeneous child and adolescent cohort. When a candidate paper is adult-only, the card's Relevance section should explicitly justify whether the finding is expected to transfer to ages roughly 5-21, citing a developmental study where one exists. Otherwise mark `relevance: medium` or `low` and document the developmental gap as an open question.
