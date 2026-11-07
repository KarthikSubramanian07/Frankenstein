"""lab.score_names: aggregate is right and never leaks a real name."""
import json
import subprocess
import sys
from pathlib import Path

import pytest

from lab import score_names as sn

ROOT = Path(__file__).resolve().parents[2]


def test_tokens_and_similarity():
    assert sn.tokens("X_SetThingState") == ["set", "thing", "state"]
    assert sn.tokens("ST_updateFaceWidget") == ["update", "face", "widget"]
    assert sn.similarity("set_thing_state", "X_SetThingState") == 1.0
    assert sn.similarity("set_state", "X_SetThingState") == 2 / 3
    assert sn.similarity(None, "X_SetThingState") == 0.0


def test_fake_run_aggregate_without_secrets():
    key = {"fn_00000001": {"name": "X_SetThingState"}, "fn_00000002": {"name": "X_DrawStripe"}}
    run = {"run_id": "t", "names": [
        {"fn": "fn_00000001", "name": "set_thing_state"},
        {"fn": "fn_00000002", "name": "draw_span", "subsystem": "render"},
        {"fn": "fn_00000003", "name": None}]}
    agg, _ = sn.score(run, key, {"fn_00000002": "render"})
    assert agg == {"run_id": "t", "fn_count": 3, "in_key": 2, "exact": 1,
                   "mean_similarity": round((1 + 1 / 3) / 3, 4), "subsystem_hits": 1}
    assert "subsystem_hits" not in sn.score({"names": run["names"][:1]}, key)[0]


@pytest.mark.skipif(not sn.KEY.exists(), reason="answer key is on Lane A's machine")
def test_real_rows_output_never_contains_real_name(tmp_path):
    key = json.loads(sn.KEY.read_text())
    rows = [(fn, v["name"]) for fn, v in key.items() if v.get("name") and len(v["name"]) > 4][:5]
    # half exact copies, half garbled, so both branches run
    run = {"v": 1, "run_id": "t", "names": [
        {"fn": fn, "name": real if i % 2 else "zz_guess", "inferred": True, "basis": "test"}
        for i, (fn, real) in enumerate(rows)]}
    f = tmp_path / "names.json"
    f.write_text(json.dumps(run))
    for flags in ([], ["--json"]):
        out = subprocess.run([sys.executable, "-m", "lab.score_names", str(f), *flags],
                             cwd=ROOT, capture_output=True, text=True, check=True)
        text = out.stdout + out.stderr
        for _, real in rows:
            assert real not in text and real.lower() not in text.lower()
    agg = json.loads(out.stdout)
    assert agg["fn_count"] == 5 and agg["exact"] == 2


def test_private_detail_refuses_paths_outside_secrets(tmp_path):
    with pytest.raises(SystemExit):
        sn.private_path(str(tmp_path / "leak.json"))
