"""SubQ Snap (Decisions API, POST /v1/systemone): fast typed judgments with probabilities.

Two load-bearing uses in the crew:

* `triage()` puts the WHOLE program's disassembly in one `state` (Snap's window is 384K tokens) and
  asks one score question (difficulty) and one choice question (kind) per function, at most 128
  questions per request, requests in parallel. Every question sees every function, so callee
  bodies and shared globals inform each function's difficulty. The scheduler can order work by it.
* `review()` runs on every referee MATCH: three yes/no gates (fakematch / recital of public
  Doom source / period plausibility). It does not overrule the referee; it flags.

Stdlib only. Usage is tracked in the module-level `STATS` dict (snap_calls, latency, tokens) so
metrics can report it. Pricing per docs: input $0.04 / 1M tokens, output free.
"""
from __future__ import annotations

import json
import random
import re
import threading
import time
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor

from .config import Config, env

SNAP_PRICE_IN = 0.04e-6  # USD per input token (docs.subq.ai, Models: subq-snap-1.1)
MAX_QUESTIONS = 128  # API limit per request
CHARS_PER_TOKEN = 1.45  # measured: Snap usage.input_tokens on this game's asm (1.42 chars/token)
STATE_TOKEN_BUDGET = 330_000  # under the 393,216-token window, leaving room for 128 questions

KINDS = {"math": "math", "loop": "loop", "struct_update": "struct-update", "dispatch": "dispatch/switch",
         "render": "render", "other": "other"}
KIND_CRITERIA = {
    "math": "Arithmetic or fixed-point helper: multiplies, shifts, divides, clamps; little control flow",
    "loop": "Dominated by a loop over an array, list or buffer",
    "struct_update": "Reads and writes fields of one or more structs (state update, init, setters)",
    "dispatch": "Branches on a value to many cases: switch, jump table, state machine, callbacks",
    "render": "Draws or copies pixels, columns, spans, sprites, or video memory",
    "other": "None of the above",
}
DIFFICULTY_LEVELS = [
    "Trivial: a handful of instructions, the C is obvious",
    "Easy: short, straight-line or one simple branch",
    "Moderate: several branches or a simple loop; register allocation may need a nudge",
    "Hard: long, nested control flow, many live values, order-sensitive code generation",
    "Very hard: large, loops plus switches, heavy inlining or scheduling quirks; byte-identical C is a long hunt",
]

STATS: dict = {"snap_calls": 0, "errors": 0, "latency_ms_total": 0.0, "latency_ms_mean": 0.0,
               "input_tokens": 0, "output_tokens": 0, "cost_usd": 0.0, "questions": 0,
               "by_op": {}, "last": None}
_LOCK = threading.Lock()


class SnapError(RuntimeError):
    pass


def _record(op: str, ms: float, usage: dict, nq: int, ok: bool) -> None:
    with _LOCK:
        STATS["snap_calls"] += 1
        STATS["errors"] += 0 if ok else 1
        STATS["latency_ms_total"] += ms
        STATS["latency_ms_mean"] = round(STATS["latency_ms_total"] / STATS["snap_calls"], 1)
        tin = int(usage.get("input_tokens", 0) or 0)
        STATS["input_tokens"] += tin
        STATS["output_tokens"] += int(usage.get("output_tokens", 0) or 0)
        STATS["cost_usd"] = round(STATS["input_tokens"] * SNAP_PRICE_IN, 6)
        STATS["questions"] += nq
        b = STATS["by_op"].setdefault(op, {"calls": 0, "latency_ms_total": 0.0, "input_tokens": 0})
        b["calls"] += 1
        b["latency_ms_total"] += ms
        b["input_tokens"] += tin
        STATS["last"] = {"op": op, "latency_ms": round(ms, 1), "usage": usage, "questions": nq, "ok": ok}


def reset_stats() -> None:
    with _LOCK:
        STATS.update({"snap_calls": 0, "errors": 0, "latency_ms_total": 0.0, "latency_ms_mean": 0.0,
                      "input_tokens": 0, "output_tokens": 0, "cost_usd": 0.0, "questions": 0, "by_op": {},
                      "last": None})


def decide(cfg: Config, state, questions: dict, *, op: str = "decide", timeout: float = 30,
           retries: int = 3, model: str | None = None) -> dict:
    """One /v1/systemone call. Returns the parsed JSON ({"model", "answers", "usage"}) plus
    "latency_ms". Retries 429/5xx and network errors with short backoff; everything else raises."""
    if not cfg.subq_key:
        raise SnapError("SubQ key missing: get one at the Subquadratic table, set SUBQ_API_KEY in .env")
    if not 1 <= len(questions) <= MAX_QUESTIONS:
        raise SnapError(f"{len(questions)} questions; the API takes 1 to {MAX_QUESTIONS}")
    body = json.dumps({"model": model or env("SUBQ_SNAP_MODEL", "subq-snap-1.1"), "state": state,
                       "questions": questions}).encode()
    last = None
    for attempt in range(retries + 1):
        req = urllib.request.Request(f"{cfg.subq_url}/systemone", data=body, method="POST", headers={
            "Authorization": f"Bearer {cfg.subq_key}", "Content-Type": "application/json"})
        t0 = time.perf_counter()
        try:
            with urllib.request.urlopen(req, timeout=timeout) as r:
                d = json.loads(r.read())
            ms = (time.perf_counter() - t0) * 1000
            _record(op, ms, d.get("usage") or {}, len(questions), True)
            d["latency_ms"] = round(ms, 1)
            return d
        except urllib.error.HTTPError as e:
            ms = (time.perf_counter() - t0) * 1000
            raw = e.read()[:600]
            try:
                det = json.loads(raw).get("detail") or {}
                last = f"HTTP {e.code} {det.get('error_type')}: {det.get('message')}"
            except Exception:
                last = f"HTTP {e.code}: {raw!r}"
            _record(op, ms, {}, len(questions), False)
            if e.code in (429, 500, 502, 503, 504) and attempt < retries:
                time.sleep(min(8, 0.5 * 2 ** attempt + random.random()))
                continue
            raise SnapError(last) from e
        except (urllib.error.URLError, TimeoutError) as e:
            _record(op, (time.perf_counter() - t0) * 1000, {}, len(questions), False)
            last = f"network: {e}"
            if attempt < retries:
                time.sleep(0.5 * 2 ** attempt)
                continue
    raise SnapError(f"Snap call failed after retries: {last}")


# --------------------------------------------------------------------------------------------- triage

def whole_program_state(target, recovered: dict | None = None, *, budget_tokens: int = STATE_TOKEN_BUDGET,
                        scope: str = "game") -> tuple[str, dict]:
    """All game functions by address, each with size/callees and its asm (cartographer.dense_asm).
    If the text is over the budget, cap every function at the same number of lines (the largest cap
    that fits) and say so in the stats."""
    from .cartographer import cap_lines, dense_asm, fit_cap, fn_id_map

    recovered = recovered if recovered is not None else getattr(target, "recovered", {})
    fs = sorted((f for f in target.manifest["functions"] if f["scope"] == scope), key=lambda f: int(f["addr"], 16))
    ids = fn_id_map(target)
    dense = {f["id"]: dense_asm(target.asm(f["id"]), ids) for f in fs}

    def render(cap):
        out = [f"Whole program: {len(fs)} functions of a GBA game (ARM7TDMI Thumb, GCC -O3), ordered by address. "
               "Offsets are function-relative; `=data_ID` loads a global's address."
               f"{' Each function is cut to ' + str(cap) + ' lines.' if cap else ''}\n"]
        for f in fs:
            tag = " (already recovered)" if f["id"] in recovered else ""
            out.append(f"### {f['id']} size={f['size']}B mode={f['mode']} callees={','.join(f['callees']) or '-'}"
                       f"{tag}\n{cap_lines(dense[f['id']], cap)}\n")
        return "".join(out)

    budget_chars = int(budget_tokens * CHARS_PER_TOKEN)
    cap = fit_cap(render, [len(a.splitlines()) for a in dense.values()], budget_chars)
    text = render(cap)
    return text, {"n_functions": len(fs), "chars": len(text), "tokens_est": int(len(text) / CHARS_PER_TOKEN),
                  "line_cap": cap, "trimmed": cap is not None, "over_budget": len(text) > budget_chars,
                  "functions_cut": sum(1 for a in dense.values() if cap and len(a.splitlines()) > cap)}


def _qname(prefix: str, fn: str) -> str:
    return f"{prefix}_{fn}"


def triage_questions(fns: list[str], sizes: dict[str, int] | None = None) -> dict:
    qs = {}
    for fn in fns:
        sz = f" ({sizes[fn]} bytes)" if sizes and fn in sizes else ""
        qs[_qname("d", fn)] = {
            "type": "score",
            "instructions": f"Function {fn}{sz}, shown under '### {fn}' in the program: how hard will it be to "
                            "write C that GCC compiles to these exact bytes? Consider its callees and the "
                            "globals it shares with other functions.",
            "criteria": DIFFICULTY_LEVELS}
        qs[_qname("k", fn)] = {
            "type": "choice",
            "instructions": f"Function {fn}, shown under '### {fn}': what kind of code is it mostly?",
            "criteria": KIND_CRITERIA}
    return qs


def triage(cfg: Config, target, recovered: dict | None = None, fns: list[str] | None = None, *,
           workers: int = 4, timeout: float = 120, state: str | None = None) -> dict:
    """{fn: {"difficulty": 0..1, "confidence": 0..1, "kind": str, "score": raw, "kind_confidence"}}.

    `fns` defaults to every game function. Two questions per function, so 64 functions per request;
    requests run concurrently and share the same whole-program state."""
    if state is None:
        state, _ = whole_program_state(target, recovered)
    if fns is None:
        fns = [f["id"] for f in sorted(target.game_functions(), key=lambda f: int(f["addr"], 16))]
    sizes = {fn: target.fns[fn]["size"] for fn in fns if fn in target.fns}
    per = MAX_QUESTIONS // 2
    batches = [fns[i:i + per] for i in range(0, len(fns), per)]

    def run(batch):
        return batch, decide(cfg, state, triage_questions(batch, sizes), op="triage", timeout=timeout)

    out: dict = {}
    with ThreadPoolExecutor(max_workers=max(1, min(workers, len(batches) or 1))) as ex:
        for batch, d in ex.map(run, batches):
            ans = d.get("answers") or {}
            for fn in batch:
                s = ans.get(_qname("d", fn)) or {}
                k = ans.get(_qname("k", fn)) or {}
                levels = max(2, len(s.get("legend") or DIFFICULTY_LEVELS))
                score = s.get("score")
                out[fn] = {"difficulty": round(float(score) / (levels - 1), 4) if score is not None else None,
                           "confidence": s.get("confidence"), "score": score,
                           "kind": KINDS.get(k.get("choice"), k.get("choice") or "other"),
                           "kind_confidence": k.get("confidence")}
    return out


# --------------------------------------------------------------------------------------------- review

REVIEW_QUESTIONS = {
    "fakematch": {
        "type": "noul",
        "instructions": "This C compiles to exactly the bytes of the asm. Is it a fakematch: code that coaxes the "
                        "compiler instead of expressing intent (pointless temporaries, nonsense casts, volatile "
                        "abuse, dummy padding variables, do{}while(0) or register tricks with no purpose)?",
        "criteria": {"true": "Contains compiler-coaxing constructs a programmer would not write",
                     "false": "Reads as ordinary code that just happens to match"}},
    "recital": {
        "type": "noul",
        "instructions": "Does the C recite well-known public Doom or prBoom source (original identifiers, comments, "
                        "or verbatim bodies) rather than being derived from the anonymized asm?",
        "criteria": {"true": "Uses real Doom/prBoom names, comments, or verbatim code",
                     "false": "Only anonymous ids (fn_, data_, struct_) and code derived from the asm"}},
    "period_plausible": {
        "type": "noul",
        "instructions": "Is this plausible C that a 2000s game programmer porting Doom to the GBA would have written?",
        "criteria": {"true": "Idiomatic C of the era", "false": "Unnatural, machine-generated, or anachronistic"}},
}


def review(cfg: Config, asm: str, src: str, ctx: str = "", *, timeout: float = 20) -> dict:
    """Three noul gates on one accepted function. Noul answers carry no confidence field, so
    `confidence[q]` is the API's when present, else 2*|p-0.5| (distance from a coin flip)."""
    state = {"asm": asm, "c_source": src}
    if ctx:
        state["context_header"] = ctx
    d = decide(cfg, state, REVIEW_QUESTIONS, op="review", timeout=timeout)
    ans = d.get("answers") or {}

    def p(q):
        v = (ans.get(q) or {}).get("noul")
        return float(v) if v is not None else None

    conf = {}
    for q in REVIEW_QUESTIONS:
        a = ans.get(q) or {}
        if a.get("confidence") is not None:
            conf[q] = a["confidence"]
        elif a.get("noul") is not None:
            conf[q] = round(2 * abs(float(a["noul"]) - 0.5), 4)
        else:
            conf[q] = None
    return {"fakematch_p": p("fakematch"), "recital_p": p("recital"), "period_plausible_p": p("period_plausible"),
            "confidence": conf, "latency_ms": d.get("latency_ms"), "usage": d.get("usage") or {},
            "model": d.get("model")}


# --------------------------------------------------------------------------------------------- decide_next

NEXT_QUESTIONS = {
    "next_action": {
        "type": "choice",
        "instructions": "A coding agent is trying to write C that compiles to exactly this asm. Given its failed "
                        "attempts so far (referee status, match percent, first differing instruction expected vs got), "
                        "what should happen next?",
        "criteria": {
            "keep": "Progress is real (match rising, diffs local and small): another attempt on the base model",
            "escalate": "Stuck on a structural issue the base model keeps repeating: move to the stronger model",
            "abandon": "Not converging (flat or falling match, same diff repeated, or a very large function): stop spending",
        }},
    "match_soon": {
        "type": "noul",
        "instructions": "Will this function reach a byte-identical MATCH within 4 more attempts?",
        "criteria": {"true": "Likely to match within 4 more attempts", "false": "Unlikely within 4 more attempts"}},
}


def _history_rows(history) -> list[dict]:
    rows = []
    for h in history or []:
        if isinstance(h, dict):
            rows.append({k: h.get(k) for k in ("attempt", "status", "match_pct", "expected_ins", "got_ins")})
        else:
            attempt, status, pct, exp, got = (list(h) + [None] * 5)[:5]
            rows.append({"attempt": attempt, "status": status, "match_pct": pct, "expected_ins": exp, "got_ins": got})
    return rows


def decide_next(cfg: Config, fn_id: str, asm: str, history, *, timeout: float = 8) -> dict:
    """Called by the Digger after each failed attempt from the 2nd on. One Snap request; decides
    model escalation and early abandonment. Never raises: on any error it says keep with
    confidence 0 so the Digger carries on as if Snap were absent."""
    rows = _history_rows(history)
    state = {"function": fn_id, "asm": asm, "attempts_so_far": len(rows), "history": rows}
    try:
        d = decide(cfg, state, NEXT_QUESTIONS, op="decide_next", timeout=timeout, retries=1)
        ans = d.get("answers") or {}
        a = ans.get("next_action") or {}
        action = a.get("choice")
        if action not in ("keep", "escalate", "abandon"):
            raise SnapError(f"unexpected choice {action!r}")
        p = (ans.get("match_soon") or {}).get("noul")
        return {"action": action, "confidence": float(a.get("confidence") or 0.0),
                "probs": a.get("probabilities") or {}, "p_match_within_budget": float(p) if p is not None else None,
                "latency_ms": d.get("latency_ms")}
    except Exception as e:  # noqa: BLE001 - the Digger must never fail because Snap did
        return {"action": "keep", "confidence": 0.0, "probs": {}, "p_match_within_budget": None,
                "error": f"{type(e).__name__}: {e}"[:300]}
