"""Permute every near-miss that was never accepted, and accept only perfect MATCHes through the full Checker.

    python -m crew.permute_queue --min-pct 95 --budget-s 100 --run-id permute01

Queue: game functions not in crew/exports/union/UNION.json and never fn.matched in runs/*, whose best PARTIAL
match_pct across runs/*/events.jsonl and crew/exports/*/events.jsonl is at least --min-pct. Source is the saved
attempt (attempts/<fn>.<NN>.c) or the event preview when it is complete (under 40 lines).

Each function gets crew.permuter (semantics-preserving rewrites scored by the referee). A permuted MATCH goes
through the same gate as a live run and as crew/salvage.py: a fresh referee MATCH, then Checker.review (rules,
SubQ Snap, Gemini). Accepted sources are written to runs/<run_id>/recovered/ with fn.matched and permute.result.
No model spend.
"""
from __future__ import annotations

import argparse
import json
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

from . import permuter
from .checker import Checker
from .config import ROOT, Config
from .digger import n_instructions
from .events import EventLog
from .referee import make_referee
from .target import Target


def build_queue(cfg: Config, target: Target, min_pct: float, max_pct: float = 100.0) -> dict:
    accepted = set()
    union = ROOT / "crew" / "exports" / "union" / "UNION.json"
    if union.exists():
        accepted |= {r["fn"] for r in json.loads(union.read_text()).get("rows", [])}
    best: dict[str, dict] = {}
    paths = list(cfg.runs_dir.glob("*/events.jsonl")) + list((ROOT / "crew" / "exports").glob("*/events.jsonl"))
    for ev_path in paths:
        run_dir = ev_path.parent
        previews = {}
        try:
            lines = ev_path.read_text().splitlines()
        except OSError:
            continue
        for line in lines:
            try:
                e = json.loads(line)
            except json.JSONDecodeError:
                continue
            t, fn, p = e.get("type"), e.get("fn"), e.get("payload") or {}
            if fn not in target.fns or target.fns[fn]["scope"] != "game":
                continue
            if t == "fn.matched":
                accepted.add(fn)
            elif t == "attempt.submitted":
                prev = p.get("src_preview") or ""
                if prev and len(prev.splitlines()) < 40:
                    previews[p.get("attempt")] = prev
            elif t == "verdict" and p.get("status") == "PARTIAL":
                pct = float(p.get("match_pct") or 0)
                if pct < min_pct or pct >= max_pct or pct <= best.get(fn, {}).get("match_pct", -1):
                    continue
                n = p.get("attempt")
                f = run_dir / "attempts" / f"{fn}.{int(n or 0):02d}.c"
                src = f.read_text() if f.exists() else previews.get(n)
                if src:
                    best[fn] = {"src": src.strip(), "match_pct": pct, "run": run_dir.name, "attempt": n}
    for d in cfg.runs_dir.glob("salvage*/recovered"):
        accepted |= {p.stem for p in d.glob("fn_*.c")}
    return {fn: v for fn, v in best.items() if fn not in accepted}


def main(argv=None) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--min-pct", type=float, default=95.0)
    ap.add_argument("--max-pct", type=float, default=100.0)
    ap.add_argument("--budget-s", type=float, default=100.0)
    ap.add_argument("--concurrent", type=int, default=6, help="functions permuted at once (checks capped at 6)")
    ap.add_argument("--workers", type=int, default=2)
    ap.add_argument("--run-id", default="permute01")
    ap.add_argument("--list", action="store_true", help="print the queue and exit")
    a = ap.parse_args(argv)
    cfg = Config()
    target = Target(cfg)
    queue = build_queue(cfg, target, a.min_pct, a.max_pct)
    print(f"queue: {len(queue)} functions with best PARTIAL in [{a.min_pct}, {a.max_pct})")
    for fn, v in sorted(queue.items(), key=lambda kv: -kv[1]["match_pct"]):
        print(f"  {fn} {v['match_pct']:5.1f}% from {v['run']} attempt {v['attempt']}")
    if a.list or not queue:
        return 0
    ref = make_referee(cfg.referee_url)
    out = cfg.runs_dir / a.run_id
    (out / "recovered").mkdir(parents=True, exist_ok=False)
    log = EventLog(out, a.run_id)
    snap_review = second = None
    if cfg.subq_key:
        from . import snap
        snap_review = lambda x, s, c: snap.review(cfg, x, s, c)  # noqa: E731
    if cfg.env_has("GEMINI_API_KEY"):
        from . import gemini
        second = lambda x, s: gemini.review(x, s)  # noqa: E731
    checker = Checker(ref, log, snap_review=snap_review, second_review=second)
    log.emit("run.started", "scheduler", label=f"permuter on never-accepted near-misses >= {a.min_pct}%",
             split="train", library="off", diggers=0, model="permuter", budget_usd=0, game_id=target.game_id,
             fn_total=len(queue), referee=getattr(ref, "kind", "lab"))
    t0 = time.time()
    lock = threading.Lock()
    stats = {"matched": 0, "improved": 0, "checks": 0, "rejected": 0}

    def one(item):
        fn, v = item
        p = permuter.permute(fn, v["src"], budget_s=a.budget_s, max_checks=int(a.budget_s * 12), workers=a.workers,
                             seed=int(fn[3:], 16) & 0xFFFF)
        to = p.get("to") or {}
        with lock:
            stats["checks"] += p["checks"]
            stats["improved"] += bool(p.get("improved"))
            log.emit("permute.result", "checker", fn=fn, attempt=int(v["attempt"] or 0), checks=int(p["checks"]),
                     from_pct=v["match_pct"], to_pct=100.0 if p["matched"] else float(to.get("match_pct") or 0),
                     matched=bool(p["matched"]), seconds=float(p["seconds"]), improved=bool(p.get("improved")),
                     from_exact=(p.get("from") or {}).get("exact_pct"), to_exact=to.get("exact_pct"),
                     passes=dict(p["passes"]), source_run=v["run"])
        print(f"  {fn}: {v['match_pct']}% -> {'MATCH' if p['matched'] else to.get('match_pct')} "
              f"({p['checks']} checks, {p['seconds']} s, {dict(p['passes'])})", flush=True)
        if not p["matched"]:
            if p.get("improved"):
                (out / "improved").mkdir(exist_ok=True)
                (out / "improved" / f"{fn}.c").write_text(p["best_src"] + "\n")
            return
        src = p["best_src"]
        res = checker.verify_claim(fn, int(v["attempt"] or 0), src)
        if res.get("status") != "MATCH":
            print(f"  {fn}: fresh check not MATCH ({res.get('status')})")
            return
        asm, ctx = target.asm(fn), target.context(fn)
        good, reason, evidence = checker.review(fn, asm, src, ctx, n_instructions(asm))
        with lock:
            if not good:
                stats["rejected"] += 1
                log.emit("fakematch.rejected", "checker", fn=fn, attempt=int(v["attempt"] or 0), reason=reason[:160],
                         evidence={k: x for k, x in evidence.items() if k in ("snap", "gemini")},
                         src_preview="\n".join(src.splitlines()[:20]))
                print(f"  {fn}: rejected by the Checker ({reason})")
                return
            (out / "recovered" / f"{fn}.c").write_text(
                f"/* {fn}: recovered by the Frankenstein crew. The Digger's attempt {v['attempt']} in run {v['run']}\n"
                f"   scored {v['match_pct']}%; crew/permuter.py found a semantics-preserving rewrite that matches.\n"
                f"   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).\n"
                f"   Inferred: nothing in this file is a claim about original names. */\n\n" + src.strip() + "\n")
            log.emit("fn.matched", "checker", fn=fn, attempts=1, minutes=round(p["seconds"] / 60, 2), cost_usd=0.0,
                     src_path=f"runs/{a.run_id}/recovered/{fn}.c", lines=len(src.strip().splitlines()),
                     permuted_from=f"{v['run']}#{v['attempt']}")
            stats["matched"] += 1

    order = sorted(queue.items(), key=lambda kv: -kv[1]["match_pct"])
    with ThreadPoolExecutor(max_workers=a.concurrent) as ex:
        list(ex.map(one, order))
    el = round(time.time() - t0, 1)
    ok = stats["matched"]
    log.emit("run.finished", "scheduler", matched=ok, abandoned=len(queue) - ok,
             pct_recovered=round(100 * ok / max(1, len(queue)), 1), cost_usd=0.0, elapsed_s=el)
    (out / "metrics.json").write_text(json.dumps({
        "v": 1, "run_id": a.run_id, "label": f"permuter >= {a.min_pct}%", "split": "train", "library": "off",
        "model": "permuter", "reasoning_effort": "none", "fn_total": len(queue), "matched": ok,
        "match_rate": round(ok / max(1, len(queue)), 3), "attempts_per_match": 1.0 if ok else 0.0,
        "minutes_per_match": 0.0, "cost_per_match_usd": 0.0, "false_claims_caught": checker.false_claims,
        "fakematches_rejected": checker.fakematches_rejected, "cost_usd": 0.0, "elapsed_s": el,
        "curve": [{"t_min": 0, "matched": 0}, {"t_min": max(1, int(el // 60) + 1), "matched": ok}],
        "muse": {"calls": 0, "tool_calls": 0, "image_calls": 0, "tokens_in": 0, "tokens_out": 0, "reasoning_effort": "none", "cost_usd": 0.0}, "permuter": {**stats, "budget_s": a.budget_s}}, indent=2) + "\n")
    (out / "names.json").write_text(json.dumps({"v": 1, "run_id": a.run_id, "names": []}) + "\n")
    log.close()
    print(f"{a.run_id}: {ok} of {len(queue)} matched and accepted, {stats['improved']} improved, "
          f"{stats['rejected']} rejected by the Checker, {stats['checks']} checks, {el} s")
    return 0


if __name__ == "__main__":
    sys.exit(main())
