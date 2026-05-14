# Facilities and Other Resources

## Laboratory

The proposed work is conducted at the principal investigator's laboratory at **[PI INSTITUTION]**. The PI's lab occupies **[SQ FT]** of dedicated research space within the **[DEPARTMENT / CENTER]**, with workstation space for the PI, one funded postdoctoral researcher, and rotating graduate students. A dedicated EEG suite within the building (used by the broader department) provides shielded recording space; the proposed work is secondary analysis of existing Healthy Brain Network EEG Release 3 (HBN-EEG R3) data and does not require new EEG collection.

## Office

The PI maintains private office space (**[SQ FT]**) within the **[DEPARTMENT / CENTER]** with high-speed wired and wireless network access, a research-grade workstation, and access to shared conference rooms for collaborative meetings. The funded postdoctoral researcher occupies a dedicated desk within the PI's lab; the statistical consultant works remotely.

## Computing

- **Institutional high-performance computing cluster** at **[PI INSTITUTION]**: PI holds an allocation on the **[CLUSTER NAME]** partition with **[N]** CPU-hours per year, sufficient for full Healthy Brain Network EEG Release 3 (HBN-EEG R3) adaptive-mixture independent component analysis (AMICA) decomposition (estimated 2000 CPU-hours per cohort run).
- **GPU resources**: **[GPU PARTITION OR NODE TYPE]** available for any deep-learning baseline analyses (not used in the locked R21 design but available for sensitivity analyses).
- **Software licenses**: MATLAB site license through **[PI INSTITUTION]**; EEGLAB 2026.0.0 (open source), AMICA (open source per `palmer-2008-amica`), Fieldtrip-lite (open source), ICLabel, dipfit. Python ecosystem (NumPy, SciPy, pandas, MNE-Python) under UV-managed environments.
- **Cloud computing**: **[PI INSTITUTION]** Amazon Web Services (AWS) account with Open Data Registry programmatic access for the full 500 Hz Healthy Brain Network EEG Release 3 (HBN-EEG R3) cohort pull (estimated $2-5K total budget for the project period, charged as cluster overhead, listed in the budget justification).
- **Backup and version control**: GitHub Enterprise via **[PI INSTITUTION]**, plus tier-1 institutional backup of derivatives. The project repository (this code base) is mirrored at `OpenScience-Collective/agentic-research-practicum` (public, MIT license).

## Clinical environment

**[PI INSTITUTION]** is affiliated with **[INSTITUTIONAL MEDICAL CENTER]**. While the proposed R21 is observational re-analysis of an existing pediatric cohort and does not require new clinical contact, the institutional affiliation supports the R01 follow-on (proposed for month 24) that extends the developmental baseline to autism spectrum, social anxiety, and conduct disorder cohorts.

## Major collaborating sites

- **Child Mind Institute (HBN data provider)**: the originating institution for the Healthy Brain Network biobank (`alexander-2017-hbn-protocol`). Letter of support requested from **[HBN DATA STEWARD CONTACT]** confirming continued data availability under the existing data-use agreement.
- **Swartz Center for Computational Neuroscience (SCCN), University of California San Diego**: hosts the NEMAR EEG data repository (`hermes-2023-hed-schema`, `robbins-2021-hed`). Letter of support requested from **[SCCN CONTACT]** confirming deposition support and methodological consultation.
- **OpenNeuro (Stanford Center for Reproducible Neuroscience)**: hosts the BIDS-EEG repository (`pernet-2019-eeg-bids`). Letter of support requested from **[OPENNEURO CONTACT]** confirming deposition pathway.

## Departmental support

**[DEPARTMENT / CENTER]** at **[PI INSTITUTION]** provides administrative grant-management support (pre-award and post-award), human-subjects review through the **[PI INSTITUTION]** IRB (the proposed work is Exempt-4 per secondary-data analysis criteria), and an active seminar series in computational and clinical neuroscience that supports trainee development for the funded postdoctoral researcher.
