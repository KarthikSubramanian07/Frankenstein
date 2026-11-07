"""L003's one exception: __attribute__((target("arm"))) on the definition of a manifest mode-"arm" function.
Unit tests run anywhere; the voxelburg end-to-end tests need frank-lab and the voxelburg secrets."""
import pytest

from lab.games import load
from lab.referee.lint import arm_attrs, lint, lint_expanded

ARM = '__attribute__((target("arm")))'
BODY = " int f(int x){ return x + 1; }"


def l003(src, mode):
    return any(v["rule"] == "L003" for v in lint(src, 10, mode=mode)["violations"])


def test_allowed_on_arm_function_definition():
    assert lint(ARM + BODY, 10, mode="arm")["ok"]
    assert lint(f"#include <stdint.h>\n{ARM}\nvoid f(uint8_t c)\n{{ (void)c; }}", 10, mode="arm")["ok"]


def test_rejected_on_thumb_function_and_by_default():
    assert l003(ARM + BODY, "thumb")
    assert not lint(ARM + BODY, 10)["ok"]  # existing callers that pass no mode keep the full ban


@pytest.mark.parametrize("attr", ['__attribute__((target("thumb")))', "__attribute__((optimize(0)))",
                                  "__attribute__((naked))", '__attribute__((section(".iwram")))',
                                  '__attribute__((target("arm"), noinline))', '__attribute__((__target__("arm")))',
                                  '[[gnu::target("arm")]]'])
def test_other_attributes_still_rejected_on_arm_function(attr):
    assert l003(attr + BODY, "arm")


def test_only_one_and_only_on_a_definition():
    assert l003(f"{ARM} int g(int x){{ return x; }}\n{ARM}{BODY}", "arm")  # a second one, on a helper
    assert l003(f"{ARM} int g(int x);{BODY}", "arm")  # on a prototype
    assert l003(f"#define A {ARM}\nA{BODY}", "arm")  # spelled inside a macro


def test_macro_built_attribute_rejected_after_expansion():
    expanded = f'# 1 "cand.c"\n{ARM}{BODY}\n'  # what gcc -E leaves for `#define A __attri##bute__...` + `A int f...`
    raw = '#define A(x) __attri##bute__((x))\nA(target("arm"))' + BODY
    assert not lint_expanded(expanded, "cand.c", "arm", arm_attrs(raw, "arm"))["ok"]
    # The literal attribute survives expansion once and is allowed; a macro can't add a second.
    assert lint_expanded(expanded, "cand.c", "arm", arm_attrs(ARM + BODY, "arm"))["ok"]
    assert not lint_expanded(expanded + f"{ARM} int g(void){{ return 0; }}\n", "cand.c", "arm", 1)["ok"]
    assert not lint_expanded(expanded, "cand.c", "thumb", 1)["ok"]


GAME = load("voxelburg")
needs_voxelburg = pytest.mark.skipif(
    not (GAME["secrets"] / "names.json").exists() or not (GAME["out"] / "manifest.json").exists(),
    reason="voxelburg secrets absent")
SKY_SOLID = '''#include <stdint.h>
extern struct { int a, b; uint16_t *fb; int *coltop; } data_03001D5C;
%s void %s(uint8_t color)
{
	int i, j, colheight;
	uint16_t *fbptr;
	for(i=0; i<120; i++) {
		fbptr = data_03001D5C.fb + i;
		colheight = 160 - data_03001D5C.coltop[i << 1];
		for(j=0; j<colheight; j++) {
			*fbptr = color | ((uint16_t)color << 8);
			fbptr += 120;
		}
	}
}
'''


@pytest.fixture(scope="module")
def vox():
    from lab.referee.core import Referee
    referee = Referee("voxelburg")
    return referee, {v["name"]: k for k, v in referee.names.items()}


@pytest.mark.integration
@needs_voxelburg
def test_voxelburg_arm_function_matches_with_the_attribute(vox):
    referee, ids = vox
    fn = ids["vox_sky_solid"]
    assert referee.functions[fn]["mode"] == "arm"
    assert referee.self_check(fn)["status"] == "MATCH"
    assert referee.check(fn, SKY_SOLID % (ARM, fn))["status"] == "MATCH"
    assert referee.check(fn, SKY_SOLID % ("", fn))["status"] == "PARTIAL"  # without it gcc emits Thumb


@pytest.mark.integration
@needs_voxelburg
def test_voxelburg_referee_rejects_attribute_on_thumb_and_macro_built(vox):
    referee, ids = vox
    fn = ids["vox_sky_solid"]
    built = SKY_SOLID % ('#define A(x) __attri##bute__((x))\nA(target("arm"))', fn)
    result = referee.check(fn, built)
    assert result["status"] == "LINT_FAIL" and "(after macro expansion)" in result["lint"]["violations"][0]["reason"]
    thumb = next(f for f, m in referee.functions.items() if m["scope"] == "game" and m["mode"] == "thumb")
    result = referee.check(thumb, f"{ARM} void {thumb}(void){{}}")
    assert result["status"] == "LINT_FAIL" and result["lint"]["violations"][0]["rule"] == "L003"
