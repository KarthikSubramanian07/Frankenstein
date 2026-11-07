"""Digger loop tests: scripted model, scripted referee, real Checker/EventLog/Target on the fixture manifest."""
from __future__ import annotations

import io
import urllib.error

import pytest

from crew import snap
from crew.checker import Checker
from crew.digger import Digger, attempt_budget
from crew.events import EventLog
from crew.library import Library
from crew.target import Target

from .fakes import (BASE_MODEL, ESC_MODEL, FakeLLM, ScriptedReferee, check, claim, offline_config, prose,
                    read_events, schema_errors)

GOOD = "int {fn}(int a, int b)\n{{\n    return a + b;\n}}"
BETTER = "int {fn}(int a, int b)\n{{\n    return b + a;\n}}"


class Rig:
    """One Digger on the first fixture game function. `build(fn) -> [assistant messages]` scripts the model."""

    def __init__(self, tmp_path, build, referee=None, *, fn_difficulty=None, **digger_kw):
        self.cfg = offline_config(tmp_path)
        self.referee = referee or ScriptedReferee()
        self.target = Target(self.cfg, self.referee)
        games = sorted(self.target.game_functions(), key=lambda f: f["id"])
        self.fn = games[0]["id"]
        if fn_difficulty is not None:
            self.target.fns[self.fn] = {**self.target.fns[self.fn], "difficulty": fn_difficulty}
        self.budget = attempt_budget(self.target.fns[self.fn]["difficulty"])
        self.log = EventLog(tmp_path / "run", "t01")
        self.checker = Checker(self.referee, self.log)
        self.library = Library(self.cfg, mode="off", path=tmp_path / "lib.json")
        self.llm = FakeLLM(self.cfg, script=build(self.fn), fail_models=digger_kw.pop("fail_models", ()))
        self.digger = Digger("digger-1", self.llm, self.target, self.checker, self.library, self.log, **digger_kw)

    def src(self, tpl):
        return tpl.format(fn=self.fn)

    def dig(self):
        out = self.digger.dig(self.fn)
        self.log.close()
        self.events = read_events(self.log.path)
        assert schema_errors(self.log.path) == []
        return out

    def types(self):
        return [e["type"] for e in self.events]

    def verdicts(self):
        return [e["payload"] for e in self.events if e["type"] == "verdict"]


def test_match_path_emits_contract_sequence(tmp_path):
    rig = Rig(tmp_path, lambda fn: [check(GOOD.format(fn=fn)), claim("Matched on the first try.")],
              ScriptedReferee(default="MATCH"))
    out = rig.dig()
    assert out.status == "matched" and out.attempts == 1 and out.src == rig.src(GOOD) and out.false_claims == 0
    assert rig.types() == ["fn.claimed", "attempt.submitted", "verdict", "claim.made", "verdict"]
    first, second = rig.verdicts()
    assert first["claim_was_true"] is None and first["cached"] is False and first["status"] == "MATCH"
    assert second["claim_was_true"] is True
    sub = rig.events[1]["payload"]
    assert sub["attempt"] == 1 and sub["model"] == BASE_MODEL and sub["src_preview"] == rig.src(GOOD)
    assert rig.events[3]["payload"]["text"] == "Matched on the first try."
    assert len(rig.referee.checks) == 2  # judge + an independent fresh re-check for the claim
    assert out.model_calls == {BASE_MODEL: 2}


def test_partial_then_match(tmp_path):
    rig = Rig(tmp_path, lambda fn: [check(GOOD.format(fn=fn)), check(BETTER.format(fn=fn)), claim()],
              ScriptedReferee(seq=["PARTIAL"], default="MATCH"))
    out = rig.dig()
    assert out.status == "matched" and out.attempts == 2 and out.src == rig.src(BETTER)
    assert [v["status"] for v in rig.verdicts()] == ["PARTIAL", "MATCH", "MATCH"]
    assert out.best_pct == 100.0 and [j[1] for j in out.journey] == ["PARTIAL", "MATCH"]
    # the tool result the model saw after the PARTIAL carries the first diff and remaining budget
    tool_reply = rig.llm.calls[1]["messages"][-1]
    assert tool_reply["role"] == "tool" and '"PARTIAL"' in tool_reply["content"]
    assert f'"attempts_left": {rig.budget - 1}' in tool_reply["content"]


def test_false_claim_after_partial_is_counted(tmp_path):
    rig = Rig(tmp_path, lambda fn: [check(GOOD.format(fn=fn)), claim("Trust me."), check(BETTER.format(fn=fn)), claim()],
              ScriptedReferee(default="PARTIAL"))
    rig.referee.by_src = {rig.src(BETTER): "MATCH"}
    out = rig.dig()
    assert out.status == "matched" and out.false_claims == 1 and rig.checker.false_claims == 1
    claims = [v["claim_was_true"] for v in rig.verdicts() if v["claim_was_true"] is not None]
    assert claims == [False, True]
    assert rig.types().count("claim.made") == 2
    rejected = rig.llm.calls[2]["messages"][-1]
    assert rejected["role"] == "tool" and "REJECTED" in rejected["content"]


def test_claim_before_any_attempt_is_refused(tmp_path):
    rig = Rig(tmp_path, lambda fn: [claim("Done already."), check(GOOD.format(fn=fn)), claim()],
              ScriptedReferee(default="MATCH"))
    out = rig.dig()
    assert out.status == "matched" and rig.types().count("claim.made") == 1
    assert "No attempt to claim yet" in rig.llm.calls[1]["messages"][-1]["content"]


def test_prose_code_block_is_salvaged(tmp_path):
    rig = Rig(tmp_path, lambda fn: [prose("Here is my answer:\n```c\n" + GOOD.format(fn=fn) + "\n```\nHope it helps."),
                                    claim()], ScriptedReferee(default="MATCH"))
    out = rig.dig()
    assert out.status == "matched" and out.attempts == 1 and out.src == rig.src(GOOD)
    assert rig.events[1]["type"] == "attempt.submitted" and rig.events[1]["payload"]["src_preview"] == rig.src(GOOD)
    convo = rig.llm.calls[1]["messages"]
    assert convo[-2]["role"] == "assistant" and "Here is my answer" in convo[-2]["content"]
    assert "tool_calls" not in convo[-2]  # the salvaged turn is replayed as plain content
    assert convo[-1]["role"] == "user" and convo[-1]["content"].startswith("referee_check result:")


def test_prose_without_code_gets_a_nudge(tmp_path):
    rig = Rig(tmp_path, lambda fn: [prose("Let me think."), check(GOOD.format(fn=fn)), claim()],
              ScriptedReferee(default="MATCH"))
    out = rig.dig()
    assert out.status == "matched" and out.attempts == 1
    assert rig.llm.calls[1]["messages"][-1] == {"role": "user", "content": "Call referee_check with your full C candidate."}


def _endless(fn):
    return [check(f"int {fn}(int a) {{ return a + {k}; }}") for k in range(50)]


def test_budget_exhaustion_abandons(tmp_path):
    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"))
    out = rig.dig()
    assert out.status == "abandoned" and out.attempts == rig.budget
    assert rig.types()[-1] == "fn.abandoned"
    assert rig.events[-1]["payload"] == {"attempts": rig.budget, "best_pct": 72.5}
    assert out.src is not None  # best candidate kept for the record
    # fixed fallback rule (Snap off): escalate after 3 failures
    assert rig.llm.models[:3] == [BASE_MODEL] * 3 and set(rig.llm.models[3:]) == {ESC_MODEL}


def test_forgotten_match_at_budget_end_is_auto_claimed(tmp_path):
    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"), fn_difficulty=0.0)
    assert rig.budget == 4
    rig.referee.by_src = {f"int {rig.fn}(int a) {{ return a + 3; }}": "MATCH"}
    out = rig.dig()
    assert out.status == "matched" and out.attempts == 4
    made = [e for e in rig.events if e["type"] == "claim.made"]
    assert len(made) == 1 and made[0]["payload"]["text"] == "(auto-submitted at budget end)"
    assert rig.verdicts()[-1]["claim_was_true"] is True


def test_per_function_max_usd_stops(tmp_path):
    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"), max_usd=1.0)
    rig.llm.cost = 0.4
    out = rig.dig()
    assert out.status == "abandoned" and out.attempts == 3 < rig.budget
    assert out.cost_usd == pytest.approx(1.2) and len(rig.llm.calls) == 3


def test_global_budget_gate_stops(tmp_path):
    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"), budget_ok=lambda: False)
    out = rig.dig()
    assert out.attempts == 0 and rig.llm.calls == [] and rig.types() == ["fn.claimed", "fn.abandoned"]


def _decisions(rig):
    return [e["payload"] for e in rig.events if e["type"] == "snap.decision"]


def test_snap_escalate_switches_model_next_call(tmp_path):
    seen = []

    def decide(fn, asm, hist):
        seen.append(list(hist))
        return {"action": "escalate", "confidence": 0.8, "probs": {"escalate": 0.8}, "latency_ms": 3}

    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"), snap_decide=decide)
    out = rig.dig()
    assert rig.llm.models[:2] == [BASE_MODEL, BASE_MODEL] and set(rig.llm.models[2:]) == {ESC_MODEL}
    assert out.attempts == rig.budget
    d = _decisions(rig)
    assert d[0]["op"] == "decide_next" and d[0]["action"] == "escalate" and d[0]["attempt"] == 2
    assert len(seen[0]) == 2 and all(isinstance(j[0], int) for j in seen[0])  # attempt history only


def test_snap_abandon_stops_early_after_three_failures(tmp_path):
    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"),
              snap_decide=lambda fn, asm, h: {"action": "abandon", "confidence": 0.7})
    assert rig.budget > 3
    out = rig.dig()
    assert out.status == "abandoned" and out.attempts == 3
    assert [d["action"] for d in _decisions(rig)] == ["abandon", "abandon"]  # asked after attempts 2 and 3
    assert set(rig.llm.models) == {BASE_MODEL}  # Snap on: the fixed escalation rule is off


def test_snap_abandon_with_low_confidence_keeps_going(tmp_path):
    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"),
              snap_decide=lambda fn, asm, h: {"action": "abandon", "confidence": 0.5})
    out = rig.dig()
    assert out.attempts == rig.budget


def test_snap_errors_fall_back_to_keep(tmp_path, monkeypatch):
    monkeypatch.setattr(snap.time, "sleep", lambda s: None)

    def down(req, timeout=None):
        raise urllib.error.HTTPError("u", 503, "unavailable", {}, io.BytesIO(b"{}"))

    monkeypatch.setattr(snap.urllib.request, "urlopen", down)
    cfg = offline_config(tmp_path)
    cfg.subq_key = "test-key"
    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"),
              snap_decide=lambda fn, asm, h: snap.decide_next(cfg, fn, asm, h))
    out = rig.dig()
    assert out.status == "abandoned" and out.attempts == rig.budget
    d = _decisions(rig)
    assert d and all(x["action"] == "keep" and x["error"] for x in d)
    assert set(rig.llm.models) == {BASE_MODEL}


def test_escalation_model_failure_falls_back_to_base(tmp_path):
    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"), fail_models={ESC_MODEL},
              snap_decide=lambda fn, asm, h: {"action": "escalate", "confidence": 0.9})
    out = rig.dig()
    assert out.status == "abandoned" and out.attempts == rig.budget  # not "failed"
    assert rig.llm.models[:3] == [BASE_MODEL, BASE_MODEL, ESC_MODEL]
    assert set(rig.llm.models[3:]) == {BASE_MODEL} and rig.llm.cfg.escalation_model == ""
    assert set(out.model_calls) == {BASE_MODEL}


def test_base_model_failure_fails_the_function(tmp_path):
    rig = Rig(tmp_path, _endless, ScriptedReferee(default="PARTIAL"), fail_models={BASE_MODEL})
    out = rig.dig()
    assert out.status == "failed" and out.attempts == 0 and len(rig.llm.calls) == 1
    assert out.journey[-1][0] == "error" and rig.types()[-1] == "fn.abandoned"


def test_fakematch_is_not_accepted(tmp_path):
    vol = "int {fn}(int a)\n{{\n    volatile int t = a;\n    return t;\n}}"
    rig = Rig(tmp_path, lambda fn: [check(vol.format(fn=fn)), claim()] + _endless(fn),
              ScriptedReferee(default="PARTIAL"), fn_difficulty=0.0)
    rig.referee.by_src = {rig.src(vol): "MATCH"}
    out = rig.dig()
    assert out.status != "matched" and rig.checker.fakematches_rejected >= 1
    assert any(j[1] == "FAKEMATCH" for j in out.journey)
    assert any(e["type"] == "narration" and e["payload"]["mood"] == "alarmed" for e in rig.events)
