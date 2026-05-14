# Bibliography

## What this is

`bibliography.bib` is the consolidated BibTeX file for the R21 submission. It contains 117 entries: 113 from the existing 4-strand corpus (`research/collection/{action,emotion,language,psychophysics}/*.bib`), 14 R21-specific additions (`proposals/r21-nimh/2026-animacy/refs.bib`), and 4 supplemental additions made in Phase 4 (Delorme & Makeig 2004 EEGLAB, Hamlin 2013 infant social cognition, Palmer 2008 AMICA, Plöchl 2012 eye-EEG artifact). Duplicates across files are minor (two known cross-strand duplicates, Hasson 2004 and Nelson 2017; final dedupe at Phase 5 LaTeX assembly).

## Slug-to-key map for the 37 R21-cited works

The R21 markdown uses citation slugs of the form `firstauthor-year-firstwordoftitle`. BibTeX keys in `bibliography.bib` use the upstream strand-bib convention (mixed-case `Firstauthor2024TitleAB` or lowercase `firstauthor2024title`). Phase 5 LaTeX assembly maps slugs to keys via this table.

| Citation slug (in markdown) | BibTeX key (in `bibliography.bib`) |
|---|---|
| `alexander-2017-hbn-protocol` | `alexander-2017-hbn-protocol` |
| `borgi-2014-baby-schema-children` | `Borgi2014BabySI` |
| `buzzell-2023-eeg-developmental-tool` | `buzzell-2023-eeg-developmental-tool` |
| `castelli-2000-heider-simmel` | `castelli2000heider` |
| `castelli-2002-autism-animations` | `Castelli2002AutismAS` |
| `cook-2014-mirror-neurons` | `cook-2014-mirror-neurons` |
| `crosse-2016-mtrf-toolbox` | `Crosse2016TheMT` |
| `davidson-2000-affective-style` | `Davidson2000AffectiveSP` |
| `delorme-makeig-2004-eeglab` | `delorme2004eeglab` |
| `dimigen-ehinger-2021-deconvolution-eye-eeg` | `Dimigen2021RegressionbasedAO` |
| `hamlin-2013-infant-social` | `hamlin2013infant` |
| `happe-frith-2013-atypical-social-cognition` | `happe-frith-2013-atypical-social-cognition` |
| `hari-1998-mep-action-observation` | `hari1998action` |
| `hasson-2010-natural-stimulation` | `hasson2010natural` |
| `hermes-2023-hed-schema` | `hermes-2023-hed-schema` |
| `isik-2017-social-interactions-psts` | `isik-2017-social-interactions-psts` |
| `johansson-1973-biological-motion` | `johansson1973biological` |
| `kauttonen-2015-cinematic-fmri` | `Kauttonen2015OptimizingMF` |
| `klin-2009-biological-motion-autism` | `klin2009biological` |
| `lipkin-2022-language-atlas` | `Lipkin2022ProbabilisticAF` |
| `lord-2020-autism-primer` | `lord-2020-autism-primer` |
| `marco-2011-sensory-autism` | `marco-2011-sensory-autism` |
| `matusz-2018-real-world-neuroscience` | `matusz-2018-real-world-neuroscience` |
| `nentwich-2023-semantic-novelty-cuts` | `Nentwich2023SemanticNM` |
| `norton-2022-social-eeg-toddler` | `norton-2022-social-eeg-toddler` |
| `oberman-2006-mu-mirror-autism` | `oberman2007mirror` (year is 2007 in source, slug uses 2006; verify against original at Phase 5) |
| `palmer-2008-amica` | `palmer2008amica` |
| `pernet-2019-eeg-bids` | `pernet-2019-eeg-bids` |
| `petroni-cohen-2018-isc-naturalistic-videos` | `Petroni2018TheVO` |
| `pineda-2005-mu-rhythm-mirror` | `pineda2005mu` |
| `ploechl-2012-eye-eeg-artifact-correction` | `plochl2012eyeeeg` |
| `proklova-2016-animacy-visual-cortex` | `proklova-2016-animacy-visual-cortex` |
| `reznik-allen-2018-frontal-asymmetry` | `Reznik2018FrontalAA` |
| `richardson-saxe-2018-social-brain-development` | `Richardson2018DevelopmentOT` |
| `robbins-2021-hed` | `robbins-2021-hed` |
| `telesford-2023-eeg-fmri-naturalistic` | `telesford-2023-eeg-fmri-naturalistic` |
| `vanderwal-2015-inscapes` | `Vanderwal2015InscapesAM` |

## Render plan at Phase 5

1. Convert `bibliography.bib` to NIH-numbered citation style (Vancouver-like, no author-year; numbers in order of first citation).
2. Resolve duplicate keys (`Hasson2004IntersubjectSO`, `Nelson2017NeurophysiologicalDO`) by keeping the better-formatted entry.
3. The LaTeX preamble uses the slug-to-key map above as a `\let\slug=\bibkey` table; markdown slugs render via the standard cite command.
4. Final rendered bibliography lives as `submission/build/r21-references.pdf` (or appended to the main proposal PDF).
