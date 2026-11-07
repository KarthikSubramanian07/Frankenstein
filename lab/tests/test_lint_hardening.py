"""One test per linter bypass found in the red-team pass. Integration: needs the frank-lab container and lab/secrets."""
import time

import pytest

from lab.referee.core import Referee
from lab.referee.lint import lint

pytestmark = pytest.mark.integration
SECRET = "/work/lab/secrets/names.json"


@pytest.fixture(scope="module")
def referee():
    return Referee()


@pytest.fixture(scope="module")
def fn(referee):
    return {v["name"]: k for k, v in referee.names.items()}["ST_Responder"]


def rules(referee, fn, src):
    result = referee.check(fn, src)
    assert result["status"] == "LINT_FAIL", result
    return {v["rule"] for v in result["lint"]["violations"]}


def test_token_pasted_asm_is_caught_after_expansion(referee, fn):
    assert "L001" in rules(referee, fn, f'#define J(a,b) a##b\nint {fn}(const void *e){{ J(as,m)("nop"); return 0; }}')


def test_token_pasted_pragma_is_caught_after_expansion(referee, fn):
    assert "L003" in rules(referee, fn, f'#define P(x) _Prag##ma(x)\nP("GCC optimize(0)") int {fn}(const void *e){{ return 0; }}')


def test_token_pasted_attribute_is_caught_after_expansion(referee, fn):
    assert "L003" in rules(referee, fn, f'#define A(x) __attri##bute__((x))\nA(noinline) int {fn}(const void *e){{ return 0; }}')


def test_line_splice_asm(referee, fn):
    assert "L001" in rules(referee, fn, f'int {fn}(const void *e){{ as\\\nm("nop"); return 0; }}')


def test_line_splice_pragma(referee, fn):
    assert "L003" in rules(referee, fn, f'#pra\\\ngma GCC optimize(0)\nint {fn}(const void *e){{ return 0; }}')


def test_digraph_include_of_the_answer_key(referee, fn):
    assert "L009" in rules(referee, fn, f'%:include "{SECRET}"\nint {fn}(const void *e){{ return 0; }}')


def test_trigraph_include(referee, fn):
    assert "L009" in rules(referee, fn, f'??=include "{SECRET}"\nint {fn}(const void *e){{ return 0; }}')


def test_line_directive_and_linemarker(referee, fn):
    assert "L010" in rules(referee, fn, f'#line 1 "/opt/x.h"\nint {fn}(const void *e){{ return 0; }}')
    assert "L010" in rules(referee, fn, f'# 1 "/opt/x.h" 3\nint {fn}(const void *e){{ return 0; }}')


def test_embed_and_include_next(referee, fn):
    assert "L010" in rules(referee, fn, f'const char k[] = {{\n#embed "{SECRET}"\n}};\nint {fn}(const void *e){{ return 0; }}')
    assert "L010" in rules(referee, fn, f'#include_next <stdint.h>\nint {fn}(const void *e){{ return 0; }}')


def test_has_include_probe(referee, fn):
    assert "L009" in rules(referee, fn, f'#if __has_include("{SECRET}")\nint leak;\n#endif\nint {fn}(const void *e){{ return 0; }}')


def test_c23_attribute(referee, fn):
    assert "L003" in rules(referee, fn, f'[[gnu::noinline]] int {fn}(const void *e){{ return 0; }}')
    assert "L003" in rules(referee, fn, f'<:<:gnu::noinline:>:> int {fn}(const void *e){{ return 0; }}')


def test_arm_instruction_intrinsic(referee, fn):
    assert "L011" in rules(referee, fn, f'int {fn}(const void *e){{ __builtin_arm_cdp(1,2,3,4,5,6); return 0; }}')


def test_macro_built_and_decimal_ram_address(referee, fn):
    assert "L006" in rules(referee, fn, f'#define B 0x0300##1234\nint {fn}(const void *e){{ return *(int *)B; }}')
    assert "L006" in rules(referee, fn, f'int {fn}(const void *e){{ return *(int *)(50336308); }}')


def test_one_long_line_is_padding(referee, fn):
    assert "L007" in rules(referee, fn, f"int {fn}(const void *e){{ int a = 0; " + "a += 1; " * 400 + "return a; }")


def test_compile_log_never_echoes_other_files(referee, fn):
    # Even if an include slipped through, diagnostics about files outside the temp dir are dropped.
    src = f'#include <stdint.h>\nint {fn}(const void *e){{ return undeclared_thing; }}'
    log = referee.check(fn, src)["compile"]["log"]
    assert "undeclared_thing" in log and "|" not in log


def test_legit_candidate_still_matches_and_is_fast(referee, fn):
    src = (f"#include <stdint.h>\n#include <stdbool.h>\n#include <stddef.h>\n#define REG_DISPCNT (*(volatile uint16_t *)0x04000000)\n"
           f"int {fn}(const void *e){{ (void)e; return 0; }}")
    referee.check(fn, src)
    started = time.time()
    result = referee.check(fn, src)
    assert result["status"] == "MATCH", result
    assert time.time() - started < 0.5
    assert lint("int f(int a, int b){ return a && b; }", 4)["ok"]
