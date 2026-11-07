#!/usr/bin/env bash
# Build the GBADoom target ROM twice from clean inside devkitARM and check the SHA-1s match (T1).
# Usage: lab/build_target.sh            (GBADoom clone expected at lab/secrets/gbadoom)
#        lab/build_target.sh voxelburg  (or FRANK_GAME=voxelburg; any game with a lab/games/<game>.json)
# Flags: GBADoom's own Makefile minus -flto=8 (see DECISIONS.md, "Compiler"). Other games use their Makefile as is.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
GAME="${1:-${FRANK_GAME:-doom}}"
IMAGE="${DEVKITARM_IMAGE:-devkitpro/devkitarm@sha256:116afba8df8453961de2936ffab20dd441edf4d682856c1ec8b0e53d7ed0bbf5}"

if [ "$GAME" != doom ]; then
  cfg() { python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))[sys.argv[2]])' "$REPO/lab/games/$GAME.json" "$1"; }
  SRC="$(cfg src_dir)"; ELF="$(cfg elf)"; GBA="$(cfg gba)"; CMD="$(cfg build_cmd)"
  OUT="$REPO/$(cfg out)"; SECRETS="$REPO/$(cfg secrets)"
  [ -d "$REPO/$SRC" ] || { echo "missing $SRC (see lab/GAME2.md)" >&2; exit 1; }
  mkdir -p "$OUT" "$SECRETS"
  build() {
    docker run --rm -v "$REPO":/work -w "/work/$SRC" "$IMAGE" bash -lc "$CMD"
    shasum -a 1 "$REPO/$SRC/$GBA" | cut -d' ' -f1
  }
  first="$(build)"
  cp "$REPO/$SRC/$GBA" "$OUT/target.gba"
  cp "$REPO/$SRC/$ELF" "$SECRETS/target.elf"
  second="$(build)"
  echo "build 1: $first"
  echo "build 2: $second"
  [ "$first" = "$second" ] || { echo "T1 FAIL: builds differ" >&2; exit 1; }
  echo "T1 PASS: $(cfg out)/target.gba sha1 $first"
  exit 0
fi

SRC="lab/secrets/gbadoom"
OUT="$REPO/lab/out"

[ -d "$REPO/$SRC" ] || { echo "missing $SRC: git clone https://github.com/doomhack/GBADoom.git $SRC" >&2; exit 1; }

# Start from the pinned upstream Makefile, then drop LTO from the Thumb C flags.
git -C "$REPO/$SRC" checkout -- Makefile
sed -i '' 's/ -flto=8//' "$REPO/$SRC/Makefile"
if grep -q -- '-flto=' "$REPO/$SRC/Makefile"; then echo "-flto still present" >&2; exit 1; fi

build() {
  docker run --rm -v "$REPO":/work -w "/work/$SRC" "$IMAGE" \
    bash -lc 'make clean >/dev/null && make -j"$(nproc)" >/dev/null 2>build.log || { tail -40 build.log; exit 1; }'
  shasum -a 1 "$REPO/$SRC/gbadoom.gba" | cut -d' ' -f1
}

first="$(build)"
cp "$REPO/$SRC/gbadoom.gba" "$OUT/target.gba"
cp "$REPO/$SRC/gbadoom.elf" "$REPO/lab/secrets/target.elf"
second="$(build)"

echo "build 1: $first"
echo "build 2: $second"
[ "$first" = "$second" ] || { echo "T1 FAIL: builds differ" >&2; exit 1; }
echo "T1 PASS: lab/out/target.gba sha1 $first"
