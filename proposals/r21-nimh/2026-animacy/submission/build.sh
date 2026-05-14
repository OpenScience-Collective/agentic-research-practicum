#!/usr/bin/env bash
# Build the R21 submission PDF from markdown sources.
#
# Prerequisites:
#   - pandoc 3.0+      (brew install pandoc)
#   - xelatex          (BasicTeX or MacTeX, https://www.tug.org/mactex/)
#
# Usage:
#   cd proposals/r21-nimh/2026-animacy/submission
#   bash build.sh
#
# Output:
#   submission/build/r21.pdf
#
# What it does:
#   Concatenates the four scientific markdown sources in NIH submission order
#   (Cover, Specific Aims, Significance, Innovation, Approach), then renders
#   to PDF via pandoc with the xelatex engine. NIH formatting is encoded
#   in build/header.tex (Helvetica 11pt body, 0.5" margins, 4pt para spacing).
#
# Supplemental sections (Bibliography, Facilities, Equipment, DMS plan, Budget,
# Biosketches, Letters of Support) are submitted as separate PDFs in the NIH
# submission package. Each can be rendered with the same pandoc invocation by
# passing the relevant markdown file in place of the Research Strategy bundle.

set -euo pipefail

SUBMIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$SUBMIT_DIR/build"
mkdir -p "$BUILD_DIR"

CONCAT="$BUILD_DIR/r21-concat.md"
{
  cat "$BUILD_DIR/cover.md"
  echo
  echo "\\pagebreak"
  echo
  echo "# Specific Aims"
  echo
  sed -e 's/^# Specific Aims$//' "$SUBMIT_DIR/specific-aims.md"
  echo
  echo "\\pagebreak"
  echo
  echo "# Research Strategy"
  echo
  cat "$SUBMIT_DIR/research-strategy/significance.md"
  echo
  cat "$SUBMIT_DIR/research-strategy/innovation.md"
  echo
  cat "$SUBMIT_DIR/research-strategy/approach.md"
} > "$CONCAT"

pandoc "$CONCAT" \
  -o "$BUILD_DIR/r21.pdf" \
  --pdf-engine=xelatex \
  --include-in-header="$BUILD_DIR/header.tex" \
  --variable=geometry:letterpaper,margin=0.5in \
  --variable=fontsize:11pt \
  --variable=linkcolor:black \
  --metadata=title:"Animacy across age in naturalistic viewing" \
  --metadata=author:"Seyed Yahya Shirazi" \
  --standalone

echo "Built: $BUILD_DIR/r21.pdf"
echo
echo "Word counts:"
wc -w "$SUBMIT_DIR/specific-aims.md" \
       "$SUBMIT_DIR/research-strategy/significance.md" \
       "$SUBMIT_DIR/research-strategy/innovation.md" \
       "$SUBMIT_DIR/research-strategy/approach.md"
