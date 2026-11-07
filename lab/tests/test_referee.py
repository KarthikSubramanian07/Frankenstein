"""Referee acceptance tests T2 and T3 (docs/00_START_HERE.md section 10). Needs the frank-lab container and lab/secrets."""
import random

import pytest

from lab.referee.core import Referee
from lab.referee.lint import lint

pytestmark = pytest.mark.integration


@pytest.fixture(scope="module")
def referee():
    return Referee()


def test_original_source_of_ten_random_functions_matches(referee):
    game = [f for f, m in referee.functions.items() if m["scope"] == "game" and m["mode"] == "thumb" and "." not in referee.names[f]["name"]]
    for fn in random.Random(1).sample(game, 10):
        assert referee.self_check(fn)["status"] == "MATCH", fn


def test_one_line_edit_is_partial_at_the_right_offset(referee):
    result = referee.self_check("fn_0801B7D8", ("_g->st_oldhealth = _g->player.health;", "_g->st_oldhealth = _g->player.health + 1;"))
    assert result["status"] == "PARTIAL"
    assert result["first_diff"]["offset"] == 22


def test_candidate_match_partial_no_compile_and_lint_fail(referee):
    assert referee.check("fn_0801B7D4", "int fn_0801B7D4(const void *e){(void)e; return 0;}")["status"] == "MATCH"
    partial = referee.check("fn_0801B7D4", "int fn_0801B7D4(const void *e){(void)e; return 1;}")
    assert partial["status"] == "PARTIAL" and partial["first_diff"]["expected_ins"].startswith("movs")
    assert referee.check("fn_0801B7D4", "int fn_0801B7D4( {")["status"] == "NO_COMPILE"
    assert referee.check("fn_0801B7D4", 'int fn_0801B7D4(void){ __asm__("nop"); return 0; }')["status"] == "LINT_FAIL"


def test_results_never_leak_original_names(referee):
    result = referee.check("fn_0801B7D8", "void fn_0801B7D8(void){}")
    text = str(result)
    assert "ST_" not in text and "M_Random" not in text


def test_lint_rules_each_have_a_failing_example():
    cases = {"L001": 'void f(void){ __asm__("nop"); }', "L002": 'void f(void){ x(".word 1"); }', "L003": "#pragma GCC optimize(0)\nint x;",
             "L004": 'void f(void){ register int x asm("r4"); }', "L006": "int f(void){ return *(int *)0x03001234; }",
             "L009": '#include "/work/lab/secrets/gbadoom/source/st_stuff.c"\nint x;'}
    for rule, src in cases.items():
        assert any(v["rule"] == rule for v in lint(src, 4)["violations"]), rule
