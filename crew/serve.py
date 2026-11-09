"""Crew jobs API (contracts section 4b) for Lane A's ASI:One agents (Fetch.ai).

    python -m crew.serve --port 7111          # real: each job is a one-function recovery in its own run dir
    python -m crew.serve --port 7111 --mock   # fixture-backed, instant, for building against

POST /jobs {"fn": "fn_08000A1C", "max_usd": 1.5} -> {"job_id": "j_1", "run_id": "r_asi_01"}
POST /jobs {"query": "bring back Doomguy's face"} -> SubQ Snap routes the words to a function, then starts the job
POST /route {"query": "...", "k": 5} -> candidate functions with probabilities (inferred)
GET  /jobs/{job_id}   GET /status   GET /names/{fn}   GET /health
Names are always marked inferred: true. Nothing is reported matched without a Checker-accepted referee MATCH.

Anyone in ASI:One can reach this API through the agent, so spending is capped here, not in the agent: at most
CREW_MAX_JOBS jobs at once (default 3), and CREW_HOURLY_USD (default $5) across every job and route in any rolling
hour. A job reserves its whole budget when it starts and settles to its real cost when it ends. Over a cap: 429.
"""
from __future__ import annotations

import argparse
import itertools
import json
import math
import os
import re
import threading
import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

from .config import ROOT, Config
from .httpguard import cross_site_error

FIX = ROOT / "contracts" / "fixtures"
MAX_BODY = 256 * 1024
FN_ID = re.compile(r"fn_[0-9A-F]{8}")  # contracts: ^fn_[0-9A-F]{8}$
MAX_QUERY = 200  # characters kept; the router quotes the query inside every Snap question
MAX_QUERY_IN = 2000  # longer than this is not a request, it is a payload (400)
JOB_BUDGET_FACTOR = 1.2  # a job's run budget is max_usd * 1.2 (see _real_job)
ROUTE_RESERVE_USD = 0.25  # held while a route runs; settled to the measured Snap cost
CONTROL = re.compile(r"[\x00-\x1f\x7f-\x9f\u2028\u2029\u202a-\u202e\u2066-\u2069]")


class SpendCapError(RuntimeError):
    """A request that would pass the concurrent-job or hourly spend cap (HTTP 429)."""


class SpendGuard:
    """Rolling-hour spend ledger shared by every job and route. Open entries (still running) always count."""

    def __init__(self, max_jobs: int, hourly_usd: float, window_s: float = 3600, clock=time.time):
        self.max_jobs, self.hourly_usd, self.window_s, self.clock = max_jobs, hourly_usd, window_s, clock
        self.entries: dict[str, dict] = {}
        self.lock = threading.Lock()

    @classmethod
    def from_env(cls) -> "SpendGuard":
        return cls(int(os.environ.get("CREW_MAX_JOBS", "3")), float(os.environ.get("CREW_HOURLY_USD", "5")))

    def _live(self) -> list[dict]:
        now = self.clock()
        self.entries = {k: e for k, e in self.entries.items() if e["open"] or now - e["ts"] < self.window_s}
        return list(self.entries.values())

    def spent(self) -> float:
        with self.lock:
            return round(sum(e["usd"] for e in self._live()), 4)

    def running(self) -> int:
        with self.lock:
            return sum(1 for e in self._live() if e["open"] and e["job"])

    def reserve(self, key: str, usd: float, *, job: bool = True) -> None:
        with self.lock:
            live = self._live()
            if job and sum(1 for e in live if e["open"] and e["job"]) >= self.max_jobs:
                raise SpendCapError(f"{self.max_jobs} jobs are already running; try again in a minute")
            spent = sum(e["usd"] for e in live)
            if spent + usd > self.hourly_usd + 1e-9:
                raise SpendCapError(f"the hourly spend cap (${self.hourly_usd:.2f}) is reached; "
                                    f"${max(0.0, self.hourly_usd - spent):.2f} left this hour")
            self.entries[key] = {"ts": self.clock(), "usd": usd, "open": True, "job": job}

    def settle(self, key: str, usd: float | None = None) -> None:
        """Close an entry at its real cost (None keeps the reservation, e.g. when a job crashed)."""
        with self.lock:
            e = self.entries.get(key)
            if e:
                e.update(open=False, ts=self.clock(), usd=e["usd"] if usd is None else max(0.0, float(usd)))


def clean_query(raw) -> str:
    """User words from ASI:One: control and bidi characters become spaces, whitespace collapses, and only the first
    MAX_QUERY characters are kept (agents forward whole chat messages). Over MAX_QUERY_IN is refused."""
    if not isinstance(raw, str):
        raise ValueError("query must be a string")
    if len(raw) > MAX_QUERY_IN:
        raise ValueError(f"query is longer than {MAX_QUERY_IN} characters")
    return " ".join(CONTROL.sub(" ", raw).split())[:MAX_QUERY].strip()


class Jobs:
    def __init__(self, cfg: Config, mock: bool, live_jobs: bool = False):
        self.cfg = cfg
        self.mock = mock
        self.live_jobs = live_jobs  # ASI:One jobs become runs/live, so the Stage shows them
        self.jobs: dict[str, dict] = {}
        self.ids = itertools.count(1)
        self.lock = threading.Lock()
        self.route_lock = threading.Lock()  # one route at a time: bounds Snap load and makes its cost measurable
        self.guard = SpendGuard.from_env()

    # -------------------------------------------------- jobs
    def start(self, fn: str, max_usd: float, *, route: dict | None = None, live: bool = False) -> dict:
        n = next(self.ids)
        job_id, run_id = f"j_{n}", f"r_asi_{n:02d}"
        self.guard.reserve(job_id, round(max_usd * JOB_BUDGET_FACTOR, 4))  # raises SpendCapError (429)
        job = {"job_id": job_id, "run_id": run_id, "fn": fn, "status": "running", "attempts": 0, "best_pct": 0.0,
               "cost_usd": 0.0, "src_path": None, "false_claims": 0, "started": time.time(),
               "route": route, "live": live or self.live_jobs}
        with self.lock:
            self.jobs[job_id] = job
        if self.mock:
            threading.Thread(target=self._mock_job, args=(job,), daemon=True).start()
        else:
            threading.Thread(target=self._real_job, args=(job, max_usd), daemon=True).start()
        return {"job_id": job_id, "run_id": run_id}

    def _mock_job(self, job: dict) -> None:
        for k, pct in enumerate((61.5, 88.0, 100.0), start=1):
            time.sleep(0.4)
            job.update(attempts=k, best_pct=pct, cost_usd=round(0.1 * k, 2))
        job.update(status="matched", src_path=f"runs/{job['run_id']}/recovered/{job['fn']}.c", false_claims=1,
                   fixture=True)
        self.guard.settle(job["job_id"], job["cost_usd"])

    def _real_job(self, job: dict, max_usd: float) -> None:
        from .run import Run, parser

        argv = ["--fns", job["fn"], "--diggers", "1", "--run-id", job["run_id"],
                "--library", "on", "--label", f"asi:one job {job['job_id']}", "--max-usd-per-fn", str(max_usd)]
        if job.get("route"):
            argv += ["--route-json", json.dumps(job["route"])]
        if job.get("live"):
            argv += ["--live"]  # the Stage shows this job as it happens (the ASI:One beat of the demo)
        args = parser().parse_args(argv)
        args.budget_usd = max_usd * JOB_BUDGET_FACTOR
        settled = None
        try:
            r = Run(self.cfg, args)
            job["_run"] = r
            m = r.go()
            out = r.outcomes[0] if r.outcomes else None
            job.update(attempts=out.attempts if out else 0, best_pct=out.best_pct if out else 0.0,
                       cost_usd=round(m["cost_usd"], 4), false_claims=m["false_claims_caught"],
                       status="matched" if m["matched"] else "abandoned",
                       src_path=f"runs/{job['run_id']}/recovered/{job['fn']}.c" if m["matched"] else None)
            settled = job["cost_usd"]
        except Exception as e:
            job.update(status="failed", error=str(e)[:300])
        finally:
            job.pop("_run", None)
            self.guard.settle(job["job_id"], settled)  # a crashed job keeps its full reservation

    def route(self, query: str, k: int = 5) -> dict:
        if self.mock:
            names = json.loads((FIX / "names.sample.json").read_text())["names"][:k]
            return {"query": query, "fns": [n["fn"] for n in names], "p": {n["fn"]: 0.5 for n in names},
                    "inferred": True, "basis": "fixture (mock)", "fixture": True, "latency_ms": 0}
        from . import snap
        from .target import Target

        if not hasattr(self, "_target"):
            self._target = Target(self.cfg)
        key = f"route_{time.time_ns()}"
        with self.route_lock:
            self.guard.reserve(key, ROUTE_RESERVE_USD, job=False)  # raises SpendCapError (429)
            before = snap.STATS["by_op"].get("route", {}).get("input_tokens", 0)
            try:
                return snap.route(self.cfg, self._target, query, k=max(1, min(10, k)))
            finally:
                used = snap.STATS["by_op"].get("route", {}).get("input_tokens", 0) - before
                self.guard.settle(key, used * snap.SNAP_PRICE_IN)

    def get(self, job_id: str) -> dict | None:
        job = self.jobs.get(job_id)
        if not job:
            return None
        r = job.get("_run")
        if r is not None and job["status"] == "running":  # live progress while the Digger works
            outs = [o for o in r.outcomes]
            job["cost_usd"] = round(r.usage.cost_usd, 4)
            job["false_claims"] = r.checker.false_claims
            if outs:
                job["attempts"], job["best_pct"] = outs[0].attempts, outs[0].best_pct
        out = {k: v for k, v in job.items() if not k.startswith("_") and k != "started"}
        out["evidence"] = self._evidence(job)
        return out

    def _evidence(self, job: dict) -> dict:
        """What an ASI:One answer should show: observed (referee) vs inferred (names) vs judgment (Snap, Gemini)."""
        ev_path = self.cfg.runs_dir / job["run_id"] / "events.jsonl"
        observed, decisions, reviews = None, [], []
        if ev_path.exists():
            for line in ev_path.read_text().splitlines():
                try:
                    e = json.loads(line)
                except json.JSONDecodeError:
                    continue
                p = e.get("payload", {})
                if e.get("type") == "verdict" and p.get("claim_was_true") is not None:
                    observed = {"status": p.get("status"), "match_pct": p.get("match_pct"),
                                "first_diff": p.get("first_diff"), "claim_was_true": p.get("claim_was_true")}
                elif e.get("type") == "snap.decision" and p.get("op") == "decide_next":
                    decisions.append({k: p.get(k) for k in ("attempt", "action", "confidence", "p_match_within_budget")})
                elif e.get("type") == "snap.decision" and p.get("op") == "review":
                    reviews.append({k: p.get(k) for k in ("reviewer", "fakematch_p", "recital_p", "period_plausible_p")})
        name = self.name(job["fn"])
        return {"observed": observed, "inferred": {"name": name.get("name"), "basis": name.get("basis")},
                "judgment": {"snap_decisions": decisions[-5:], "reviews": reviews[-2:], "route": job.get("route")},
                "fixture": bool(job.get("fixture"))}

    # -------------------------------------------------- status and names
    def status(self) -> dict:
        if self.mock:
            return json.loads((FIX / "crew_status.sample.json").read_text())
        live = self.cfg.runs_dir / "live"
        run_id = live.resolve().name if live.exists() else None
        out = {"live_run_id": run_id, "pct_recovered": 0.0, "matched": 0, "fn_total": 0, "false_claims": 0,
               "last_build": None}
        if not run_id:
            return out
        ev = live / "events.jsonl"
        matched, total, fc, build = set(), 0, 0, None
        if ev.exists():
            for line in ev.read_text().splitlines():
                try:
                    e = json.loads(line)
                except json.JSONDecodeError:
                    continue
                t = e.get("type")
                if t == "run.started":
                    total = e["payload"].get("fn_total", 0)
                elif t == "fn.matched":
                    matched.add(e["fn"])
                elif t == "verdict" and e["payload"].get("claim_was_true") is False:
                    fc += 1
                elif t == "build.rom":
                    build = {"rom_sha1": e["payload"]["rom_sha1"], "identical": e["payload"]["identical"]}
        out.update(matched=len(matched), fn_total=total, false_claims=fc, last_build=build,
                   pct_recovered=round(len(matched) / total * 100, 1) if total else 0.0)
        return out

    def name(self, fn: str) -> dict:
        if self.mock:
            for n in json.loads((FIX / "names.sample.json").read_text())["names"]:
                if n["fn"] == fn:
                    return n
        for p in sorted(self.cfg.runs_dir.glob("*/names.json"), key=lambda p: p.stat().st_mtime, reverse=True):
            try:
                for n in json.loads(p.read_text()).get("names", []):
                    if n["fn"] == fn:
                        return {**n, "inferred": True}
            except (json.JSONDecodeError, OSError):
                continue
        return {"fn": fn, "name": None, "inferred": True, "basis": "not named yet"}


def make_handler(jobs: Jobs):
    class H(BaseHTTPRequestHandler):
        def log_message(self, *a):  # quiet
            pass

        def _send(self, code: int, body) -> None:
            data = json.dumps(body).encode()
            self.send_response(code)
            self.send_header("Content-Type", "application/json")
            self.send_header("Content-Length", str(len(data)))
            self.end_headers()
            self.wfile.write(data)

        def do_GET(self):
            if refused := cross_site_error(self, post=False):
                return self._send(refused[0], {"error": refused[1]})
            p = self.path.split("?", 1)[0].rstrip("/")
            if p == "/health":
                return self._send(200, {"ok": True, "mock": jobs.mock, "model": jobs.cfg.model,
                                        "jobs_running": jobs.guard.running(), "spent_last_hour_usd": jobs.guard.spent(),
                                        "hourly_cap_usd": jobs.guard.hourly_usd, "max_jobs": jobs.guard.max_jobs})
            if p == "/status":
                return self._send(200, jobs.status())
            if p.startswith("/jobs/"):
                j = jobs.get(p.rsplit("/", 1)[1])
                return self._send(200, j) if j else self._send(404, {"error": "unknown job"})
            if p.startswith("/names/"):
                return self._send(200, jobs.name(p.rsplit("/", 1)[1]))
            self._send(404, {"error": "not found"})

        def do_POST(self):
            path = self.path.rstrip("/")
            if path not in ("/jobs", "/route"):
                return self._send(404, {"error": "not found"})
            if refused := cross_site_error(self, post=True):  # every job and route spends real money
                return self._send(refused[0], {"error": refused[1]})
            try:
                n = int(self.headers.get("Content-Length") or 0)
            except ValueError:
                return self._send(400, {"error": "bad Content-Length"})
            if n > MAX_BODY:
                return self._send(413, {"error": "body too large"})
            if n < 0:
                return self._send(400, {"error": "bad Content-Length"})
            try:
                body = json.loads(self.rfile.read(n) or b"{}")
            except (json.JSONDecodeError, UnicodeDecodeError):
                return self._send(400, {"error": "invalid JSON"})
            if not isinstance(body, dict):
                return self._send(400, {"error": "expected a JSON object"})
            # natural language -> functions (SubQ Snap over the whole program; inferred, never the hidden map)
            if path == "/route" or ("query" in body and "fn" not in body):
                try:
                    q = clean_query(body.get("query") or "")
                    k = body.get("k", 5)
                    if isinstance(k, bool) or not isinstance(k, int):
                        raise ValueError("k must be an integer")
                except ValueError as e:
                    return self._send(400, {"error": str(e)})
                if not q:
                    return self._send(400, {"error": "expected {\"query\": \"bring back Doomguy's face\"}"})
                try:
                    r = jobs.route(q, k)
                except SpendCapError as e:
                    return self._send(429, {"error": str(e)})
                except Exception as e:
                    return self._send(503, {"error": f"router unavailable: {str(e)[:160]}"})
                if path == "/route" or not r.get("fns"):
                    return self._send(200, r)
                body = {**body, "fn": r["fns"][0]}
                routed = r
            else:
                routed = None
            try:
                fn = body["fn"]
                raw_usd = body.get("max_usd", 1.5)
                if not isinstance(fn, str) or isinstance(raw_usd, bool) or not isinstance(raw_usd, (int, float)):
                    raise TypeError
                if not math.isfinite(raw_usd):
                    raise ValueError
                max_usd = min(5.0, max(0.1, float(raw_usd)))
            except (json.JSONDecodeError, KeyError, TypeError, ValueError):
                return self._send(400, {"error": "expected {\"fn\": \"fn_XXXXXXXX\", \"max_usd\": 1.5}"})
            if not FN_ID.fullmatch(fn):
                return self._send(400, {"error": "fn must look like fn_08000A1C"})
            rt = {k: routed.get(k) for k in ("query", "fns", "p", "basis", "latency_ms")} if routed else None
            try:
                started = jobs.start(fn, max_usd, route=rt, live=bool(body.get("live")))
            except SpendCapError as e:
                return self._send(429, {"error": str(e)})
            self._send(200, {**started, "route": routed} if routed else started)

    return H


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="python -m crew.serve")
    ap.add_argument("--port", type=int, default=7111)
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--mock", action="store_true")
    ap.add_argument("--live-jobs", action="store_true", help="every ASI:One job becomes runs/live (Stage shows it)")
    a = ap.parse_args(argv)
    jobs = Jobs(Config(), a.mock, live_jobs=a.live_jobs)
    srv = ThreadingHTTPServer((a.host, a.port), make_handler(jobs))
    print(f"crew jobs API on http://{a.host}:{a.port} ({'mock' if a.mock else 'real'})", flush=True)
    try:
        srv.serve_forever()
    except KeyboardInterrupt:
        pass
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
