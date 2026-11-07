"""Package the pinned upstream shareware IWAD with a verified GBADoom engine.

Uses the official GbaWadUtil converter, never a raw append of doom1.wad.
Outputs local provenance only; no claims about emulator boot or redistribution rights.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import struct
import subprocess
from pathlib import Path

UPSTREAM = "doomhack/GBADoom@7763f5f9adf18f83a59093bc1ab786fe2c36591f"
UTILITY_BLOB = "f08081a700974947f065369d2b8ca4bc181d09ec"
SHAREWARE_BLOB = "1a58f66277d6bc869dfeb701591bd39f25eaacd0"
MAGIC = b"GBADOOM-IWAD-HDR"
HEADER_SIZE = 32
FORMAT_VERSION = 15


def sha1(data: bytes) -> str:
    return hashlib.sha1(data).hexdigest()


def blob_hash(data: bytes) -> str:
    return sha1(b"blob " + str(len(data)).encode("ascii") + b"\0" + data)


def header_offset(data: bytes) -> int:
    offsets = [i for i in range(0, len(data) - HEADER_SIZE + 1, HEADER_SIZE)
               if data[i:i + len(MAGIC)] == MAGIC]
    if len(offsets) != 1:
        raise ValueError("expected one 32-byte-aligned GBADOOM-IWAD-HDR header")
    return offsets[0]


def wad_lumps(wad: bytes) -> dict[str, bytes]:
    if len(wad) < 12 or wad[:4] not in (b"IWAD", b"PWAD"):
        raise ValueError("invalid WAD header")
    count, directory = struct.unpack_from("<II", wad, 4)
    if count > 100000 or directory < 12 or directory + count * 16 > len(wad):
        raise ValueError("invalid WAD directory")
    lumps = {}
    for i in range(count):
        offset, length, name = struct.unpack_from("<II8s", wad, directory + i * 16)
        if offset + length > len(wad):
            raise ValueError("WAD lump outside file")
        lumps[name.rstrip(b"\0").decode("ascii")] = wad[offset:offset + length]
    return lumps


def validate_package(engine: bytes, packaged: bytes) -> dict:
    off = header_offset(engine)
    if len(engine) != off + HEADER_SIZE:
        raise ValueError("engine must be engine-only, ending immediately after the IWAD header")
    if len(packaged) > 32 * 1024 * 1024:
        raise ValueError("package exceeds GBA 32 MiB maximum")
    if header_offset(packaged) != off or packaged[:off + 16] != engine[:off + 16]:
        raise ValueError("converter changed engine bytes outside IWAD metadata")
    version, length, reserved_a, reserved_b = struct.unpack_from("<IIII", packaged, off + 16)
    if version != FORMAT_VERSION or reserved_a or reserved_b or len(packaged) != off + HEADER_SIZE + length:
        raise ValueError("invalid packaged IWAD metadata/length")
    wad = packaged[off + HEADER_SIZE:]
    lumps = wad_lumps(wad)
    if lumps.get("GBAVER") != struct.pack("<I", FORMAT_VERSION):
        raise ValueError("processed WAD lacks expected GBAVER format marker")
    if "E1M1" not in lumps or "E2M1" in lumps or "MAP01" in lumps:
        raise ValueError("expected episode-one shareware data")
    return {"header_offset": off, "engine_bytes": len(engine), "package_bytes": len(packaged),
            "processed_wad_bytes": length, "processed_wad_sha1": sha1(wad), "iwad_version": version,
            "engine_code_preserved": True, "modified_engine_range": [off + 16, off + HEADER_SIZE]}


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--engine", required=True, type=Path)
    p.add_argument("--expected-engine-sha1", required=True, help="current manifest/referee engine hash")
    p.add_argument("--wad", required=True, type=Path, help="pinned upstream GbaWadUtil/doom1.wad")
    p.add_argument("--utility", required=True, type=Path, help="pinned upstream GbaWadUtil.exe with bundled DLLs/data")
    p.add_argument("--out", required=True, type=Path, help="new playable .gba path (must not exist)")
    p.add_argument("--gus", help="optional upstream timidity.cfg; absent means no music instrument bank")
    args = p.parse_args()
    engine_path, wad_path, utility = args.engine.resolve(), args.wad.resolve(), args.utility.resolve()
    engine, wad, utility_bytes = engine_path.read_bytes(), wad_path.read_bytes(), utility.read_bytes()
    if sha1(engine) != args.expected_engine_sha1.lower():
        p.error("engine differs from expected manifest/referee SHA-1")
    if blob_hash(wad) != SHAREWARE_BLOB:
        p.error("WAD is not the pinned upstream shareware doom1.wad")
    if blob_hash(utility_bytes) != UTILITY_BLOB:
        p.error("GbaWadUtil executable differs from pinned upstream Git blob")
    off = header_offset(engine)
    if off + HEADER_SIZE != len(engine):
        p.error("engine input already contains data after its IWAD header")
    out = args.out.resolve()
    provenance = out.with_suffix(out.suffix + ".package.json")
    log_path = out.with_suffix(out.suffix + ".build.log")
    if out.exists() or provenance.exists() or log_path.exists():
        p.error("output/provenance/log exists; choose a fresh output path")
    out.parent.mkdir(parents=True, exist_ok=True)
    if not (utility.parent / "data" / "gbadoom.wad").is_file():
        p.error("mandatory utility data/gbadoom.wad missing")
    cmd = [str(utility), "-in", str(wad_path), "-rom", str(engine_path), "-romout", str(out)]
    if args.gus:
        cmd += ["-gus", args.gus]
    result = subprocess.run(cmd, cwd=utility.parent, capture_output=True, text=True, timeout=180)
    log_path.write_text(result.stdout + result.stderr, encoding="utf-8")
    if result.returncode:
        p.error(f"GbaWadUtil failed ({result.returncode}); see {log_path}")
    package = out.read_bytes()
    verification = validate_package(engine, package)
    proof = {"v": 1, "kind": "creature.package", "upstream": UPSTREAM,
             "engine_path": str(engine_path), "engine_sha1": sha1(engine), "playable_path": str(out),
             "playable_sha1": sha1(package), "playable_sha256": hashlib.sha256(package).hexdigest(),
             "input_wad_sha1": sha1(wad), "input_wad_git_blob": SHAREWARE_BLOB,
             "utility_sha256": hashlib.sha256(utility_bytes).hexdigest(), "utility_git_blob": UTILITY_BLOB,
             "music_bank_requested": bool(args.gus), "command": cmd, **verification,
             "runtime_verified": False, "public_distribution_reviewed": False}
    provenance.write_text(json.dumps(proof, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(proof))


if __name__ == "__main__":
    main()
