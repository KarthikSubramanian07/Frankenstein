"""Run the crew over a split of the target and write runs/<run_id>/ in the contract formats.

    python -m crew.run --label "train · learning" --split train --library learning --diggers 6 --live
    python -m crew.run --split heldout --library on  --label "heldout · library on"
    python -m crew.run --split heldout --library off --label "heldout · library off"
    python -m crew.run --fns fn_08000214,fn_08000230 --live          # specific functions (demo)

Latency: N Diggers run in parallel threads; the Checker's referee calls happen inside each Digger's
thread; the Distiller (one LLM call per match) and narration run off the critical path.
"""
from __future__ import annotations

import argparse
import json
import os
import re
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

from .archivist import Archivist
from .checker import Checker
from .config import Config
from .digger import Digger, Outcome
from .events import EventLog
from .library import Library
from .llm import LLM, LLMError, Usage
from .prompts import DISTILL_SYSTEM, distill_user
from .referee import make_referee
from .target import Target

PRIORITY_SUBSYSTEM_HINT = None  # Lane A tells us hud then weapons; ordering uses only manifest data (no viz_map)


def new_run_id(runs_dir: Path, prefix: str = "r") -> str:
    existing = [p.name for p in runs_dir.glob(f"{prefix}*") if p.is_dir()]
    nums = [int(m.group(1)) for n in existing if (m := re.fullmatch(rf"{prefix}(\d+)", n))]
    return f"{prefix}{(max(nums) + 1) if nums else 1:02d}"


def order_functions(target: Target, fns: list[dict], snap_scores: dict | None = None) -> list[dict]:
    """Leaves before callers (callees recovered first give better context), easy before hard."""
    def key(f):
        d = (snap_scores or {}).get(f["id"], {}).get("difficulty", f["difficulty"])
        return (len(f["callees"]) > 0, round(d, 2), f["size"])
    return sorted(fns, key=key)


class Run:
    def __init__(self, cfg: Config, args):
        self.cfg = cfg
        self.args = args
        self.referee = make_referee(cfg.referee_url)
        self.target = Target(cfg, self.referee)
        cfg.runs_dir.mkdir(parents=True, exist_ok=True)
        self.run_id = args.run_id or new_run_id(cfg.runs_dir)
        self.dir = cfg.runs_dir / self.run_id
        (self.dir / "recovered").mkdir(parents=True, exist_ok=True)
        self.log = EventLog(self.dir, self.run_id)
        self.usage = Usage()
        self.llm = LLM(cfg, self.usage)
        lib_path = Path(args.library_path) if args.library_path else None
        self.library = Library(cfg, mode=args.library, path=lib_path)
        from .library import CaseMemory

        self.library.cases = CaseMemory(self.library)  # solved-before memory (training solutions only)
        snap_review = None
        self.snap_scores = {}
        if args.snap and cfg.subq_key:
            try:
                from . import snap
                def snap_review(asm, src, ctx, _s=snap):
                    r = _s.review(cfg, asm, src, ctx)
                    self.log.emit("snap.decision", "checker", op="review", reviewer="snap", fakematch_p=r.get("fakematch_p"),
                                  recital_p=r.get("recital_p"), period_plausible_p=r.get("period_plausible_p"),
                                  latency_ms=r.get("latency_ms"))
                    return r
                self._snap = snap
            except Exception:
                snap_review = None
        second = None
        if args.gemini and cfg.env_has("GEMINI_API_KEY"):
            from . import gemini

            def second(asm, src, _g=gemini):
                r = _g.review(asm, src)
                self.log.emit("snap.decision", "checker", op="review", reviewer="gemini", model=r.get("model"),
                              fakematch_p=r.get("fakematch_p"), recital_p=r.get("recital_p"),
                              period_plausible_p=r.get("plausible_p"), latency_ms=r.get("latency_ms"))
                return r
        self.checker = Checker(self.referee, self.log, snap_review=snap_review, second_review=second)
        self.archivist = Archivist(self.log)
        self.log.listeners.append(self.archivist.on_event)
        from .memory import AtlasSink

        self.atlas = AtlasSink(cfg, self.run_id)  # MongoDB Atlas system of record (no-op without MONGODB_URI)
        self.log.listeners.append(self.atlas.on_event)
        self.matched: list[tuple[float, str]] = []
        self.outcomes: list[Outcome] = []
        self.names: dict[str, dict] = {}
        self.t0 = time.time()
        self._lock = threading.Lock()
        self._stop = threading.Event()
        self.distill_pool = ThreadPoolExecutor(max_workers=2, thread_name_prefix="distiller")
        self.distill_futs = []
        self.types_slice = None

    # ------------------------------------------------------------------ helpers
    def budget_ok(self) -> bool:
        return self.usage.cost_usd < 0.9 * self.args.budget_usd

    def select(self) -> list[dict]:
        if self.args.fns:
            ids = [s.strip() for s in self.args.fns.split(",") if s.strip()]
            return [self.target.fns[i] for i in ids]
        fns = self.target.game_functions(None if self.args.split == "all" else self.args.split)
        if self.args.max_size:
            fns = [f for f in fns if f["size"] <= self.args.max_size]
        fns = order_functions(self.target, fns, self.snap_scores)
        return fns[: self.args.limit] if self.args.limit else fns

    def ticker(self) -> None:
        while not self._stop.wait(5):
            self.tick()

    def tick(self) -> None:
        with self._lock:
            m = len(self.matched)
        total = max(1, self.fn_total)
        self.log.emit("metric.tick", "scheduler", pct_recovered=round(m / total * 100, 1), matched=m,
                      attempted=self.attempted, false_claims=self.checker.false_claims,
                      cost_usd=round(self.usage.cost_usd, 4), elapsed_s=round(time.time() - self.t0, 1))

    def accept(self, out: Outcome) -> None:
        path = self.dir / "recovered" / f"{out.fn}.c"
        path.write_text(f"/* {out.fn}: recovered by the Frankenstein crew, run {self.run_id}.\n"
                        f"   Observed: compiles to identical bytes (referee MATCH, Checker accepted).\n"
                        f"   Inferred: nothing in this file is a claim about original names. */\n\n" + out.src.strip() + "\n")
        with self._lock:
            self.target.recovered[out.fn] = out.src
            self.matched.append((time.time() - self.t0, out.fn))
            n = len(self.matched)
        rel = os.path.relpath(path, self.cfg.runs_dir.parent)
        self.log.emit("fn.matched", "checker", fn=out.fn, attempts=out.attempts, minutes=round(out.seconds / 60, 2),
                      cost_usd=round(out.cost_usd, 4), src_path=rel, lines=len(out.src.strip().splitlines()),
                      models=out.model_calls)
        self.archivist.milestone(n, self.fn_total)
        f = self.target.fns.get(out.fn, {})
        self.library.cases.add(out.fn, self.target.asm(out.fn), out.src, f.get("split", ""), f.get("size", 0), self.run_id)
        if self.args.library != "off" or self.args.names:
            self.distill_futs.append(self.distill_pool.submit(self.distill, out))
        if n % 3 == 0 and getattr(self.referee, "kind", "") == "lab" and not self.args.no_rebuild:
            threading.Thread(target=self.rebuild, daemon=True).start()

    def rebuild(self) -> None:
        """Ask the Lab to splice every accepted function into the ROM and prove the SHA-1; log it in THIS run."""
        try:
            with self._lock:
                if getattr(self, "_rebuilding", False):
                    return
                self._rebuilding = True
            r = self.referee.rebuild(str(self.dir / "recovered"))
            if isinstance(r, dict) and r.get("rom_sha1"):
                self.log.emit("build.rom", "lab", rom_sha1=r["rom_sha1"], identical=bool(r.get("identical")),
                              recovered=int(r.get("recovered", 0)), from_original=int(r.get("from_original", 0)),
                              pct_agent_code=float(r.get("pct_agent_code", 0.0)), rom_path=r.get("rom_path", ""),
                              original_sha1=r.get("original_sha1"), method=r.get("method"))
                self.last_build = r
        except Exception as e:
            self.log.emit("narration", "archivist", text="Rebuild hiccup. The referee will try again.", mood="dry",
                          speak=False, priority=0, error=str(e)[:160])
        finally:
            self._rebuilding = False

    def distill(self, out: Outcome) -> None:
        journey = "\n".join(f"attempt {j[0]}: {j[1]} {j[2]}% {j[3] or ''} -> {j[4] if len(j) > 4 else ''}"
                            for j in out.journey if isinstance(j[0], int))[-2500:]
        try:
            r = self.llm.chat([{"role": "system", "content": DISTILL_SYSTEM},
                               {"role": "user", "content": distill_user(out.fn, self.target.asm(out.fn), out.src, journey)}],
                              effort="low", max_tokens=3000)
            txt = r["message"].get("content") or ""
            data = json.loads(txt[txt.find("{"): txt.rfind("}") + 1])
        except (LLMError, ValueError, json.JSONDecodeError):
            return
        name = re.sub(r"[^a-z0-9_]", "", str(data.get("name", "")).lower())[:48]
        if name:
            with self._lock:
                self.names[out.fn] = {"fn": out.fn, "name": name, "inferred": True, "basis": "recovered code"}
        if self.args.library == "learning":
            for idm in (data.get("idioms") or [])[:2]:
                if not all(isinstance(idm.get(k), str) for k in ("title", "applies_when", "do")):
                    continue
                item = self.library.add(idm, out.src, out.fn)
                if item:
                    self.log.emit("idiom.learned", "distiller", fn=out.fn, idiom_id=item["idiom_id"],
                                  title=item["title"], applies_when=item["applies_when"], do=item["do"])

    # ------------------------------------------------------------------ main
    def go(self) -> dict:
        if self.args.snap and self.cfg.subq_key and hasattr(self, "_snap") and not self.args.fns:
            try:
                t = time.time()
                fns_pre = [f["id"] for f in self.target.game_functions(None if self.args.split == "all" else self.args.split)]
                if self.args.max_size:
                    fns_pre = [i for i in fns_pre if self.target.fns[i]["size"] <= self.args.max_size]
                self.snap_scores = self._snap.triage(self.cfg, self.target, fns=fns_pre)
                self.log.emit("snap.decision", "scheduler", op="triage", functions=len(self.snap_scores),
                              latency_ms=round((time.time() - t) * 1000),
                              hardest=sorted(self.snap_scores, key=lambda k: -self.snap_scores[k]["difficulty"])[:5])
                self.log.emit("narration", "archivist", text=f"SubQ Snap read the whole program: {len(self.snap_scores)} functions triaged.",
                              mood="dry", speak=False, priority=1)
            except Exception:
                self.snap_scores = {}
        if self.args.cartographer:
            self.types_slice = self._load_types()
        fns = self.select()
        self.fn_total = len(fns)
        self.attempted = 0
        label = self.args.label or f"{self.args.split} · library {self.args.library}"
        if getattr(self.referee, "kind", "") == "mock":
            label += " (mock referee)"
        if self.target.fixture:
            label += " (fixture target)"
        self.label = label
        self.log.emit("run.started", "scheduler", label=label, split="heldout" if self.args.split == "heldout" else "train",
                      library=self.args.library, diggers=self.args.diggers, model=self.cfg.model,
                      budget_usd=self.args.budget_usd, game_id=self.target.game_id, fn_total=self.fn_total,
                      referee=getattr(self.referee, "kind", "lab"), reasoning_effort=self.cfg.reasoning_effort,
                      escalation_model=self.cfg.escalation_model or None, cartographer=bool(self.args.cartographer),
                      library_backend=self.library.backend,
                      snap=bool(self.snap_scores) or (self.checker.snap_review is not None))
        if self.args.live:
            live = self.cfg.runs_dir / "live"
            tmp = self.cfg.runs_dir / ".live.tmp"
            if tmp.is_symlink() or tmp.exists():
                tmp.unlink()
            os.symlink(self.run_id, tmp)
            os.replace(tmp, live)  # atomic switch for the Stage
        if self.args.route_json:
            try:
                rt = json.loads(self.args.route_json)
                self.log.emit("snap.decision", "scheduler", fn=(rt.get("fns") or [None])[0], op="route",
                              query=str(rt.get("query", ""))[:200], fns=rt.get("fns"), p=rt.get("p"),
                              basis=rt.get("basis"), latency_ms=rt.get("latency_ms"), source="asi:one")
            except (json.JSONDecodeError, TypeError):
                pass
        tick = threading.Thread(target=self.ticker, daemon=True)
        tick.start()
        self.director = None
        if self.args.director:
            self._start_director()
        queue = list(fns)
        qlock = threading.Lock()

        def worker(i: int):
            snap_decide = None
            if hasattr(self, "_snap") and self.args.snap:
                snap_decide = lambda fn, asm, hist: self._snap.decide_next(self.cfg, fn, asm, hist)  # noqa: E731
            d0 = None
            if self.args.warm_start:
                d0 = self._best_prior_attempt
            d = Digger(f"digger-{i + 1}", self.llm, self.target, self.checker, self.library, self.log,
                       max_usd=self.args.max_usd_per_fn, types_slice=self.types_slice, budget_ok=self.budget_ok,
                       snap_decide=snap_decide)
            d.warm_start = d0
            d.max_attempts = self.args.max_attempts
            while self.budget_ok():
                with qlock:
                    if not queue:
                        return
                    # 1) what the player is looking at right now (SubQ Snap director), 2) functions whose
                    # callees are already recovered, 3) Snap triage order
                    boosted = list(self.director.boosted) if self.director else []
                    idx = next((k for b in boosted for k, f in enumerate(queue) if f["id"] == b), None)
                    if idx is None:
                        idx = next((k for k, f in enumerate(queue)
                                    if all(c in self.target.recovered for c in f["callees"])), 0)
                    f = queue.pop(idx)
                    self.attempted += 1
                if f["id"] in self.snap_scores:  # Snap's whole-program difficulty sets this function's budget
                    f = {**f, "difficulty": round(self.snap_scores[f["id"]]["difficulty"], 3)}
                    self.target.fns[f["id"]] = f
                out = d.dig(f["id"])
                with self._lock:
                    self.outcomes.append(out)
                if out.idioms and self.args.library != "off":
                    for ch in self.library.record_outcome(out.idioms, out.status == "matched", out.attempts):
                        self.log.emit("idiom.judged", "distiller", fn=out.fn, **ch)
                if out.status == "matched":
                    self.accept(out)

        with ThreadPoolExecutor(max_workers=self.args.diggers, thread_name_prefix="digger") as ex:
            futs = [ex.submit(worker, i) for i in range(self.args.diggers)]
            for f in as_completed(futs):
                f.result()
        for f in self.distill_futs:
            try:
                f.result(timeout=120)
            except Exception:
                pass
        self.distill_pool.shutdown(wait=True)
        if self.matched and getattr(self.referee, "kind", "") == "lab" and not self.args.no_rebuild:
            self.rebuild()  # the proof at the end of every run: rebuilt ROM, same SHA-1
        self._stop.set()
        if getattr(self, "_director_srv", None):
            self._director_srv.shutdown()  # release :7112 for the next live run
        self.tick()
        return self.finish()

    def _start_director(self) -> None:
        """POST /heartbeat {"running": [fn ids], "frame_png_b64": "..."} from Lane D's tap; Snap steers every few s."""
        from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

        from .director import MAX_HEARTBEAT_BYTES, Director, parse_heartbeat

        self.director = Director(self.cfg, self.target, self.log)
        run = self

        class H(BaseHTTPRequestHandler):
            def log_message(self, *a):
                pass

            def do_POST(self):
                try:
                    n = int(self.headers.get("Content-Length") or 0)
                except ValueError:
                    n = -1
                if not 0 <= n <= MAX_HEARTBEAT_BYTES:  # refuse before reading: no 8 MB reads on demand
                    body, code = {"error": f"body must be 0 to {MAX_HEARTBEAT_BYTES} bytes"}, 413
                else:
                    try:
                        running, png = parse_heartbeat(self.rfile.read(n))
                        run.director.heartbeat(running, png)
                        body, code = {"ok": True, "boosted": run.director.boosted}, 200
                    except Exception as e:
                        body, code = {"error": str(e)[:200]}, 400
                data = json.dumps(body).encode()
                self.send_response(code)
                self.send_header("Content-Type", "application/json")
                self.send_header("Content-Length", str(len(data)))
                self.end_headers()
                self.wfile.write(data)

            def do_GET(self):
                data = json.dumps({"boosted": run.director.boosted, "last": run.director.last}).encode()
                self.send_response(200)
                self.send_header("Content-Type", "application/json")
                self.send_header("Content-Length", str(len(data)))
                self.end_headers()
                self.wfile.write(data)

        srv = ThreadingHTTPServer(("127.0.0.1", self.args.director_port), H)
        self._director_srv = srv
        threading.Thread(target=srv.serve_forever, daemon=True).start()

        def steer_loop():
            while not self._stop.wait(self.args.director_every):
                if self.director.recent:
                    self.director.steer()
        threading.Thread(target=steer_loop, daemon=True).start()

    def _best_prior_attempt(self, fn: str):
        """Best earlier attempt at this exact function across runs/*/ (full source from attempts/).
        Only for non-evaluation runs: held-out comparisons must never carry state between arms."""
        best = None
        for ev_path in self.cfg.runs_dir.glob("*/events.jsonl"):
            run_dir = ev_path.parent
            if run_dir == self.dir:
                continue
            try:
                previews = {}
                for line in ev_path.read_text().splitlines():
                    if fn not in line:
                        continue
                    e = json.loads(line)
                    if e.get("fn") != fn:
                        continue
                    p = e["payload"]
                    if e.get("type") == "attempt.submitted":
                        prev = p.get("src_preview") or ""
                        if prev and len(prev.splitlines()) < 40:  # under 40 lines, the preview is the whole source
                            previews[int(p.get("attempt", 0))] = prev
                        continue
                    if e.get("type") != "verdict" or p.get("status") != "PARTIAL":
                        continue
                    n = int(p.get("attempt", 0))
                    src_path = run_dir / "attempts" / f"{fn}.{n:02d}.c"
                    src = src_path.read_text().strip() if src_path.exists() else previews.get(n)
                    if src and (best is None or p["match_pct"] > best["match_pct"]):
                        best = {"src": src, "match_pct": p["match_pct"], "run": run_dir.name}
            except (OSError, json.JSONDecodeError, ValueError):
                continue
        return best

    def _load_types(self):
        hdr = self.dir / "types.h"
        src = Path(self.args.cartographer) if self.args.cartographer not in ("on", "1", "true") else hdr
        if not src.exists():
            return None
        text = src.read_text()
        try:
            from .cartographer import signatures_for
            return lambda fn: signatures_for(fn, text)
        except Exception:
            return lambda fn: text[:4000]

    def _snap_stats(self) -> dict | None:
        if not hasattr(self, "_snap"):
            return None
        st = dict(self._snap.STATS)
        return {"on": bool(self.args.snap), "model": "subq-snap-1.1", **{k: st.get(k) for k in
                ("snap_calls", "errors", "latency_ms_mean", "input_tokens", "cost_usd", "by_op")}}

    def finish(self) -> dict:
        el = time.time() - self.t0
        matched = len(self.matched)
        abandoned = sum(1 for o in self.outcomes if o.status != "matched")
        total_attempts = sum(o.attempts for o in self.outcomes)
        m_attempts = sum(o.attempts for o in self.outcomes if o.status == "matched")
        m_secs = sum(o.seconds for o in self.outcomes if o.status == "matched")
        self.log.emit("run.finished", "scheduler", matched=matched, abandoned=abandoned,
                      pct_recovered=round(matched / max(1, self.fn_total) * 100, 1),
                      cost_usd=round(self.usage.cost_usd, 4), elapsed_s=round(el, 1))
        curve = [{"t_min": 0, "matched": 0}]
        for mm in range(1, int(el // 60) + 2):
            curve.append({"t_min": mm, "matched": sum(1 for t, _ in self.matched if t <= mm * 60)})
        cost = round(self.usage.cost_usd, 4)
        metrics = {
            "v": 1, "run_id": self.run_id, "label": self.label,
            "split": "heldout" if self.args.split == "heldout" else "train", "library": self.args.library,
            "model": self.cfg.model, "reasoning_effort": self.cfg.reasoning_effort, "fn_total": self.fn_total,
            "matched": matched, "match_rate": round(matched / max(1, self.fn_total), 3),
            "attempts_per_match": round(m_attempts / matched, 2) if matched else 0.0,
            "minutes_per_match": round(m_secs / 60 / matched, 2) if matched else 0.0,
            "cost_per_match_usd": round(cost / matched, 4) if matched else 0.0,
            "false_claims_caught": self.checker.false_claims, "fakematches_rejected": self.checker.fakematches_rejected,
            "cost_usd": cost, "curve": curve, "muse": self.usage.block(self.cfg.reasoning_effort),
            "attempts_total": total_attempts, "elapsed_s": round(el, 1),
            "referee": getattr(self.referee, "kind", "lab"), "fixture_target": self.target.fixture,
            "library_backend": self.library.backend, "library_size": len(self.library.items),
            "library_status": self.library.counts(), "case_memory": len(self.library.cases.items), "library_baseline": round(self.library.baseline(), 3),
            "snap_reviews": self.checker.snap_reviews, "second_opinion_reviews": self.checker.second_reviews, "cartographer": bool(self.args.cartographer),
            "snap": self._snap_stats(),
            "cost_estimated": any(m not in ("muse-spark-1.3",) for m in self.usage.by_model),
        }
        if getattr(self.referee, "kind", "") == "mock" or self.target.fixture:
            metrics["fixture"] = True  # never mistakable for a real result
        metrics["memory"] = self.atlas.finish({k: v for k, v in metrics.items() if k != "curve"})
        (self.dir / "metrics.json").write_text(json.dumps(metrics, indent=2) + "\n")
        (self.dir / "names.json").write_text(json.dumps({"v": 1, "run_id": self.run_id, "names": list(self.names.values())},
                                                         indent=2) + "\n")
        self.log.close()
        return metrics


def parser() -> argparse.ArgumentParser:
    ap = argparse.ArgumentParser(prog="python -m crew.run", description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--label", default="")
    ap.add_argument("--split", choices=["train", "heldout", "all"], default="train")
    ap.add_argument("--library", choices=["on", "off", "learning"], default="learning")
    ap.add_argument("--library-path", default="", help="idiom store file (local backend); share between runs")
    ap.add_argument("--diggers", type=int, default=6)
    ap.add_argument("--fns", default="", help="comma-separated fn ids (demo mode)")
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--max-size", type=int, default=0, help="only functions up to this many bytes")
    ap.add_argument("--budget-usd", type=float, default=None)
    ap.add_argument("--max-usd-per-fn", type=float, default=1.5)
    ap.add_argument("--cartographer", default="", help="'on' to use runs/<id>/types.h, or a header path")
    ap.add_argument("--snap", action=argparse.BooleanOptionalAction, default=True, help="SubQ Snap triage + review")
    ap.add_argument("--names", action="store_true", help="name functions even when library is off")
    ap.add_argument("--gemini", action=argparse.BooleanOptionalAction, default=True,
                    help="Gemini second-opinion review on every MATCH (a different lab's model)")
    ap.add_argument("--no-rebuild", action="store_true")
    ap.add_argument("--warm-start", action="store_true",
                    help="resume each function from its best earlier attempt (never use in held-out evaluation)")
    ap.add_argument("--max-attempts", type=int, default=0, help="override the per-function attempt budget")
    ap.add_argument("--director", action="store_true", help="Play to recover: SubQ Snap steers by live heartbeats")
    ap.add_argument("--director-port", type=int, default=7112)
    ap.add_argument("--director-every", type=float, default=4.0, help="seconds between Snap steering decisions")
    ap.add_argument("--live", action="store_true", help="point runs/live at this run")
    ap.add_argument("--run-id", default="")
    ap.add_argument("--route-json", default="", help="SubQ Snap route that started this run (ASI:One jobs)")
    return ap


def main(argv=None) -> int:
    args = parser().parse_args(argv)
    cfg = Config()
    if args.budget_usd is None:
        args.budget_usd = cfg.budget_usd
    r = Run(cfg, args)
    print(f"run {r.run_id} -> {r.dir}  referee={getattr(r.referee, 'kind', 'lab')}  manifest={cfg.manifest_path.name}",
          file=sys.stderr)
    m = r.go()
    print(json.dumps({k: m[k] for k in ("run_id", "label", "matched", "fn_total", "match_rate", "attempts_per_match",
                                        "false_claims_caught", "cost_usd", "elapsed_s")}, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
