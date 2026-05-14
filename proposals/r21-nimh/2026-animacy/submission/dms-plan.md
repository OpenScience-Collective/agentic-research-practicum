# Data Management and Sharing Plan

Per NIH Data Management and Sharing Policy (NOT-OD-21-013, effective 2023-01-25). This plan applies to all scientific data generated under the proposed R21.

## 1. Data type

The proposed work is observational secondary analysis of the existing Healthy Brain Network EEG Release 3 (HBN-EEG R3) cohort (`alexander-2017-hbn-protocol`); no new primary data are collected. Scientific data generated:

- **Preprocessing derivatives**: per-subject BIDS-compliant `.set`/`.fdt` files at multiple pipeline stages (high-pass-filtered, cleanline-processed, channel-rejected, AMICA-decomposed), plus per-subject quality-assurance tables (`qa_channels.csv`, `qa_amica.csv`) and per-stage power-spectral-density figures (`stage-*_psd.png`).
- **Component-level products**: per-subject AMICA decompositions (`*_ic-topos.png`, `*_dipoles.png`) and ICLabel classifications.
- **Event-locked derivatives**: per-subject epoched event-related spectral perturbation (ERSP) tensors aligned to shot onsets.
- **Group-level derivatives**: independent-component (IC) cluster centroids, group-level generalized linear model (GLM) parameter estimates, and cluster-corrected permutation statistics.
- **Code, configuration, and figures**: the analysis pipeline source (MATLAB and Python), per-run `params.json` configuration logs, and publication figures.

Volumetric estimate: derivatives ~150 GB for N≈160 at intermediate stages, ~20 GB at the final group-level product layer. No identifiable participant data are generated.

## 2. Related tools, software, and code

All analysis code is developed under public version control at `OpenScience-Collective/agentic-research-practicum` (GitHub, MIT license). A versioned pipeline snapshot is deposited to Zenodo at each manuscript submission, receiving a Digital Object Identifier (DOI) for permanent citation. Dependencies are pinned in `_typos.toml`, `.pre-commit-config.yaml`, and the EEGLAB version tag in `.github/workflows/matlab-tests.yml`. Python dependencies follow PEP 723 inline-script metadata where applicable, allowing one-command reproducibility via `uv`.

## 3. Standards

- **Brain Imaging Data Structure (BIDS)** 1.10+ for the BIDS-EEG schema (`pernet-2019-eeg-bids`). All preprocessing and event-annotation outputs are BIDS-compliant from raw `.bdf` through epoched derivatives.
- **Hierarchical Event Descriptor (HED)** 8.3.0 for event annotation, including shot-level animacy descriptors (`robbins-2021-hed`, `hermes-2023-hed-schema`).
- **NIH Common Data Elements** where applicable (cohort demographics align with HBN's existing CDE-compliant metadata).

## 4. Data preservation, access, and associated timelines

- **Raw HBN-EEG R3**: already public on the HBN AWS Open Data Registry (Child Mind Institute). No re-deposition required.
- **Derivatives and code**: deposited to OpenNeuro (Stanford Center for Reproducible Neuroscience) and NEMAR (Swartz Center for Computational Neuroscience, University of California San Diego) **by month 18** of the funded period. Each deposition receives a citable identifier and is linked from the project repository README.
- **Pipeline snapshot**: deposited to Zenodo at each manuscript submission, with a DOI included in the manuscript and the OpenNeuro / NEMAR record.
- **Long-term preservation**: a synchronized copy of all derivatives is maintained at **[PI INSTITUTION]** institutional repository for a minimum of 10 years post-project, complementing the OpenNeuro and NEMAR copies.

## 5. Access, distribution, or reuse considerations

- **Access controls**: none beyond the existing HBN data-use agreement (public, no IRB approval required for the secondary analysis). Derivatives are released under the Creative Commons Attribution 4.0 International (CC-BY-4.0) license per OpenNeuro convention; code under MIT license per repository policy.
- **Reuse expectations**: the pipeline is explicitly designed for reuse across HBN releases and across naturalistic-viewing EEG cohorts (`telesford-2023-eeg-fmri-naturalistic`). The README documents reuse pathways including (a) running the pipeline against a different HBN release with a single configuration change, and (b) running against a non-HBN BIDS-EEG dataset with the per-stage parameters re-validated.
- **Restrictions**: none. The proposed work is fully open by design.

## 6. Oversight of data management and sharing

The PI is the responsible party for data management and sharing. Quarterly progress reports to the NIMH program officer document deposition status, derivative volumes, and any deviations from this plan. **[PI INSTITUTION]** Office of Research Administration provides annual auditing of compliance with the NIH DMS Policy. Any deviation from the timelines above is reported within 30 days to the program officer with a corrective action plan.
