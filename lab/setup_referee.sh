#!/usr/bin/env bash
# Run the real referee on any teammate's machine. Needs Docker (devkitARM image, about 2 GB once).
# No GBADoom clone or build: the referee judges against the committed lab/out/target/*.json, exported from
# Lane A's private variant. Afterwards: python3 -m lab.referee serve   (127.0.0.1:7101)
set -euo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
IMAGE="$(grep -o 'devkitpro/devkitarm@sha256:[0-9a-f]*' lab/build_target.sh)"
n=$(ls lab/out/target/*.json 2>/dev/null | wc -l | tr -d ' ')
[ "$n" -gt 0 ] || { echo "no lab/out/target/*.json: git pull first" >&2; exit 1; }
docker image inspect "$IMAGE" >/dev/null 2>&1 || docker pull -q "$IMAGE" >/dev/null
docker ps --format '{{.Names}}' | grep -q '^frank-lab$' || docker run -d --name frank-lab -v "$REPO":/work -w /work "$IMAGE" sleep infinity >/dev/null
echo "referee ready ($n targets): python3 -m lab.referee serve   (127.0.0.1:7101)"
