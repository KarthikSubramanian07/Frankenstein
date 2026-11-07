"""Two-lab review: SubQ Snap and Gemini judge every MATCH in parallel; rules for when they reject."""
from crew.checker import Checker


class Log:
    def __init__(self):
        self.events = []

    def emit(self, t, a, fn=None, **p):
        self.events.append((t, p))


def mk(snap=None, gem=None):
    return Checker(referee=None, log=Log(),
                   snap_review=(lambda a, s, c: snap) if snap is not None else None,
                   second_review=(lambda a, s: gem) if gem is not None else None)


SRC = "int fn_08000200(int a) { return a + 1; }"


def test_both_clean_accepts_and_records_evidence():
    ok, why, ev = mk({"fakematch_p": 0.01, "recital_p": 0.0}, {"fakematch_p": 0.0, "recital_p": 0.0}).review(
        "fn_08000200", "adds r0,#1\nbx lr", SRC, "", 2)
    assert ok and "snap" in ev and "gemini" in ev


def test_gemini_alone_must_be_near_certain():
    c = mk({"fakematch_p": 0.1, "recital_p": 0.0}, {"fakematch_p": 0.9, "recital_p": 0.0})
    assert c.review("f", "", SRC, "", 2)[0]
    c = mk({"fakematch_p": 0.1, "recital_p": 0.0}, {"fakematch_p": 0.97, "recital_p": 0.0})
    assert not c.review("f", "", SRC, "", 2)[0] and c.fakematches_rejected == 1


def test_two_labs_agreeing_reject():
    ok, why, _ = mk({"fakematch_p": 0.6, "recital_p": 0.0}, {"fakematch_p": 0.75}).review("f", "", SRC, "", 2)
    assert not ok and "Gemini" in why


def test_recital_needs_agreement_or_certainty():
    assert not mk({"fakematch_p": 0, "recital_p": 0.55}, {"recital_p": 0.8}).review("f", "", SRC, "", 2)[0]
    assert mk({"fakematch_p": 0, "recital_p": 0.2}, {"recital_p": 0.8}).review("f", "", SRC, "", 2)[0]


def test_reviewer_errors_are_advisory():
    def boom(*a):
        raise RuntimeError("down")
    c = Checker(None, Log(), snap_review=boom, second_review=boom)
    ok, _, ev = c.review("f", "", SRC, "", 2)
    assert ok and "snap_error" in ev and "gemini_error" in ev


def test_idioms_are_adopted_or_retired_on_evidence(tmp_path):
    from crew.config import Config
    from crew.library import Library
    lib = Library(Config(), mode="learning", path=tmp_path / "lib.json")
    good = lib.add({"title": "count down loops", "applies_when": "subs then bne", "do": "for (i=n;i;i--)"}, "x", "f1")
    bad = lib.add({"title": "short locals sign extend", "applies_when": "lsls 16 asrs 16", "do": "use short"}, "y", "f2")
    for _ in range(4):
        lib.record_outcome([], True, 1)             # baseline: quick matches
    ch = []
    for _ in range(3):
        ch += lib.record_outcome([good["idiom_id"]], True, 1)
    for _ in range(4):
        ch += lib.record_outcome([bad["idiom_id"]], False, 6)
    st = {c["idiom_id"]: c["status"] for c in ch}
    assert st[good["idiom_id"]] == "adopted" and st[bad["idiom_id"]] == "retired"
    assert all(h["idiom_id"] != bad["idiom_id"] for h in lib.search("lsls asrs short sign extend"))


def test_empty_model_turn_is_never_sent_back(tmp_path):
    """A model that burns its whole budget thinking returns no content and no tool calls; the Digger must nudge
    it instead of appending an empty assistant message (which the API rejects with HTTP 400)."""
    from crew.config import Config
    from crew.digger import Digger
    from crew.events import EventLog
    from crew.library import Library
    from crew.referee import MockReferee
    from crew.target import Target
    from crew.checker import Checker

    cfg = Config()
    t = Target(cfg, MockReferee())
    fn = next(iter(f["id"] for f in t.game_functions()))
    seen = []

    class LLMStub:
        def __init__(self):
            self.cfg = cfg
            self.n = 0

        def chat(self, messages, **k):
            seen.append([m for m in messages if m["role"] == "assistant" and not m.get("content") and not m.get("tool_calls")])
            self.n += 1
            if self.n == 1:
                return {"message": {"role": "assistant", "content": None}, "tin": 1, "tout": 1, "cost": 0.0, "model": cfg.model}
            return {"message": {"role": "assistant", "content": "done"}, "tin": 1, "tout": 1, "cost": 0.0, "model": cfg.model}

    log = EventLog(tmp_path, "t")
    d = Digger("digger-1", LLMStub(), t, Checker(MockReferee(), log), Library(cfg, mode="off", path=tmp_path / "l.json"), log)
    d.dig(fn)
    assert all(not s for s in seen)


def test_claim_first_counts_real_lies_and_accepts_true_claims(tmp_path):
    from crew.config import Config
    from crew.digger import Digger
    from crew.events import EventLog
    from crew.library import Library
    from crew.target import Target
    from crew.checker import Checker
    import json as _j

    class Ref:
        kind = "stub"

        def __init__(self):
            self.n = 0

        def check(self, fn, src):
            self.n += 1
            ok = "good" in src
            return {"status": "MATCH" if ok else "PARTIAL", "match_pct": 100.0 if ok else 80.0,
                    "first_diff": None if ok else {"offset": 4, "expected": "1c08", "got": "1c10",
                                                    "expected_ins": "adds r0, r1, #0", "got_ins": "adds r0, r2, #0"},
                    "diff": [], "lint": {"ok": True, "violations": []}, "compile": {"ok": True, "log": ""}}

    cfg = Config()
    ref = Ref()
    t = Target(cfg, ref)
    fn = next(f["id"] for f in t.game_functions())
    srcs = ["int bad(void){return 1;}", "int good(void){return 0;}"]

    class LLMStub:
        cfg = Config()

        def __init__(self):
            self.i = 0

        def chat(self, messages, **k):
            src = srcs[min(self.i, 1)]
            self.i += 1
            return {"message": {"role": "assistant", "content": None, "tool_calls": [{"id": f"c{self.i}", "type": "function",
                    "function": {"name": "referee_check", "arguments": _j.dumps({"src": src, "claim": True})}}]},
                    "tin": 1, "tout": 1, "cost": 0.0, "model": cfg.model}

    log = EventLog(tmp_path, "t")
    chk = Checker(ref, log)
    out = Digger("digger-1", LLMStub(), t, chk, Library(cfg, mode="off", path=tmp_path / "l.json"), log).dig(fn)
    assert out.status == "matched" and out.false_claims == 1 and chk.false_claims == 1
    evs = [_j.loads(l) for l in (tmp_path / "events.jsonl").read_text().splitlines()]
    verdicts = [e["payload"]["claim_was_true"] for e in evs if e["type"] == "verdict"]
    assert verdicts == [False, True]
