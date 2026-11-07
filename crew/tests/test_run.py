"""End-to-end: crew.run with a scripted model and the MockReferee on the fixture manifest, into tmp_path.

Everything the run writes must validate against contracts/schemas, and the numbers in metrics.json must
agree with the event stream they summarise.
"""
from __future__ import annotations

import collections
import json
import os

import pytest

from crew import run as crew_run
from crew.referee import MockReferee

from .fakes import FakeLLM, CrewPolicy, offline_config, read_events, schema_errors

CREW_EVENTS = {"run.started", "fn.claimed", "attempt.submitted", "verdict", "claim.made", "fn.matched",
               "fn.abandoned", "idiom.learned", "idiom.used", "metric.tick", "narration", "run.finished"}
SEED_IDIOM = {"idiom_id": "idm_001", "title": "Count down loops", "applies_when": "subs then bne at loop end",
              "do": "while (n--)", "example": "", "source_fn": "fn_08000200", "uses": 0}


@pytest.fixture
def crew(tmp_path, monkeypatch):
    """Returns go(*argv, cost=..., policy=...) -> (run, metrics, fake)."""
    cfg = offline_config(tmp_path / "runs")
    fakes = []

    def go(*argv, cost=0.002, policy=None, budget=40.0):
        args = crew_run.parser().parse_args(["--no-snap", "--no-rebuild", *argv])
        args.budget_usd = budget
        pol = policy or CrewPolicy()

        def make_llm(c, usage):
            f = FakeLLM(c, usage, script=pol, cost=cost)
            fakes.append(f)
            return f

        monkeypatch.setattr(crew_run, "LLM", make_llm)
        r = crew_run.Run(cfg, args)
        return r, r.go(), fakes[-1]

    go.cfg = cfg
    return go


@pytest.fixture
def seeded_library(tmp_path):
    p = tmp_path / "idioms.json"
    p.write_text(json.dumps([SEED_IDIOM]))
    return p


def test_end_to_end_mock_run(crew, seeded_library):
    r, m, fake = crew("--split", "train", "--limit", "8", "--diggers", "2", "--library", "learning",
                      "--library-path", str(seeded_library), "--label", "e2e")
    d = r.dir
    assert d == crew.cfg.runs_dir / "r01"
    for name in ("events.jsonl", "metrics.json", "names.json"):
        assert (d / name).exists(), name
        assert schema_errors(d / name) == [], name

    ev = read_events(d / "events.jsonl")
    types = collections.Counter(e["type"] for e in ev)
    assert CREW_EVENTS <= set(types), CREW_EVENTS - set(types)
    assert ev[0]["type"] == "run.started" and ev[-1]["type"] == "run.finished"
    assert [e["seq"] for e in ev] == list(range(1, len(ev) + 1))
    assert {e["run_id"] for e in ev} == {"r01"}

    # every role in the policy happened: 2 of each across 8 functions
    roles = collections.Counter(fake.script.roles.values())
    assert roles == {"match": 2, "liar": 2, "stuck": 2, "lint": 2}
    assert m["fn_total"] == 8 and m["matched"] == 6 == types["fn.matched"]
    assert types["fn.abandoned"] == 2 and types["fn.claimed"] == 8

    false_in_events = sum(1 for e in ev if e["type"] == "verdict" and e["payload"]["claim_was_true"] is False)
    assert false_in_events == 2 and m["false_claims_caught"] == false_in_events
    assert any(e["type"] == "verdict" and e["payload"]["status"] == "LINT_FAIL" for e in ev)
    assert any(e["type"] == "narration" and e["payload"]["text"] == "Claim rejected!" for e in ev)

    matched = {e["fn"] for e in ev if e["type"] == "fn.matched"}
    files = {p.stem for p in (d / "recovered").glob("*.c")}
    assert files == matched
    for e in ev:
        if e["type"] == "fn.matched":
            src = (crew.cfg.runs_dir.parent / e["payload"]["src_path"]).read_text()
            assert f"{e['fn']}(" in src and "Checker accepted" in src
            assert MockReferee().check(e["fn"], src.split("*/", 1)[1])["status"] == "MATCH"

    names = json.loads((d / "names.json").read_text())["names"]
    assert {n["fn"] for n in names} == matched and all(n["inferred"] is True for n in names)
    learned = [e for e in ev if e["type"] == "idiom.learned"]
    assert len(learned) == 1  # the distiller proposes the same idiom every time; the rest are deduped
    lib = json.loads(seeded_library.read_text())
    assert len(lib) == 2 and lib[1]["uses"] == m["matched"] - 1

    assert m["label"] == "e2e (mock referee) (fixture target)" and m["fixture"] is True
    assert m["referee"] == "mock" and m["fixture_target"] is True and m["library_backend"] == "local-json"
    assert m["attempts_total"] == sum(1 for e in ev if e["type"] == "attempt.submitted")
    assert m["muse"]["calls"] == len(fake.calls) and m["cost_usd"] == pytest.approx(0.002 * len(fake.calls), abs=1e-4)
    started = ev[0]["payload"]
    assert started["referee"] == "mock" and started["label"] == m["label"] and started["fn_total"] == 8


def test_label_when_only_the_referee_is_mock(crew, monkeypatch):
    monkeypatch.setenv("FRANK_MANIFEST", "crew/bench/out/manifest.json")  # a real (non-fixture) manifest
    r, m, _ = crew("--limit", "1", "--diggers", "1", "--library", "off")
    assert m["label"].endswith("(mock referee)") and "(fixture target)" not in m["label"]
    assert m["fixture"] is True and m["fixture_target"] is False
    assert schema_errors(r.dir / "metrics.json") == []


def test_budget_cap_stops_claiming(crew):
    r, m, fake = crew("--limit", "10", "--diggers", "1", "--library", "off", cost=1.0, budget=5.0)
    ev = read_events(r.dir / "events.jsonl")
    claimed = sum(1 for e in ev if e["type"] == "fn.claimed")
    assert 1 <= claimed < m["fn_total"] == 10
    # the gate is 90% of the budget, checked before every model call; the one Distiller call in flight may
    # land after the last check, so the run ends within one call of the gate
    assert 5 <= len(fake.calls) <= 6 and 4.5 <= m["cost_usd"] <= 6.0
    assert schema_errors(r.dir / "events.jsonl") == [] and schema_errors(r.dir / "metrics.json") == []
    assert ev[-1]["type"] == "run.finished"


def test_fns_selection_and_ordering(crew):
    r, m, _ = crew("--fns", "fn_08000454,fn_0800036C", "--diggers", "1", "--library", "off")
    claimed = [e["fn"] for e in read_events(r.dir / "events.jsonl") if e["type"] == "fn.claimed"]
    assert sorted(claimed) == ["fn_0800036C", "fn_08000454"] and m["fn_total"] == 2


def test_order_functions_leaves_first(crew):
    from crew.config import Config
    from crew.target import Target
    t = Target(Config())
    order = crew_run.order_functions(t, t.game_functions())
    leaf_flags = [len(f["callees"]) > 0 for f in order]
    assert leaf_flags == sorted(leaf_flags)  # all leaves before any caller
    leaves = [f for f in order if not f["callees"]]
    assert [round(f["difficulty"], 2) for f in leaves] == sorted(round(f["difficulty"], 2) for f in leaves)


def test_live_symlink_switches_atomically(crew):
    runs = crew.cfg.runs_dir
    r1, _, _ = crew("--limit", "1", "--diggers", "1", "--library", "off", "--live")
    live = runs / "live"
    assert live.is_symlink() and os.readlink(live) == "r01" and (live / "events.jsonl").exists()
    r2, _, _ = crew("--limit", "1", "--diggers", "1", "--library", "off", "--live")
    assert r2.run_id == "r02" and os.readlink(live) == "r02" and live.resolve() == r2.dir.resolve()
    assert not (runs / ".live.tmp").exists() and not (runs / ".live.tmp").is_symlink()
    r3, _, _ = crew("--limit", "1", "--diggers", "1", "--library", "off")  # without --live: untouched
    assert r3.run_id == "r03" and os.readlink(live) == "r02"


def test_run_ids_increment(crew):
    from crew.run import new_run_id
    runs = crew.cfg.runs_dir
    runs.mkdir(parents=True)
    assert new_run_id(runs) == "r01"
    for n in ("r01", "r09", "rx", "r_asi_01"):
        (runs / n).mkdir()
    assert new_run_id(runs) == "r10"
