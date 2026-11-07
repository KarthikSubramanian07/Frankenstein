"""Play to recover: SubQ Snap watches the live game and steers the crew in real time.

Lane D's tap sends what the game is doing right now (the functions executing this frame from the heartbeat,
and a screenshot). Snap sees the frame plus the code that is running, and decides which unrecovered function
the crew should rebuild next so that the part of the game the player is looking at heals first.
What you play is what gets rebuilt.

Also `eyes()`: Snap compares frames from the original and the rebuilt or patched ROM and judges behaviour
(observed by looking, not proved by bytes). Used to show that a fix visibly changed what we said it changed.

All decisions emit `snap.decision` events (op "director" or "eyes") so the Stage and ASI:One can show them.
Never invents running functions: it only ranks ids the heartbeat actually reported.
"""
from __future__ import annotations

import base64
import json
import threading
import time
from collections import Counter, deque

from . import snap
from .config import Config

MAX_OPTIONS = 40  # keep the choice small: latency scales with options and state size


def _img(png_bytes: bytes, media: str = "image/png") -> dict:
    return {"mediaType": media, "base64": base64.b64encode(png_bytes).decode()}


MAX_HEARTBEAT_BYTES = 6_000_000  # a 4 MiB PNG in base64 plus the id list
MAX_FRAME_BYTES = 4 * 1024 * 1024  # Lane D's adapter sends at most this (creature/bridge/director_adapter.py)
MAX_RUNNING = 1024  # more ids than the game has functions is not a real frame
PNG_MAGIC = b"\x89PNG\r\n\x1a\n"


def parse_heartbeat(raw: bytes) -> tuple[list[str], bytes | None]:
    """Validate one POST /heartbeat body: {"running": [fn ids], "frame_png_b64": "..."}. Raises ValueError."""
    if len(raw) > MAX_HEARTBEAT_BYTES:
        raise ValueError(f"heartbeat is larger than {MAX_HEARTBEAT_BYTES} bytes")
    d = json.loads(raw or b"{}")
    if not isinstance(d, dict):
        raise ValueError("expected a JSON object")
    running = d.get("running") or []
    if not isinstance(running, list) or not all(isinstance(f, str) and len(f) <= 32 for f in running):
        raise ValueError("running must be a list of fn ids")
    if len(running) > MAX_RUNNING:
        raise ValueError(f"running lists more than {MAX_RUNNING} functions")
    png, b64 = None, d.get("frame_png_b64")
    if b64:
        if not isinstance(b64, str) or len(b64) > (MAX_FRAME_BYTES + 2) // 3 * 4:
            raise ValueError(f"frame must be a base64 PNG of at most {MAX_FRAME_BYTES} bytes")
        png = base64.b64decode(b64, validate=True)
        if not png.startswith(PNG_MAGIC):
            raise ValueError("frame must be a PNG")
    return list(dict.fromkeys(running)), png


class Director:
    """Holds a rolling window of heartbeats; `steer()` asks Snap and returns fn ids to boost."""

    def __init__(self, cfg: Config, target, log=None, window: int = 120):
        self.cfg = cfg
        self.target = target
        self.log = log
        self.recent: deque = deque(maxlen=window)  # (ts, [fn ids])
        self.frame_png: bytes | None = None
        self.lock = threading.Lock()
        self.boosted: list[str] = []
        self.last = None
        self.pending = None  # optional callable -> set of fn ids still queued in this run; Snap only picks from these

    def heartbeat(self, running: list[str], frame_png: bytes | None = None) -> None:
        ids = [f for f in running if f in self.target.fns]
        with self.lock:
            self.recent.append((time.time(), ids))
            if frame_png:
                self.frame_png = frame_png

    STALE_S = 12.0  # only what the player did in the last few seconds counts

    def hot(self) -> list[tuple[str, int]]:
        now = time.time()
        with self.lock:
            while self.recent and now - self.recent[0][0] > self.STALE_S:
                self.recent.popleft()
            c = Counter(f for _, ids in self.recent for f in ids)
        queued = self.pending() if self.pending else None
        return [(f, n) for f, n in c.most_common() if self.target.fns[f]["scope"] == "game"
                and f not in self.target.recovered and (queued is None or f in queued)]

    def steer(self, timeout: float = 8) -> dict:
        hot = self.hot()[:MAX_OPTIONS]
        if not hot:
            return {"action": "none", "reason": "no unrecovered game code running"
                    + (" among this run's pending functions" if self.pending else "")}
        state = {
            "what": "A Game Boy Advance game is being played live while agents rebuild its source code. "
                    "These functions executed in the last few seconds (count = frames seen running). "
                    "Unrecovered code is shown as static on screen. Pick what to rebuild next so the part of the "
                    "screen the player is looking at heals first.",
            "running_unrecovered": [{"fn": f, "frames": n, "size": self.target.fns[f]["size"],
                                     "asm_head": "\n".join(self.target.asm(f).splitlines()[:12])} for f, n in hot],
            "recovered_so_far": len(self.target.recovered),
        }
        q = {
            "next": {"type": "choice", "instructions": "Which function should the crew rebuild next?",
                     "criteria": {f: f"runs in {n} recent frames, {self.target.fns[f]['size']} bytes" for f, n in hot}},
            "visible": {"type": "noul", "instructions": "Is the code that's running mostly drawing what the player "
                        "sees right now (HUD, weapon, enemies on screen), rather than background bookkeeping?"},
        }
        images = [_img(self.frame_png)] if self.frame_png else None
        t = time.time()
        if len(hot) < 2:  # Snap's choice needs two or more options; with one there is nothing to judge
            out = {"action": "boost", "fns": [hot[0][0]], "confidence": None, "latency_ms": 0,
                   "fallback": "only one candidate running"}
            with self.lock:
                self.boosted = out["fns"]
                self.last = out
            if self.log is not None:
                self.log.emit("snap.decision", "scheduler", fn=out["fns"][0], op="director",
                              **{k: v for k, v in out.items() if k != "action"})
            return out
        try:
            r = snap.decide(self.cfg, state, q, op="director", timeout=timeout, images=images)
            ans = r["answers"]
            probs = ans["next"].get("probabilities", {})
            ranked = sorted(probs, key=lambda k: -probs[k])[:3] or [ans["next"]["choice"]]
            out = {"action": "boost", "fns": ranked, "confidence": ans["next"].get("confidence"),
                   "visible_p": ans["visible"].get("noul"), "latency_ms": round((time.time() - t) * 1000),
                   "frame": bool(images)}
        except Exception as e:  # fall back to the hottest running function (still real data, no Snap)
            out = {"action": "boost", "fns": [hot[0][0]], "confidence": 0.0, "error": str(e)[:160],
                   "latency_ms": round((time.time() - t) * 1000), "fallback": "hottest"}
        with self.lock:
            self.boosted = out["fns"]
            self.last = out
        if self.log is not None:
            self.log.emit("snap.decision", "scheduler", fn=out["fns"][0], op="director", **{k: v for k, v in out.items()
                          if k not in ("action",)})
        return out


def eyes(cfg: Config, before_png: bytes, after_png: bytes, claim: str, *, log=None, fn: str | None = None,
         timeout: float = 15) -> dict:
    """Behavioural check: did the visible change match the claim? Two frames, same input, original vs patched."""
    state = {"claim": claim, "note": "Image 1 is the original game; image 2 is the rebuilt or patched game, "
                                     "same moment of play. Judge only what is visible."}
    q = {
        "changed_as_claimed": {"type": "noul", "instructions": "Does image 2 show the change the claim describes, "
                               "compared with image 1?"},
        "otherwise_same": {"type": "noul", "instructions": "Apart from that change, do the two frames look the same "
                           "(no new glitches, missing sprites or corrupted HUD)?"},
    }
    t = time.time()
    r = snap.decide(cfg, state, q, op="eyes", timeout=timeout, images=[_img(before_png), _img(after_png)])
    a = r["answers"]
    out = {"changed_as_claimed_p": a["changed_as_claimed"].get("noul"), "otherwise_same_p": a["otherwise_same"].get("noul"),
           "latency_ms": round((time.time() - t) * 1000)}
    if log is not None:
        log.emit("snap.decision", "creature", fn=fn, op="eyes", claim=claim[:200], **out)
    return out
