"""Package a GBADoom engine ROM with the shareware IWAD using GbaWadUtil built from the public source.

This is NOT Lane D's verified package path (creature/runtime/package_rom.py pins the upstream Windows .exe by
Git blob, and a source build cannot match that hash). It is a separate wrapper for macOS/Linux:

    python3 tools/package_rom_native.py --engine lab/out/target.gba --utility <build>/GbaWadUtil \
        --wad <GBADoom clone>/GbaWadUtil/doom1.wad --out <scratch>/doom-original.gba

The utility must sit next to a `data/gbadoom.wad` (copy or symlink GBADoom's GbaWadUtil/data). Checks: the WAD is
DOOM1.WAD v1.9 shareware (SHA-1 below, 4,196,020 bytes), the output passes Lane D's own `validate_package`
(engine bytes preserved, one IWAD header, format-15 processed WAD, episode-one data). No GUS music bank, same as
Lane D's packages. Writes `<out>.package.json` provenance labelled "native-source-build". ROMs and WADs stay out of
git (`*.gba`, `*.wad` are ignored).
"""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import subprocess
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]
SHAREWARE_SHA1 = "5b2e249b9c5133ec987b3ea77596381dc0d6bc1d"  # DOOM1.WAD v1.9 shareware, 4,196,020 bytes
SHAREWARE_SIZE = 4_196_020
UPSTREAM = "doomhack/GBADoom@7763f5f9adf18f83a59093bc1ab786fe2c36591f (tools/GbaWadUtil, built with clang++)"


def _lane_d_validator():
    spec = importlib.util.spec_from_file_location("package_rom", REPO / "creature/runtime/package_rom.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--engine", required=True, type=Path)
    p.add_argument("--utility", required=True, type=Path, help="GbaWadUtil compiled from the public source")
    p.add_argument("--wad", required=True, type=Path, help="shareware doom1.wad (v1.9)")
    p.add_argument("--out", required=True, type=Path)
    p.add_argument("--expected-engine-sha1", default="", help="optional: refuse an engine with a different SHA-1")
    a = p.parse_args()
    pr = _lane_d_validator()
    engine, wad = a.engine.read_bytes(), a.wad.read_bytes()
    if len(wad) != SHAREWARE_SIZE or pr.sha1(wad) != SHAREWARE_SHA1:
        p.error(f"WAD is not DOOM1.WAD v1.9 shareware (sha1 {pr.sha1(wad)}, {len(wad)} bytes)")
    if a.expected_engine_sha1 and pr.sha1(engine) != a.expected_engine_sha1.lower():
        p.error("engine SHA-1 differs from --expected-engine-sha1")
    utility = a.utility.resolve()
    gbawad = utility.parent / "data" / "gbadoom.wad"
    if not gbawad.is_file():
        p.error(f"{gbawad} missing: GbaWadUtil needs GBADoom's data/ folder next to it")
    out = a.out.resolve()
    if out.exists():
        p.error("output exists; choose a fresh path")
    out.parent.mkdir(parents=True, exist_ok=True)
    cmd = [str(utility), "-in", str(a.wad.resolve()), "-rom", str(a.engine.resolve()), "-romout", str(out)]
    r = subprocess.run(cmd, cwd=utility.parent, capture_output=True, text=True, timeout=180)
    if r.returncode:
        p.error(f"GbaWadUtil failed ({r.returncode}): {(r.stdout + r.stderr)[-800:]}")
    package = out.read_bytes()
    verification = pr.validate_package(engine, package)  # Lane D's structural checks, unchanged
    proof = {"v": 1, "kind": "creature.package", "packager": "native-source-build",
             "note": "packaged with GbaWadUtil built from the public source; not Lane D's pinned-.exe package",
             "upstream": UPSTREAM, "utility_sha256": hashlib.sha256(utility.read_bytes()).hexdigest(),
             "gbadoom_wad_git_blob": pr.blob_hash(gbawad.read_bytes()),
             "engine_path": str(a.engine), "engine_sha1": pr.sha1(engine),
             "playable_path": str(out), "playable_sha1": pr.sha1(package),
             "input_wad_sha1": pr.sha1(wad), "input_wad_git_blob": pr.blob_hash(wad),
             "music_bank_requested": False, **verification, "runtime_verified": False}
    out.with_suffix(out.suffix + ".package.json").write_text(json.dumps(proof, indent=2) + "\n")
    print(json.dumps(proof))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
