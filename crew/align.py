"""Side-by-side feedback for Diggers: align the candidate's instructions with the target's.

The referee's verdict (MATCH or not, and match_pct) is positional and stays the only proof. But positional
scoring hides progress: if the register allocation drifts at instruction 2, every later instruction counts as
wrong and a nearly right function scores 2%. Real decompilers work from an aligned diff instead. This module
gives the Digger that view:

- structure_pct: share of instructions that line up once register names are ignored
- exact_pct: share that line up exactly after alignment
- registers: target register -> candidate register, where aligned instructions differ only in registers
- side_by_side: the first divergent hunks, target on the left, candidate on the right

Feedback only. It never decides anything: acceptance is still the referee's byte-identical MATCH.
"""
from __future__ import annotations

import difflib
import re
from collections import Counter

REG = re.compile(r"\b(r1[0-5]|r[0-9]|sl|fp|ip|sb|sp|lr|pc)\b")
ADDR = re.compile(r"\b[0-9a-f]{6,8}\b|<[^>]*>|@.*$")


def _clean(text: str) -> str:
    return re.sub(r"\s+", " ", ADDR.sub("", text.replace("\t", " "))).strip()


def _shape(text: str) -> str:
    return REG.sub("R", _clean(text))


def align(target: list[dict], got: list[dict], *, max_lines: int = 40) -> dict:
    t_txt = [_clean(i["text"]) for i in target]
    g_txt = [_clean(i["text"]) for i in got]
    t_shape = [_shape(x) for x in t_txt]
    g_shape = [_shape(x) for x in g_txt]
    sm = difflib.SequenceMatcher(None, t_shape, g_shape, autojunk=False)
    structure = sum(b.size for b in sm.get_matching_blocks())
    exact = 0
    regs: Counter = Counter()
    for b in sm.get_matching_blocks():
        for k in range(b.size):
            ti, gi = b.a + k, b.b + k
            if t_txt[ti] == g_txt[gi]:
                exact += 1
            else:
                for tr, gr in zip(REG.findall(t_txt[ti]), REG.findall(g_txt[gi])):
                    if tr != gr:
                        regs[(tr, gr)] += 1
    n = max(1, len(target))
    lines: list[str] = []
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == "equal":
            continue
        if len(lines) >= max_lines:
            break
        off = (target[i1]["off"] - target[0]["off"]) if i1 < len(target) else None
        head = f"@ +0x{off:x}" if off is not None else "@ end"
        lines.append(f"{head}  {tag}")
        for k in range(max(i2 - i1, j2 - j1)):
            left = t_txt[i1 + k] if i1 + k < i2 else ""
            right = g_txt[j1 + k] if j1 + k < j2 else ""
            lines.append(f"  {left:<34} | {right}")
            if len(lines) >= max_lines:
                break
    return {
        "structure_pct": round(100.0 * structure / n, 1),
        "exact_pct": round(100.0 * exact / n, 1),
        "length": {"target": len(target), "candidate": len(got)},
        "registers": [f"target {tr} -> yours {gr} (x{c})" for (tr, gr), c in regs.most_common(6)],
        "side_by_side": lines,
        "hint": ("Structure is close; fix register allocation (declaration order, temporaries, types)."
                 if structure / n > 0.85 and exact / n < 0.85 else
                 "Structure differs; compare the hunks below and restructure control flow first."
                 if structure / n < 0.6 else "Close: fix the hunks below one at a time."),
    }


class LabAligner:
    """Uses Lane A's referee core in-process (same container, same code) to get both instruction lists.
    The official verdict still comes from the referee HTTP call; this only explains a PARTIAL."""

    def __init__(self):
        from lab.referee.core import Referee  # Lane A's code; the target lists live in lab/out, never lab/secrets

        self.core = Referee()

    def explain(self, fn: str, src: str) -> dict | None:
        try:
            result, target, got = self.core.check_items(fn, src)
        except Exception:
            return None
        if result.get("status") != "PARTIAL" or not target or not got:
            return None
        return align(target, got)
