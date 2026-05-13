---
epic_issue: 35
epic_title: "R21 (NIMH), Animacy across age in naturalistic viewing (HBN R3)"
integration_branch: main
epic_branch: null
worktree_base: "../r21-phase{N}-*"
mechanism: "NIH R21"
target_ic: "NIMH"
nofo: "PA-25-304 (NIH Parent R21, Clinical Trial Not Allowed); PA-25-150 (NINDS/NIMH joint) as alternate pending NOT-NS-26-007 verification"
phases:
  - number: 1
    title: "NOFO selection and Specific Aims"
    issue: 36
    branch: "feature/issue-36-phase1-aims"
    status: complete
    pr: 41
    note: "Merged 2026-05-13. Aims at 435 words, 2 aims, falsification conditions on Aims page. NOFO targeting PA-25-304."
  - number: 2
    title: "Significance and Innovation, lit-review expansion"
    issue: 37
    branch: "feature/issue-37-phase2-sig-inn"
    status: complete
    pr: 42
    note: "Merged 2026-05-13. Significance 423w, Innovation 396w. 14 refs added via opencite from 73 candidates across 7 queries."
  - number: 3
    title: "Approach, preliminary data, timeline"
    issue: 38
    branch: "feature/issue-38-phase3-approach"
    status: in_progress
  - number: 4
    title: "Supplemental sections (Bib, Facilities, DMS, Budget, Biosketches)"
    issue: 39
    branch: "feature/issue-39-phase4-supplemental"
    status: pending
  - number: 5
    title: "Assembly, grant-review, humanizer pass"
    issue: 40
    branch: "feature/issue-40-phase5-assembly"
    status: pending
current_phase: 3
created_at: "2026-05-13T17:05:00Z"
updated_at: "2026-05-13T20:45:00Z"
---

## Notes

- Parallel to Epic #1 (HBN ERSP analysis). Both use main as integration branch; phase PRs land into main directly (no separate epic-merge branch), matching the project convention in CLAUDE.md.
- State file is separate from Epic #1's `.claude/epic.local.md` to avoid collision.
- Preliminary data source: whatever Epic #1 derivatives have landed by Phase 3 start. Cite published HBN-EEG R3 group results where available; clearly label pilot vs group.
- Lit-review strategy: existing 98-paper corpus in `research/collection/` plus `direction-papers/movie-ersp-direction.md` is the base. Phase 2 expands via `opencite:opencite` on animacy/biological motion, developmental EEG, and naturalistic-viewing time-resolved EEG.
- Proposal directory: `proposals/r21-nimh/2026-animacy/` (created in Phase 1).
- R21 constraints: 2 years, $275K direct costs total; 1p aims + 6p strategy.
- No emojis in commits/PRs/issues. No em-dashes in prose. Define abbreviations on first use.
- Per-phase review: invoke `/review-pr` on each phase PR. For Phase 5, also invoke `grant:grant-review` and `grant-figure-qa` before finalization.
