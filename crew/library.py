"""Idiom library: generic compiler habits learned from accepted matches (never the answer).

MongoDB Atlas when MONGODB_URI is set and pymongo is installed; otherwise a local JSON file
(runs/_library/idioms.json). Search is keyword overlap locally; Atlas uses $text if no vector index exists.
Hard rule: an idiom whose example shares 3+ consecutive lines with the accepted source is rejected.

Habits must earn their place (The System That Gets Better): every idiom starts as a *candidate*. Each time a
Digger is given it, the outcome is recorded. An idiom is *adopted* once it has been used at least 3 times with a
first-or-second-attempt match rate at least the library's baseline, and *retired* (never offered again) once it
has been used 4+ times and does worse than the baseline by 15 points. Status changes are emitted as
`idiom.judged` events, so the Stage can show habits being kept and rolled back.
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

    ADOPT_MIN, RETIRE_MIN, RETIRE_MARGIN = 3, 4, 0.15

    def search(self, query: str, k: int = 5) -> list[dict]:
        if self.mode == "off" or not self.items:
            return []
        q = _tokens(query)
        live = [it for it in self.items if it.get("status", "candidate") != "retired"]
        rank = {"adopted": 0, "candidate": 1}
        scored = sorted(live, key=lambda it: (-len(q & _tokens(" ".join([it["title"], it["applies_when"], it["do"]]))),
                                              rank.get(it.get("status", "candidate"), 1)))
        return [{k2: it[k2] for k2 in ("idiom_id", "title", "applies_when", "do", "example")} for it in scored[:k]]

    def baseline(self) -> float:
        """Quick-match rate across all recorded outcomes (the bar an idiom has to clear)."""
        b = getattr(self, "_base", None) or {"n": 0, "wins": 0}
        return b["wins"] / b["n"] if b["n"] else 0.5

    def record_outcome(self, idiom_ids: list[str], matched: bool, attempts: int) -> list[dict]:
        """Credit (or blame) the idioms a Digger was given. Returns status changes for `idiom.judged`."""
        win = bool(matched and attempts <= 2)
        if self.mode != "learning":  # frozen library (held-out evaluation): never learn from the test set
            return []
        with self._lock:
            b = getattr(self, "_base", None) or {"n": 0, "wins": 0}
            b["n"] += 1
            b["wins"] += int(win)
            self._base = b
            base = b["wins"] / b["n"]
            changes = []
            for it in self.items:
                if it["idiom_id"] not in idiom_ids:
                    continue
                it["tries"] = it.get("tries", 0) + 1
                it["wins"] = it.get("wins", 0) + int(win)
                rate = it["wins"] / it["tries"]
                old = it.get("status", "candidate")
                new = old
                if old != "retired" and it["tries"] >= self.RETIRE_MIN and rate < base - self.RETIRE_MARGIN:
                    new = "retired"
                elif old == "candidate" and it["tries"] >= self.ADOPT_MIN and rate >= base:
                    new = "adopted"
                if new != old:
                    it["status"] = new
                    changes.append({"idiom_id": it["idiom_id"], "status": new, "tries": it["tries"], "wins": it["wins"],
                                    "rate": round(rate, 3), "baseline": round(base, 3), "title": it["title"]})
                if self.coll is not None:
                    self.coll.update_one({"idiom_id": it["idiom_id"]}, {"$set": {k: it.get(k) for k in ("tries", "wins", "status")}})
            if self.mode == "learning":
                self._save()
        return changes

    def counts(self) -> dict:
        c = {"candidate": 0, "adopted": 0, "retired": 0}
        for it in self.items:
            c[it.get("status", "candidate")] = c.get(it.get("status", "candidate"), 0) + 1
        return c

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
                    "example": idiom.get("example", "")[:400], "source_fn": source_fn, "uses": 0,
                    "status": "candidate", "tries": 0, "wins": 0}
            self.items.append(item)
            if self.coll is not None:
                self.coll.insert_one(dict(item))
            self._save()
            return item
