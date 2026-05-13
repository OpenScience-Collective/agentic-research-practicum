---
epic_issue: 1
epic_title: "HBN ERSP: Boy-shot vs Puppy-shot in 'ThePresent' (R3)"
integration_branch: main
epic_branch: null
worktree_base: "../hbn-ersp"
phases:
  - number: 1
    title: "Preprocess R3 (BIDS import, HPF, cleanline gate, channel rejection)"
    issue: 2
    branch: "feature/issue-2-phase1-preprocess"
    status: code_landed_results_lost
    pr: 8
    note: "PR #8 merged 2026-04-21; derivatives lost in repo transfer. Re-running on 3 subjects via feature/issue-2-phase1-rerun."
  - number: 2
    title: "AMICA + dipfit"
    issue: 3
    branch: "feature/issue-3-phase2-amica"
    status: pending
  - number: 3
    title: "ICLabel classification + non-brain IC rejection"
    issue: 4
    branch: "feature/issue-4-phase3-iclabel"
    status: pending
  - number: 4
    title: "Shot-event expansion and epoching"
    issue: 5
    branch: "feature/issue-5-phase4-epoch"
    status: pending
  - number: 5
    title: "ERSP precompute + IC clustering"
    issue: 6
    branch: "feature/issue-6-phase5-ersp"
    status: pending
  - number: 6
    title: "Group statistics + manuscript figures"
    issue: 7
    branch: "feature/issue-7-phase6-stats"
    status: pending
current_phase: 1
created_at: "2026-04-21T16:55:00Z"
updated_at: "2026-05-12T22:00:00Z"
---

## Notes

- Workflow is main-only: no `develop` branch, no `feature/issue-N-epic-*` integration branch. Phase PRs target `main`.
- Per-phase QA: invoke the `eeg-qa-neuroscientist` agent (`.claude/agents/eeg-qa-neuroscientist.md`) on the phase's `derivatives/<stage>/` directory before opening the PR. Address PASS-WITH-FINDINGS / FAIL items before review.
- Results tracking: QA artifacts (PSD PNGs, `qa_*.csv`, `params.json`, READMEs) under `derivatives/<stage>/` are allow-listed in `.gitignore` and committed. Heavy `.set`/`.fdt` checkpoints stay ignored.
- Re-run cadence: Phase 1 is re-running on 3 subjects to recover the lost Stage B results from 2026-04-21. Subsequent phases run on the same 3 subjects until the pipeline is end-to-end, then we expand.
