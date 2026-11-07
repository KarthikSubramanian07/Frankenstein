"""The Digger: a tool-calling agent on Muse Spark that rewrites one function until the referee says MATCH.

Latency choices: everything the model needs up front is in the first user message (asm, ctx, idioms,
recovered neighbours), so most functions need zero lookup round trips; the system prompt and tools are
byte-stable for prompt caching; easy functions start at lower reasoning effort and escalate.
"""
from __future__ import annotations

import json
import re
import time
from dataclasses import dataclass, field

from .checker import Checker
from .events import EventLog
from .library import Library
from .llm import LLM, LLMError
from .prompts import DIGGER_SYSTEM, TOOLS, digger_user
from .target import Target

CODE_BLOCK = re.compile(r"```(?:c|C)?\s*\n(.*?)```", re.S)


@dataclass
class Outcome:
    fn: str
    status: str  # matched | abandoned | failed | rejected
    attempts: int = 0
    best_pct: float = 0.0
    cost_usd: float = 0.0
    src: str | None = None
    seconds: float = 0.0
    false_claims: int = 0
    journey: list = field(default_factory=list)  # (attempt, status, pct, first_diff ins) for the Distiller
    model_calls: dict = field(default_factory=dict)
    idioms: list = field(default_factory=list)  # idiom ids this Digger was given (credited or blamed afterwards)


def attempt_budget(difficulty: float) -> int:
    return max(4, min(12, round(4 + difficulty * 8)))


def effort_for(difficulty: float, failures: int, base: str) -> str:
    if failures >= 3:
        return "high" if base in ("high", "xhigh", "max") else base
    if difficulty < 0.35:
        return "medium" if base in ("high", "xhigh", "max") else base
    return base


def n_instructions(asm: str) -> int:
    return sum(1 for l in asm.splitlines() if re.match(r"^\s+[a-z]", l) and not l.strip().startswith("."))


class Digger:
    def __init__(self, name: str, llm: LLM, target: Target, checker: Checker, library: Library, log: EventLog,
                 *, max_usd: float = 1.5, escalate_after: int = 3, types_slice=None, budget_ok=lambda: True,
                 snap_decide=None):
        self.name = name
        self.llm = llm
        self.target = target
        self.checker = checker
        self.library = library
        self.log = log
        self.max_usd = max_usd
        self.escalate_after = escalate_after
        self.types_slice = types_slice  # callable(fn) -> str, or None (cartographer off)
        self.budget_ok = budget_ok
        self.snap_decide = snap_decide  # callable(fn_id, asm, history) -> dict, or None (SubQ Snap off)
        self.allow_claim_first = True  # Diggers may stake a claim before seeing the verdict (real lies, caught)

    def _tool_result(self, call_id: str, content) -> dict:
        return {"role": "tool", "tool_call_id": call_id,
                "content": content if isinstance(content, str) else json.dumps(content)}

    def dig(self, fn_id: str) -> Outcome:
        t0 = time.time()
        fn = self.target.fns[fn_id]
        asm, ctx = self.target.asm(fn_id), self.target.context(fn_id)
        n_ins = n_instructions(asm) or max(1, fn["size"] // 2)
        idioms = self.library.search(asm[:2000], k=3)
        for i in idioms:
            self.log.emit("idiom.used", self.name, fn=fn_id, idiom_id=i["idiom_id"])
        types = self.types_slice(fn_id) if self.types_slice else ""
        messages = [{"role": "system", "content": DIGGER_SYSTEM},
                    {"role": "user", "content": digger_user(fn, asm, ctx, idioms, self.target.neighbors(fn_id), types)}]
        out = Outcome(fn=fn_id, status="abandoned")
        out.idioms = [i["idiom_id"] for i in idioms]
        budget = attempt_budget(fn["difficulty"])
        last_src, last_attempt, best_src, failures, turns = None, 0, None, 0, 0
        escalated = False  # set by SubQ Snap (or by the fixed fallback rule when Snap is off)
        self.log.emit("fn.claimed", "scheduler", fn=fn_id, digger=self.name, difficulty=fn["difficulty"])

        while out.attempts < budget and turns < budget * 3 and out.cost_usd < self.max_usd and self.budget_ok():
            turns += 1
            if self.snap_decide is None and failures >= self.escalate_after:
                escalated = True
            model = self.llm.cfg.escalation_model if (escalated and self.llm.cfg.escalation_model) else self.llm.cfg.model
            effort = effort_for(fn["difficulty"], failures, self.llm.cfg.reasoning_effort)
            try:
                # big functions need room to think AND write: scale the output budget with function size
                r = self.llm.chat(messages, model=model, tools=TOOLS, effort=effort,
                                  max_tokens=min(32000, 8000 + fn["size"] * 16))
            except LLMError as e:
                if model != self.llm.cfg.model:  # escalation model unavailable: stay on the base model
                    self.llm.cfg.escalation_model = ""
                    continue
                out.status = "failed"
                out.journey.append(("error", str(e)[:200]))
                break
            out.cost_usd += r["cost"]
            out.model_calls[r["model"]] = out.model_calls.get(r["model"], 0) + 1
            msg = r["message"]
            calls = msg.get("tool_calls") or []
            if not calls and not (msg.get("content") or "").strip():
                # the model spent its whole budget thinking: never send an empty assistant turn back (API 400)
                messages.append({"role": "user", "content": "You ran out of room before answering. Submit your best "
                                 "complete C candidate now with referee_check; refine it after you see the diff."})
                continue
            messages.append({k: v for k, v in msg.items() if k in ("role", "content", "tool_calls") and v is not None}
                            | {"role": "assistant"})
            if not calls:
                # model answered in prose: salvage a code block as an attempt, otherwise nudge it
                m = CODE_BLOCK.search(msg.get("content") or "")
                if not m:
                    messages.append({"role": "user", "content": "Call referee_check with your full C candidate."})
                    continue
                calls = [{"id": "inline", "function": {"name": "referee_check", "arguments": json.dumps({"src": m.group(1)})}}]
                messages.pop()
                messages.append({"role": "assistant", "content": msg.get("content") or ""})
            for c in calls:
                name = c["function"]["name"]
                try:
                    args = json.loads(c["function"].get("arguments") or "{}")
                except json.JSONDecodeError:
                    args = {}
                if name == "referee_check":
                    src = (args.get("src") or "").strip()
                    out.attempts += 1
                    last_attempt, last_src = out.attempts, src
                    self.log.emit("attempt.submitted", self.name, fn=fn_id, attempt=out.attempts,
                                  tokens_in=r["tin"], tokens_out=r["tout"], cost_usd=round(r["cost"], 6),
                                  src_preview="\n".join(src.splitlines()[:40]), model=r["model"], effort=effort)
                    if args.get("claim") is True and self.allow_claim_first:
                        # claim-first: the Digger staked a claim before seeing a verdict; the Checker decides
                        if self._claim(fn_id, out.attempts, src, args.get("claim_text") or "Matched it. Pretty sure.",
                                       asm, ctx, n_ins, out):
                            out.journey.append((out.attempts, "MATCH", 100.0, None, None))
                            out.seconds = time.time() - t0
                            return out
                        failures += 1
                        last = out.journey[-1]
                        lr = getattr(out, "last_res", None) or {}
                        pct = float(lr.get("match_pct", 0.0))
                        if pct >= out.best_pct and last[1] == "FALSE_CLAIM":
                            out.best_pct, best_src = pct, src
                        messages.append(self._tool_result(c["id"], {
                            "verdict": "CLAIM REJECTED" if last[1] == "FALSE_CLAIM" else "REJECTED: " + str(last[-1]),
                            "status": lr.get("status"), "match_pct": pct, "first_diff": lr.get("first_diff"),
                            "diff": (lr.get("diff") or [])[:16], "lint": lr.get("lint"),
                            "compile_log": (lr.get("compile") or {}).get("log", "")[-1500:] if lr.get("status") == "NO_COMPILE" else None,
                            "attempts_left": budget - out.attempts,
                            "note": "Your false claim was counted. Check before claiming."}))
                        continue
                    res = self.checker.judge(fn_id, out.attempts, src)
                    pct = float(res.get("match_pct", 0.0))
                    fd = res.get("first_diff") or {}
                    out.journey.append((out.attempts, res["status"], pct, fd.get("expected_ins"), fd.get("got_ins")))
                    if pct >= out.best_pct:
                        out.best_pct, best_src = pct, src
                    if res["status"] != "MATCH":
                        failures += 1
                        if self.snap_decide is not None and failures >= 2 and out.attempts < budget:
                            d = self.snap_decide(fn_id, asm, [j for j in out.journey if isinstance(j[0], int)])
                            act, conf = d.get("action", "keep"), float(d.get("confidence") or 0)
                            self.log.emit("snap.decision", "scheduler", fn=fn_id, op="decide_next", action=act,
                                          confidence=round(conf, 3), probs=d.get("probs") or {},
                                          p_match_within_budget=d.get("p_match_within_budget"),
                                          latency_ms=d.get("latency_ms"), error=d.get("error"), attempt=out.attempts)
                            if act == "escalate" and not escalated and self.llm.cfg.escalation_model:
                                escalated = True
                            elif act == "abandon" and conf >= 0.6 and failures >= 3:
                                budget = out.attempts  # Snap says more attempts won't converge: stop spending
                    reply = {k: res.get(k) for k in ("status", "match_pct", "first_diff", "lint")}
                    reply["diff"] = (res.get("diff") or [])[:16]
                    if res["status"] == "NO_COMPILE":
                        reply["compile_log"] = (res.get("compile") or {}).get("log", "")[-1500:]
                    reply["attempts_left"] = budget - out.attempts
                    if res["status"] == "MATCH":
                        reply["next"] = "Call submit_claim now."
                    messages.append(self._tool_result(c["id"], reply) if c["id"] != "inline"
                                    else {"role": "user", "content": "referee_check result: " + json.dumps(reply)})
                elif name == "submit_claim":
                    if last_src is None:
                        messages.append(self._tool_result(c["id"], "No attempt to claim yet. Call referee_check first."))
                        continue
                    done = self._claim(fn_id, last_attempt, last_src, args.get("text", "Matched it."), asm, ctx, n_ins, out)
                    if done:
                        out.seconds = time.time() - t0
                        return out
                    messages.append(self._tool_result(c["id"], {"verdict": "REJECTED", "reason": out.journey[-1][-1]}))
                elif name == "search_idioms":
                    hits = self.library.search(args.get("query", ""), k=5)
                    out.idioms += [h["idiom_id"] for h in hits if h["idiom_id"] not in out.idioms]
                    for i in hits:
                        self.log.emit("idiom.used", self.name, fn=fn_id, idiom_id=i["idiom_id"])
                    messages.append(self._tool_result(c["id"], hits or "No idioms (library empty or off)."))
                elif name == "get_neighbors":
                    messages.append(self._tool_result(c["id"], self.target.neighbors(fn_id)))
                else:
                    messages.append(self._tool_result(c["id"], f"Unknown tool {name}."))
            # a MATCH the model forgot to claim still goes through the Checker (never auto-accepted)
            if out.journey and out.journey[-1][1] == "MATCH" and out.attempts >= budget:
                if self._claim(fn_id, last_attempt, last_src, "(auto-submitted at budget end)", asm, ctx, n_ins, out):
                    out.seconds = time.time() - t0
                    return out
        if out.status != "failed":
            out.status = "abandoned"
        out.src = best_src
        out.seconds = time.time() - t0
        self.log.emit("fn.abandoned", self.name, fn=fn_id, attempts=out.attempts, best_pct=out.best_pct)
        return out

    def _claim(self, fn_id, attempt, src, text, asm, ctx, n_ins, out: Outcome) -> bool:
        self.log.emit("claim.made", self.name, fn=fn_id, attempt=attempt, text=text[:200])
        res = self.checker.verify_claim(fn_id, attempt, src)
        out.last_res = res
        if res["status"] != "MATCH":
            out.false_claims += 1
            out.journey.append((attempt, "FALSE_CLAIM", res.get("match_pct", 0), "claim rejected by referee"))
            return False
        ok, reason, evidence = self.checker.review(fn_id, asm, src, ctx, n_ins)
        if not ok:
            out.journey.append((attempt, "FAKEMATCH", 100.0, reason))
            self.log.emit("narration", "archivist", fn=fn_id, text=f"Bytes match, but the Checker smells a fake.",
                          mood="alarmed", speak=False, priority=1)
            return False
        out.status, out.src = "matched", src
        out.evidence = evidence
        return True
