"""The Checker: never trusts a Digger. Every attempt is judged by the referee through the Checker,
every claim is re-verified with a fresh, uncached referee call, and every MATCH gets a fakematch review
(hard rules here, plus SubQ Snap's probability gate when available)."""
from __future__ import annotations

import hashlib
import re
import threading

from .events import EventLog

VOLATILE = re.compile(r"\bvolatile\b")
CAST = re.compile(r"\(\s*(unsigned|signed|u8|u16|u32|s8|s16|s32|int|short|char|long)\s*\**\s*\)")
GOTO = re.compile(r"\bgoto\b")
# IWRAM/EWRAM raw casts (0x02…/0x03…) stand in for a data_ id. GBA MMIO at 0x0400… is hardware, not data_.
ABS_ADDR = re.compile(r"\)\s*0x0[23][0-9A-Fa-f]{6}\b")
MMIO = re.compile(r"0x0400[0-9A-Fa-f]{4}")


class Checker:
    def __init__(self, referee, log: EventLog, snap_review=None, snap_threshold: float = 0.85, second_review=None):
        self.referee = referee
        self.log = log
        self.snap_review = snap_review  # callable(asm, src, ctx) -> dict, or None
        self.snap_threshold = snap_threshold
        self._cache: dict[tuple[str, str], dict] = {}
        self._lock = threading.Lock()
        self.false_claims = 0
        self.fakematches_rejected = 0
        self.snap_reviews = 0
        self.second_review = second_review  # callable(asm, src) -> dict (Gemini), or None
        self.second_reviews = 0

    @staticmethod
    def key(fn: str, src: str) -> tuple[str, str]:
        return fn, hashlib.sha1(src.encode()).hexdigest()

    def judge(self, fn: str, attempt: int, src: str) -> dict:
        """Referee verdict for an attempt (cached by source hash: identical resubmissions cost nothing)."""
        k = self.key(fn, src)
        with self._lock:
            hit = self._cache.get(k)
        res = hit or self.referee.check(fn, src)
        if not hit:
            with self._lock:
                self._cache[k] = res
        self.log.emit("verdict", "checker", fn=fn, attempt=attempt, status=res["status"],
                      match_pct=float(res.get("match_pct", 0.0)), first_diff=res.get("first_diff"),
                      lint_ok=bool(res.get("lint", {}).get("ok", True)), claim_was_true=None,
                      cached=bool(hit))
        return res

    def verify_claim(self, fn: str, attempt: int, src: str) -> dict:
        """Independent re-verification: fresh referee call, never the Digger's (or our cached) result."""
        res = self.referee.check(fn, src)
        ok = res["status"] == "MATCH" and res.get("lint", {}).get("ok", True)
        if not ok:
            with self._lock:
                self.false_claims += 1
        self.log.emit("verdict", "checker", fn=fn, attempt=attempt, status=res["status"],
                      match_pct=float(res.get("match_pct", 0.0)), first_diff=res.get("first_diff"),
                      lint_ok=bool(res.get("lint", {}).get("ok", True)), claim_was_true=ok)
        return res

    def review(self, fn: str, asm: str, src: str, ctx: str, n_instructions: int) -> tuple[bool, str, dict]:
        """Fakematch review of a byte MATCH. Returns (accept, reason, evidence)."""
        evidence: dict = {}
        lines = [l for l in src.splitlines() if l.strip()]
        if VOLATILE.search(src) and "volatile" not in ctx:
            # volatile on MMIO registers is real GBA code; volatile locals to coax codegen are not
            if any(VOLATILE.search(line) and not MMIO.search(line) for line in src.splitlines()):
                return self._reject("volatile used to coax codegen", evidence)
        if ABS_ADDR.search(src):
            return self._reject("absolute address cast instead of a data_ id (L006)", evidence)
        if len(GOTO.findall(src)) > 2:
            return self._reject("more than two gotos", evidence)
        if n_instructions and len(lines) > max(12, 8 * n_instructions):
            return self._reject("source padded far beyond the target's size", evidence)
        if max((len(CAST.findall(l)) for l in lines), default=0) >= 4:
            return self._reject("cast chains with no type reason", evidence)
        # Two labs, in parallel (no added latency): SubQ Snap and Gemini. The referee already proved the bytes;
        # these judge what bytes can't. Reject when Snap is sure, when both labs flag it, or Gemini is near-certain.
        from concurrent.futures import ThreadPoolExecutor

        jobs = {}
        with ThreadPoolExecutor(max_workers=2) as ex:
            if self.snap_review is not None:
                jobs["snap"] = ex.submit(self.snap_review, asm, src, ctx)
            if self.second_review is not None:
                jobs["gemini"] = ex.submit(self.second_review, asm, src)
            res = {}
            for k, f in jobs.items():
                try:
                    res[k] = f.result(timeout=25)
                except Exception as e:  # advisory: the referee is the floor
                    evidence[f"{k}_error"] = str(e)[:200]
        if "snap" in res:
            r = res["snap"]
            self.snap_reviews += 1
            evidence["snap"] = {k: r.get(k) for k in ("fakematch_p", "recital_p", "period_plausible_p")}
        if "gemini" in res:
            g = res["gemini"]
            self.second_reviews += 1
            evidence["gemini"] = {k: g.get(k) for k in ("fakematch_p", "recital_p", "plausible_p", "reason", "model")}
        sf = (res.get("snap") or {}).get("fakematch_p") or 0
        sr = (res.get("snap") or {}).get("recital_p") or 0
        gf = float((res.get("gemini") or {}).get("fakematch_p") or 0)
        gr = float((res.get("gemini") or {}).get("recital_p") or 0)
        if sf >= self.snap_threshold:
            return self._reject(f"SubQ Snap: fakematch probability {sf:.2f}", evidence)
        if sr >= self.snap_threshold:
            return self._reject(f"SubQ Snap: recites public source, p={sr:.2f}", evidence)
        if gf >= 0.95 or (gf >= 0.7 and sf >= 0.5):
            return self._reject(f"second lab (Gemini) flags a fakematch, p={gf:.2f}", evidence)
        if gr >= 0.95 or (gr >= 0.7 and sr >= 0.5):
            return self._reject(f"second lab (Gemini) flags recited public source, p={gr:.2f}", evidence)
        return True, "accepted", evidence

    def _reject(self, reason: str, evidence: dict):
        with self._lock:
            self.fakematches_rejected += 1
        return False, reason, evidence
