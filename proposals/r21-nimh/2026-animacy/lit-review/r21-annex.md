# R21 Lit Review Annex, Phase 2 Additions

This annex documents the 14 references added in Phase 2 via the `opencite` skill to support the Significance and Innovation sections. The base corpus of 98 papers in [`research/collection/`](../../../../research/collection/) and [`research/synthesis/`](../../../../research/synthesis/) remains the comprehensive lit review; this annex is the R21-specific supplement.

## Opencite queries run

| # | Query | Returned | Kept | File |
|---|---|---|---|---|
| 1 | "animacy perception development infants children" (year >= 2010) | 15 | 1 | `q1-animacy-development.bib` |
| 2 | "biological motion perception developmental EEG" (year >= 2010) | 10 | 3 | `q2-biomotion-dev-eeg.bib` |
| 3 | "mu rhythm development children pediatric EEG" (year >= 2010) | 10 | 1 | `q3-mu-pediatric.bib` |
| 4 | "animacy autism biological motion social cognition" (year >= 2015) | 10 | 2 | `q4-animacy-autism.bib` |
| 5 | "naturalistic movie EEG children developmental social" (year >= 2015) | 10 | 3 | `q5-naturalistic-children.bib` |
| 6 | "Healthy Brain Network EEG pediatric BIDS naturalistic" (year >= 2017) | 10 | 2 | `q6-hbn-eeg.bib` |
| 7 | "HED Hierarchical Event Descriptor BIDS EEG annotation" (year >= 2018) | 8 | 2 | `q7-hed-bids.bib` |
| | **Totals** | **73** | **14** | |

Total return: 73 candidate entries. Total kept: 14, selected by relevance to Significance or Innovation claims and impact (journal venue, citation count, primary-source status). The 59 dropped entries were either off-topic (medical, marketing, or non-naturalistic-neuroscience domains), duplicates of existing corpus slugs in `research/collection/`, or background-only references that did not directly support a claim being made on the Significance or Innovation pages.

## Kept references, with claim mapping

Each kept reference maps to a specific Significance or Innovation claim. BibTeX keys match the entries in `proposals/r21-nimh/2026-animacy/refs.bib`.

| BibTeX key | Section | Claim supported |
|---|---|---|
| `alexander-2017-hbn-protocol` | Significance, Innovation | HBN-EEG cohort credibility, N, ages, transdiagnostic design, OpenNeuro deposition |
| `buzzell-2023-eeg-developmental-tool` | Significance, Innovation | Pediatric naturalistic-EEG is methodologically open territory; AMICA pipeline justification |
| `norton-2022-social-eeg-toddler` | Significance | Pediatric naturalistic-EEG paradigms beyond ISC are emerging |
| `matusz-2018-real-world-neuroscience` | Significance, Innovation | Naturalistic stimuli are the right probe; field-level shift toward pre-registration |
| `happe-frith-2013-atypical-social-cognition` | Significance, Innovation | Non-monotonic developmental trajectory; clinical translation framing |
| `lord-2020-autism-primer` | Significance, Innovation | Autism prevalence and clinical translation; transdiagnostic relevance |
| `marco-2011-sensory-autism` | Significance | Atypical sensory processing in autism, broadens clinical relevance beyond biological motion |
| `cook-2014-mirror-neurons` | Significance | Modern mirror-neuron synthesis; mu-rhythm interpretive frame |
| `isik-2017-social-interactions-psts` | Innovation | Social-interaction-specific neural representations in pSTS; supports animacy as graded |
| `proklova-2016-animacy-visual-cortex` | Innovation | Animacy as continuous coding axis in ventral visual cortex |
| `pernet-2019-eeg-bids` | Significance, Innovation | EEG-BIDS standard, foundational pipeline reproducibility claim |
| `robbins-2021-hed` | Significance, Innovation | HED event annotation, foundational pipeline reproducibility claim |
| `hermes-2023-hed-schema` | Significance, Innovation | HED schema, with PI on author list; demonstrates technical capability |
| `telesford-2023-eeg-fmri-naturalistic` | Significance, Innovation | Naturalistic-viewing EEG datasets are proliferating; pipeline reusability claim |

## Notable rejections

Documented for audit transparency:

- **Cerebellum and social cognition** references (Overwalle 2020, Sokolov 2017, D'Mello 2015): off-topic for scalp EEG.
- **Robot anthropomorphism** (Blut 2021, Admoni 2017, Wiese 2017): off-topic for biological-agent animacy.
- **Default-mode network reviews** (Menon 2023, Buckner 2008 already in corpus): too tangential for R21 Significance.
- **fNIRS technology** (Vidal-Rosas 2023, Su 2022): off-modality for R21.
- **Language acquisition** (Ambridge 2015, MacDonald 2013): off-topic.
- **Magnetoencephalography practice** (Hari 2018, Hill 2019): off-modality.
- **Sleep, ketamine, epilepsy** in Q3: spurious matches from "rhythm" or "pediatric" stem.

## Where the annex does not go

This annex does not introduce new analysis methods, new aims, or new data sources beyond what the Aims page commits to. It also does not add per-paper cards in `research/collection/` (those belong to manuscript preparation, not the R21).
