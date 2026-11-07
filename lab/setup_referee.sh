#!/usr/bin/env bash
# One command to run the real referee on any teammate's machine (needs Docker, about 1 GB image).
# Rebuilds the exact target from GitHub sources, checks it equals the committed manifest, then starts the
# frank-lab container. Afterwards: python3 -m lab.referee serve   (localhost:7101)
set -euo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
UPSTREAM_COMMIT=7763f5f
IMAGE="$(grep -o 'devkitpro/devkitarm@sha256:[0-9a-f]*' lab/build_target.sh)"

if [ ! -d lab/secrets/gbadoom ]; then
  git clone -q https://github.com/doomhack/GBADoom.git lab/secrets/gbadoom
fi
git -C lab/secrets/gbadoom checkout -q "$UPSTREAM_COMMIT"
docker pull -q "$IMAGE" >/dev/null

lab/build_target.sh | tail -1
want="$(python3 -c "import json;print(json.load(open('lab/out/manifest.json'))['game']['rom_sha1'])")"
got="$(shasum -a 1 lab/out/target.gba | cut -d' ' -f1)"
[ "$want" = "$got" ] || { echo "ROM $got does not match the committed manifest $want" >&2; exit 1; }

lab/dump_target.sh
python3 lab/split.py >/dev/null
git diff --quiet -- lab/out || { echo "regenerated lab/out differs from the committed one; tell Lane A (GitHub issue)" >&2; git diff --stat -- lab/out >&2; exit 1; }

docker ps --format '{{.Names}}' | grep -q '^frank-lab$' || docker run -d --name frank-lab -v "$REPO":/work -w /work "$IMAGE" sleep infinity >/dev/null
echo "referee ready: python3 -m lab.referee serve   (localhost:7101)"
