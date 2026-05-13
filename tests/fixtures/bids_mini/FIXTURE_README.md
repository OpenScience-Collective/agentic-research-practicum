# HBN R3 fixture

Mini BIDS-EEG dataset derived from the HBN R3 100 Hz local copy.
Used by `tests/matlab/*.m` to run real-data smoke tests in CI
without requiring the full /Volumes mount.

## Provenance

- Subject: `sub-NDARAA948VFH`
- Task: `ThePresent`
- Window: 0 to 60 s (from full recording of 206.0 s)
- Sampling rate: 100 Hz
- Channels: 129 (unchanged from source)
- Built from: `/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf`
- License: CC-BY-SA 4.0 (inherited from HBN-EEG; see `dataset_description.json`).

## Reproduce

```bash
matlab -batch "run('scripts/build_test_fixture.m')"
```

## Why this window

shot_events.tsv rows that fall in [0, 60) span shots 1..15, which
include boy-only (#2..#5), neither (#7, #14), boy+puppy (#16 sits
exactly at the boundary, dropped), and the first puppy-only shot
(#15 at 55.042 s). Phase 4 epoching has enough material.
