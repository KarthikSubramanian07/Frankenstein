"""Verify ROM files and prepare a manual mGBA save-state/load script; stdlib only.

Does not emit rom.swapped: an actual mGBA run and observed acknowledgement are required.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import shutil
from pathlib import Path

try:
    from .package_rom import HEADER_SIZE, validate_package
except ImportError:  # direct invocation: python creature/runtime/prepare_swap.py
    from package_rom import HEADER_SIZE, validate_package


def digest(path: Path) -> str:
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha1").hexdigest()


def lua_string(value: str) -> str:
    # Lua decimal byte escapes keep Windows paths and arbitrary UTF-8 unambiguous.
    return '"' + "".join("\\%03d" % b for b in value.encode("utf-8")) + '"'


def verify_package_chain(engine_path: Path, playable: Path, proof_path: Path) -> dict:
    """Recompute the chain from files; a JSON assertion alone is insufficient."""
    proof = json.loads(proof_path.read_text(encoding="utf-8-sig"))
    if proof.get("fixture") or proof.get("kind") != "creature.package" or proof.get("v") != 1:
        raise ValueError("package proof must be a real creature.package v1 record")
    engine, packaged = engine_path.read_bytes(), playable.read_bytes()
    verified = validate_package(engine, packaged)
    hashes = {"engine_sha1": hashlib.sha1(engine).hexdigest(),
              "playable_sha1": hashlib.sha1(packaged).hexdigest(),
              "playable_sha256": hashlib.sha256(packaged).hexdigest()}
    for key, expected in {**hashes, **verified}.items():
        if proof.get(key) != expected:
            raise ValueError("package proof disagrees with actual files: " + key)
    return {**hashes, **verified,
            "payload": packaged[verified["header_offset"] + HEADER_SIZE:]}


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--baseline", type=Path, required=True, help="actual playable baseline, including WAD if appended")
    p.add_argument("--candidate", type=Path, required=True, help="actual playable candidate, including WAD if appended")
    p.add_argument("--report", type=Path, required=True, help="real referee rebuild/patch JSON")
    p.add_argument("--mode", choices=("rebuild", "patch"), required=True)
    p.add_argument("--out", type=Path, required=True, help="new output directory; do not commit generated ROM copies")
    p.add_argument("--state-compatible", action="store_true", help="explicit acknowledgement that state/layout compatibility has been checked")
    p.add_argument("--baseline-package-proof", type=Path, help="package_rom sidecar for baseline playable file")
    p.add_argument("--candidate-package-proof", type=Path, help="package_rom sidecar for candidate playable file")
    p.add_argument("--baseline-engine", type=Path, help="actual baseline engine-only file, required with package proofs")
    p.add_argument("--candidate-engine", type=Path, help="actual candidate engine-only file, required with package proofs")
    args = p.parse_args()
    report = json.loads(args.report.read_text(encoding="utf-8-sig"))
    if report.get("fixture"):
        p.error("fixture reports cannot authorize a real swap")
    baseline, candidate = args.baseline.resolve(), args.candidate.resolve()
    before, after = digest(baseline), digest(candidate)
    package_options = (args.baseline_package_proof, args.candidate_package_proof,
                       args.baseline_engine, args.candidate_engine)
    proof_summary = None
    report_before, report_after = before, after
    if any(package_options):
        if not all(package_options):
            p.error("packaged mode requires both package proofs and both actual engine files")
        try:
            base_chain = verify_package_chain(args.baseline_engine.resolve(), baseline,
                                              args.baseline_package_proof)
            cand_chain = verify_package_chain(args.candidate_engine.resolve(), candidate,
                                              args.candidate_package_proof)
        except (ValueError, OSError, KeyError) as error:
            p.error(str(error))
        if base_chain["payload"] != cand_chain["payload"]:
            p.error("processed WAD payloads differ; this is not a code-only swap")
        if base_chain["header_offset"] != cand_chain["header_offset"]:
            p.error("engine layout changed; package/state compatibility not established")
        report_before, report_after = base_chain["engine_sha1"], cand_chain["engine_sha1"]
        proof_summary = {"baseline_engine_sha1": report_before, "candidate_engine_sha1": report_after,
                         "same_processed_wad": True,
                         "processed_wad_sha1": base_chain["processed_wad_sha1"],
                         "package_chain_verified": True}
    if report.get("rom_sha1", "").lower() != report_after:
        p.error("candidate SHA-1 differs from report (supply verified package chains for an engine-only report)")
    if args.mode == "rebuild":
        if (report.get("identical") is not True or before != after or report_before != report_after
                or report.get("original_sha1", "").lower() != report_before):
            p.error("rebuild must be byte-identical to the playable baseline and match both report hashes")
    else:
        changed = report.get("changed_functions")
        if not isinstance(changed, list) or len(changed) != 1 or not isinstance(changed[0], str):
            p.error("patch must report exactly one changed function")
        if before == after:
            p.error("patch candidate is unchanged")
        if not args.state_compatible:
            p.error("patch save-state compatibility unconfirmed; use menu/restart fallback or pass --state-compatible after checking")
    if args.out.exists():
        p.error("output directory already exists; choose a fresh directory")
    args.out.mkdir(parents=True)
    copied = args.out.resolve() / (after + ".gba")
    backup = args.out.resolve() / ("baseline-" + before + ".gba")
    shutil.copyfile(candidate, copied)
    shutil.copyfile(baseline, backup)
    if digest(copied) != after or digest(backup) != before:
        raise RuntimeError("copy verification failed")
    script = '''-- Generated preflight: file copies verified with SHA-1 in Python.
-- Keep both copies unchanged. Pause mGBA, load this script, then inspect console.
-- No rom.swapped event is emitted. This is an unverified runtime attempt.
local candidate = %s
local baseline = %s
local state = emu:saveStateBuffer()
if not state or #state == 0 then error("FRANK: could not save state; no ROM loaded") end
if not emu:loadFile(candidate) then
    error("FRANK: ROM load failed; reopen baseline and restore state manually if required")
end
if not emu:loadStateBuffer(state) then
    local rolled = emu:loadFile(baseline)
    local restored = rolled and emu:loadStateBuffer(state)
    error("FRANK: candidate state restore failed; rollback restored=" .. tostring(restored))
end
console:log("FRANK: candidate loaded and save-state API returned success; visually confirm game and controls before claiming swap")
console:log("FRANK: preflight candidate SHA-1 %s (file verification, not a loaded-ROM SHA-1 measurement)")
''' % (lua_string(str(copied)), lua_string(str(backup)), after)
    script_path = args.out / "swap.lua"
    script_path.write_text(script, encoding="utf-8")
    result = {"v": 1, "mode": args.mode, "baseline_sha1": before, "candidate_sha1": after,
              "script": str(script_path.resolve()), "runtime_verified": False,
              "note": "No event emitted. Recheck files unchanged immediately before running script; capture actual gameplay acknowledgement."}
    if proof_summary:
        result["package_proof"] = proof_summary
    (args.out / "preflight.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result))


if __name__ == "__main__":
    main()
