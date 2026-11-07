"""Idiom library: generic compiler habits learned from accepted matches (never the answer).

MongoDB Atlas when MONGODB_URI is set and pymongo is installed; otherwise a local JSON file
(runs/_library/idioms.json). Search is keyword overlap locally; Atlas uses $text if no vector index exists.
Hard rule: an idiom whose example shares 3+ consecutive lines with the accepted source is rejected.
"""
from __future__ import annotations

import json
import re
import threading
from pathlib import Path

from .config import Config


def _norm_lines(s: str) -> list[str]:
    return [re.sub(r"\s+", " ", l).strip() for l in s.splitlines() if l.strip() and l.strip() not in "{}"]


def leaks(example: str, source: str, run: int = 3) -> bool:
    a, b = _norm_lines(example), _norm_lines(source)
    grams = {tuple(b[i:i + run]) for i in range(len(b) - run + 1)}
    return any(tuple(a[i:i + run]) in grams for i in range(len(a) - run + 1))


def _tokens(s: str) -> set[str]:
    return {w for w in re.findall(r"[a-z]{3,}|#\d+|r\d+", s.lower())}


class Library:
    def __init__(self, cfg: Config, mode: str = "learning", path: Path | None = None):
        self.mode = mode  # on | off | learning
        self.path = path or cfg.runs_dir / "_library" / "idioms.json"
        self._lock = threading.Lock()
        self.coll = None
        if cfg.mongodb_uri:
            try:
                from pymongo import MongoClient

                self.coll = MongoClient(cfg.mongodb_uri, serverSelectionTimeoutMS=4000)[cfg.mongodb_db]["idioms"]
                self.coll.create_index([("title", "text"), ("applies_when", "text"), ("do", "text")])
            except Exception:
                self.coll = None
        self.items = self._load()

    @property
    def backend(self) -> str:
        return "mongodb" if self.coll is not None else "local-json"

    def _load(self) -> list[dict]:
        if self.coll is not None:
            return list(self.coll.find({}, {"_id": 0}))
        if self.path.exists():
            return json.loads(self.path.read_text())
        return []

    def _save(self) -> None:
        if self.coll is None:
            self.path.parent.mkdir(parents=True, exist_ok=True)
            self.path.write_text(json.dumps(self.items, indent=2))

    def search(self, query: str, k: int = 5) -> list[dict]:
        if self.mode == "off" or not self.items:
            return []
        q = _tokens(query)
        scored = sorted(self.items, key=lambda it: -len(q & _tokens(" ".join([it["title"], it["applies_when"], it["do"]]))))
        return [{k2: it[k2] for k2 in ("idiom_id", "title", "applies_when", "do", "example")} for it in scored[:k]]

    def add(self, idiom: dict, accepted_src: str, source_fn: str) -> dict | None:
        """Returns the stored idiom, or None if rejected (leak, duplicate, or library frozen)."""
        if self.mode != "learning":
            return None
        if leaks(idiom.get("example", ""), accepted_src):
            return None
        with self._lock:
            t = _tokens(idiom["title"] + " " + idiom["applies_when"])
            for it in self.items:  # dedupe near-duplicates
                u = _tokens(it["title"] + " " + it["applies_when"])
                if t and len(t & u) / max(1, len(t | u)) > 0.6:
                    it["uses"] = it.get("uses", 0) + 1
                    if self.coll is not None:
                        self.coll.update_one({"idiom_id": it["idiom_id"]}, {"$inc": {"uses": 1}})
                    self._save()
                    return None
            item = {"idiom_id": f"idm_{len(self.items) + 1:03d}", "title": idiom["title"][:80],
                    "applies_when": idiom["applies_when"][:200], "do": idiom["do"][:200],
                    "example": idiom.get("example", "")[:400], "source_fn": source_fn, "uses": 0}
            self.items.append(item)
            if self.coll is not None:
                self.coll.insert_one(dict(item))
            self._save()
            return item
