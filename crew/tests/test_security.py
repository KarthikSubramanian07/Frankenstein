"""Security tests: what an anonymous ASI:One user can and cannot make the crew do (SECURITY.md).

Spend caps (concurrent jobs, rolling-hour USD), query limits, body limits, path checks, director heartbeat caps,
and the referee lint that untrusted C must pass before it reaches the compiler."""
from __future__ import annotations

import base64
import http.client
import json
import threading
import time
from http.server import ThreadingHTTPServer

import pytest

from crew import export
from crew.director import MAX_FRAME_BYTES, MAX_HEARTBEAT_BYTES, MAX_RUNNING, PNG_MAGIC, parse_heartbeat
from crew.serve import MAX_BODY, MAX_QUERY, MAX_QUERY_IN, Jobs, SpendCapError, SpendGuard, clean_query, make_handler

from .fakes import offline_config

FN = "fn_08000A1C"


class Clock:
    def __init__(self):
        self.t = 1_000_000.0

    def __call__(self):
        return self.t


def serve(jobs: Jobs):
    srv = ThreadingHTTPServer(("127.0.0.1", 0), make_handler(jobs))
    threading.Thread(target=srv.serve_forever, kwargs={"poll_interval": 0.02}, daemon=True).start()
    return srv


def post(srv, path, body=None, raw: bytes | None = None, headers: dict | None = None):
    c = http.client.HTTPConnection("127.0.0.1", srv.server_address[1], timeout=5)
    data = raw if raw is not None else json.dumps(body).encode()
    h = {"Content-Type": "application/json", "Content-Length": str(len(data)), **(headers or {})}
    c.request("POST", path, body=data, headers=h)
    r = c.getresponse()
    out = r.status, json.loads(r.read() or b"{}")
    c.close()
    return out


@pytest.fixture
def jobs(tmp_path):
    j = Jobs(offline_config(tmp_path), mock=True)
    j.guard = SpendGuard(max_jobs=3, hourly_usd=5.0)
    return j


@pytest.fixture
def server(jobs):
    srv = serve(jobs)
    yield srv
    srv.shutdown()
    srv.server_close()


# ---------------------------------------------------------------- spend caps
def test_at_most_three_jobs_run_at_once(server, jobs):
    for _ in range(3):
        assert post(server, "/jobs", {"fn": FN, "max_usd": 0.5})[0] == 200
    code, err = post(server, "/jobs", {"fn": FN, "max_usd": 0.5})
    assert code == 429 and "already running" in err["error"]
    deadline = time.time() + 5  # mock jobs finish in about 1.2 s and settle their reservations
    while jobs.guard.running() and time.time() < deadline:
        time.sleep(0.05)
    assert jobs.guard.running() == 0
    assert post(server, "/jobs", {"fn": FN, "max_usd": 0.5})[0] == 200


def test_hourly_spend_cap_holds_across_jobs(server, jobs):
    # each job reserves max_usd * 1.2 while it runs: 2.4 + 2.4 fits under $5, a third does not
    assert post(server, "/jobs", {"fn": FN, "max_usd": 2.0})[0] == 200
    assert post(server, "/jobs", {"fn": FN, "max_usd": 2.0})[0] == 200
    code, err = post(server, "/jobs", {"fn": FN, "max_usd": 2.0})
    assert code == 429 and "hourly spend cap" in err["error"]


def test_one_job_cannot_reserve_more_than_the_cap(server):
    code, err = post(server, "/jobs", {"fn": FN, "max_usd": 5.0})  # 5.0 * 1.2 = $6 > $5
    assert code == 429 and "hourly spend cap" in err["error"]


def test_spend_ledger_rolls_over_after_an_hour_and_settles_to_real_cost():
    clock = Clock()
    g = SpendGuard(max_jobs=3, hourly_usd=5.0, clock=clock)
    g.reserve("j_1", 3.0)
    with pytest.raises(SpendCapError):
        g.reserve("j_2", 2.5)
    g.settle("j_1", 0.4)  # the job really cost $0.40
    g.reserve("j_2", 2.5)
    assert g.spent() == pytest.approx(2.9)
    g.settle("j_2", 2.5)
    g.reserve("j_3", 2.0)
    clock.t += 3601  # settled entries leave the window; the still-running j_3 keeps counting
    assert g.spent() == pytest.approx(2.0)
    g.reserve("j_4", 2.9)
    with pytest.raises(SpendCapError):
        g.reserve("j_5", 0.2)


def test_a_crashed_job_keeps_its_reservation():
    g = SpendGuard(max_jobs=3, hourly_usd=5.0, clock=Clock())
    g.reserve("j_1", 1.8)
    g.settle("j_1", None)
    assert g.spent() == pytest.approx(1.8) and g.running() == 0


def test_routes_are_charged_to_the_same_cap(tmp_path, monkeypatch):
    from crew import snap

    def fake_route(cfg, target, query, k=5):  # what a real Snap route records: input tokens under op "route"
        b = snap.STATS["by_op"].setdefault("route", {"calls": 0, "latency_ms_total": 0.0, "input_tokens": 0})
        b["input_tokens"] += 1_000_000
        return {"query": query, "fns": [FN], "p": {FN: 0.9}, "inferred": True, "basis": "test"}

    monkeypatch.setitem(snap.STATS, "by_op", {})  # restored after the test
    monkeypatch.setattr(snap, "route", fake_route)
    jobs = Jobs(offline_config(tmp_path), mock=False)
    jobs.guard = SpendGuard(max_jobs=3, hourly_usd=5.0)
    jobs._target = object()
    srv = serve(jobs)
    try:
        assert post(srv, "/route", {"query": "the shotgun"})[0] == 200
        assert jobs.guard.spent() == pytest.approx(1_000_000 * snap.SNAP_PRICE_IN)  # settled to measured cost
        jobs.guard.reserve("big", 4.9, job=False)
        code, err = post(srv, "/route", {"query": "bring back Doomguy's face"})
        assert code == 429 and "hourly spend cap" in err["error"]
    finally:
        srv.shutdown()
        srv.server_close()


@pytest.mark.parametrize("max_usd", [float("nan"), float("inf"), True, "1.5", None])
def test_max_usd_must_be_a_finite_number(server, max_usd):
    raw = json.dumps({"fn": FN, "max_usd": max_usd}).encode()  # json.dumps writes NaN and Infinity
    assert post(server, "/jobs", raw=raw)[0] == 400


# ---------------------------------------------------------------- query
def test_query_length_is_capped(server):
    code, r = post(server, "/route", {"query": "a" * (MAX_QUERY + 50)})  # a long chat message: first 200 kept
    assert code == 200 and r["query"] == "a" * MAX_QUERY
    code, err = post(server, "/route", {"query": "a" * (MAX_QUERY_IN + 1)})
    assert code == 400 and "longer than" in err["error"]
    assert post(server, "/jobs", {"query": "b" * (MAX_QUERY_IN + 1)})[0] == 400


def test_query_control_characters_are_stripped():
    assert clean_query("the\x00 face\r\n\x1b[31m  please‮") == "the face [31m please"
    with pytest.raises(ValueError):
        clean_query(["not", "a", "string"])


@pytest.mark.parametrize("k", ["5", 2.5, True, None])
def test_route_k_must_be_an_integer(server, k):
    assert post(server, "/route", {"query": "the shotgun", "k": k})[0] == 400


# ---------------------------------------------------------------- bodies
def test_oversized_body_is_rejected_before_reading(server):
    code, err = post(server, "/jobs", raw=b"{}", headers={"Content-Length": str(MAX_BODY + 1)})
    assert code == 413 and err == {"error": "body too large"}


@pytest.mark.parametrize("length", ["-1", "lots"])
def test_bad_content_length_is_400(server, length):
    assert post(server, "/jobs", raw=b"{}", headers={"Content-Length": length})[0] == 400


def test_non_utf8_body_is_400(server):
    assert post(server, "/jobs", raw=b"\xff\xfe{")[0] == 400


# ---------------------------------------------------------------- paths
@pytest.mark.parametrize("run_id", ["../lab", "..", "a/b", "/etc", ".hidden", "x" * 65, "doom..r01"])
def test_export_rejects_run_ids_that_leave_runs(run_id, tmp_path):
    with pytest.raises(SystemExit, match="bad run id"):
        export.export(run_id, offline_config(tmp_path))


def test_rebuild_recovered_dir_is_confined_to_runs_or_exports():
    from lab.referee.__main__ import confined_recovered_dir

    assert confined_recovered_dir("crew/exports/doom_r01/recovered").endswith("crew/exports/doom_r01/recovered")
    for bad in ("lab/secrets", "../../etc", "/etc", "runs/../lab/secrets", 7):
        with pytest.raises(ValueError):
            confined_recovered_dir(bad)


# ---------------------------------------------------------------- director heartbeat
def _hb(**d) -> bytes:
    return json.dumps(d).encode()


def test_heartbeat_accepts_a_real_shape_and_dedupes():
    png = PNG_MAGIC + b"\x00" * 32
    running, frame = parse_heartbeat(_hb(running=[FN, FN, "fn_0801B298"], frame_png_b64=base64.b64encode(png).decode()))
    assert running == [FN, "fn_0801B298"] and frame == png


@pytest.mark.parametrize("body", [
    _hb(running=["fn_%08X" % i for i in range(MAX_RUNNING + 1)]),          # running list too long
    _hb(running="fn_08000A1C"),                                             # not a list
    _hb(running=[1, 2]),                                                    # not strings
    _hb(running=[], frame_png_b64=base64.b64encode(b"GIF89a....").decode()),  # not a PNG
    _hb(running=[], frame_png_b64="!!not base64!!"),
    _hb(running=[], frame_png_b64="A" * ((MAX_FRAME_BYTES + 2) // 3 * 4 + 4)),  # frame too large
    b"[1, 2]",
    b"x" * (MAX_HEARTBEAT_BYTES + 1),
])
def test_heartbeat_rejects_bad_or_oversized_bodies(body):
    with pytest.raises(ValueError):
        parse_heartbeat(body)


# ---------------------------------------------------------------- untrusted C (the referee lint)
@pytest.mark.parametrize("src", [
    '#include "/work/.env"',
    '%:include "/work/.env"',                       # digraph for #
    '#\\\ninclude "/work/.env"',                    # backslash-newline splice
    '#inc\\\nlude "/work/.env"',
    'char *a = "/*";\n#include "/work/.env"\nchar *b = "*/";',  # a comment opener inside a string
    '#/**/include "/work/.env"',
    '#if __has_include("/work/.env")\n#endif',
    '#embed </work/.env>',
    '#include <../../work/.env>',
    '#define H "/work/.env"\n#include H',
    '_Pragma("GCC optimize(0)")',
])
def test_referee_lint_rejects_include_bypasses(src):
    from lab.referee.lint import lint

    assert not lint(src + f"\nint {FN}(void){{return 1;}}", 50)["ok"]


def test_referee_lint_allows_system_headers():
    from lab.referee.lint import lint

    assert lint(f"#include <stdint.h>\n#include <string.h> // memcpy\nint {FN}(void){{return 1;}}", 50)["ok"]
