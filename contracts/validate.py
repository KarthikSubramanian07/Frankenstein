#!/usr/bin/env python3
"""Validate every fixture and every runs/*/ file against contracts/schemas/. Exits non-zero on any failure.

    python3 contracts/validate.py            # fixtures + runs/*
    python3 contracts/validate.py path ...   # specific files (schema picked from the file name)
"""
from __future__ import annotations

import json
import sys
from pathlib import Path

from jsonschema import Draft202012Validator

ROOT = Path(__file__).resolve().parent.parent
SCHEMAS = ROOT / "contracts" / "schemas"
FIX = ROOT / "contracts" / "fixtures"

# file-name stem prefix -> schema name
BY_NAME = {
    "manifest": "manifest", "viz_map": "viz_map", "referee_result": "referee_result",
    "rebuild_result": "rebuild_result", "patch_result": "patch_result", "memory_probe": "memory_probe",
    "metrics": "metrics", "names": "names", "sprite_frame": "sprite_frame",
    "crew_job": "crew_job", "crew_status": "crew_status", "link_info": "link_info",
}


def load_validators() -> dict[str, Draft202012Validator]:
    out = {}
    for p in sorted(SCHEMAS.glob("*.schema.json")):
        schema = json.loads(p.read_text())
        Draft202012Validator.check_schema(schema)
        out[p.name.removesuffix(".schema.json")] = Draft202012Validator(schema)
    return out


def errors_for(v: Draft202012Validator, doc, where: str) -> list[str]:
    return [f"{where}: {'/'.join(map(str, e.absolute_path)) or '<root>'}: {e.message}"
            for e in sorted(v.iter_errors(doc), key=lambda e: list(map(str, e.absolute_path)))]


def check_jsonl(v, path: Path) -> list[str]:
    errs, last_seq = [], {}
    for n, line in enumerate(path.read_text().splitlines(), start=1):
        if not line.strip():
            continue
        try:
            doc = json.loads(line)
        except json.JSONDecodeError as e:
            errs.append(f"{path}:{n}: invalid JSON: {e}")
            continue
        if doc == {"type": "fixture"}:
            continue
        errs += errors_for(v, doc, f"{path}:{n}")
        actor, seq = doc.get("actor"), doc.get("seq")
        if isinstance(seq, int) and actor in last_seq and seq <= last_seq[actor]:
            errs.append(f"{path}:{n}: seq {seq} not strictly increasing for writer {actor}")
        last_seq[actor] = seq
    return errs


def check_file(vals, path: Path) -> list[str]:
    if path.suffix == ".jsonl":
        return check_jsonl(vals["event"], path)
    stem = path.name.split(".")[0]
    name = next((s for k, s in BY_NAME.items() if stem.startswith(k)), None)
    if name is None:
        return [f"{path}: no schema for this file name"]
    try:
        doc = json.loads(path.read_text())
    except json.JSONDecodeError as e:
        return [f"{path}: invalid JSON: {e}"]
    if name == "metrics" and "runs" in doc:  # metrics.sample.json wraps several runs
        return [e for i, r in enumerate(doc["runs"]) for e in errors_for(vals[name], r, f"{path}[runs/{i}]")]
    return errors_for(vals[name], doc, str(path))


def default_targets() -> list[Path]:
    files = sorted(p for p in FIX.iterdir() if p.suffix in (".json", ".jsonl"))
    runs = ROOT / "runs"
    for d in sorted(p for p in runs.iterdir() if p.is_dir() and not p.is_symlink()) if runs.exists() else []:
        files += [p for p in (d / "events.jsonl", d / "metrics.json", d / "names.json") if p.exists()]
    for p in (ROOT / "lab" / "out").glob("*.json"):
        files.append(p)
    return files


def main(argv: list[str]) -> int:
    vals = load_validators()
    targets = [Path(a) for a in argv] or default_targets()
    errs = []
    for t in targets:
        errs += check_file(vals, t)
    for e in errs[:200]:
        print("FAIL", e)
    rel = lambda p: p.relative_to(ROOT) if p.is_absolute() and p.is_relative_to(ROOT) else p  # noqa: E731
    print(f"{'FAILED' if errs else 'OK'}: {len(targets)} files, {len(vals)} schemas, {len(errs)} errors")
    if not errs:
        for t in targets:
            print("  ok", rel(t.resolve()))
    return 1 if errs else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
