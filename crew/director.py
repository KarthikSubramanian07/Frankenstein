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
import threading
import time
from collections import Counter, deque

from . import snap
from .config import Config

MAX_OPTIONS = 40  # keep the choice small: latency scales with options and state size


def _img(png_bytes: bytes, media: str = "image/png") -> dict:
    return {"mediaType": media, "base64": base64.b64encode(png_bytes).decode()}


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

    def heartbeat(self, running: list[str], frame_png: bytes | None = None) -> None:
        ids = [f for f in running if f in self.target.fns]
        with self.lock:
            self.recent.append((time.time(), ids))
            if frame_png:
                self.frame_png = frame_png

    def hot(self) -> list[tuple[str, int]]:
        with self.lock:
            c = Counter(f for _, ids in self.recent for f in ids)
        return [(f, n) for f, n in c.most_common() if self.target.fns[f]["scope"] == "game"
                and f not in self.target.recovered]

    def steer(self, timeout: float = 8) -> dict:
        hot = self.hot()[:MAX_OPTIONS]
        if not hot:
            return {"action": "none", "reason": "no unrecovered game code running"}
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
