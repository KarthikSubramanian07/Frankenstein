#!/usr/bin/env bash
# Dump symbols and disassembly of the target ELF and its objects into lab/secrets/dump/ for lab/split.py.
# Usage: lab/dump_target.sh [game]  (or FRANK_GAME; default doom). Other games dump into lab/secrets/games/<game>/dump/.
set -euo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
GAME="${1:-${FRANK_GAME:-doom}}"
IMAGE="${DEVKITARM_IMAGE:-$(grep -o 'devkitpro/devkitarm@sha256:[0-9a-f]*' "$REPO/lab/build_target.sh")}"
# Paths relative to the repo: the secrets dir (target.elf, dump/) and the game's object files.
read -r SECRETS OBJS < <(python3 - "$REPO/lab/games/$GAME.json" <<'PY'
import json, sys
c = json.load(open(sys.argv[1]))
print(c["secrets"], " ".join(f'/work/{c["src_dir"]}/{d}/*{c["obj_suffix"]}' for d in c["obj_dirs"]))
PY
)
mkdir -p "$REPO/$SECRETS/dump"
docker run --rm -v "$REPO":/work -w /work "$IMAGE" bash -c '
  B=$DEVKITARM/bin/arm-none-eabi
  cd '"$SECRETS"'
  $B-nm -S -n --defined-only --special-syms target.elf > dump/elf_nm.txt
  $B-objdump -d target.elf > dump/elf_dis.txt
  for o in '"$OBJS"'; do echo "== $(basename "$o")"; $B-nm -S --defined-only "$o"; done > dump/obj_nm.txt'
echo "dumped to $SECRETS/dump/"
