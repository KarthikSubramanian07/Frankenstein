"""Second opinion from a different lab: Gemini reviews every accepted MATCH alongside SubQ Snap.

Advisory only (the referee is the floor): it can flag a fakematch or a recital of public source, which the
Checker treats as a rejection only when Gemini AND Snap agree, or Gemini alone is very sure. Shown on the
Time trial scene as "reviewed by a different lab's model". Off the critical path for latency: one fast call.
"""
from __future__ import annotations

import json
import time
import urllib.error
import urllib.request

from .config import env

MODEL = env("GEMINI_MODEL", "gemini-3.5-flash")
STATS = {"calls": 0, "errors": 0, "latency_ms_total": 0.0}

PROMPT = """You are an independent reviewer for a matching-decompilation project. The C below compiles to exactly \
the bytes of the asm (a compiler proved that). Judge only what bytes cannot: is it a FAKEMATCH (compiler coaxing a \
programmer would never write: pointless temporaries, nonsense casts, volatile abuse, padding), does it RECITE \
well-known public Doom/prBoom source (real identifiers, comments, verbatim bodies), and is it PLAUSIBLE code a \
2000s GBA programmer would write? Reply with JSON only: {"fakematch_p": 0-1, "recital_p": 0-1, \
"plausible_p": 0-1, "reason": "<one short sentence>"}.

ASM:
```
%s
```
C:
```c
%s
```"""


def review(asm: str, src: str, *, timeout: float = 15) -> dict:
    key = env("GEMINI_API_KEY")
    if not key:
        raise RuntimeError("GEMINI_API_KEY missing")
    body = json.dumps({"contents": [{"parts": [{"text": PROMPT % (asm[:6000], src[:6000])}]}],
                       "generationConfig": {"responseMimeType": "application/json", "temperature": 0}}).encode()
    url = f"https://generativelanguage.googleapis.com/v1beta/models/{MODEL}:generateContent"
    req = urllib.request.Request(url, data=body, method="POST",
                                 headers={"Content-Type": "application/json", "x-goog-api-key": key})
    t = time.perf_counter()
    try:
        with urllib.request.urlopen(req, timeout=timeout) as r:
            d = json.loads(r.read())
        text = d["candidates"][0]["content"]["parts"][0]["text"]
        out = json.loads(text[text.find("{"): text.rfind("}") + 1])
    except (urllib.error.URLError, KeyError, IndexError, json.JSONDecodeError, TimeoutError) as e:
        STATS["errors"] += 1
        raise RuntimeError(f"gemini review failed: {str(e)[:160]}") from e
    finally:
        STATS["calls"] += 1
        STATS["latency_ms_total"] += (time.perf_counter() - t) * 1000
    out["latency_ms"] = round((time.perf_counter() - t) * 1000)
    out["model"] = MODEL
    return out
