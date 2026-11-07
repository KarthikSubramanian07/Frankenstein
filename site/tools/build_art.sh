#!/usr/bin/env bash
# Build web images from site/tools/out/<scene>.png into site/assets/art/:
#   <scene>-800.webp, <scene>-1400.webp (when the source is wider), <scene>-full.webp (native width),
#   and <scene>-lqip.webp, a 32 px blur-up placeholder. Never upscales: Gemini renders at 1200-1584 px.
#   site/tools/build_art.sh            # every shipped scene in out/
#   site/tools/build_art.sh hero lie   # only some scenes
# Needs cwebp (brew install webp) and sips (macOS).
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
src="$here/out"
dst="$here/../assets/art"
mkdir -p "$dst"
scenes=("$@")
if [ ${#scenes[@]} -eq 0 ]; then
  for f in "$src"/*.png; do n="$(basename "$f" .png)"; [[ "$n" == *-v* ]] || scenes+=("$n"); done
fi
for n in "${scenes[@]}"; do
  in="$src/$n.png"
  [ -f "$in" ] || { echo "missing $in" >&2; continue; }
  native="$(sips -g pixelWidth "$in" | awk '/pixelWidth/ {print $2}')"
  rm -f "$dst/$n"-*.webp
  cwebp -quiet -q 80 -m 6 -resize 800 0 "$in" -o "$dst/$n-800.webp"
  if [ "$native" -gt 1400 ]; then cwebp -quiet -q 80 -m 6 -resize 1400 0 "$in" -o "$dst/$n-1400.webp"; fi
  cwebp -quiet -q 80 -m 6 "$in" -o "$dst/$n-full.webp"
  cwebp -quiet -q 40 -resize 32 0 "$in" -o "$dst/$n-lqip.webp"
  printf '%-8s native %4spx ' "$n" "$native"
  for f in "$dst/$n"-*.webp; do printf ' %s=%sK' "$(basename "$f" .webp | sed "s/^$n-//")" "$(( $(stat -f%z "$f") / 1024 ))"; done; echo
done
