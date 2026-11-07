"""Chase honest near-misses: run the permuter on the best PARTIAL attempts across runs.

    python -m crew.sweep                 # permute every unmatched near-miss (>=75% or structure >=90%)
    python -m crew.sweep --min-pct 90    # only the last mile
    python -m crew.sweep --budget-s 60 --limit 10

Finds the best earlier PARTIAL with full source for each unrecovered game function, runs crew.permuter
against Lane A's in-process referee (instruction lists for structure scoring; HTTP fallback otherwise),
and accepts a MATCH only through the same Checker path as a live Digger (fresh verify + fakematch rules,
Snap/Gemini when keys are present). Writes runs/permute<N>/ with recovered/, events, metrics.

This is not a second model: every accepted file still compiles to identical bytes. Provenance is explicit
in the recovered header and fn.matched.permuted_from.
"""
from __future__ import annotations

import argparse
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

# skip scanning these for near-miss *sources*; their recovered/ still counts as accepted
SKIP_SRC = re.compile(r"^(bench|smoke|fx|r_fx|_|salvage|permute)")
SKIP_ACCEPTED = re.compile(r"^(bench|smoke|fx|r_fx|_)")


def collect_near_misses(cfg: Config, target: Target, *, min_pct: float, min_structure: float) -> dict[str, dict]:
    accepted = set()
    for rec in cfg.runs_dir.glob("*/recovered/fn_*.c"):
        if not SKIP_ACCEPTED.match(rec.parent.parent.name):
            accepted.add(rec.stem)
    for rec in (ROOT / "crew" / "exports").glob("*/recovered/fn_*.c"):
        if rec.parent.parent.name != "union":
            accepted.add(rec.stem)
    best: dict[str, dict] = {}
    for ev_path in sorted(cfg.runs_dir.glob("*/events.jsonl")):
        run_dir = ev_path.parent
        if SKIP_SRC.match(run_dir.name):
            continue
        previews = {}
        for line in ev_path.read_text().splitlines():
            try:
                e = json.loads(line)
            except json.JSONDecodeError:
                continue
            fn, t, p = e.get("fn"), e.get("type"), e.get("payload") or {}
            if not fn or fn not in target.fns or target.fns[fn]["scope"] != "game":
                continue
            if t == "fn.matched":
                accepted.add(fn)
            elif t == "attempt.submitted":
                prev = p.get("src_preview") or ""
                if prev and len(prev.splitlines()) < 40:
                    previews[(fn, int(p.get("attempt") or 0))] = prev
            elif t == "verdict" and p.get("status") == "PARTIAL":
                pct = float(p.get("match_pct") or 0.0)
                al = p.get("aligned") or {}
                sp = float(al.get("structure_pct") or 0.0) if isinstance(al, dict) else 0.0
                if pct < min_pct and sp < min_structure:
                    continue
                n = int(p.get("attempt") or 0)
                path = run_dir / "attempts" / f"{fn}.{n:02d}.c"
                src = path.read_text() if path.exists() else previews.get((fn, n))
                if not src:
                    continue
                score = (pct, sp)
                cur = best.get(fn)
                if cur is None or score > (cur["match_pct"], cur["structure_pct"]):
                    best[fn] = {"src": src, "match_pct": pct, "structure_pct": sp,
                                "from_run": run_dir.name, "attempt": n}
    return {fn: v for fn, v in best.items() if fn not in accepted}


def _check_fn(cfg: Config):
    from . import permuter

    try:
        permuter.lab_check  # noqa: B018 — prefer in-process: instruction lists for structure scoring
        permuter._lab()
        return permuter.lab_check, "lab-inprocess"
    except Exception:
        return permuter.http_checker(cfg.referee_url), "http"


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--min-pct", type=float, default=75.0)
    ap.add_argument("--min-structure", type=float, default=90.0)
    ap.add_argument("--budget-s", type=float, default=60.0)
    ap.add_argument("--max-checks", type=int, default=0, help="0 = 10 * budget-s")
    ap.add_argument("--workers", type=int, default=6)
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--fns", default="", help="comma-separated fn ids (optional filter)")
    args = ap.parse_args(argv)

    cfg = Config()
    target = Target(cfg)
    cands = collect_near_misses(cfg, target, min_pct=args.min_pct, min_structure=args.min_structure)
    want = {f.strip() for f in args.fns.split(",") if f.strip()}
    if want:
        cands = {k: v for k, v in cands.items() if k in want}
    ordered = sorted(cands.items(), key=lambda kv: (-kv[1]["match_pct"], -kv[1]["structure_pct"], kv[0]))
    if args.limit:
        ordered = ordered[: args.limit]
    if not ordered:
        print("nothing to permute")
        return 0

    from . import permuter

    check, check_kind = _check_fn(cfg)
    max_checks = args.max_checks or int(args.budget_s * 10)
    ref = make_referee(cfg.referee_url)
    run_id = new_run_id(cfg.runs_dir, "permute")
    out = cfg.runs_dir / run_id
    (out / "recovered").mkdir(parents=True)
    (out / "attempts").mkdir(parents=True)
    log = EventLog(out, run_id)
    snap_review = second = None
    if cfg.subq_key:
        from . import snap

        snap_review = lambda a, s, c: snap.review(cfg, a, s, c)  # noqa: E731
    if cfg.env_has("GEMINI_API_KEY"):
        from . import gemini

        second = lambda a, s: gemini.review(a, s)  # noqa: E731
    checker = Checker(ref, log, snap_review=snap_review, second_review=second)
    log.emit("run.started", "scheduler", label="permute sweep: near-misses scored by the real referee",
             split="train", library="off", diggers=0, model="permuter", budget_usd=0, game_id=target.game_id,
             fn_total=len(ordered), referee=getattr(ref, "kind", "lab"), check=check_kind,
             permute_s=args.budget_s, min_pct=args.min_pct)

    matched = improved = 0
    for i, (fn, meta) in enumerate(ordered, 1):
        print(f"[{i}/{len(ordered)}] {fn} from {meta['from_run']} @{meta['match_pct']}% "
              f"(structure {meta['structure_pct']}%) …", flush=True)
        seed = int(fn[3:], 16) & 0xFFFF
        try:
            p = permuter.permute(fn, meta["src"], budget_s=args.budget_s, max_checks=max_checks,
                                 workers=args.workers, seed=seed, check=check)
        except Exception as e:
            log.emit("permute.result", "permuter", fn=fn, attempt=meta["attempt"], checks=0,
                     from_pct=meta["match_pct"], to_pct=meta["match_pct"], matched=False, improved=False,
                     seconds=0.0, error=str(e)[:200])
            print(f"  error: {e}")
            continue
        to = p.get("to") or {}
        to_pct = 100.0 if p.get("matched") else float(to.get("match_pct") or meta["match_pct"])
        log.emit("permute.result", "permuter", fn=fn, attempt=meta["attempt"], checks=int(p.get("checks", 0)),
                 from_pct=meta["match_pct"], to_pct=to_pct, matched=bool(p.get("matched")),
                 improved=bool(p.get("improved")), seconds=float(p.get("seconds") or 0),
                 from_exact=(p.get("from") or {}).get("exact_pct"), to_exact=to.get("exact_pct"),
                 from_structure=meta["structure_pct"], to_structure=to.get("structure_pct"),
                 passes=dict(p.get("passes") or {}), from_run=meta["from_run"])
        if p.get("improved") and not p.get("matched"):
            improved += 1
            (out / "attempts" / f"{fn}.best.c").write_text(p["best_src"] + "\n")
            print(f"  improved {meta['match_pct']}% -> {to_pct}% ({p.get('checks')} checks, {p.get('seconds')}s)")
        if not p.get("matched"):
            if not p.get("improved"):
                print(f"  no change ({p.get('checks')} checks, {p.get('seconds')}s)")
            continue
        src = p["best_src"]
        (out / "attempts" / f"{fn}.matched.c").write_text(src + "\n")
        res = checker.verify_claim(fn, int(meta["attempt"] or 0), src)
        if res.get("status") != "MATCH":
            print(f"  permuter MATCH but fresh referee says {res.get('status')}, skipped")
            continue
        asm, ctx = target.asm(fn), target.context(fn)
        good, reason, evidence = checker.review(fn, asm, src, ctx, n_instructions(asm))
        if not good:
            log.emit("fakematch.rejected", "checker", fn=fn, attempt=int(meta["attempt"] or 0),
                     reason=reason[:160], evidence={k: v for k, v in evidence.items() if k in ("snap", "gemini")})
            print(f"  Checker rejected: {reason}")
            continue
        (out / "recovered" / f"{fn}.c").write_text(
            f"/* {fn}: matched by the Frankenstein permuter from a near-miss in run {meta['from_run']}, "
            f"attempt {meta['attempt']} ({meta['match_pct']}% -> MATCH, {p.get('checks')} referee checks).\n"
            f"   Observed: compiles to identical bytes (fresh referee MATCH, Checker accepted).\n"
            f"   Inferred: nothing in this file is a claim about original names. */\n\n"
            + src.strip() + "\n")
        log.emit("fn.matched", "checker", fn=fn, attempts=int(p.get("checks") or 0), minutes=0.0, cost_usd=0.0,
                 src_path=f"runs/{run_id}/recovered/{fn}.c", lines=len(src.strip().splitlines()),
                 permuted_from=meta["from_run"], permuted_attempt=meta["attempt"])
        matched += 1
        print(f"  MATCH accepted ({p.get('checks')} checks, {p.get('seconds')}s)")

    log.emit("run.finished", "scheduler", matched=matched, abandoned=len(ordered) - matched,
             pct_recovered=round(100 * matched / max(1, len(ordered)), 1), cost_usd=0.0, elapsed_s=0.0,
             improved_only=improved)
    (out / "metrics.json").write_text(json.dumps({
        "v": 1, "run_id": run_id, "label": "permute sweep", "split": "train", "library": "off",
        "model": "permuter", "fn_total": len(ordered), "matched": matched, "improved_only": improved,
        "match_rate": round(matched / max(1, len(ordered)), 3), "attempts_per_match": 0.0,
        "minutes_per_match": 0.0, "cost_per_match_usd": 0.0, "false_claims_caught": checker.false_claims,
        "fakematches_rejected": checker.fakematches_rejected, "cost_usd": 0.0,
        "permuter": {"on": True, "budget_s": args.budget_s, "check": check_kind,
                     "min_pct": args.min_pct, "min_structure": args.min_structure},
        "curve": [{"t_min": 0, "matched": matched}]}, indent=2) + "\n")
    (out / "names.json").write_text(json.dumps({"v": 1, "run_id": run_id, "names": []}) + "\n")
    log.close()
    print(f"permute {run_id}: {matched} matched, {improved} improved-only, of {len(ordered)} near-misses "
          f"(check={check_kind})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
