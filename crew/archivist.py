"""The Archivist: dry museum-curator narration grounded strictly in events (no LLM on the hot path).

At most one ticker line every 8 seconds; announcer lines (priority 3, speak=True, four words or fewer)
for milestones and false claims. Every line is <= 90 characters (contract).
"""
from __future__ import annotations

import random
import threading
import time

TICKER = {
    "false_claim": ["Another claim, another lie. Byte {off} disagrees.",
                    "{digger} swore it matched. Offset {off} says otherwise.",
                    "Confidence is not evidence. Instruction at {off} differs."],
    "matched": ["{fn} is back. The compiler agrees, byte for byte.",
                "{fn} recovered in {attempts} tries. Patience is a virtue.",
                "Matched {fn}. Somewhere, a 2004 programmer nods."],
    "matched_first": ["{fn} matched first try. Show-off.", "One attempt, one match. {fn} goes in the case."],
    "lint": ["Inline assembly. Nice try, {digger}.", "The linter does not accept bribes."],
    "idiom": ["New idiom filed: {title}.", "The library grows: {title}."],
    "abandoned": ["{fn} resists. We will come back with better tools.",
                  "{fn} keeps its secrets for now. Best was {pct}%."],
}
ANNOUNCE = {25: "Quarter of targets back!", 50: "Halfway there!", 75: "Three quarters!",
            100: "Every target matched!"}  # announcer lines: four words max; about the run's targets, not the game


class Archivist:
    def __init__(self, log, min_gap_s: float = 8.0, seed: int = 7):
        self.log = log
        self.min_gap = min_gap_s
        self.last = 0.0
        self.rng = random.Random(seed)
        self._lock = threading.Lock()
        self._said = set()
        self._claims = {}

    def say(self, text: str, mood: str = "dry", speak: bool = False, priority: int = 1, force: bool = False) -> None:
        with self._lock:
            now = time.time()
            if not force and now - self.last < self.min_gap:
                return
            self.last = now
        self.log.emit("narration", "archivist", text=text[:90], mood=mood, speak=speak, priority=priority)

    def milestone(self, matched: int, total: int) -> None:
        """Milestones are about THIS run's targets. Small runs (live segments, ASI:One jobs) never say
        "recovered", because a 2-of-2 run is not "fully recovered" when the game has 568 functions."""
        pct = matched * 100 // max(1, total)
        for m, line in ANNOUNCE.items():
            if pct >= m and m not in self._said:
                if total < 20 and m < 100:
                    continue  # a 2-3 function run only gets the closing line
                self._said.add(m)
                self.say(line, mood="proud", speak=True, priority=3, force=True)

    def on_event(self, ev: dict) -> None:
        t, p, fn = ev["type"], ev["payload"], ev.get("fn") or "?"
        if t == "narration":
            return
        if t == "claim.made":
            self._claims[(fn, p.get("attempt"))] = ev["actor"]
        elif t == "verdict" and p.get("claim_was_true") is False:
            off = (p.get("first_diff") or {}).get("offset", "?")
            digger = self._claims.get((fn, p.get("attempt")), "The digger")
            self.say("Claim rejected!", mood="alarmed", speak=True, priority=3, force=True)
            self.say(self.rng.choice(TICKER["false_claim"]).format(off=off, digger=digger), mood="alarmed",
                     priority=2, force=True)
        elif t == "verdict" and p.get("status") == "LINT_FAIL":
            self.say(self.rng.choice(TICKER["lint"]).format(digger="digger"), priority=1)
        elif t == "fn.matched":
            key = "matched_first" if p.get("attempts") == 1 else "matched"
            self.say(self.rng.choice(TICKER[key]).format(fn=fn, attempts=p.get("attempts")), priority=1)
        elif t == "idiom.learned":
            self.say(self.rng.choice(TICKER["idiom"]).format(title=p.get("title", "")[:50]), priority=1)
        elif t == "fn.abandoned":
            self.say(self.rng.choice(TICKER["abandoned"]).format(fn=fn, pct=p.get("best_pct", 0)), priority=0)
