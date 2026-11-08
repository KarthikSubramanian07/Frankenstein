"""On-stage live segment: 2-3 small functions recovered live, real API calls, real verdicts, a visible timer.

    python -m crew.demo --fns fn_08004698,fn_0800A1B4 --live
    python -m crew.demo --pick 3 --live          # pick 3 small unrecovered train functions (leaves first)

Writes a normal run (so the Stage shows it through runs/live) and prints a big terminal timer per function.
"""
from __future__ import annotations

import argparse
import sys
import threading
import time

from .config import Config
from .run import Run, parser as run_parser
from .target import Target


def pick(cfg: Config, n: int, max_size: int = 64) -> list[str]:
    t = Target(cfg)
    done = set()
    for p in cfg.runs_dir.glob("*/recovered/fn_*.c"):
        done.add(p.stem)
    fns = [f for f in t.game_functions("train") if f["mode"] == "thumb" and 12 <= f["size"] <= max_size
           and f["id"] not in done and not f["callees"]]
    fns.sort(key=lambda f: (f["difficulty"], f["size"]))
    return [f["id"] for f in fns[:n]]


def pick_redo(cfg: Config, n: int, min_size: int = 16, max_size: int = 40) -> list[str]:
    """Already-recovered small leaf functions, to redo from scratch on stage (library off, no warm start)."""
    t = Target(cfg)
    done = {p.stem for p in (cfg.runs_dir.parent / "crew" / "exports" / "union" / "recovered").glob("fn_*.c")}
    fns = [f for f in t.game_functions("train") if f["mode"] == "thumb" and min_size <= f["size"] <= max_size
           and f["id"] in done and not f["callees"]]
    fns.sort(key=lambda f: (f["difficulty"], f["size"]))
    return [f["id"] for f in fns[:n]]


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="python -m crew.demo")
    ap.add_argument("--fns", default="")
    ap.add_argument("--pick", type=int, default=0)
    ap.add_argument("--live", action="store_true")
    ap.add_argument("--diggers", type=int, default=3)
    ap.add_argument("--redo", type=int, default=0,
                    help="redo N already-recovered small functions from scratch (library off, no warm start)")
    a = ap.parse_args(argv)
    cfg = Config()
    fns = [f for f in a.fns.split(",") if f] or (pick_redo(cfg, a.redo) if a.redo else pick(cfg, a.pick or 3))
    if not fns:
        print("no functions to demo", file=sys.stderr)
        return 1
    args = run_parser().parse_args(["--fns", ",".join(fns), "--diggers", str(a.diggers), "--library", "off" if a.redo else "on",
                                    "--label", "LIVE on stage · redo from scratch" if a.redo else "LIVE on stage", *(["--live"] if a.live else [])])
    args.budget_usd = 5.0
    cfg.reasoning_effort = "medium"  # on stage, a first attempt in seconds beats a perfect one in 25 s
    r = Run(cfg, args)
    t0 = time.time()
    stop = threading.Event()

    def timer():
        while not stop.wait(0.5):
            done = len(r.matched)
            sys.stdout.write(f"\r  LIVE  {time.time() - t0:6.1f}s   matched {done}/{len(fns)}   "
                             f"lies caught {r.checker.false_claims}   ${r.usage.cost_usd:.3f}   ")
            sys.stdout.flush()

    threading.Thread(target=timer, daemon=True).start()
    m = r.go()
    stop.set()
    print(f"\n  done in {time.time() - t0:.1f}s: {m['matched']}/{m['fn_total']} matched, "
          f"{m['false_claims_caught']} false claims caught, ${m['cost_usd']:.3f}  (run {r.run_id})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
