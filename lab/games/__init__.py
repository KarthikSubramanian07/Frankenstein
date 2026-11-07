"""Per-game pipeline config: lab/games/<id>.json. Pick with --game or FRANK_GAME (default doom)."""
import json
import os
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]


def load(game: str | None = None) -> dict:
    """Config for `game` plus absolute Paths: out, secrets, src (and *_rel strings relative to the repo)."""
    game = game or os.environ.get("FRANK_GAME") or "doom"
    path = Path(__file__).with_name(f"{game}.json")
    if not path.exists():
        raise SystemExit(f"unknown game {game!r}: no {path}")
    cfg = json.loads(path.read_text())
    for key in ("out", "secrets", "src_dir"):
        cfg[f"{key}_rel"] = cfg[key]
        cfg[key] = REPO / cfg[key]
    return cfg
