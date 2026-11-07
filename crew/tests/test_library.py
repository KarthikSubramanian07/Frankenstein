"""Idiom library tests (local JSON backend): leak check, dedupe, modes, persistence."""
from __future__ import annotations

import json

from crew.library import Library, leaks

from .fakes import offline_config

ACCEPTED = """int fn_08000214(int a, int b)
{
    int r = a * b;
    r = r >> 16;
    if (r < 0)
        r = 0;
    return r;
}"""

IDIOM = {"title": "Arithmetic shift for fixed point", "applies_when": "asrs follows muls",
         "do": "keep the product in a signed int", "example": "int k(int x, int y)\n{\n    return (x * y) >> 8;\n}"}


def lib(tmp_path, mode="learning"):
    return Library(offline_config(tmp_path), mode=mode, path=tmp_path / "idioms.json")


def test_leak_check():
    copied = "int f(int x, int y)\n{\n    int r = a * b;\n  r   =  r >> 16;\n    if (r < 0)\n}"
    assert leaks(copied, ACCEPTED)  # three consecutive lines, whitespace-normalised
    two = "int r = a * b;\nr = r >> 16;\nreturn x;"
    assert not leaks(two, ACCEPTED)
    assert not leaks(IDIOM["example"], ACCEPTED)
    assert not leaks("", ACCEPTED)


def test_add_rejects_leaky_example(tmp_path):
    l = lib(tmp_path)
    bad = {**IDIOM, "example": "\n".join(ACCEPTED.splitlines()[2:5])}
    assert l.add(bad, ACCEPTED, "fn_08000214") is None and l.items == []
    assert not (tmp_path / "idioms.json").exists()


def test_add_and_persist(tmp_path):
    l = lib(tmp_path)
    item = l.add(IDIOM, ACCEPTED, "fn_08000214")
    assert item["idiom_id"] == "idm_001" and item["uses"] == 0 and item["source_fn"] == "fn_08000214"
    on_disk = json.loads((tmp_path / "idioms.json").read_text())
    assert on_disk == [item]
    again = lib(tmp_path, mode="on")
    assert again.items == [item] and again.backend == "local-json"
    hits = again.search("muls then asrs fixed point")
    assert hits[0]["idiom_id"] == "idm_001" and set(hits[0]) == {"idiom_id", "title", "applies_when", "do", "example"}


def test_dedupe_increments_uses(tmp_path):
    l = lib(tmp_path)
    l.add(IDIOM, ACCEPTED, "fn_08000214")
    near = {**IDIOM, "title": "Arithmetic shift for fixed-point", "do": "something else"}
    assert l.add(near, ACCEPTED, "fn_08000230") is None
    assert len(l.items) == 1 and l.items[0]["uses"] == 1
    assert json.loads((tmp_path / "idioms.json").read_text())[0]["uses"] == 1
    other = {"title": "Count down loops", "applies_when": "subs then bne at loop end", "do": "while (n--)", "example": ""}
    assert l.add(other, ACCEPTED, "fn_08000230")["idiom_id"] == "idm_002"


def test_fields_are_truncated(tmp_path):
    l = lib(tmp_path)
    item = l.add({"title": "t" * 200, "applies_when": "w" * 500, "do": "d" * 500, "example": "e" * 900}, ACCEPTED, "fn_1")
    assert len(item["title"]) == 80 and len(item["applies_when"]) == 200 and len(item["example"]) == 400


def test_mode_off(tmp_path):
    lib(tmp_path).add(IDIOM, ACCEPTED, "fn_08000214")
    off = lib(tmp_path, mode="off")
    assert len(off.items) == 1  # it loads, but never shows or learns
    assert off.search("fixed point shift") == []
    assert off.add({**IDIOM, "title": "Brand new"}, ACCEPTED, "fn_1") is None


def test_mode_on_is_frozen(tmp_path):
    lib(tmp_path).add(IDIOM, ACCEPTED, "fn_08000214")
    on = lib(tmp_path, mode="on")
    assert on.add({"title": "Other", "applies_when": "x", "do": "y"}, ACCEPTED, "fn_1") is None
    assert len(on.items) == 1 and len(on.search("anything")) == 1


def test_empty_library_search(tmp_path):
    assert lib(tmp_path).search("anything") == []
