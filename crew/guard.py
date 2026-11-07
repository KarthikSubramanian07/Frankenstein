"""Crew isolation (T4): the crew process never opens anything under lab/secrets/ or the visual-only viz_map.

Every file read in crew/ goes through `safe_read`. Lane A's `python -m lab.guard check` is the
cross-lane equivalent; this in-process check needs no subprocess and is always on.
"""
from __future__ import annotations

from pathlib import Path

from .config import ROOT

FORBIDDEN = [ROOT / "lab" / "secrets", ROOT / "crew" / "bench" / "answers"]  # answer keys
FORBIDDEN_FILES = [ROOT / "lab" / "out" / "viz_map.json"]  # screen-only map; agents must never see it


class GuardError(PermissionError):
    pass


def check(path: str | Path) -> Path:
    p = Path(path).expanduser().resolve()
    for f in FORBIDDEN:
        f = f.resolve()
        if p == f or f in p.parents:
            raise GuardError(f"crew may not read {p} (answer key)")
    if p in [f.resolve() for f in FORBIDDEN_FILES]:
        raise GuardError(f"crew may not read {p} (visual-only map)")
    return p


def safe_read(path: str | Path) -> str:
    return check(path).read_text(encoding="utf-8", errors="replace")
