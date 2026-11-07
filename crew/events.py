"""Append-only writer for runs/<run_id>/events.jsonl (contracts section 5). Thread-safe."""
from __future__ import annotations

import json
import threading
from datetime import datetime, timezone
from pathlib import Path


def now_iso() -> str:
    t = datetime.now(timezone.utc)
    return t.strftime("%Y-%m-%dT%H:%M:%S.") + f"{t.microsecond // 1000:03d}Z"


class EventLog:
    def __init__(self, run_dir: Path, run_id: str):
        self.run_dir = Path(run_dir)
        self.run_id = run_id
        self.run_dir.mkdir(parents=True, exist_ok=True)
        self.path = self.run_dir / "events.jsonl"
        self._lock = threading.Lock()
        self._seq = 0
        self._fh = self.path.open("a", encoding="utf-8")
        self.listeners = []  # callables(event) for in-process consumers (archivist, metrics)

    def emit(self, type_: str, actor: str, fn: str | None = None, **payload) -> dict:
        with self._lock:
            self._seq += 1
            ev = {"v": 1, "ts": now_iso(), "run_id": self.run_id, "seq": self._seq, "type": type_,
                  "actor": actor, "fn": fn, "payload": payload}
            self._fh.write(json.dumps(ev, separators=(",", ":")) + "\n")
            self._fh.flush()
        for cb in list(self.listeners):
            try:
                cb(ev)
            except Exception:  # a listener must never break the run
                pass
        return ev

    def close(self) -> None:
        with self._lock:
            self._fh.close()
