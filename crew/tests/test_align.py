"""Aligned side-by-side feedback: register drift no longer looks like a 2% match."""
from crew.align import align


def ins(off, text):
    return {"off": off, "text": text, "bytes": "0000"}


def test_register_drift_is_structure_not_failure():
    t = [ins(0, "push\t{r4, r5, r6, r7, lr}"), ins(2, "mov\tr7, sl"), ins(4, "mov\tr5, r8"), ins(6, "ldr\tr3, [r0, #16]"),
         ins(8, "adds\tr3, #1"), ins(10, "str\tr3, [r0, #16]"), ins(12, "bx\tlr")]
    g = [ins(0, "push\t{r4, r5, r6, r7, lr}"), ins(2, "mov\tr6, sl"), ins(4, "mov\tr5, r8"), ins(6, "ldr\tr2, [r0, #16]"),
         ins(8, "adds\tr2, #1"), ins(10, "str\tr2, [r0, #16]"), ins(12, "bx\tlr")]
    a = align(t, g)
    assert a["structure_pct"] == 100.0 and a["exact_pct"] < 60
    assert any("target r3 -> yours r2" in r for r in a["registers"])
    assert "register allocation" in a["hint"]


def test_structural_divergence_shows_hunks():
    t = [ins(0, "cmp\tr0, #0"), ins(2, "beq.n 10"), ins(4, "movs\tr0, #1"), ins(6, "bx\tlr")]
    g = [ins(0, "cmp\tr0, #0"), ins(2, "bne.n 8"), ins(4, "movs\tr0, #0"), ins(6, "movs\tr1, #2"), ins(8, "bx\tlr")]
    a = align(t, g)
    assert a["structure_pct"] < 100 and a["side_by_side"] and a["length"] == {"target": 4, "candidate": 5}


def test_branch_targets_compare_relative_to_function_start():
    t = [{"off": 0x540, "text": "cmp r0, r3"}, {"off": 0x542, "text": "bne.n 540 <fn_0801B248+0x24>"}]
    g = [{"off": 0x0, "text": "cmp r0, r3"}, {"off": 0x2, "text": "bne.n 0 <fn_0801B248>"}]
    a = align(t, g)
    assert a["structure_pct"] == 100.0 and a["exact_pct"] == 100.0
