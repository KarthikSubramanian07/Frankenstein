"""Crew jobs API (contracts section 4b) for Lane A's ASI:One agents (Fetch.ai).

    python -m crew.serve --port 7111          # real: each job is a one-function recovery in its own run dir
    python -m crew.serve --port 7111 --mock   # fixture-backed, instant, for building against

POST /jobs {"fn": "fn_08000A1C", "max_usd": 1.5} -> {"job_id": "j_1", "run_id": "r_asi_01"}
GET  /jobs/{job_id}   GET /status   GET /names/{fn}   GET /health
Names are always marked inferred: true. Nothing is reported matched without a Checker-accepted referee MATCH.
"""
from __future__ import annotations

import argparse
import itertools
import json
import threading
import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

from .config import ROOT, Config

FIX = ROOT / "contracts" / "fixtures"
MAX_BODY = 256 * 1024


class Jobs:
    def __init__(self, cfg: Config, mock: bool):
        self.cfg = cfg
        self.mock = mock
        self.jobs: dict[str, dict] = {}
        self.ids = itertools.count(1)
        self.lock = threading.Lock()

    # -------------------------------------------------- jobs
    def start(self, fn: str, max_usd: float) -> dict:
        n = next(self.ids)
        job_id, run_id = f"j_{n}", f"r_asi_{n:02d}"
        job = {"job_id": job_id, "run_id": run_id, "fn": fn, "status": "running", "attempts": 0, "best_pct": 0.0,
               "cost_usd": 0.0, "src_path": None, "false_claims": 0, "started": time.time()}
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

    def _real_job(self, job: dict, max_usd: float) -> None:
        from .run import Run, parser

        args = parser().parse_args(["--fns", job["fn"], "--diggers", "1", "--run-id", job["run_id"],
                                    "--library", "on", "--label", f"asi:one job {job['job_id']}",
                                    "--max-usd-per-fn", str(max_usd), "--no-rebuild"])
        args.budget_usd = max_usd * 1.2
        try:
            r = Run(self.cfg, args)
            job["_run"] = r
            m = r.go()
            out = r.outcomes[0] if r.outcomes else None
            job.update(attempts=out.attempts if out else 0, best_pct=out.best_pct if out else 0.0,
                       cost_usd=round(m["cost_usd"], 4), false_claims=m["false_claims_caught"],
                       status="matched" if m["matched"] else "abandoned",
                       src_path=f"runs/{job['run_id']}/recovered/{job['fn']}.c" if m["matched"] else None)
        except Exception as e:
            job.update(status="failed", error=str(e)[:300])
        finally:
            job.pop("_run", None)

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
        return {k: v for k, v in job.items() if not k.startswith("_") and k != "started"}

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
            p = self.path.split("?", 1)[0].rstrip("/")
            if p == "/health":
                return self._send(200, {"ok": True, "mock": jobs.mock, "model": jobs.cfg.model})
            if p == "/status":
                return self._send(200, jobs.status())
            if p.startswith("/jobs/"):
                j = jobs.get(p.rsplit("/", 1)[1])
                return self._send(200, j) if j else self._send(404, {"error": "unknown job"})
            if p.startswith("/names/"):
                return self._send(200, jobs.name(p.rsplit("/", 1)[1]))
            self._send(404, {"error": "not found"})

        def do_POST(self):
            if self.path.rstrip("/") != "/jobs":
                return self._send(404, {"error": "not found"})
            n = int(self.headers.get("Content-Length") or 0)
            if n > MAX_BODY:
                return self._send(413, {"error": "body too large"})
            try:
                body = json.loads(self.rfile.read(n) or b"{}")
                fn = str(body["fn"])
            except (json.JSONDecodeError, KeyError, TypeError):
                return self._send(400, {"error": "expected {\"fn\": \"fn_XXXXXXXX\", \"max_usd\": 1.5}"})
            if not (fn.startswith("fn_") and len(fn) == 11):
                return self._send(400, {"error": "fn must look like fn_08000A1C"})
            max_usd = min(5.0, max(0.1, float(body.get("max_usd", 1.5))))
            self._send(200, jobs.start(fn, max_usd))

    return H


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="python -m crew.serve")
    ap.add_argument("--port", type=int, default=7111)
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--mock", action="store_true")
    a = ap.parse_args(argv)
    jobs = Jobs(Config(), a.mock)
    srv = ThreadingHTTPServer((a.host, a.port), make_handler(jobs))
    print(f"crew jobs API on http://{a.host}:{a.port} ({'mock' if a.mock else 'real'})", flush=True)
    try:
        srv.serve_forever()
    except KeyboardInterrupt:
        pass
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
