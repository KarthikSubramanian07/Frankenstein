"""Pokemon Red referee: self-test plus the four gap fixes. Needs lab/secrets/pokered (pret source + RGBDS build).
Ids only here; original names stay in lab/secrets/pokered."""
import json
import shutil
import sys
from pathlib import Path

import pytest

POKERED = Path(__file__).resolve().parents[1] / "pokered"
SECRETS = POKERED.parent / "secrets" / "pokered"
pytestmark = pytest.mark.skipif(not (SECRETS / "pokered.sym").exists() or not shutil.which("rgbasm"),
                                reason="lab/secrets/pokered or RGBDS missing")
sys.path.insert(0, str(POKERED))

TITLE_DATA = "rt_01_42dd"        # title-screen routine with two inline data runs
PREDEF_USER = "rt_00_3493"       # 8-byte routine whose first statement is a predef
PREDEF_TARGET = "rt_03_78a5"     # the routine that predef reaches
TABLE_DISPATCH = "rt_07_4b0e"    # map script that dispatches through a pointer table
TABLE = "rt_07_4b28"             # that pointer table
TABLE_ONLY_ENTRY = "rt_07_4db9"  # reached only through the table (rival battle start)


@pytest.fixture(scope="module")
def ref():
    import referee
    return referee


def test_selftest_five_match_and_edits_partial(ref):
    assert ref.selftest()


def test_jump_table_entries_are_in_the_closure(ref):
    import make_slice
    r, index = ref.reference(), ref.source_index()
    name = r["ids"]
    assert name[TABLE] in make_slice.callees(name[TABLE_DISPATCH], index, r["ext"])
    assert name[TABLE_ONLY_ENTRY] in make_slice.callees(name[TABLE], index, r["ext"])
    title = json.loads((POKERED / "slice.json").read_text())
    assert title["units"] > 148  # was 148 before tables were followed


def test_predef_accepts_an_id(ref):
    body = ref.original_body(PREDEF_USER)
    name = ref.reference()["ids"][PREDEF_TARGET]
    cand = body.replace(f"predef {name}", f"predef {PREDEF_TARGET}")
    assert cand != body and name not in cand
    res = ref.check(PREDEF_USER, cand)
    assert res["status"] == "MATCH", res
    assert name not in res["compile"]["log"]


def test_inline_data_allowed_inside_original_ranges(ref):
    assert ref.data_ranges(TITLE_DATA)
    assert ref.check(TITLE_DATA, ref.original_body(TITLE_DATA))["status"] == "MATCH"


def test_raw_bytes_outside_data_ranges_fail(ref):
    lines = ref.original_body(TITLE_DATA).splitlines()
    i = next(k for k, l in enumerate(lines) if l.strip() == "xor a")
    smuggled = "\n".join(lines[:i] + ["\tdb $af"] + lines[i + 1:]) + "\n"  # same bytes, emitted as data
    res = ref.check(TITLE_DATA, smuggled)
    assert res["status"] == "LINT_FAIL" and res["match_pct"] == 100.0, res
    # routines without inline data still reject db/dw and data macros before building
    for bad in ("\tdb $c9\n", "\tdw $00c9\n", "\ttext_far $1234\n"):
        assert not ref.lint(bad, PREDEF_USER)["ok"]


def test_interaction_slice_is_separate_and_ids_only():
    inter = json.loads((POKERED / "slice_interactions.json").read_text())
    title = json.loads((POKERED / "slice.json").read_text())
    ids = {u["id"] for u in inter["routines"]}
    assert TABLE_ONLY_ENTRY in ids and inter["units"] > title["units"]
    assert any(u["boundary"] for u in inter["routines"])
    names = json.loads((SECRETS / "names_slice_interactions.json").read_text())
    text = (POKERED / "slice_interactions.json").read_text()
    assert not any(v["name"] in text for v in names.values())
