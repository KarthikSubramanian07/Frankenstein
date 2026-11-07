"""Checker tests: verdict cache, fresh claim verification, fakematch review and the Snap gate."""
from __future__ import annotations

import pytest

from crew.checker import Checker
from crew.events import EventLog

from .fakes import ScriptedReferee, read_events, schema_errors

FN = "fn_08000214"
PLAIN = f"int {FN}(int a, int b)\n{{\n    if (a < 0)\n        return 0;\n    return (a * b) >> 16;\n}}"


@pytest.fixture
def rig(tmp_path):
    ref = ScriptedReferee(default="MATCH")
    log = EventLog(tmp_path, "t01")
    yield ref, log, Checker(ref, log)
    log.close()
    assert schema_errors(log.path) == []


def test_verdict_cache(rig):
    ref, log, ch = rig
    a = ch.judge(FN, 1, PLAIN)
    b = ch.judge(FN, 2, PLAIN)
    assert a == b and len(ref.checks) == 1
    v = [e["payload"] for e in read_events(log.path) if e["type"] == "verdict"]
    assert [x["cached"] for x in v] == [False, True] and [x["attempt"] for x in v] == [1, 2]
    assert all(x["claim_was_true"] is None for x in v)
    ch.judge(FN, 3, PLAIN + "\n")  # different bytes, different key
    ch.judge("fn_08000230", 4, PLAIN)  # same source, different function
    assert len(ref.checks) == 3


def test_verify_claim_always_calls_referee(rig):
    ref, log, ch = rig
    ch.judge(FN, 1, PLAIN)
    ch.verify_claim(FN, 1, PLAIN)
    ch.verify_claim(FN, 1, PLAIN)
    assert len(ref.checks) == 3 and ch.false_claims == 0


def test_verify_claim_counts_false_claims(rig):
    ref, log, ch = rig
    ref.seq = ["PARTIAL", "LINT_FAIL", "MATCH"]
    assert ch.verify_claim(FN, 1, "a")["status"] == "PARTIAL"
    assert ch.verify_claim(FN, 2, "b")["status"] == "LINT_FAIL"
    ch.verify_claim(FN, 3, "c")
    assert ch.false_claims == 2
    v = [e["payload"]["claim_was_true"] for e in read_events(log.path) if e["type"] == "verdict"]
    assert v == [False, False, True]


def test_lint_failure_on_match_is_still_a_false_claim(rig):
    ref, log, ch = rig
    ref.check = lambda fn, src: {"status": "MATCH", "match_pct": 100.0, "lint": {"ok": False}, "first_diff": None}
    ch.verify_claim(FN, 1, PLAIN)
    assert ch.false_claims == 1


@pytest.mark.parametrize("src,ctx,reason", [
    (f"int {FN}(int a)\n{{\n    volatile int t = a;\n    return t;\n}}", "", "volatile"),
    (f"void {FN}(void)\n{{\n    *(u32 *)0x03001234 = 1;\n}}", "", "absolute address"),
    (f"int {FN}(int a)\n{{\n a: goto b;\n b: goto c;\n c: goto a;\n}}", "", "gotos"),
    (f"int {FN}(int a)\n{{\n" + "    a = a;\n" * 20 + "    return a;\n}", "", "padded"),
    (f"int {FN}(int a)\n{{\n    return (int)(u32)(s16)(u8)a;\n}}", "", "cast chains"),
])
def test_review_rejects(rig, src, ctx, reason):
    _, _, ch = rig
    ok, why, _ = ch.review(FN, "", src, ctx, n_instructions=1)
    assert not ok and reason in why and ch.fakematches_rejected == 1


@pytest.mark.parametrize("src,ctx", [
    (PLAIN, ""),
    (f"int {FN}(int a)\n{{\n    volatile int t = a;\n    return t;\n}}", "extern volatile u16 data_04000130;"),
    (f"int {FN}(int a)\n{{\n    if (a) goto out;\n    a = 1;\nout:\n    return a;\n}}", ""),
    (f"int {FN}(int a)\n{{\n    return (s16)(u8)a;\n}}", ""),
    (f"extern u32 data_03001234;\nvoid {FN}(void)\n{{\n    data_03001234 = 0x03001234;\n}}", ""),
    # GBA MMIO at 0x0400… is hardware, not a missing data_ id; volatile on those lines is normal
    (f"void {FN}(void)\n{{\n    unsigned short s = *(unsigned short *)0x04000208;\n    *(unsigned short *)0x04000208 = 0;\n    *(unsigned short *)0x04000208 = s;\n}}", ""),
    (f"void {FN}(void)\n{{\n    *(volatile unsigned short *)0x04000208 = 0;\n}}", ""),
])
def test_review_accepts_plain_code(rig, src, ctx):
    _, _, ch = rig
    ok, why, ev = ch.review(FN, "", src, ctx, n_instructions=10)
    assert ok and why == "accepted" and ev == {} and ch.fakematches_rejected == 0


def _snap(**r):
    calls = []

    def review(asm, src, ctx):
        calls.append((asm, src, ctx))
        return {"fakematch_p": 0.1, "recital_p": 0.1, "period_plausible_p": 0.9, **r}
    review.calls = calls
    return review


def test_snap_gate_rejects_at_threshold(tmp_path):
    for p, accepted in ((0.84, True), (0.85, False), (0.97, False)):
        ch = Checker(ScriptedReferee(), EventLog(tmp_path / str(p), "t"), snap_review=_snap(fakematch_p=p))
        ok, why, ev = ch.review(FN, "asm", PLAIN, "ctx", 10)
        assert ok is accepted, p
        assert ev["snap"]["fakematch_p"] == p and ch.snap_reviews == 1
        if not accepted:
            assert why.startswith("SubQ Snap: fakematch probability") and ch.fakematches_rejected == 1


def test_snap_gate_rejects_recital(tmp_path):
    ch = Checker(ScriptedReferee(), EventLog(tmp_path, "t"), snap_review=_snap(recital_p=0.9))
    ok, why, _ = ch.review(FN, "asm", PLAIN, "", 10)
    assert not ok and "recites public source" in why


def test_snap_gate_custom_threshold(tmp_path):
    ch = Checker(ScriptedReferee(), EventLog(tmp_path, "t"), snap_review=_snap(fakematch_p=0.6), snap_threshold=0.5)
    assert ch.review(FN, "asm", PLAIN, "", 10)[0] is False


def test_snap_gate_is_advisory_on_errors(tmp_path):
    def broken(asm, src, ctx):
        raise TimeoutError("SubQ took too long")

    ch = Checker(ScriptedReferee(), EventLog(tmp_path, "t"), snap_review=broken)
    ok, why, ev = ch.review(FN, "asm", PLAIN, "", 10)
    assert ok and why == "accepted" and "SubQ took too long" in ev["snap_error"] and ch.snap_reviews == 0


def test_hard_rules_run_before_snap(tmp_path):
    snap = _snap()
    ch = Checker(ScriptedReferee(), EventLog(tmp_path, "t"), snap_review=snap)
    ok, _, _ = ch.review(FN, "", f"int {FN}(void)\n{{\n    volatile int x;\n    return x;\n}}", "", 10)
    assert not ok and snap.calls == []  # no paid call for something the hard rules already caught
