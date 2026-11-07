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
    draft_used: bool = False  # the first message carried a machine decompiler's draft (m2c)


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
        self.allow_claim_first = True
        # Diggers may stake a claim before seeing the verdict (real lies, caught)
        self.cases = getattr(library, "cases", None)  # CaseMemory: solved training functions, by similarity
        self.max_attempts = 0  # 0 = budget from difficulty (Snap triage or the manifest)
        self.stall_limit = 0  # >0: after this many non-improving attempts think deeper once, then move on
        self.warm_start = None  # callable(fn_id) -> {"src", "match_pct", ...} or None (never in held-out evaluation)
        self.draft = None  # callable(fn_id) -> m2c draft C or None (crew.draft.get_draft), for big functions
        self.draft_min_bytes = 150
        self.permute = None  # callable(fn_id, src) -> crew.permuter.permute() result, or None (off)
        self.permute_min_structure = 90.0  # run it on near-misses: aligned structure_pct >= 90 or match_pct >= 75
        self.permute_min_pct = 75.0
        self.permute_max_runs = 2  # per function, each on a new best attempt

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
        cases = self.cases.similar(asm, k=2, exclude=fn_id) if self.cases is not None else []
        for c in cases:
            self.log.emit("idiom.used", self.name, fn=fn_id, idiom_id=f"case:{c['fn']}", similarity=c["similarity"])
        warm = self.warm_start(fn_id) if self.warm_start else None
        messages = [{"role": "system", "content": DIGGER_SYSTEM},
                    {"role": "user", "content": digger_user(fn, asm, ctx, idioms, self.target.neighbors(fn_id), types, cases)}]
        if warm:
            messages[1]["content"] += ("\n\n## Your best earlier attempt at THIS function (from a previous run)\n"
                                       f"It scored {warm['match_pct']}% positional"
                                       + (f", {warm['structure_pct']}% structure" if warm.get("structure_pct") else "")
                                       + ". Start from it and fix the remaining differences.\n```c\n" + warm["src"] + "\n```")
            self.log.emit("narration", "archivist", fn=fn_id, text=f"{fn_id}: picking up where we left off at {warm['match_pct']}%.",
                          mood="dry", speak=False, priority=0)
        out = Outcome(fn=fn_id, status="abandoned")
        if self.draft is not None and fn["size"] >= self.draft_min_bytes:
            try:
                draft = self.draft(fn_id)
            except Exception:
                draft = None
            if draft:
                out.draft_used = True
                messages[1]["content"] += (
                    "\n\n## A machine decompiler's draft of THIS function (m2c, from the asm above)\n"
                    "Structure is usually right; types, names and registers are not (var_rN/temp_rN are registers, "
                    "unkNN are field offsets, `?` is an unknown type). Use it as the map of the control flow, then "
                    "write real C with proper types that compiles to these exact bytes.\n```c\n" + draft + "\n```")
        out.idioms = [i["idiom_id"] for i in idioms]
        out.cases = [c["fn"] for c in cases]
        budget = self.max_attempts or attempt_budget(fn["difficulty"])
        last_src, last_attempt, best_src, failures, turns = None, 0, None, 0, 0
        perm_runs = 0
        stall, deeper_used = 0, False
        match_turn = 10**9  # turn of the latest MATCH verdict (auto-claim if the model moves on without claiming)
        escalated = False  # set by SubQ Snap (or by the fixed fallback rule when Snap is off)
        esc_failed = False  # an escalation-model call errored during this function
        self.log.emit("fn.claimed", "scheduler", fn=fn_id, digger=self.name, difficulty=fn["difficulty"])

        while out.attempts < budget and turns < budget * 3 and out.cost_usd < self.max_usd and self.budget_ok():
            turns += 1
            if self.snap_decide is None and failures >= self.escalate_after:
                escalated = True
            use_esc = escalated and not esc_failed and self.llm.cfg.escalation_model
            model = self.llm.cfg.escalation_model if use_esc else self.llm.cfg.model
            effort = effort_for(fn["difficulty"], failures, self.llm.cfg.reasoning_effort)
            try:
                # big functions need room to think AND write: scale the output budget with function size
                r = self.llm.chat(messages, model=model, tools=TOOLS, effort=effort,
                                  max_tokens=min(32000, 8000 + fn["size"] * 16))
            except LLMError as e:
                if model != self.llm.cfg.model:  # escalation call failed: stay on the base model
                    esc_failed = True  # for this function only; one bad call must not end escalation run-wide
                    if "HTTP 404" in str(e):  # the escalation model does not exist: turn it off for everyone
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
                    try:  # every full attempt is kept (events carry only a 40-line preview)
                        adir = self.log.run_dir / "attempts"
                        adir.mkdir(exist_ok=True)
                        (adir / f"{fn_id}.{out.attempts:02d}.c").write_text(src + "\n")
                    except OSError:
                        pass
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
                    out.journey.append((out.attempts, res["status"], pct, fd.get("expected_ins"), fd.get("got_ins"),
                                        (res.get("aligned") or {}).get("structure_pct")))
                    if pct > out.best_pct:
                        stall = 0
                    elif res["status"] != "MATCH":
                        stall += 1  # wide, not deep: published work shows odds collapse after ~3 non-improving tries
                    new_best = pct >= out.best_pct
                    if new_best:
                        out.best_pct, best_src = pct, src
                    perm = None
                    al = res.get("aligned") or {}
                    if (self.permute is not None and res["status"] == "PARTIAL" and new_best
                            and perm_runs < self.permute_max_runs
                            and (float(al.get("structure_pct") or 0) >= self.permute_min_structure
                                 or pct >= self.permute_min_pct)):
                        perm_runs += 1
                        perm = self._permute(fn_id, out.attempts, src, res, asm, ctx, n_ins, out)
                        if perm and perm.get("claimed"):
                            out.seconds = time.time() - t0
                            return out
                        if perm and perm.get("improved") and not perm.get("matched"):
                            to = float((perm.get("to") or {}).get("match_pct") or 0)
                            if to >= out.best_pct:
                                out.best_pct, best_src = to, perm["best_src"]
                    if res["status"] == "MATCH":
                        match_turn = turns  # the model gets this turn's follow-up to claim in its own words
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
                    if res.get("aligned"):
                        reply["aligned"] = res["aligned"]  # side-by-side: where the structure really diverges
                    reply["diff"] = (res.get("diff") or [])[:16]
                    if res["status"] == "NO_COMPILE":
                        reply["compile_log"] = (res.get("compile") or {}).get("log", "")[-1500:]
                    if perm and perm.get("improved"):
                        reply["permuted"] = {
                            "note": "Your best so far, after automated permutation (semantics-preserving rewrites "
                                    "scored by the referee). Start from this source.",
                            **{k: (perm.get("to") or {}).get(k) for k in ("match_pct", "exact_pct", "structure_pct")},
                            "src": perm["best_src"]}
                        if perm.get("rejected"):
                            reply["permuted"]["note"] = ("The permuter matched the bytes but the Checker rejected it: "
                                                         + perm["rejected"] + ". Fix that, keep the structure.")
                    if self.stall_limit and stall >= self.stall_limit and res["status"] != "MATCH":
                        if not deeper_used:
                            deeper_used = True
                            reply["think_deeper"] = ("Three attempts without improvement. Stop small edits: re-read the "
                                                     "asm and the aligned diff, state in one sentence what structure "
                                                     "GCC is producing, then write one new candidate from your best "
                                                     "attempt.")
                        else:
                            budget = out.attempts  # move on: spend on fresh functions instead of a dead end
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
            # a MATCH is claimed at once, even if the model kept talking; the Checker still re-verifies it
            # with a fresh referee call and reviews it (salvage found 7 matches lost to models that wandered off)
            if out.journey and out.journey[-1][1] == "MATCH" and (out.attempts >= budget or turns > match_turn):
                text = "(auto-submitted at budget end)" if out.attempts >= budget else "(auto-claimed on a referee MATCH)"
                if self._claim(fn_id, last_attempt, last_src, text, asm, ctx, n_ins, out):
                    out.seconds = time.time() - t0
                    return out
        if out.status != "failed":
            out.status = "abandoned"
        out.src = best_src
        out.seconds = time.time() - t0
        self.log.emit("fn.abandoned", self.name, fn=fn_id, attempts=out.attempts, best_pct=out.best_pct)
        return out

    def _permute(self, fn_id, attempt, src, res, asm, ctx, n_ins, out: Outcome) -> dict | None:
        """Run the permuter on a near-miss. A permuted MATCH is a new attempt that goes through the normal path:
        the Checker's judge, then the claim with its fresh verify, then the fakematch review."""
        t = time.time()
        try:
            p = self.permute(fn_id, src)
        except Exception as e:  # the permuter is an accelerator, never a reason to lose the function
            out.journey.append(("permute_error", str(e)[:200]))
            return None
        frm, to = p.get("from") or {}, p.get("to") or {}
        self.log.emit("permute.result", self.name, fn=fn_id, attempt=attempt, checks=int(p.get("checks", 0)),
                      from_pct=float(res.get("match_pct", 0.0)), to_pct=100.0 if p.get("matched") else float(
                          to.get("match_pct") or res.get("match_pct", 0.0)), matched=bool(p.get("matched")),
                      seconds=round(time.time() - t, 1), improved=bool(p.get("improved")),
                      from_exact=frm.get("exact_pct"), to_exact=to.get("exact_pct"),
                      passes=dict(p.get("passes") or {}))
        if not p.get("matched"):
            return p
        psrc = p["best_src"]
        out.attempts += 1
        n = out.attempts
        try:
            adir = self.log.run_dir / "attempts"
            adir.mkdir(exist_ok=True)
            (adir / f"{fn_id}.{n:02d}.c").write_text(psrc + "\n")
        except OSError:
            pass
        self.log.emit("attempt.submitted", self.name, fn=fn_id, attempt=n, tokens_in=0, tokens_out=0, cost_usd=0.0,
                      src_preview="\n".join(psrc.splitlines()[:40]), model="permuter", effort=None,
                      permuted_from=attempt)
        r2 = self.checker.judge(fn_id, n, psrc)
        out.journey.append((n, r2["status"], float(r2.get("match_pct", 0.0)), None, None, None))
        if r2["status"] == "MATCH":
            if self._claim(fn_id, n, psrc, f"Matched by permuting attempt {attempt} ({p.get('checks')} referee checks).",
                           asm, ctx, n_ins, out):
                out.journey.append((n, "MATCH", 100.0, None, None))
                p["claimed"] = True
            else:
                p["rejected"] = str(out.journey[-1][-1])
        return p

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
            # bytes matched, but the Checker caught compiler-coaxing: a visible K.O., not a silent drop
            self.log.emit("fakematch.rejected", "checker", fn=fn_id, attempt=attempt, reason=reason[:160],
                          evidence={k: v for k, v in evidence.items() if k in ("snap", "gemini")},
                          src_preview="\n".join(src.splitlines()[:20]))
            self.log.emit("narration", "archivist", fn=fn_id, text=f"Bytes match, but the Checker smells a fake.",
                          mood="alarmed", speak=False, priority=1)
            return False
        out.status, out.src = "matched", src
        out.evidence = evidence
        return True
