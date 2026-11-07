"""crew.draft: objdump -> GNU as conversion (pure), and the m2c call when a pinned checkout is present."""
from __future__ import annotations

import pytest

from crew import draft

OBJDUMP = """fn_0801B248:
 801b248:\tb570      \tpush\t{r4, r5, r6, lr}
 801b24a:\tf7e5 f919 \tbl\t8000480 <fn_08000480>
 801b24e:\t4b0c      \tldr\tr3, [pc, #48]\t@ (801b280 <fn_0801B248+0x38>)
 801b250:\t681a      \tldr\tr2, [r3, #0]
 801b252:\t2a00      \tcmp\tr2, #0
 801b254:\tddf8      \tble.n\t801b248 <fn_0801B248>
 801b256:\td1f8      \tbne.n\t801b250 <fn_0801B248+0x8>
 801b258:\tbd70      \tpop\t{r4, r5, r6, pc}
 801b280:\t030064c4 \t.word\t0x030064c4\t@ data_030064C4
"""


def test_to_gas_labels_pools_and_calls():
    s = draft.to_gas(OBJDUMP, "fn_0801B248")
    assert "\tbl fn_08000480" in s
    assert "\tldr r3, .L801b280" in s and ".L801b280:\n\t.word data_030064C4" in s
    assert "\tble .L801b248" in s  # ble is a branch, not a call
    assert ".L801b250:\n\tldr r2, [r3, #0]" in s and "\tbne .L801b250" in s
    assert "@" not in s


def test_clean_rejects_failures_and_truncates():
    assert draft.clean("/*\nDecompilation failure in function f:\n*/") is None
    assert draft.clean("") is None
    big = "x = 1;\n" * 5000
    out = draft.clean(big)
    assert len(out) <= draft.MAX_DRAFT_CHARS + 40 and out.endswith("truncated ... */\n")


@pytest.mark.skipif(draft.m2c_path(fetch=False) is None, reason="no pinned m2c checkout (runs/_tools/m2c)")
def test_m2c_drafts_real_thumb(tmp_path):
    c = draft.get_draft("fn_0801B248", OBJDUMP, cache_dir=tmp_path)
    assert c and "fn_0801B248" in c and "fn_08000480" in c
