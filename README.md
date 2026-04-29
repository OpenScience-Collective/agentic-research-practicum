# HBN ERSP: Boy-Shot vs Puppy-Shot

Event-related spectral perturbation (ERSP) analysis of the first 500 ms of EEG
responses around shot onsets in the animated short *The Present*, contrasting
shots that begin with the boy versus shots that begin with the puppy.

Dataset: Healthy Brain Network (HBN-EEG), Release 3 (R3), task `ThePresent`,
BIDS dataset `ds005507`. Pipeline runs on a local 100 Hz downsampled copy
before validation on the full 500 Hz S3 release.

## Quick start

```bash
# 1. Clone and install dev tooling
git clone https://github.com/OpenScience-Collective/agentic-research-practicum.git
cd agentic-research-practicum
uv tool install pre-commit miss_hit
pre-commit install

# 2. Sanity check the local R3 dataset (184 subjects expected)
ls /Volumes/S1/Datasets/HBN/L100/R3_L100_bdf/ | grep '^sub-' | wc -l

# 3. Run a single phase from MATLAB (one function per step, CLI callable).
#    `Subjects` is a string array; for multiple, use ["sub-A" "sub-B"].
matlab -batch "phase1_preprocess(BidsRoot=\"/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf\", \
  Subjects=\"sub-NDARAA948VFH\")"

# 4. Local CI (heavy MATLAB checks on real BDF). EEGLAB_PATH and BIDS_ROOT
#    must be set; the script refuses to run without them.
EEGLAB_PATH=/path/to/eeglab \
  BIDS_ROOT=/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf \
  ./scripts/local_ci.sh
```

A 30-second real-EEG fixture for `runtests` smoke tests is tracked in issue
[#11](https://github.com/OpenScience-Collective/agentic-research-practicum/issues/11);
until it lands, the smoke tests run against your local R3 copy.

## Stack

- MATLAB R2023b+ with EEGLAB 2024+ (`Biosig`, `clean_rawdata`, `AMICA`,
  `IClabel`, `dipfit5`, `std_precomp`)
- BIDS (`ds005507`), HED 8.3.0 events
- `matlab-mcp-tools` to drive MATLAB from Claude Code over MCP
- Optional Python helpers via `uv` (UV-only, no `pip` / `conda` / `virtualenv`)

## Pipeline phases

Each phase is one MATLAB function under `src/matlab/phaseN_*.m`, callable from
the shell, with a checkpoint dropped under `derivatives/<stage>/`.

1. **`phase1_preprocess`** - BIDS import, 1 Hz HPF, cleanline (60/120/180),
   channel rejection (`clean_rawdata`)
2. **`phase2_amica`** - 24-way parallel AMICA + `dipfit5`
3. **`phase3_iclabel`** - ICLabel classification, drop non-brain ICs
   (brain threshold 0.69)
4. **`phase4_epoch`** - shot-event expansion via `expand_events` +
   `pop_epoch` -0.6 to +0.6 s around `shots`
5. **`phase5_ersp`** - `std_precomp` ERSP on 0-500 ms with baseline
   -500 to -100 ms; IC clustering
6. **`phase6_stats`** - group contrasts, cluster-level stats,
   manuscript-ready figures

## Contrast (locked)

**Contrast 1 - Boy-only vs Puppy-only**:

- Boy-only: `has_boy=1 AND has_puppy=0` (20 stim-side shots)
- Puppy-only: `has_boy=0 AND has_puppy=1` (15 stim-side shots)
- Mutually exclusive; cleanest social-stimulus contrast.
- Log luminance ratio (`LLR`) is included as a continuous regressor of no
  interest in the group-level GLM.

Alternatives (puppy-present vs absent, boy vs puppy with overlap) considered
and rejected; see `.context/ideas.md`.

## Repository layout

```
src/matlab/         # phase1..phase6 + +hbn package utilities
tests/matlab/       # MATLAB smoke tests on real EEG (no mocks)
scripts/            # local_ci.sh, fixture builders, helpers
derivatives/        # phase checkpoints (gitignored)
.context/           # plan, ideas, research, scratch_history
.rules/             # MATLAB, testing, git, code-review conventions
.github/workflows/  # cheap CI: typos, lint, MATLAB checkcode
```

## Development workflow

1. Pick a phase / issue. `gh issue develop <N>` from `develop` to get a branch.
2. One function per preprocessing step. Parameters in an `opts` struct,
   logged to `params.json` next to the checkpoint.
3. Re-derive each parameter; do not silently inherit from the reference
   pipeline at `~/Documents/git/HBN_BIDS_analysis/study_handy_scripts.m`.
4. Write tests on real EEG (`tests/matlab/`). NO MOCKS - if a test would
   only pass with synthetic data, do not write it.
5. Atomic commits, <50 chars subject, no emoji, no AI attribution.
6. PR to `develop`. Run `/review-pr`; address every non-false-positive finding.
7. Close the phase issue. After all phases land, merge `develop` into `main`.

See `CLAUDE.md` and `.rules/*.md` for the full conventions.

## Continuous integration

- **GitHub Actions** (`.github/workflows/lint.yml`): cheap checks on every push
  and PR - typos, `actionlint`, `yamllint`, `markdownlint`, MATLAB
  `checkcode`. No EEGLAB plugin runs (license + data constraints).
- **Local CI** (`scripts/local_ci.sh`): heavy MATLAB only - `mh_style`,
  `mh_lint`, `checkcode`, and `runtests` against the real R3 BIDS data.
  Required before opening a PR that touches `src/matlab/`.
- **Pre-commit**: file hygiene, typos, lint (`ruff` for `.py`,
  `mh_style`/`mh_lint` for `.m`).

## Data

- Local 100 Hz R3 (primary): `/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf/`
  (184 subjects, downsampled from SET via `emgio` + `bids-matlab-tools` 9.1).
- Stimulus events: `shot_events.tsv` at repo root (49 trusted rows after
  `match_diff_s > 1.0 s` invalidation).
- Full 500 Hz R3 (after pipeline validates locally):
  `s3://fcp-indi/data/Projects/HBN/BIDS_EEG/cmi_bids_R3`.

## Citing

If you use this analysis in a publication, please cite the HBN-EEG release
along with this repository. A `CITATION.cff` will be added when the first
phase is complete.

## License

BSD 3-Clause License - see [`LICENSE`](LICENSE).
