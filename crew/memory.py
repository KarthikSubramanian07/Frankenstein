"""MongoDB Atlas as the crew's memory and system of record.

Every event a run emits (attempts, verdicts, claims, SubQ Snap decisions, habit verdicts) is mirrored into
Atlas, batched off the hot path, so any run can be queried later ("which habits helped on held-out functions?",
"how often did Snap's escalations convert?"). `events.jsonl` stays the contract for the Stage; Atlas is the
durable, queryable record. A no-op when MONGODB_URI is unset or pymongo is missing.

Collections in MONGODB_DB (default "frankenstein"): events (one doc per event), runs (one doc per run, upserted
with metrics at the end), idioms (owned by crew/library.py).
"""
from __future__ import annotations

import queue
import re
import threading

CREDENTIALS = re.compile(r"(mongodb(?:\+srv)?://)[^@/\s]+@")


def safe_error(e: Exception, uri: str | None) -> str:
    """The error text that reaches metrics.json (published in runs/): never the URI or its user:password."""
    text = str(e).replace(uri, "<MONGODB_URI>") if uri else str(e)
    return CREDENTIALS.sub(r"\1<credentials>@", text)[:200]


class AtlasSink:
    def __init__(self, cfg, run_id: str, batch: int = 50, flush_s: float = 1.0):
        self.ok = False
        self.run_id = run_id
        self.q: queue.Queue = queue.Queue()
        self.written = 0
        self.error = None
        self.uri = cfg.mongodb_uri
        if not cfg.mongodb_uri:
            return
        try:
            from pymongo import MongoClient

            db = MongoClient(cfg.mongodb_uri, serverSelectionTimeoutMS=4000)[cfg.mongodb_db]
            db.command("ping")
            self.events = db["events"]
            self.runs = db["runs"]
            self.events.create_index([("run_id", 1), ("seq", 1)])
            self.events.create_index([("type", 1), ("fn", 1)])
            self.ok = True
        except Exception as e:  # memory is best-effort; the run never depends on it
            self.error = safe_error(e, self.uri)
            return
        self.batch, self.flush_s = batch, flush_s
        self._stop = threading.Event()
        self._t = threading.Thread(target=self._loop, daemon=True, name="atlas-sink")
        self._t.start()

    def on_event(self, ev: dict) -> None:
        if self.ok:
            self.q.put(dict(ev))

    def _drain(self) -> None:
        docs = []
        while len(docs) < self.batch:
            try:
                docs.append(self.q.get_nowait())
            except queue.Empty:
                break
        if docs:
            try:
                self.events.insert_many(docs, ordered=False)
                self.written += len(docs)
            except Exception as e:
                self.error = safe_error(e, self.uri)

    def _loop(self) -> None:
        while not self._stop.wait(self.flush_s):
            while not self.q.empty():
                self._drain()

    def finish(self, metrics: dict) -> dict:
        if not self.ok:
            return {"backend": "none", "error": self.error}
        self._stop.set()
        self._t.join(timeout=5)
        while not self.q.empty():
            self._drain()
        try:
            self.runs.update_one({"run_id": self.run_id}, {"$set": {**metrics, "run_id": self.run_id}}, upsert=True)
        except Exception as e:
            self.error = safe_error(e, self.uri)
        return {"backend": "mongodb-atlas", "events_written": self.written, "error": self.error}
