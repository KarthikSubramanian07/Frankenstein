"""Salvage matches that never made it into a recovered file, and put each one through the full Checker again.

    python -m crew.salvage            # -> runs/salvage<N>/ (events.jsonl, recovered/), then `python -m crew.union`

A Digger can see the referee say MATCH and then keep editing instead of claiming it, which loses the match.
This scans every run for a MATCH verdict on a function that was never accepted anywhere, recovers the exact
source (the saved attempt, or the event preview when it is complete), and re-runs the same gate as a live run:
a fresh referee check (must be MATCH), then the Checker's fakematch review (rules, SubQ Snap, Gemini). Only
what passes is written, with a fn.matched event that says "salvaged". Fakes the Checker rejected stay rejected.
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

from .checker import Checker
from .config import ROOT, Config
from .digger import n_instructions
from .events import EventLog
from .referee import make_referee
from .run import new_run_id
from .target import Target

SKIP = re.compile(r"^(bench|smoke|fx|r_fx|_|salvage)")


def main(argv=None) -> int:
    cfg = Config()
    target = Target(cfg)
    accepted, rejected_fake, candidates = set(), set(), {}
    for ev_path in sorted(cfg.runs_dir.glob("*/events.jsonl")):
        run_dir = ev_path.parent
        if SKIP.match(run_dir.name):
            continue
        previews = {}
        for line in ev_path.read_text().splitlines():
            try:
                e = json.loads(line)
            except json.JSONDecodeError:
                continue
            t, fn, p = e.get("type"), e.get("fn"), e.get("payload", {})
            if fn not in target.fns or target.fns[fn]["scope"] != "game":
                continue
            if t == "fn.matched":
                accepted.add(fn)
            elif t == "fakematch.rejected":
                rejected_fake.add((fn, run_dir.name, p.get("attempt")))
            elif t == "attempt.submitted":
                prev = p.get("src_preview") or ""
                if prev and len(prev.splitlines()) < 40:
                    previews[(fn, p.get("attempt"))] = prev
            elif t == "verdict" and p.get("status") == "MATCH" and p.get("claim_was_true") is not False:
                n = p.get("attempt")
                f = run_dir / "attempts" / f"{fn}.{int(n or 0):02d}.c"
                src = f.read_text() if f.exists() else previews.get((fn, n))
                if src and (fn, run_dir.name, n) not in rejected_fake:
                    candidates.setdefault(fn, (src, run_dir.name, n))
    todo = {fn: v for fn, v in candidates.items() if fn not in accepted}
    if not todo:
        print("nothing to salvage")
        return 0
    ref = make_referee(cfg.referee_url)
    run_id = new_run_id(cfg.runs_dir, "salvage")
    out = cfg.runs_dir / run_id
    (out / "recovered").mkdir(parents=True)
    log = EventLog(out, run_id)
    snap_review = second = None
    if cfg.subq_key:
        from . import snap

        snap_review = lambda a, s, c: snap.review(cfg, a, s, c)  # noqa: E731
    if cfg.env_has("GEMINI_API_KEY"):
        from . import gemini

        second = lambda a, s: gemini.review(a, s)  # noqa: E731
    checker = Checker(ref, log, snap_review=snap_review, second_review=second)
    log.emit("run.started", "scheduler", label="salvage: MATCH verdicts that were never claimed, re-checked",
             split="train", library="off", diggers=0, model=cfg.model, budget_usd=0, game_id=target.game_id,
             fn_total=len(todo), referee=getattr(ref, "kind", "lab"))
    ok = 0
    for fn, (src, from_run, n) in sorted(todo.items()):
        res = checker.verify_claim(fn, int(n or 0), src)
        if res.get("status") != "MATCH":
            print(f"  {fn}: no longer MATCH ({res.get('status')}), skipped")
            continue
        asm, ctx = target.asm(fn), target.context(fn)
        good, reason, evidence = checker.review(fn, asm, src, ctx, n_instructions(asm))
        if not good:
            log.emit("fakematch.rejected", "checker", fn=fn, attempt=int(n or 0), reason=reason[:160],
                     evidence={k: v for k, v in evidence.items() if k in ("snap", "gemini")})
            print(f"  {fn}: rejected by the Checker ({reason})")
            continue
        (out / "recovered" / f"{fn}.c").write_text(
            f"/* {fn}: salvaged by the Frankenstein crew from run {from_run}, attempt {n}.\n"
            f"   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).\n"
            f"   Inferred: nothing in this file is a claim about original names. */\n\n" + src.strip() + "\n")
        log.emit("fn.matched", "checker", fn=fn, attempts=int(n or 0), minutes=0.0, cost_usd=0.0,
                 src_path=f"runs/{run_id}/recovered/{fn}.c", lines=len(src.strip().splitlines()),
                 salvaged_from=from_run)
        ok += 1
        print(f"  {fn}: salvaged from {from_run} attempt {n}")
    log.emit("run.finished", "scheduler", matched=ok, abandoned=len(todo) - ok,
             pct_recovered=round(100 * ok / max(1, len(todo)), 1), cost_usd=0.0, elapsed_s=0.0)
    (out / "metrics.json").write_text(json.dumps({
        "v": 1, "run_id": run_id, "label": "salvage", "split": "train", "library": "off", "model": cfg.model,
        "reasoning_effort": cfg.reasoning_effort, "fn_total": len(todo), "matched": ok,
        "match_rate": round(ok / max(1, len(todo)), 3), "attempts_per_match": 0.0, "minutes_per_match": 0.0,
        "cost_per_match_usd": 0.0, "false_claims_caught": checker.false_claims,
        "fakematches_rejected": checker.fakematches_rejected, "cost_usd": 0.0,
        "curve": [{"t_min": 0, "matched": ok}]}, indent=2) + "\n")
    (out / "names.json").write_text(json.dumps({"v": 1, "run_id": run_id, "names": []}) + "\n")
    log.close()
    print(f"salvage {run_id}: {ok} of {len(todo)} re-accepted")
    return 0


if __name__ == "__main__":
    sys.exit(main())
