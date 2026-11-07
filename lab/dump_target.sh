#!/usr/bin/env bash
# Dump symbols and disassembly of the target ELF and its objects into lab/secrets/dump/ for lab/split.py.
set -euo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE="${DEVKITARM_IMAGE:-$(grep -o 'devkitpro/devkitarm@sha256:[0-9a-f]*' "$REPO/lab/build_target.sh")}"
mkdir -p "$REPO/lab/secrets/dump"
docker run --rm -v "$REPO/lab/secrets":/w -w /w "$IMAGE" bash -c '
  B=$DEVKITARM/bin/arm-none-eabi
  $B-nm -S -n --defined-only --special-syms target.elf > dump/elf_nm.txt
  $B-objdump -d target.elf > dump/elf_dis.txt
  for o in gbadoom/build/*.o; do echo "== $(basename "$o")"; $B-nm -S --defined-only "$o"; done > dump/obj_nm.txt'
echo "dumped to lab/secrets/dump/"
