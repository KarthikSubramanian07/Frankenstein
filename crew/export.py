"""Publish a finished run so every lane can pull it from GitHub (runs/ is gitignored).

    python -m crew.export doom_r01            # -> crew/exports/doom_r01/{events.jsonl,metrics.json,names.json,recovered/,EXPORT.json}

EXPORT.json records the manifest SHA-1 of the target, the ROM SHA-1 the referee judged against, and a hash
of every file, so the Stage and the Creature can prove which build a replay belongs to. Only Checker-accepted
sources are in recovered/. Nothing from lab/secrets or the answer keys is ever copied.
"""
from __future__ import annotations

import hashlib
import json
import shutil
import sys
from pathlib import Path

from .config import ROOT, Config

OUT = ROOT / "crew" / "exports"


def sha1(p: Path) -> str:
    return hashlib.sha1(p.read_bytes()).hexdigest()


def export(run_id: str, cfg: Config | None = None) -> Path:
    cfg = cfg or Config()
    src = cfg.runs_dir / run_id
    if not (src / "events.jsonl").exists():
        raise SystemExit(f"no run at {src}")
    if not (src / "metrics.json").exists():
        raise SystemExit(f"run {run_id} has not finished (no metrics.json)")
    dst = OUT / run_id
    if dst.exists():
        shutil.rmtree(dst)
    (dst / "recovered").mkdir(parents=True)
    for name in ("events.jsonl", "metrics.json", "names.json"):
        if (src / name).exists():
            shutil.copy2(src / name, dst / name)
    for c in sorted((src / "recovered").glob("fn_*.c")):
        shutil.copy2(c, dst / "recovered" / c.name)
    man = cfg.manifest_path
    manifest = json.loads(man.read_text())
    files = {str(p.relative_to(dst)): sha1(p) for p in sorted(dst.rglob("*")) if p.is_file()}
    meta = {"v": 1, "run_id": run_id, "manifest": str(man.relative_to(ROOT)), "manifest_sha1": sha1(man),
            "target_rom_sha1": manifest["game"].get("rom_sha1"), "game_id": manifest["game"]["id"],
            "recovered": len(list((dst / "recovered").glob("fn_*.c"))), "files": files,
            "fixture": bool(json.loads((dst / "metrics.json").read_text()).get("fixture"))}
    (dst / "EXPORT.json").write_text(json.dumps(meta, indent=2) + "\n")
    return dst


def main(argv=None) -> int:
    argv = argv if argv is not None else sys.argv[1:]
    if not argv:
        print(__doc__)
        return 1
    for rid in argv:
        d = export(rid)
        print(f"exported {rid} -> {d.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
