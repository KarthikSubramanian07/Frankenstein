"""Verify ROM files and prepare a manual mGBA save-state/load script; stdlib only.

Does not emit rom.swapped: an actual mGBA run and observed acknowledgement are required.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import shutil
from pathlib import Path


def digest(path: Path) -> str:
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha1").hexdigest()


def lua_string(value: str) -> str:
    # Lua decimal byte escapes keep Windows paths and arbitrary UTF-8 unambiguous.
    return '"' + "".join("\\%03d" % b for b in value.encode("utf-8")) + '"'


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--baseline", type=Path, required=True, help="actual playable baseline, including WAD if appended")
    p.add_argument("--candidate", type=Path, required=True, help="actual playable candidate, including WAD if appended")
    p.add_argument("--report", type=Path, required=True, help="real referee rebuild/patch JSON")
    p.add_argument("--mode", choices=("rebuild", "patch"), required=True)
    p.add_argument("--out", type=Path, required=True, help="new output directory; do not commit generated ROM copies")
    p.add_argument("--state-compatible", action="store_true", help="explicit acknowledgement that state/layout compatibility has been checked")
    args = p.parse_args()
    report = json.loads(args.report.read_text(encoding="utf-8-sig"))
    if report.get("fixture"):
        p.error("fixture reports cannot authorize a real swap")
    baseline, candidate = args.baseline.resolve(), args.candidate.resolve()
    before, after = digest(baseline), digest(candidate)
    if report.get("rom_sha1", "").lower() != after:
        p.error("candidate SHA-1 differs from report (engine-only hash cannot attest a WAD-appended ROM)")
    if args.mode == "rebuild":
        if report.get("identical") is not True or before != after or report.get("original_sha1", "").lower() != before:
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
    (args.out / "preflight.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result))


if __name__ == "__main__":
    main()
