"""Referee access for the crew: the real Lab referee over HTTP, or a clearly-labelled in-process mock.

REFEREE_URL=http://127.0.0.1:7101  -> Lane A's referee (contracts section 4)
REFEREE_URL=mock                    -> MockReferee: deterministic fake verdicts for wiring and tests only.
Runs against the mock are labelled "mock referee" in run.started and metrics; never present them as results.
"""
from __future__ import annotations

import hashlib
import json
import re
import time
import urllib.error
import urllib.request

LINT_RULES = [  # the hard floor is Lane A's linter; this mirrors it so the mock behaves similarly
    ("L001", re.compile(r"\b(__asm__|__asm|asm)\s*(volatile\s*)?\("), "inline assembly is not allowed"),
    ("L002", re.compile(r"\.(2byte|4byte|byte|word|inst)\b"), "raw bytes emitted into code"),
    ("L003", re.compile(r"#\s*pragma|__attribute__"), "codegen-changing pragma or attribute"),
    ("L004", re.compile(r"register\s+[^;]*\basm\s*\("), "register asm binding"),
]


class RefereeError(RuntimeError):
    pass


class HttpReferee:
    kind = "lab"

    def __init__(self, url: str, timeout: float = 60):
        self.url = url.rstrip("/")
        self.timeout = timeout

    def _req(self, method: str, path: str, body: dict | None = None, raw: bool = False):
        data = json.dumps(body).encode() if body is not None else None
        last = None
        for attempt in range(3):
            req = urllib.request.Request(self.url + path, data=data, method=method,
                                         headers={"Content-Type": "application/json"})
            try:
                with urllib.request.urlopen(req, timeout=self.timeout) as r:
                    data = r.read()
                    if raw:
                        return data.decode("utf-8", "replace")
                    return json.loads(data)
            except urllib.error.HTTPError as e:
                raise RefereeError(f"referee HTTP {e.code} on {path}: {e.read()[:300]!r}") from e
            except (urllib.error.URLError, TimeoutError, ConnectionError) as e:
                last = e
                time.sleep(1 + attempt)
        raise RefereeError(f"referee unreachable at {self.url}: {last}")

    def health(self) -> dict:
        return self._req("GET", "/health")

    def check(self, fn: str, src: str) -> dict:
        return self._req("POST", "/check", {"fn": fn, "src": src})

    def context(self, fn: str) -> str:
        txt = self._req("GET", f"/context/{fn}", raw=True)  # lab serves the header as text; bench may wrap it in JSON
        try:
            d = json.loads(txt)
            if isinstance(d, dict):
                return d.get("ctx") or d.get("header") or ""
            if isinstance(d, str):
                return d
        except json.JSONDecodeError:
            pass
        return txt

    def rebuild(self, recovered_dir: str) -> dict:
        return self._req("POST", "/rebuild", {"recovered_dir": recovered_dir})


class MockReferee:
    """Deterministic fake. A candidate 'matches' when its normalized hash falls under a threshold that rises
    with effort, so loops, claims, false claims and verdict events all get exercised. Not a compiler."""
    kind = "mock"

    def __init__(self, match_threshold: int = 30):
        self.match_threshold = match_threshold

    def health(self) -> dict:
        return {"ok": True, "referee": "mock"}

    def context(self, fn: str) -> str:
        return ("/* MOCK ctx header (Lane A's real one replaces this) */\n"
                "typedef unsigned char u8; typedef unsigned short u16; typedef unsigned int u32;\n"
                "typedef signed char s8; typedef short s16; typedef int s32; typedef int fixed_t;\n")

    def check(self, fn: str, src: str) -> dict:
        t0 = time.time()
        base = {"v": 1, "fn": fn, "referee": "mock", "diff": [], "first_diff": None}
        viol = [{"rule": r, "reason": why} for r, rx, why in LINT_RULES if rx.search(src)]
        if viol:
            return {**base, "status": "LINT_FAIL", "match_pct": 0.0, "lint": {"ok": False, "violations": viol},
                    "compile": {"ok": False, "log": "not compiled: lint failed"}, "elapsed_ms": 1}
        if "{" not in src or src.count("{") != src.count("}"):
            return {**base, "status": "NO_COMPILE", "match_pct": 0.0, "lint": {"ok": True, "violations": []},
                    "compile": {"ok": False, "log": "error: expected declaration (mock)"}, "elapsed_ms": 2}
        norm = re.sub(r"\s+|/\*.*?\*/|//[^\n]*", "", src, flags=re.S)
        h = int(hashlib.sha1((fn + norm).encode()).hexdigest()[:8], 16) % 100
        ok = {"lint": {"ok": True, "violations": []}, "compile": {"ok": True, "log": ""},
              "elapsed_ms": int((time.time() - t0) * 1000) + 5}
        if h < self.match_threshold:
            return {**base, **ok, "status": "MATCH", "match_pct": 100.0}
        off = (h % 12) * 2
        fd = {"offset": off, "expected": "1c08", "got": "1c10",
              "expected_ins": "adds r0, r1, #0", "got_ins": "adds r0, r2, #0"}
        return {**base, **ok, "status": "PARTIAL", "match_pct": round(40 + h * 0.55, 1), "first_diff": fd, "diff": [fd]}

    def rebuild(self, recovered_dir: str) -> dict:
        return {"v": 1, "rom_sha1": "0" * 40, "identical": True, "recovered": 0, "from_original": 0,
                "method": "source-tree", "mock": True}


def make_referee(url: str):
    return MockReferee() if url.strip().lower() in ("mock", "") else HttpReferee(url)
