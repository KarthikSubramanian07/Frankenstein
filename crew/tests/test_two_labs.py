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
