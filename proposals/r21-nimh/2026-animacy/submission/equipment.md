# Equipment

## Computing equipment available

- **Principal investigator workstation**: **[WORKSTATION MODEL / CPU / RAM / STORAGE]**, primary development and analysis environment.
- **Postdoctoral researcher workstation**: **[WORKSTATION MODEL / CPU / RAM / STORAGE]**, provisioned at project start.
- **Institutional high-performance computing cluster** (**[PI INSTITUTION]** **[CLUSTER NAME]**): **[N]** CPU-hours per year on the **[PARTITION]** queue. Sufficient for full-cohort AMICA decomposition. **[GPU PARTITION]** available for sensitivity analyses.
- **Network attached storage**: **[NAS TIER]** at **[PI INSTITUTION]**, with Tier-1 institutional backup. Storage allocation **[N TB]** for derivatives and analysis outputs over the funded period.

## EEG equipment

None used in the proposed R21. The work is observational secondary analysis of the existing Healthy Brain Network EEG Release 3 (HBN-EEG R3) cohort, which was acquired by the Child Mind Institute on a Geodesic Sensor Net 128-channel HydroCel system at 500 Hz, downsampled locally to 100 Hz for development. Source data are obtained via the HBN AWS Open Data Registry and processed under the existing public data-use agreement (`alexander-2017-hbn-protocol`).

## Software licenses

- **MATLAB R2024a** (site license, **[PI INSTITUTION]**); EEGLAB 2026.0.0 (open source); AMICA binaries (open source, Swartz Center for Computational Neuroscience; `palmer-2008-amica`); Fieldtrip-lite (open source); ICLabel (open source); dipfit5 (open source); cleanrawdata (open source); firfilt (open source). All MATLAB toolboxes are bundled with the pinned EEGLAB release.
- **Python 3.11+** managed by `uv`; MNE-Python (open source); NumPy, SciPy, pandas, matplotlib (open source).
- **R 4.3+** with `mgcv` (generalized additive models for the Aim 1 non-monotonic developmental smooth) and `lme4` (mixed-effects models, sensitivity analyses).

No new equipment is requested in the budget; computing services and AWS use are listed as services in the budget justification.
