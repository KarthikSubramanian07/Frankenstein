"""Cartographer tests: fixture manifest, canned model output (no network)."""
from __future__ import annotations

import json
import shutil
from pathlib import Path

import jsonschema
import pytest

from crew import cartographer as carto
from crew.config import ROOT, Config
from crew.events import EventLog
from crew.target import Target

FIXTURE = "contracts/fixtures/manifest.sample.json"
HAS_CLANG = shutil.which("clang") is not None


@pytest.fixture
def target(monkeypatch):
    monkeypatch.setenv("FRANK_MANIFEST", FIXTURE)
    cfg = Config()
    assert cfg.manifest_path.name == "manifest.sample.json"
    return Target(cfg)


def _ids(t, n=4):
    return [f["id"] for f in sorted(t.game_functions(), key=lambda f: int(f["addr"], 16))][:n]


def canned(t):
    a, b, c, d = _ids(t)
    return f"""Here you go.
```c
typedef struct struct_0001 {{
    int32_t f_00;
    uint16_t f_04; /* inferred: flags; one; two */
    uint16_t f_06;
}} struct_0001; /* inferred: map object */

extern struct_0001 data_03000100[16];
extern int32_t data_03000200;
int32_t {a}(struct_0001 *p, int32_t x);
void {b}(void);
undefined_type_t {c}(int32_t x);
struct_0001 *{d}(int32_t idx);
```
"""


def test_corpus_deterministic(target):
    rec = {_ids(target)[1]: "int x;\n", _ids(target)[0]: "int y;\n"}
    t1, s1 = carto.build_corpus(target, rec)
    t2, s2 = carto.build_corpus(target, dict(reversed(list(rec.items()))))
    assert t1 == t2 and s1 == s2
    assert s1["n_functions"] == len(target.game_functions())
    assert s1["n_recovered"] == 2 and s1["chars"] == len(t1) and s1["tokens_est"] > 0
    pos = [t1.index(f"### {f}") for f in _ids(target, 10)]
    assert pos == sorted(pos)  # ordered by address
    assert t1.index(f"// ---- {_ids(target)[0]}.c") < t1.index(f"// ---- {_ids(target)[1]}.c")


def test_dense_asm_inlines_literals_and_offsets():
    raw = ("fn_0801B34C:\n"
           " 801b34c:\tb5f0      \tpush\t{r4, r5, r6, r7, lr}\n"
           " 801b34e:\t4dc8      \tldr\tr5, [pc, #800]\t@ (801b354 <fn_0801B34C+0x8>)\n"
           " 801b350:\td100      \tbne.n\t801b34c <fn_0801B34C>\n"
           " 801b352:\tf7e2 fdc3 \tbl\t80005a8 <fn_080005A8>\n"
           " 801b354:\t03006778 \t.word\t0x03006778\n"
           " 801b358:\t080005a9 \t.word\t0x080005a9\n")
    out = carto.dense_asm(raw, {0x080005A8: "fn_080005A8"})
    assert out.splitlines() == ["fn_0801B34C:", "0 push {r4, r5, r6, r7, lr}", "2 ldr r5, =data_03006778",
                                "4 bne.n fn_0801B34C", "6 bl fn_080005A8", "c .word 0x080005a9"]
    assert carto.literal_globals(raw, {0x080005A8}) == ["data_03006778"]


def test_corpus_trims_to_budget_and_says_so(target):
    _, full = carto.build_corpus(target, {}, token_budget=None)
    assert full["full_disassembly"] and full["line_cap"] is None
    text, cut = carto.build_corpus(target, {}, token_budget=int(full["tokens_est"] * 0.8))
    assert not cut["full_disassembly"] and cut["line_cap"] and cut["functions_cut"] > 0
    assert all(f"### {f['id']}" in text for f in target.game_functions())


def test_extract_header():
    assert carto.extract_header("blah\n```c\nint fn_08000000(void);\n```\ntrailer") == "int fn_08000000(void);\n"
    # unterminated fence (length-truncated answer)
    assert "fn_08000004" in carto.extract_header("```c\nvoid fn_08000004(void);\n")
    # largest block wins
    assert "big" in carto.extract_header("```c\nint a;\n```\n```c\nint big; int more;\n```")


def test_split_decls_comments_and_structs(target):
    decls = carto.split_decls(carto.extract_header(canned(target)))
    assert len(decls) == 7
    assert decls[0].startswith("typedef struct") and decls[0].endswith("/* inferred: map object */")
    assert carto.classify(decls[0]) == "struct"
    assert [carto.classify(d) for d in decls[1:3]] == ["global", "global"]
    s = carto.summarize(decls)
    assert s["n_structs"] == 1 and s["n_signatures"] == 4 and s["n_global_arrays"] == 1


@pytest.mark.skipif(not HAS_CLANG, reason="host clang not available")
def test_drop_until_compiles(target, monkeypatch):
    monkeypatch.setattr(carto, "_bench_flags", lambda: None)  # force host clang
    header, info = carto.validate(carto.extract_header(canned(target)))
    assert info["compiled"] is True and info["dropped"] == 1
    assert "undefined_type_t" not in header and "struct_0001 *" in header
    assert any("undefined_type_t" in d for d in info["dropped_decls"])


def test_signatures_for_slice(target):
    a, b, c, d = _ids(target)
    header = carto.extract_header(canned(target))
    s = carto.signatures_for(d, header, callees=[a])
    assert f"{d}(" in s and f"{a}(" in s and "typedef struct struct_0001" in s
    assert f"{b}(" not in s and "data_03000200" not in s
    s2 = carto.signatures_for(b, header, callees=[])
    assert f"{b}(void)" in s2 and "struct_0001" not in s2.split("*/", 1)[1]


def test_missing_key_message(target):
    cfg = target.cfg
    cfg.subq_key = ""
    with pytest.raises(carto.CartographerError, match="SubQ key missing"):
        carto.propose(cfg, target, {}, provider="subq")


def test_model_not_allowed_message(monkeypatch):
    import io
    import urllib.error

    def boom(*a, **k):
        raise urllib.error.HTTPError("u", 403, "Forbidden", {}, io.BytesIO(b'{"error":{"code":"model_not_allowed"}}'))
    monkeypatch.setattr(carto.urllib.request, "urlopen", boom)
    cfg = Config()
    cfg.subq_key = "test"
    with pytest.raises(carto.CartographerError, match=r"subq-preview needs early access \(model_not_allowed\)"):
        carto.subq_chat(cfg, [{"role": "user", "content": "x"}])


@pytest.mark.skipif(not HAS_CLANG, reason="host clang not available")
def test_propose_writes_files_and_valid_event(target, tmp_path, monkeypatch):
    monkeypatch.setattr(carto, "_bench_flags", lambda: None)
    cfg = target.cfg
    cfg.subq_key = "test-key"
    body = {"choices": [{"message": {"role": "assistant", "content": canned(target)}, "finish_reason": "stop"}],
            "usage": {"prompt_tokens": 12345, "completion_tokens": 678}, "model": "subq-preview"}
    sent = {}

    class Resp:
        def __enter__(self): return self
        def __exit__(self, *a): return False
        def read(self): return json.dumps(body).encode()

    def fake_urlopen(req, timeout=None):
        sent["url"] = req.full_url
        sent["body"] = json.loads(req.data)
        return Resp()
    monkeypatch.setattr(carto.urllib.request, "urlopen", fake_urlopen)

    log = EventLog(tmp_path, "rtest")
    stats = carto.propose(cfg, target, {}, log=log, provider="subq")
    log.close()
    assert sent["url"].endswith("/chat/completions") and sent["body"]["model"] == cfg.subq_model
    assert "### " in sent["body"]["messages"][1]["content"]
    assert stats["source"] == "subq" and stats["tokens_in"] == 12345 and stats["tokens_in_source"] == "usage"
    assert stats["dropped"] == 1 and stats["n_signatures"] == 3 and stats["n_structs"] == 1
    assert stats["cost_usd"] is None
    assert (tmp_path / "types.h").exists() and json.loads((tmp_path / "cartographer.json").read_text())["dropped"] == 1

    schema = json.loads((ROOT / "contracts/schemas/event.schema.json").read_text())
    events = [json.loads(line) for line in (tmp_path / "events.jsonl").read_text().splitlines()]
    assert len(events) == 1 and events[0]["type"] == "types.proposed"
    jsonschema.validate(events[0], schema)
    p = events[0]["payload"]
    assert p["source"] == "subq" and p["structs"] == 1 and p["signatures"] == 3 and p["dropped"] == 1
    assert p["n_functions"] == stats["n_functions"] and p["tokens_in"] == 12345 and p["header_path"]


def test_meta_fallback_is_labelled(target, tmp_path, monkeypatch):
    monkeypatch.setattr(carto, "validate", lambda h, cc=None: (carto.PRELUDE + h, {
        "compiler": None, "dropped": 0, "dropped_decls": [], "compiled": None, "rounds": 0}))
    monkeypatch.setattr(carto, "_meta_chat", lambda cfg, m, mt: {
        "content": canned(target), "tin": 10, "tout": 5, "model": "muse-spark-1.3", "cost": 0.001})
    stats = carto.propose(target.cfg, target, {}, provider="meta", run_dir=tmp_path)
    assert stats["source"] == "meta-fallback" and "META FALLBACK (not SubQ)" in (tmp_path / "types.h").read_text()


def test_cli_dry_run(target, tmp_path, capsys):
    assert carto.main(["--run-dir", str(tmp_path), "--dry-run"]) == 0
    out = json.loads(capsys.readouterr().out)
    assert out["n_functions"] == len(target.game_functions()) and out["tokens_est"] > 0
