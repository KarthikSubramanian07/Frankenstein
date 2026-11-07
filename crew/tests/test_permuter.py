"""crew.permuter: passes keep C semantics (differential test with the host compiler), the search is driven by a
stub referee, it stops on MATCH, and it never spends checks on sources the Checker's rules would reject."""
from __future__ import annotations

import random
import shutil
import subprocess
from collections import Counter

import pytest

from crew import permuter as P

from .permuter_samples import CALLS, DRIVER, SAMPLES


def apply(name, src, fn, seed=0):
    env = P.Env(src)
    toks, tail = P.tokenize(src)
    out = P.PASSES[name][0](P.Func(toks, fn, env), random.Random(seed))
    return None if out is None else P.render(out, tail)


def norm(s):
    return " ".join(t.t for t in P.tokenize(s)[0])


def test_commute_keeps_parse_tree_with_parentheses():
    src = "int f(int a, int b, int c) { return a + b * c; }"
    outs = {norm(apply("commute", src, "f", s)) for s in range(20)}
    assert "int f ( int a , int b , int c ) { return b * c + a ; }" in outs or \
           "int f ( int a , int b , int c ) { return a + c * b ; }" in outs
    src2 = "int f(int a, int b, int c) { return a - b + c; }"
    out = norm(apply("commute", src2, "f"))
    assert out == "int f ( int a , int b , int c ) { return c + ( a - b ) ; }"


def test_mirror_comparison():
    assert norm(apply("commute", "int f(int a, int b) { return a < b; }", "f")) == \
        "int f ( int a , int b ) { return b > a ; }"


def test_reorder_respects_dataflow_and_memory():
    dep = "int f(int a) { int x = a + 1; int y = x * 2; return y; }"
    assert apply("reorder_stmts", dep, "f") is None  # y reads x
    two_stores = "int g; int h; void f(int *p, int *q) { *p = 1; *q = 2; }"
    assert apply("reorder_stmts", two_stores, "f") is None  # may alias
    local_vs_store = "void f(int *p, int a) { int x; *p = a; x = a + 1; p[1] = x; }"
    assert apply("reorder_stmts", local_vs_store, "f") is not None  # x = a + 1 touches only locals
    call = "int g(void); void f(int *p) { int a = g(); *p = 3; }"
    assert apply("reorder_stmts", call, "f") is None


def test_for_with_continue_is_not_rewritten():
    src = "int f(int n) { int i, s = 0; for (i = 0; i < n; i++) { if (i & 1) continue; s += i; } return s; }"
    for seed in range(10):
        out = apply("loops", src, "f", seed)
        assert out is None or "for" in out


def test_signedness_only_when_bits_cannot_differ():
    unsafe = "int f(int a) { int x = a + 1; return x < 3; }"
    assert apply("signedness", unsafe, "f") is None
    safe = "int f(int a, int *p) { int x = a + 1; p[0] = x; return x == 3; }"
    assert "unsigned int x" in apply("signedness", safe, "f")


def test_temp_for_expr_needs_a_known_type():
    known = "int f(int a, int b) { int x; x = a * b + 1; return x; }"
    assert "int tmp = a * b" in apply("temp_for_expr", known, "f")
    unknown = "struct S; int f(struct S *s) { int x; x = s->v + 1; return x; }"
    assert apply("temp_for_expr", unknown, "f") is None


cc = shutil.which("cc") or shutil.which("gcc")


@pytest.mark.skipif(cc is None, reason="no host C compiler")
@pytest.mark.parametrize("fn", sorted(SAMPLES))
def test_random_pass_chains_preserve_behaviour(fn, tmp_path):
    """Differential test: compile the original and 25 mutated versions with the host compiler, run all of
    them on 400 random inputs, and require identical output (return values and memory)."""
    def run(src):
        decl, call, ext = CALLS[fn]
        (tmp_path / "f.c").write_text(src)
        (tmp_path / "m.c").write_text(DRIVER % {"decl": decl + "\n" + ext, "call": call})
        p = subprocess.run([cc, "-O1", "-w", str(tmp_path / "f.c"), str(tmp_path / "m.c"), "-o", str(tmp_path / "a")],
                           capture_output=True, text=True)
        assert p.returncode == 0, p.stderr[:800] + "\n" + src
        return subprocess.run([str(tmp_path / "a")], capture_output=True, text=True, timeout=20).stdout

    src = SAMPLES[fn]
    ref = run(src)
    env = P.Env(src)
    toks, tail = P.tokenize(src)
    rng = random.Random(hash(fn) & 0xFFFF)
    cur = toks
    for _ in range(25):
        m = P.mutate(cur, fn, env, rng, rng.choice([1, 2, 3]))
        assert m is not None
        cur = m[0]
        s = P.render(cur, tail)
        assert run(s) == ref, f"{m[1]} changed behaviour:\n{s}"


def _stub(goal_src, fn="f"):
    """A fake referee: 'instructions' are the goal's tokens; MATCH when the candidate's tokens equal them."""
    goal = [{"off": 2 * i, "text": t.t, "bytes": t.t, "key": None} for i, t in enumerate(P.tokenize(goal_src)[0])]
    calls = Counter()

    def check(f, src):
        calls["n"] += 1
        got = [{"off": 2 * i, "text": t.t, "bytes": t.t, "key": None} for i, t in enumerate(P.tokenize(src)[0])]
        same = sum(1 for a, b in zip(goal, got) if a["bytes"] == b["bytes"])
        if same == len(goal) == len(got):
            return {"status": "MATCH", "match_pct": 100.0}, goal, got
        return {"status": "PARTIAL", "match_pct": round(100 * same / len(goal), 1)}, goal, got
    return check, calls


def test_search_finds_match_and_stops():
    start = "int f(int a, int b, int c) { int x = a + b; int y = c * 2; return x - y; }"
    goal = "int f(int a, int b, int c) { int x = b + a; int y = 2 * c; return x - y; }"
    check, calls = _stub(goal)
    r = P.permute("f", start, budget_s=30, max_checks=400, workers=2, seed=1, check=check, ctx="", passes=["commute"])
    assert r["matched"] and norm(r["best_src"]) == norm(goal)
    assert r["checks"] == calls["n"] and r["checks"] < 400
    assert r["improved"] and r["from"]["match_pct"] < 100


def test_search_respects_budget_and_keeps_best():
    start = "int f(int a, int b) { return a + b; }"
    check, calls = _stub("int f(int a, int b) { return a - b; }")  # unreachable: semantics differ
    r = P.permute("f", start, budget_s=5, max_checks=25, workers=2, seed=0, check=check, ctx="")
    assert not r["matched"] and r["checks"] <= 25 and calls["n"] == r["checks"]
    assert norm(r["best_src"]) in {norm(start), norm("int f(int a, int b) { return b + a; }")}


def test_unparseable_source_is_returned_untouched():
    check, _ = _stub("int f(void) { return 0; }")
    r = P.permute("g", "int f(void) { return 1; }", budget_s=2, max_checks=5, check=check, ctx="")
    assert r["best_src"] == "int f(void) { return 1; }" and not r["matched"] and "error" in r


def test_checker_rules_filter_candidates():
    assert not P._checker_ok("int f(int a) { return (int)(int)(int)(int)a; }", "int f(int a) { return a; }")
    assert P._checker_ok("int f(int a) { return (int)a; }", "int f(int a) { return a; }")


def test_penalty_scale():
    t = [{"off": 0, "text": "movs r0, #1", "bytes": "2001"}, {"off": 2, "text": "adds r0, r1, r2", "bytes": "1888"}]
    assert P.penalty(t, t) == (0, 2, 2)
    reg = [{"off": 0, "text": "movs r3, #1", "bytes": "2301"}, t[1]]
    assert P.penalty(t, reg)[0] == 5
    moved = [t[1], t[0]]
    assert P.penalty(t, moved)[0] == 60
