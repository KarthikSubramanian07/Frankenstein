"""Archivist tests: line length, rate limit, milestones, grounded false-claim lines."""
from __future__ import annotations

import pytest

from crew import archivist as arch
from crew.archivist import ANNOUNCE, TICKER, Archivist


class Log:
    def __init__(self):
        self.lines = []

    def emit(self, type_, actor, fn=None, **payload):
        assert type_ == "narration" and actor == "archivist"
        self.lines.append(payload)


class Clock:
    def __init__(self, t=1000.0):
        self.t = t

    def __call__(self):
        return self.t


@pytest.fixture
def clock(monkeypatch):
    c = Clock()
    monkeypatch.setattr(arch.time, "time", c)
    return c


def ev(type_, fn="fn_08000214", actor="checker", **p):
    return {"type": type_, "fn": fn, "actor": actor, "payload": p}


def test_lines_never_exceed_90_chars(clock):
    log = Log()
    a = Archivist(log, min_gap_s=0)
    a.say("x" * 300, force=True)
    long_fn = "fn_" + "F" * 120
    for t in ("fn.matched", "fn.abandoned", "idiom.learned"):
        for _ in range(20):
            clock.t += 1
            a.on_event(ev(t, fn=long_fn, attempts=3, best_pct=99.9, title="t" * 300))
    a.on_event(ev("claim.made", fn=long_fn, actor="digger-12345678901234567890", attempt=1))
    a.on_event(ev("verdict", fn=long_fn, attempt=1, claim_was_true=False, first_diff={"offset": 10 ** 40}))
    assert log.lines and all(len(l["text"]) <= 90 for l in log.lines)


def test_templates_fit_with_realistic_values():
    for key, lines in TICKER.items():
        for tpl in lines:
            s = tpl.format(off=1234, digger="digger-12", fn="fn_08000A1C", attempts=12, pct=99.9, title="t" * 50)
            assert len(s) <= 90, (key, s)
    assert all(len(s.split()) <= 4 for s in ANNOUNCE.values())


def test_rate_limit(clock):
    log = Log()
    a = Archivist(log, min_gap_s=8)
    a.say("one")
    a.say("two")
    clock.t += 7.9
    a.say("three")
    assert [l["text"] for l in log.lines] == ["one"]
    clock.t += 0.2
    a.say("four")
    a.say("forced", force=True)
    assert [l["text"] for l in log.lines] == ["one", "four", "forced"]


def test_milestones_once_each(clock):
    log = Log()
    a = Archivist(log)
    a.milestone(1, 8)
    assert log.lines == []
    a.milestone(2, 8)
    a.milestone(3, 8)
    assert [l["text"] for l in log.lines] == ["Quarter recovered!"]
    a.milestone(8, 8)
    a.milestone(8, 8)
    texts = [l["text"] for l in log.lines]
    assert texts == ["Quarter recovered!", "Halfway recovered!", "Three quarters!", "Fully recovered!"]
    assert all(l["speak"] is True and l["priority"] == 3 and l["mood"] == "proud" for l in log.lines)


def test_false_claim_names_the_digger_and_offset(clock):
    log = Log()
    a = Archivist(log, seed=1)
    a.on_event(ev("claim.made", actor="digger-3", attempt=4))
    a.on_event(ev("verdict", attempt=4, claim_was_true=False, first_diff={"offset": 18}))
    assert log.lines[0] == {"text": "Claim rejected!", "mood": "alarmed", "speak": True, "priority": 3}
    second = log.lines[1]["text"]
    assert second in [t.format(off=18, digger="digger-3") for t in TICKER["false_claim"]]
    assert log.lines[1]["priority"] == 2


def test_ignores_own_narration_and_true_claims(clock):
    log = Log()
    a = Archivist(log, min_gap_s=0)
    a.on_event(ev("narration", actor="archivist", text="hi"))
    a.on_event(ev("verdict", attempt=1, claim_was_true=True, status="MATCH"))
    a.on_event(ev("verdict", attempt=1, claim_was_true=None, status="PARTIAL"))
    assert log.lines == []
