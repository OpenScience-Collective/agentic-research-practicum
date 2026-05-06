# Strand 2, Action (Phase 1 brief)

**Goal:** populate `research/collection/action/` with at least 14 paper-cards covering biological motion, action observation, event segmentation, and sensorimotor electroencephalography (EEG) signatures during movie watching, sufficient to evaluate whether action-network responses contribute to the HBN ThePresent boy-shot vs puppy-shot event-related spectral perturbation (ERSP) contrast.

## Scope

Cover six categories. Animated-stimulus findings receive priority because ThePresent is an animated short.

### 1. Biological motion perception
- Johansson (1973) point-light walker tradition
- Grossman, Blake superior temporal sulcus (STS) responses to biological motion
- Pavlova reviews of biological motion processing in development
- Saygin (2007) Brain on STS lesions and biological motion
- Pelphrey, Morris social perception in autism using point-light displays

### 2. Action observation networks (parietal-premotor, mirror system)
- Rizzolatti, Craighero (2004) mirror neuron review
- Caspers, Zilles, Eickhoff meta-analysis of action observation fMRI
- Kilner, Friston, Frith predictive coding account of mirror system
- Iacoboni mirror system in social cognition
- Caggiano, Fogassi peripersonal-space mirror neurons

### 3. Event segmentation theory and naturalistic boundary detection
- Zacks et al. event segmentation theory (Psychol Bull, 2007)
- Speer, Zacks naturalistic story segmentation
- Baldassano, Hasson, Norman event boundaries in naturalistic stimuli (Neuron 2017)
- Newtson original behavioral event-segmentation work
- Kurby, Zacks aging and event boundaries

### 4. Mu rhythm and sensorimotor desynchronization to observed actions
- Pineda mu rhythm and mirror-neuron interpretation
- Muthukumaraswamy, Johnson mu suppression to observed action
- Hari, Salenius MEG mu-rhythm during action observation
- Babiloni et al. EEG mu rhythm in athletes and action observation
- Calmels EEG mirror-system reviews

### 5. Naturalistic movie fMRI/EEG of agentive interactions
- Hasson et al. Sherlock and other naturalistic narratives
- Lerner, Honey, Hasson temporal hierarchies during stories
- Sliwa and Freiwald (2017) Science specialized macaque cortex for social interaction observation
- Chen et al. (2017) Nat Neurosci Sherlock dataset release on shared memories of naturalistic events
- McMahon, Bonner, Kanwisher action representation in dynamic stimuli

### 6. Animation / cartoon-specific findings
- Klin, Jones gaze allocation in cartoon vs naturalistic faces
- Heider, Simmel triangle-animation tradition and modern fMRI follow-ups (Castelli et al.)
- Wagner et al. fMRI of animated agents
- Chevallier et al. autism and animation viewing
- Hasson, Honey on stimulus naturalness gradient including animation

## Per-entry deliverable

Create folder `research/collection/action/<slug>/` containing:
- `card.md` from the schema (`type` ∈ {paper, dataset, tool}; `strand: action`)
- `source.pdf` only if redistributable
- `source.md` always required
- `meta.json` with provenance (DOI / URL, retrieved_at, license, sha256 if PDF archived, redistribution_ok)
- BibTeX entry appended to `research/collection/action/action.bib`
- One-line entry in `research/collection/action/INDEX.md` under the right category heading

Use `opencite:opencite` for DOI lookup, PDF retrieval, and PDF→markdown conversion.

## Seed material

- `project_brief.md`, boy and puppy as animated agents; shot-onset paradigm
- `.context/research.md`, HBN-EEG dataset, ThePresent subject pool, sampling rate
- `.context/ideas.md`, contrast-choice rationale (boy-only vs puppy-only is socially asymmetric across agents)
- `shot_events.tsv`, `has_boy`, `has_puppy` per-shot indicators

Imported entries from these seeds must set `imported_from: <relative path>` in `card.md`.

## Skills to use

- `opencite:opencite` for paper retrieval, DOI lookup, BibTeX export
- `manuscript:manuscript-writing` for prose discipline (no em-dashes, abbreviations on first use)

## Acceptance criteria

- [ ] >= 14 entries across the six categories
- [ ] Each category has >= 2 entries
- [ ] Every entry folder has `card.md`, `source.md`, and `meta.json`
- [ ] All entries have BibTeX in `action.bib`
- [ ] `INDEX.md` fully populated with categorized one-liners
- [ ] No prose synthesis in this phase

## Out of scope

- Pure motor execution without observation (no go-no-go reaching, no isolated muscle EEG)
- Action-language semantic representations (handled by language strand)
- Mirror-neuron debates centered on macaque single-unit physiology unless they directly motivate a human EEG / fMRI claim used in Phase 3
- Drafting the direction paper or any synthesis prose
- Comparing or ranking entries; collection only
