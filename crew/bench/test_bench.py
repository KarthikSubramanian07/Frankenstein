"""Bench tests: python -m pytest crew/bench

The answer key is read only inside these tests (to prove every original function MATCHes through the same
path a Digger's candidate takes). The crew itself is blocked from crew/bench/answers/ by crew.guard.
"""
from __future__ import annotations

import concurrent.futures as cf
import json
import re
import threading
from http.server import ThreadingHTTPServer
from pathlib import Path

import pytest

from crew.bench import build
from crew.bench import referee as bref
from crew.bench.core import OUT, ROOT

ANSWERS = Path(__file__).resolve().parent / "answers"
IDENT = re.compile(r"\b[A-Za-z_]\w*\b")


@pytest.fixture(scope="session", autouse=True)
def built():
    if not (OUT / "targets.json").exists() or not (ANSWERS / "names.json").exists():
        build.main()
    return json.loads((ANSWERS / "names.json").read_text())


def candidate_from_answer(names: dict, fid: str) -> str:
    """The answer's own source, renamed to the anonymized ids exactly as a correct Digger would write it."""
    src = (ANSWERS / names["functions"][fid]["file"]).read_text()
    src = re.sub(r'^\s*#include\s+"bench\.h"\s*$', "", src, flags=re.M)
    ren = names["rename"]
    return IDENT.sub(lambda m: ren.get(m.group(0), m.group(0)), src)


def by_name(names: dict, name: str) -> str:
    return next(k for k, v in names["functions"].items() if v["name"] == name)


def test_bench_size(built):
    assert 16 <= len(built["functions"]) <= 20


@pytest.mark.parametrize("idx", range(20))
def test_every_answer_matches(built, idx):
    fids = sorted(built["functions"])
    if idx >= len(fids):
        pytest.skip("fewer functions")
    fid = fids[idx]
    res = bref.check(fid, candidate_from_answer(built, fid))
    assert res["status"] == "MATCH", (fid, res["first_diff"], res["compile"]["log"])
    assert res["match_pct"] == 100.0 and res["lint"]["ok"] and res["first_diff"] is None
    assert res["elapsed_ms"] < 3000


def test_constant_edit_is_partial(built):
    fid = by_name(built, "mover_reset")
    src = candidate_from_answer(built, fid)
    assert "= 100;" in src
    res = bref.check(fid, src.replace("= 100;", "= 101;"))
    assert res["status"] == "PARTIAL"
    fd = res["first_diff"]
    assert fd and set(fd) >= {"offset", "expected", "got", "expected_ins", "got_ins"}
    assert fd["expected"] != fd["got"] and fd["expected_ins"] != fd["got_ins"]
    assert 0 < res["match_pct"] < 100 and 1 <= len(res["diff"]) <= 64


def test_wrong_callee_is_partial(built):
    fid = by_name(built, "mover_confine")
    src = candidate_from_answer(built, fid)
    callee = by_name(built, "clamp_s32")
    other = by_name(built, "abs_diff")
    bad = f"s32 {other}(s32 a, s32 b, s32 c);\n" + src.replace(callee, other)  # same code, wrong call target
    res = bref.check(fid, bad)
    assert res["status"] == "PARTIAL"
    assert any(other in d["got_ins"] for d in res["diff"])


def test_switch_table_and_rodata(built):
    fid = by_name(built, "menu_input")
    res = bref.check(fid, candidate_from_answer(built, fid).replace("return 7;", "return 8;"))
    assert res["status"] == "PARTIAL"


def test_asm_is_lint_fail(built):
    fid = sorted(built["functions"])[0]
    res = bref.check(fid, f'int {fid}(int a) {{ asm("mov r0, r1"); return a; }}')
    assert res["status"] == "LINT_FAIL" and not res["lint"]["ok"]
    assert res["lint"]["violations"][0]["rule"] == "L001"


def test_asm_copied_into_comments_is_l008(built):
    fid = by_name(built, "key_edge")
    asm = (OUT / "asm" / f"{fid}.s").read_text().splitlines()
    body = [l.split(":", 1)[1].strip() for l in asm if re.match(r"^\s+[0-9a-f]{4}:", l)]
    comment = "/*\n" + "\n".join(body * 2) + "\n*/\n"
    res = bref.check(fid, comment + f"u16 {fid}(u16 a, u16 b) {{ return a & ~b; }}\n")
    assert res["status"] == "LINT_FAIL" and res["lint"]["violations"][0]["rule"] == "L008"


def test_garbage_is_no_compile(built):
    fid = sorted(built["functions"])[0]
    res = bref.check(fid, "this is not C at all {")
    assert res["status"] == "NO_COMPILE" and res["compile"]["ok"] is False
    assert res["compile"]["log"] and "/tmp" not in res["compile"]["log"] and "/var/" not in res["compile"]["log"]
    assert "benchref-" not in res["compile"]["log"]


def test_wrong_name_is_no_compile(built):
    fid = by_name(built, "key_edge")
    res = bref.check(fid, "u16 key_edge(u16 a, u16 b) { return a & ~b; }")
    assert res["status"] == "NO_COMPILE" and fid in res["compile"]["log"]


def test_results_validate_against_schema(built):
    jsonschema = pytest.importorskip("jsonschema")
    schema = json.loads((ROOT / "contracts" / "schemas" / "referee_result.schema.json").read_text())
    fid = by_name(built, "mover_reset")
    src = candidate_from_answer(built, fid)
    for s in (src, src.replace("= 100;", "= 101;"), "garbage {", f'int {fid}() {{ asm("nop"); }}'):
        jsonschema.validate(bref.check(fid, s), schema)


def test_manifest_validates(built):
    jsonschema = pytest.importorskip("jsonschema")
    schema = json.loads((ROOT / "contracts" / "schemas" / "manifest.schema.json").read_text())
    m = json.loads((OUT / "manifest.json").read_text())
    jsonschema.validate(m, schema)
    fns = m["functions"]
    held = [f for f in fns if f["split"] == "heldout"]
    assert 0.2 <= len(held) / len(fns) <= 0.4
    addrs = [int(f["addr"], 16) for f in fns]
    assert addrs == sorted(addrs) and addrs[0] == 0x08000200
    ids = {f["id"] for f in fns}
    for f in fns:
        assert (ROOT / f["asm_path"]).exists()
        assert set(f["callees"]) <= ids and set(f["callers"]) <= ids


def test_no_original_names_in_out(built):
    originals = {v["name"] for v in built["functions"].values()} | set(built["rename"]) - set(built["rename"].values())
    for p in [*OUT.glob("*.json"), *(OUT / "asm").glob("*.s"), *(OUT / "ctx").glob("*.h")]:
        leaked = set(IDENT.findall(p.read_text())) & originals
        assert not leaked, (p.name, leaked)


def test_guard_blocks_answers():
    guard = pytest.importorskip("crew.guard")
    GuardError, check, safe_read = guard.GuardError, guard.check, guard.safe_read
    with pytest.raises(GuardError):
        safe_read(ANSWERS / "bench.h")
    with pytest.raises(GuardError):
        check(ANSWERS / "names.json")
    check(OUT / "manifest.json")  # out/ is crew-visible


def test_concurrent_checks(built):
    fids = sorted(built["functions"])[:8]
    srcs = {f: candidate_from_answer(built, f) for f in fids}
    with cf.ThreadPoolExecutor(8) as ex:
        results = list(ex.map(lambda f: bref.check(f, srcs[f]), fids))
    assert all(r["status"] == "MATCH" for r in results)


def test_http_and_crew_integration(built, monkeypatch):
    httpd = ThreadingHTTPServer(("127.0.0.1", 0), bref.Handler)
    t = threading.Thread(target=httpd.serve_forever, daemon=True)
    t.start()
    url = f"http://127.0.0.1:{httpd.server_address[1]}"
    try:
        Config = pytest.importorskip("crew.config").Config
        HttpReferee = pytest.importorskip("crew.referee").HttpReferee
        Target = pytest.importorskip("crew.target").Target
        ref = HttpReferee(url, timeout=30)
        h = ref.health()
        assert h["ok"] is True and h["referee"].startswith("bench@arm-none-eabi-gcc")
        monkeypatch.setenv("FRANK_MANIFEST", "crew/bench/out/manifest.json")
        tgt = Target(Config(), referee=ref)
        assert tgt.game_id == "bench" and len(tgt.game_functions()) == len(built["functions"])
        fid = by_name(built, "mover_reset")
        assert tgt.asm(fid).startswith(f"@ {fid}")
        ctx = tgt.context(fid)
        assert "typedef s32 fixed_t;" in ctx and "struct_" in ctx
        assert ref.check(fid, candidate_from_answer(built, fid))["status"] == "MATCH"
        rb = ref.rebuild(str(Path("/nonexistent")))
        assert rb["identical"] is True and rb["method"] == "source-tree"
        with pytest.raises(Exception):
            ref.check("fn_DEADBEEF", "int x;")
    finally:
        httpd.shutdown()


def test_rebuild_detects_mismatch(built, tmp_path):
    good = by_name(built, "key_edge")
    bad = by_name(built, "mover_reset")
    (tmp_path / f"{good}.c").write_text(candidate_from_answer(built, good))
    (tmp_path / f"{bad}.c").write_text(candidate_from_answer(built, bad).replace("= 100;", "= 7;"))
    rb = bref.rebuild(str(tmp_path))
    assert rb["identical"] is False and rb["recovered"] == 1 and rb["mismatched"] == [bad]
    (tmp_path / f"{bad}.c").write_text(candidate_from_answer(built, bad))
    rb = bref.rebuild(str(tmp_path))
    assert rb["identical"] is True and rb["rom_sha1"] == rb["original_sha1"] and rb["recovered"] == 2
