#!/bin/bash
set -e
SCRIPT=/Users/yahya/.claude/plugins/cache/research-skills/figures/0.9.0/skills/transparent-icons/scripts/generate_icon.py
PY="uv run --with python-dotenv --with openai --with pillow python"

declare -a icons=(
  "stim_photographs.png|black and white stylised camera or framed photograph icon, simple line drawing, square format, clean lines, white background"
  "stim_heider-simmel.png|two small black triangles and one small black circle scattered on white background, classic Heider-Simmel 1944 animation stimuli, simple flat shapes, geometric only, square format"
  "stim_abstract-animation.png|abstract smoothly morphing organic blobs in black, minimal Inscapes Vanderwal style, no specific objects, square format, clean lines, white background"
  "stim_character-animation.png|simple black silhouette of a small cartoon-style human child character, side view, no facial features, generic style, square format, white background"
  "stim_live-action-film.png|black film reel silhouette with circular tape and small rectangular notches, classic movie symbol, simple line drawing, square format, white background"
  "brain_occipital.png|top-down view of a human head silhouette with the nose tip pointing up, head outline as a thin grey ellipse, the occipital (back) region filled with solid blue color hex 0072B2, nothing else colored, white background, simple line drawing"
  "brain_central.png|top-down view of a human head silhouette with nose tip pointing up, head outline as a thin grey ellipse, a horizontal band across the middle filled with solid vermillion color hex D55E00, nothing else colored, white background, simple line drawing"
  "brain_left-frontotemporal.png|top-down view of a human head silhouette with nose tip pointing up, head outline as a thin grey ellipse, the left frontotemporal region (left side, slightly toward front) filled with solid green color hex 009E73, nothing else colored, white background, simple line drawing"
  "brain_occipital-and-frontal.png|top-down view of a human head silhouette with nose tip pointing up, head outline as a thin grey ellipse, two regions filled with solid reddish-purple color hex CC79A7: the occipital (back) region and two small frontal circles near the front, white background, simple line drawing"
)

for entry in "${icons[@]}"; do
  IFS='|' read -r fname prompt <<< "$entry"
  echo "=== Generating $fname ==="
  $PY $SCRIPT "$prompt" -o "$fname" --transparent 2>&1 | grep -E "^(Backend|Saved|Error)" || echo "FAILED $fname"
done
echo "=== Done ==="
ls -la *.png
