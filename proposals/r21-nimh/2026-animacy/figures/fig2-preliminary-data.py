# /// script
# requires-python = ">=3.11"
# dependencies = [
#   "matplotlib>=3.8",
#   "pillow>=10",
# ]
# ///
"""Figure 2, preliminary data composite, 3-subject AMICA IC topographies + dipoles.

Composes existing per-subject PNGs from `derivatives/amica/sub-*/figures/` into
a 2-row x 3-column figure. Top row, IC topographies. Bottom row, dipole fits.

Renders to fig2-preliminary-data.png at 300 dpi, 7-inch width.

Run from repo root via uv:
    uv run proposals/r21-nimh/2026-animacy/figures/fig2-preliminary-data.py
"""

from __future__ import annotations

from pathlib import Path

import matplotlib.pyplot as plt
from PIL import Image


REPO_ROOT = Path(__file__).resolve().parents[4]
DERIVATIVES = REPO_ROOT / "derivatives" / "amica"
OUTPUT = Path(__file__).resolve().parent / "fig2-preliminary-data.png"

SUBJECTS = [
    "sub-NDARAA948VFH",
    "sub-NDARAC853DTE",
    "sub-NDARAD774HAZ",
]


def main() -> None:
    if not DERIVATIVES.exists():
        raise FileNotFoundError(
            f"AMICA derivatives directory not found at {DERIVATIVES}, "
            "run from the repository worktree where derivatives are tracked."
        )

    fig, axes = plt.subplots(2, 3, figsize=(7, 4.5), constrained_layout=True)

    for col, sub in enumerate(SUBJECTS):
        topo_path = DERIVATIVES / sub / "figures" / f"{sub}_ic-topos.png"
        dipole_path = DERIVATIVES / sub / "figures" / f"{sub}_dipoles.png"

        for ax in (axes[0, col], axes[1, col]):
            ax.set_xticks([])
            ax.set_yticks([])

        if topo_path.exists():
            axes[0, col].imshow(Image.open(topo_path))
        else:
            axes[0, col].text(
                0.5,
                0.5,
                f"missing\n{topo_path.name}",
                ha="center",
                va="center",
                fontsize=8,
            )
        axes[0, col].set_title(sub, fontsize=8)

        if dipole_path.exists():
            axes[1, col].imshow(Image.open(dipole_path))
        else:
            axes[1, col].text(
                0.5,
                0.5,
                f"missing\n{dipole_path.name}",
                ha="center",
                va="center",
                fontsize=8,
            )

    axes[0, 0].set_ylabel("IC topographies", fontsize=9)
    axes[1, 0].set_ylabel("Dipole fits", fontsize=9)

    fig.suptitle(
        "Figure 2, Preliminary AMICA + dipole results, 3 HBN-EEG R3 subjects",
        fontsize=10,
    )

    fig.savefig(OUTPUT, dpi=300, bbox_inches="tight")
    print(f"wrote {OUTPUT}")


if __name__ == "__main__":
    main()
