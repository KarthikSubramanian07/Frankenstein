"""Contract tests: fixtures are deterministic, schema-valid, and internally consistent."""
import collections
import json
import subprocess
import sys
from pathlib import Path

import pytest
from jsonschema import Draft202012Validator

ROOT = Path(__file__).resolve().parents[2]
FIX = ROOT / "contracts" / "fixtures"
sys.path.insert(0, str(ROOT / "contracts"))
import validate  # noqa: E402


def events():
    return [json.loads(l) for l in (FIX / "events.sample.jsonl").read_text().splitlines()[1:]]


def test_fixtures_validate():
    assert validate.main([]) == 0


def test_generator_is_deterministic(tmp_path):
    subprocess.run([sys.executable, str(ROOT / "contracts/make_fixtures.py"), "--out", str(tmp_path)], check=True)
    for p in FIX.glob("*.json*"):
        assert (tmp_path / p.name).read_bytes() == p.read_bytes(), p.name


def test_every_fixture_is_marked():
    for p in FIX.glob("*.json"):
        assert json.loads(p.read_text()).get("fixture") is True, p.name
    assert json.loads((FIX / "events.sample.jsonl").read_text().splitlines()[0]) == {"type": "fixture"}


def test_every_event_type_present():
    schema = json.loads((ROOT / "contracts/schemas/event.schema.json").read_text())
    assert set(schema["properties"]["type"]["enum"]) <= {e["type"] for e in events()}


def test_run_counts_match_contract_and_metrics():
    ev = events()
    c = collections.Counter(e["type"] for e in ev)
    false_claims = sum(1 for e in ev if e["type"] == "verdict" and e["payload"]["claim_was_true"] is False)
    lint = sum(1 for e in ev if e["type"] == "verdict" and e["payload"]["status"] == "LINT_FAIL")
    assert c["fn.matched"] == 60 and false_claims == 9 and lint == 3 and c["idiom.learned"] == 12
    assert 35 <= c["narration"] <= 60
    m = json.loads((FIX / "metrics.sample.json").read_text())["runs"][0]
    assert m["matched"] == c["fn.matched"] and m["false_claims_caught"] == false_claims
    assert [b["payload"]["identical"] for b in ev if b["type"] == "build.rom"] == [True]


def test_every_claim_gets_a_verdict():
    ev = events()
    verdicts = {(e["fn"], e["payload"]["attempt"]) for e in ev if e["type"] == "verdict"}
    for e in ev:
        if e["type"] == "claim.made":
            assert (e["fn"], e["payload"]["attempt"]) in verdicts


def test_manifest_shape():
    m = json.loads((FIX / "manifest.sample.json").read_text())
    fns = m["functions"]
    game = [f for f in fns if f["scope"] == "game"]
    assert len(game) == 84 and len(fns) - len(game) == 12
    assert 0.25 <= sum(f["split"] == "heldout" for f in game) / len(game) <= 0.35
    addrs = [int(f["addr"], 16) for f in fns]
    assert addrs == sorted(addrs) and addrs[0] == 0x08000200
    by = {f["id"]: f for f in fns}
    for f in fns:
        for c in f["callees"]:
            assert f["id"] in by[c]["callers"]
    viz = json.loads((FIX / "viz_map.sample.json").read_text())
    covered = [x for s in viz["subsystems"] for x in s["functions"]]
    assert sorted(covered) == sorted(f["id"] for f in game)
    assert "flto" not in m["game"]["compiler"]["flags"].replace("minus -flto", "")


def test_schema_rejects_bad_event():
    v = Draft202012Validator(json.loads((ROOT / "contracts/schemas/event.schema.json").read_text()))
    bad = {"v": 1, "ts": "2026-11-07T19:00:00.000Z", "run_id": "r", "seq": 1, "type": "narration",
           "actor": "archivist", "payload": {"text": "x" * 91, "mood": "dry", "speak": False, "priority": 1}}
    assert list(v.iter_errors(bad))
    bad["payload"]["text"] = "ok"
    assert not list(v.iter_errors(bad))
    bad["type"] = "verdict"
    assert list(v.iter_errors(bad))
