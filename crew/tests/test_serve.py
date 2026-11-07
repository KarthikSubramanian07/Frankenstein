"""Jobs API tests: the real HTTP server on an ephemeral port (mock mode), and real-mode status/names
derived from a temporary runs/ directory."""
from __future__ import annotations

import json
import os
import threading
import time
import urllib.error
import urllib.request
from http.server import ThreadingHTTPServer

import pytest

from crew.config import ROOT
from crew.serve import Jobs, make_handler

from .fakes import VALIDATORS, offline_config

FIX = ROOT / "contracts" / "fixtures"


def valid(schema: str, doc) -> list[str]:
    return [e.message for e in VALIDATORS[schema].iter_errors(doc)]


def name_entry_errors(entry: dict) -> list[str]:
    return valid("names", {"v": 1, "run_id": "x", "names": [entry]})


class Client:
    def __init__(self, url):
        self.url = url

    def req(self, method, path, body=None, raw: bytes | None = None):
        data = raw if raw is not None else (json.dumps(body).encode() if body is not None else None)
        r = urllib.request.Request(self.url + path, data=data, method=method, headers={"Content-Type": "application/json"})
        try:
            with urllib.request.urlopen(r, timeout=5) as resp:
                return resp.status, json.loads(resp.read())
        except urllib.error.HTTPError as e:
            return e.code, json.loads(e.read())


@pytest.fixture
def server(tmp_path):
    jobs = Jobs(offline_config(tmp_path), mock=True)
    srv = ThreadingHTTPServer(("127.0.0.1", 0), make_handler(jobs))
    t = threading.Thread(target=srv.serve_forever, kwargs={"poll_interval": 0.02}, daemon=True)
    t.start()
    yield Client(f"http://127.0.0.1:{srv.server_address[1]}")
    srv.shutdown()
    srv.server_close()


def test_mock_job_lifecycle(server):
    code, started = server.req("POST", "/jobs", {"fn": "fn_08000A1C", "max_usd": 1.0})
    assert code == 200 and started == {"job_id": "j_1", "run_id": "r_asi_01"}
    code, job = server.req("GET", "/jobs/j_1")
    assert code == 200 and job["status"] == "running" and job["fn"] == "fn_08000A1C"
    assert valid("crew_job", job) == []
    deadline = time.time() + 5
    while job["status"] == "running" and time.time() < deadline:
        time.sleep(0.05)
        job = server.req("GET", "/jobs/j_1")[1]
    assert job["status"] == "matched" and valid("crew_job", job) == []
    assert job["attempts"] == 3 and job["best_pct"] == 100.0 and job["false_claims"] == 1 and job["fixture"] is True
    assert job["src_path"] == "runs/r_asi_01/recovered/fn_08000A1C.c"
    assert server.req("POST", "/jobs", {"fn": "fn_08000A20"})[1]["job_id"] == "j_2"


def test_status_and_names_validate(server):
    code, st = server.req("GET", "/status")
    assert code == 200 and valid("crew_status", st) == []
    sample = json.loads((FIX / "names.sample.json").read_text())["names"][0]
    code, n = server.req("GET", f"/names/{sample['fn']}")
    assert code == 200 and n == sample and name_entry_errors(n) == []
    code, h = server.req("GET", "/health")
    assert code == 200 and h["ok"] is True and h["mock"] is True


@pytest.mark.parametrize("body", [
    {"fn": "nope"}, {"fn": "fn_123"}, {"fn": "fn_08000a1c"}, {"fn": "fn_ZZZZZZZZ"}, {"fn": " fn_8000A1C"},
    {}, {"max_usd": 1}, [1, 2], {"fn": "fn_08000A1C", "max_usd": "lots"},
])
def test_bad_job_requests_are_400(server, body):
    code, err = server.req("POST", "/jobs", body)
    assert code == 400 and "error" in err


@pytest.mark.parametrize("raw", [b"{not json", b"5", b'"query"', b"null", b"[]"])
def test_bad_json_is_400(server, raw):
    assert server.req("POST", "/jobs", raw=raw)[0] == 400


def test_unknown_routes_are_404(server):
    assert server.req("GET", "/jobs/j_999") == (404, {"error": "unknown job"})
    assert server.req("GET", "/nope")[0] == 404
    assert server.req("POST", "/status", {})[0] == 404


def test_max_usd_is_clamped(tmp_path, monkeypatch):
    jobs = Jobs(offline_config(tmp_path), mock=True)
    seen = []
    monkeypatch.setattr(jobs, "start", lambda fn, max_usd: seen.append(max_usd) or {"job_id": "j", "run_id": "r"})
    srv = ThreadingHTTPServer(("127.0.0.1", 0), make_handler(jobs))
    threading.Thread(target=srv.serve_forever, kwargs={"poll_interval": 0.02}, daemon=True).start()
    try:
        c = Client(f"http://127.0.0.1:{srv.server_address[1]}")
        for v in (100, 0, 2.5):
            assert c.req("POST", "/jobs", {"fn": "fn_08000A1C", "max_usd": v})[0] == 200
    finally:
        srv.shutdown()
        srv.server_close()
    assert seen == [5.0, 0.1, 2.5]


# ---------------------------------------------------------------- real mode, no server needed
def _ev(seq, type_, fn=None, **p):
    return json.dumps({"v": 1, "ts": "2026-11-07T10:00:00.000Z", "run_id": "r07", "seq": seq, "type": type_,
                       "actor": "checker", "fn": fn, "payload": p})


def test_real_status_from_live_run(tmp_path):
    runs = tmp_path / "runs"
    (runs / "r07").mkdir(parents=True)
    lines = [_ev(1, "run.started", fn_total=4), _ev(2, "fn.matched", "fn_08000214"),
             _ev(3, "verdict", "fn_08000230", claim_was_true=False), _ev(4, "fn.matched", "fn_08000230"),
             _ev(5, "fn.matched", "fn_08000230"),  # duplicates count once
             _ev(6, "verdict", "fn_08000230", claim_was_true=True),
             "not json at all",
             _ev(7, "build.rom", rom_sha1="ab" * 20, identical=False)]
    (runs / "r07" / "events.jsonl").write_text("\n".join(lines) + "\n")
    os.symlink("r07", runs / "live")
    jobs = Jobs(offline_config(runs), mock=False)
    st = jobs.status()
    assert st == {"live_run_id": "r07", "pct_recovered": 50.0, "matched": 2, "fn_total": 4, "false_claims": 1,
                  "last_build": {"rom_sha1": "ab" * 20, "identical": False}}
    assert valid("crew_status", st) == []


def test_real_status_without_live_run(tmp_path):
    st = Jobs(offline_config(tmp_path), mock=False).status()
    assert st["live_run_id"] is None and st["matched"] == 0 and st["fn_total"] == 0 and st["last_build"] is None


def test_real_names_newest_run_wins(tmp_path):
    for rid, name in (("r01", "old_name"), ("r02", "new_name")):
        (tmp_path / rid).mkdir()
        (tmp_path / rid / "names.json").write_text(json.dumps({"v": 1, "run_id": rid, "names": [
            {"fn": "fn_08000214", "name": name, "inferred": True, "basis": "recovered code"}]}))
        time.sleep(0.01)
    os.utime(tmp_path / "r01" / "names.json", (1, 1))
    (tmp_path / "r03").mkdir()
    (tmp_path / "r03" / "names.json").write_text("{broken")
    jobs = Jobs(offline_config(tmp_path), mock=False)
    n = jobs.name("fn_08000214")
    assert n["name"] == "new_name" and n["inferred"] is True and name_entry_errors(n) == []
    missing = jobs.name("fn_08000230")
    assert missing["name"] is None and missing["inferred"] is True
