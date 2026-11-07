"""SubQ Snap client tests. HTTP is monkeypatched; the live test runs only with LIVE=1."""
from __future__ import annotations

import io
import json
import os
import urllib.error

import pytest

from crew import snap
from crew.config import Config
from crew.target import Target

FIXTURE = "contracts/fixtures/manifest.sample.json"


@pytest.fixture
def target(monkeypatch):
    monkeypatch.setenv("FRANK_MANIFEST", FIXTURE)
    return Target(Config())


@pytest.fixture
def cfg():
    c = Config()
    c.subq_key = c.subq_key or "test-key"
    return c


class Resp:
    def __init__(self, body): self.body = body
    def __enter__(self): return self
    def __exit__(self, *a): return False
    def read(self): return json.dumps(self.body).encode()


def fake_api(calls):
    """Answer every question with a plausible typed answer, like the documented response shape."""
    def urlopen(req, timeout=None):
        body = json.loads(req.data)
        calls.append(body)
        ans = {}
        for name, q in body["questions"].items():
            if q["type"] == "noul":
                ans[name] = {"type": "noul", "noul": 0.9 if name == "fakematch" else 0.2}
            elif q["type"] == "choice":
                ans[name] = {"type": "choice", "choice": "loop", "confidence": 0.7,
                             "probabilities": {k: 0 for k in q["criteria"]}}
            else:
                n = len(q["criteria"])
                ans[name] = {"type": "score", "score": 2.0, "legend": {str(i): c for i, c in enumerate(q["criteria"])},
                             "probabilities": {str(i): 1 / n for i in range(n)}, "confidence": 0.6}
        return Resp({"model": body["model"], "answers": ans, "usage": {"input_tokens": 1000, "output_tokens": 0}})
    return urlopen


def test_triage_batches_and_parses(target, cfg, monkeypatch):
    snap.reset_stats()
    calls = []
    monkeypatch.setattr(snap.urllib.request, "urlopen", fake_api(calls))
    fns = [f["id"] for f in target.game_functions()]
    out = snap.triage(cfg, target, fns=fns)
    assert len(calls) == -(-len(fns) // 64)  # 2 questions per function, <=128 per request
    assert all(1 <= len(c["questions"]) <= 128 for c in calls)
    assert all(c["state"] == calls[0]["state"] for c in calls)  # same whole-program state
    assert set(out) == set(fns)
    r = out[fns[0]]
    assert r == {"difficulty": 0.5, "confidence": 0.6, "score": 2.0, "kind": "loop", "kind_confidence": 0.7}
    assert snap.STATS["snap_calls"] == len(calls) and snap.STATS["by_op"]["triage"]["calls"] == len(calls)
    assert snap.STATS["input_tokens"] == 1000 * len(calls) and snap.STATS["latency_ms_mean"] >= 0


def test_whole_program_state_trims_to_budget(target):
    full, s1 = snap.whole_program_state(target)
    assert not s1["trimmed"] and all(f"### {f['id']}" in full for f in target.game_functions())
    budget = int(s1["tokens_est"] * 0.92)
    small, s2 = snap.whole_program_state(target, budget_tokens=budget)
    assert s2["trimmed"] and s2["line_cap"] and not s2["over_budget"]
    assert s2["chars"] <= budget * snap.CHARS_PER_TOKEN
    assert all(f"### {f['id']}" in small for f in target.game_functions())  # every function still present


def test_review_shape(cfg, monkeypatch):
    snap.reset_stats()
    calls = []
    monkeypatch.setattr(snap.urllib.request, "urlopen", fake_api(calls))
    r = snap.review(cfg, "push {lr}\npop {pc}", "void fn_08000000(void) {}", ctx="/* ctx */")
    assert set(calls[0]["questions"]) == {"fakematch", "recital", "period_plausible"}
    assert calls[0]["state"]["context_header"] == "/* ctx */"
    assert r["fakematch_p"] == 0.9 and r["recital_p"] == 0.2 and r["period_plausible_p"] == 0.2
    assert r["confidence"] == {"fakematch": 0.8, "recital": 0.6, "period_plausible": 0.6}
    assert snap.STATS["by_op"]["review"]["calls"] == 1


def test_retry_then_error(cfg, monkeypatch):
    snap.reset_stats()
    monkeypatch.setattr(snap.time, "sleep", lambda s: None)
    n = {"c": 0}

    def flaky(req, timeout=None):
        n["c"] += 1
        if n["c"] == 1:
            raise urllib.error.HTTPError("u", 429, "slow down", {}, io.BytesIO(b'{"detail":{"error_type":"rate_limit","message":"x"}}'))
        return Resp({"model": "subq-snap-1.1", "answers": {"q": {"type": "noul", "noul": 0.5}}, "usage": {}})
    monkeypatch.setattr(snap.urllib.request, "urlopen", flaky)
    d = snap.decide(cfg, "s", {"q": {"type": "noul", "instructions": "?"}})
    assert d["answers"]["q"]["noul"] == 0.5 and n["c"] == 2 and snap.STATS["errors"] == 1

    def forbidden(req, timeout=None):
        raise urllib.error.HTTPError("u", 403, "no", {}, io.BytesIO(b'{"detail":{"error_type":"model_not_allowed","message":"nope"}}'))
    monkeypatch.setattr(snap.urllib.request, "urlopen", forbidden)
    with pytest.raises(snap.SnapError, match="model_not_allowed"):
        snap.decide(cfg, "s", {"q": {"type": "noul", "instructions": "?"}})


def test_question_limit(cfg):
    with pytest.raises(snap.SnapError, match="1 to 128"):
        snap.decide(cfg, "s", {f"q{i}": {"type": "noul", "instructions": "?"} for i in range(129)})


@pytest.mark.live
@pytest.mark.skipif(os.environ.get("LIVE") != "1", reason="set LIVE=1 to call the real Snap API")
def test_live_review_and_triage(target):
    c = Config()
    if not c.subq_key:
        pytest.skip("SUBQ_API_KEY not set")
    r = snap.review(c, " push\t{r4, lr}\n adds\tr0, r0, r1\n pop\t{r4}\n pop\t{r1}\n bx\tr1",
                    "int32_t fn_08000444(int32_t a, int32_t b) { return a + b; }")
    assert 0 <= r["fakematch_p"] <= 1 and 0 <= r["recital_p"] <= 1 and 0 <= r["period_plausible_p"] <= 1
    fns = [f["id"] for f in target.manifest["functions"][:10]]
    out = snap.triage(c, target, fns=fns)
    assert set(out) == set(fns) and all(0 <= v["difficulty"] <= 1 for v in out.values())


def test_decide_next_parses_and_tracks(cfg, monkeypatch):
    snap.reset_stats()
    calls = []

    def urlopen(req, timeout=None):
        body = json.loads(req.data)
        calls.append((body, timeout))
        return Resp({"model": "subq-snap-1.1", "usage": {"input_tokens": 500, "output_tokens": 0}, "answers": {
            "next_action": {"type": "choice", "choice": "escalate", "confidence": 0.72,
                            "probabilities": {"keep": 0.2, "escalate": 0.7, "abandon": 0.1}},
            "match_soon": {"type": "noul", "noul": 0.35}}})
    monkeypatch.setattr(snap.urllib.request, "urlopen", urlopen)
    hist = [(1, "PARTIAL", 81.0, "lsls r3, r3, #8", "lsls r2, r3, #8"), (2, "PARTIAL", 81.0, "lsls r3, r3, #8", "movs r2, r3")]
    r = snap.decide_next(cfg, "fn_08000444", "push {lr}", hist)
    assert r["action"] == "escalate" and r["confidence"] == 0.72 and r["p_match_within_budget"] == 0.35
    assert r["probs"]["escalate"] == 0.7 and "error" not in r
    body, timeout = calls[0]
    assert timeout == 8 and set(body["questions"]) == {"next_action", "match_soon"}
    assert body["state"]["history"][1] == {"attempt": 2, "status": "PARTIAL", "match_pct": 81.0,
                                           "expected_ins": "lsls r3, r3, #8", "got_ins": "movs r2, r3"}
    assert snap.STATS["by_op"]["decide_next"]["calls"] == 1


def test_decide_next_never_raises(cfg, monkeypatch):
    monkeypatch.setattr(snap.time, "sleep", lambda s: None)

    def down(req, timeout=None):
        raise urllib.error.URLError("timed out")
    monkeypatch.setattr(snap.urllib.request, "urlopen", down)
    r = snap.decide_next(cfg, "fn_08000444", "x", [(1, "NO_COMPILE", 0.0, None, None)])
    assert r["action"] == "keep" and r["confidence"] == 0 and "timed out" in r["error"]
    c = Config()
    c.subq_key = ""
    assert snap.decide_next(c, "fn_08000444", "x", [])["error"].startswith("SnapError: SubQ key missing")
