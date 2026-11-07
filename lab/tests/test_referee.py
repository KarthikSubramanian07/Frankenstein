"""Referee acceptance tests T2 and T3 (docs/00_START_HERE.md section 10). Needs the frank-lab container and lab/secrets."""
import random

import pytest

from lab.referee.core import Referee
from lab.referee.lint import lint

pytestmark = pytest.mark.integration


@pytest.fixture(scope="module")
def referee():
    return Referee()


@pytest.fixture(scope="module")
def fid(referee):
    """Original name -> anonymous id (ids shift whenever the variant changes function sizes)."""
    rev = {v["name"]: k for k, v in referee.names.items()}
    return rev.__getitem__


def test_original_source_of_ten_random_functions_matches(referee):
    game = [f for f, m in referee.functions.items() if m["scope"] == "game" and m["mode"] == "thumb" and "." not in referee.names[f]["name"]]
    for fn in random.Random(1).sample(game, 10):
        assert referee.self_check(fn)["status"] == "MATCH", fn


def test_one_line_edit_is_partial(referee, fid):
    result = referee.self_check(fid("ST_Ticker"), ("_g->st_oldhealth = _g->player.health;", "_g->st_oldhealth = _g->player.health + 1;"))
    assert result["status"] == "PARTIAL"
    assert 0 < result["match_pct"] < 100 and result["first_diff"]["offset"] > 0


def test_candidate_match_partial_no_compile_and_lint_fail(referee, fid):
    f = fid("ST_Responder")
    assert referee.check(f, f"int {f}(const void *e){{(void)e; return 0;}}")["status"] == "MATCH"
    partial = referee.check(f, f"int {f}(const void *e){{(void)e; return 1;}}")
    assert partial["status"] == "PARTIAL" and partial["first_diff"]["expected_ins"].startswith("movs")
    assert referee.check(f, f"int {f}( {{")["status"] == "NO_COMPILE"
    assert referee.check(f, f'int {f}(void){{ __asm__("nop"); return 0; }}')["status"] == "LINT_FAIL"


def test_standalone_candidate_matches_a_call_to_a_same_file_static(referee, fid):
    g, sm, fs = fid("A_GunFlash"), fid("P_SetMobjState"), fid("A_FireSomething")
    src = f"void {sm}(void *mo, int s);\nvoid {fs}(void *p, int a);\nvoid {g}(void **p, void *u) {{ (void)u; {sm}(*p, 155); {fs}(p, 0); }}\n"
    assert referee.check(g, src)["status"] == "MATCH"


def test_results_never_leak_original_names(referee, fid):
    f = fid("ST_Ticker")
    result = referee.check(f, f"void {f}(void){{}}")
    text = str(result)
    assert "ST_" not in text and "M_Random" not in text


def test_lint_rules_each_have_a_failing_example():
    cases = {"L001": 'void f(void){ __asm__("nop"); }', "L002": 'void f(void){ x(".word 1"); }', "L003": "#pragma GCC optimize(0)\nint x;",
             "L004": 'void f(void){ register int x asm("r4"); }', "L006": "int f(void){ return *(int *)0x03001234; }",
             "L009": '#include "/work/lab/secrets/gbadoom/source/st_stuff.c"\nint x;'}
    for rule, src in cases.items():
        assert any(v["rule"] == rule for v in lint(src, 4)["violations"]), rule


def test_teammate_mode_without_the_answer_key_gives_the_same_verdicts(referee, fid):
    """Teammates have no lab/secrets: the committed lab/out/target files must judge exactly like the live target."""
    team = Referee()
    team.names, team.ids, team._targets = {}, {}, {}
    g, sm, fs, resp = fid("A_GunFlash"), fid("P_SetMobjState"), fid("A_FireSomething"), fid("ST_Responder")
    cands = {g: f"void {sm}(void *m, int s);\nvoid {fs}(void *p, int a);\nvoid {g}(void **p, void *u) {{ (void)u; {sm}(*p, 155); {fs}(p, 0); }}\n",
             resp: f"int {resp}(const void *e){{(void)e; return 1;}}"}
    for fn, src in cands.items():
        live, offline = referee.check(fn, src), team.check(fn, src)
        assert (live["status"], live["match_pct"], live["first_diff"]) == (offline["status"], offline["match_pct"], offline["first_diff"])
