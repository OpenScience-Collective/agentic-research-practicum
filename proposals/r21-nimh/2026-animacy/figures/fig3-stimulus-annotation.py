# /// script
# requires-python = ">=3.11"
# dependencies = [
#   "matplotlib>=3.8",
#   "pandas>=2.0",
# ]
# ///
"""Figure 3, stimulus annotation diagram for The Present shot events.

Three panels:
  A. Shot-onset timeline, 49 trusted shots colored by class.
  B. Log luminance ratio (LLR) distribution histogram, class-conditional.
  C. Shot duration histogram per class.

Renders to fig3-stimulus-annotation.png at 300 dpi, 7-inch width.

Run from repo root via uv (handles deps via PEP 723 inline script metadata):
    uv run proposals/r21-nimh/2026-animacy/figures/fig3-stimulus-annotation.py
"""

from __future__ import annotations

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


REPO_ROOT = Path(__file__).resolve().parents[4]
SHOT_EVENTS = REPO_ROOT / "shot_events.tsv"
OUTPUT = Path(__file__).resolve().parent / "fig3-stimulus-annotation.png"

PALETTE = {
    "boy-only": "#0072B2",
    "puppy-only": "#E69F00",
    "mixed-or-empty": "#999999",
}


def classify(row: pd.Series) -> str:
    has_boy = row.get("has_boy")
    has_puppy = row.get("has_puppy")
    if has_boy == 1 and has_puppy == 0:
        return "boy-only"
    if has_boy == 0 and has_puppy == 1:
        return "puppy-only"
    return "mixed-or-empty"


def main() -> None:
    if not SHOT_EVENTS.exists():
        raise FileNotFoundError(
            f"shot_events.tsv not found at {SHOT_EVENTS}, "
            "run from the repository worktree where it is tracked."
        )
    df = pd.read_csv(SHOT_EVENTS, sep="\t")
    df["match_diff_s"] = pd.to_numeric(df["match_diff_s"], errors="coerce")
    df["LLR"] = pd.to_numeric(df["LLR"], errors="coerce")
    df["has_boy"] = pd.to_numeric(df["has_boy"], errors="coerce")
    df["has_puppy"] = pd.to_numeric(df["has_puppy"], errors="coerce")

    # match_diff_s NaN means no alignment QC was performed (typically the first
    # shot or scene transitions without a clear audio cue); treat as trusted.
    trusted = df[df["match_diff_s"].abs().fillna(0.0) <= 1.0].copy()
    trusted["class"] = trusted.apply(classify, axis=1)

    fig, axes = plt.subplots(3, 1, figsize=(7, 6), constrained_layout=True)

    # Panel A: shot-onset timeline
    ax_a = axes[0]
    for cls, color in PALETTE.items():
        mask = trusted["class"] == cls
        ax_a.eventplot(
            trusted.loc[mask, "onset"].to_numpy(),
            colors=color,
            linelengths=0.8,
            label=f"{cls} (n={int(mask.sum())})",
        )
    ax_a.set_xlabel("Shot onset (s)")
    ax_a.set_yticks([])
    ax_a.set_title("A. Trusted shot onsets, colored by class")
    ax_a.legend(loc="upper right", frameon=False, fontsize=8)

    # Panel B: LLR distribution
    ax_b = axes[1]
    bins = np.linspace(trusted["LLR"].min(), trusted["LLR"].max(), 12)
    for cls, color in PALETTE.items():
        if cls == "mixed-or-empty":
            continue
        values = trusted.loc[trusted["class"] == cls, "LLR"].dropna()
        if values.empty:
            continue
        ax_b.hist(values, bins=bins, alpha=0.6, color=color, label=cls)
    ax_b.axvline(0, color="black", linewidth=0.5, linestyle="--")
    ax_b.set_xlabel("Log luminance ratio (LLR)")
    ax_b.set_ylabel("Number of shots")
    ax_b.set_title("B. LLR distribution, boy-only vs puppy-only")
    ax_b.legend(loc="upper right", frameon=False, fontsize=8)

    # Panel C: duration distribution
    ax_c = axes[2]
    bins = np.linspace(0, trusted["duration"].max() * 1.05, 12)
    for cls, color in PALETTE.items():
        values = trusted.loc[trusted["class"] == cls, "duration"]
        if values.empty:
            continue
        ax_c.hist(values, bins=bins, alpha=0.6, color=color, label=cls)
    ax_c.set_xlabel("Shot duration (s)")
    ax_c.set_ylabel("Number of shots")
    ax_c.set_title("C. Shot duration by class")
    ax_c.legend(loc="upper right", frameon=False, fontsize=8)

    fig.suptitle(
        f"Figure 3, Stimulus annotation, The Present ({len(trusted)} trusted shots after QC)",
        fontsize=10,
    )

    fig.savefig(OUTPUT, dpi=300, bbox_inches="tight")
    print(f"wrote {OUTPUT}")


if __name__ == "__main__":
    main()
