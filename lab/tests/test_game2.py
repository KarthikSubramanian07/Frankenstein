"""Game 2 (Attack on Voxelburg): the referee judges it from its own config. Needs frank-lab and the voxelburg secrets."""
import random

import pytest

from lab.games import load
from lab.referee.core import Referee

GAME = load("voxelburg")
pytestmark = [pytest.mark.integration, pytest.mark.skipif(
    not (GAME["secrets"] / "names.json").exists() or not (GAME["out"] / "manifest.json").exists(),
    reason="voxelburg secrets absent: run lab/build_target.sh voxelburg, dump_target.sh, split.py --game voxelburg")]


@pytest.fixture(scope="module")
def referee():
    return Referee("voxelburg")


def test_original_source_of_five_random_functions_matches(referee):
    game = sorted(f for f, m in referee.functions.items() if m["scope"] == "game" and "." not in referee.names[f]["name"])
    for fn in random.Random(2).sample(game, 5):
        assert referee.self_check(fn)["status"] == "MATCH", (fn, referee.functions[fn]["mode"])


def test_one_line_edit_is_partial(referee):
    fn = next(f for f, v in referee.names.items() if v["name"] == "xgl_init")
    result = referee.self_check(fn, ("xgl_viewport(0, 0, 240, 160);", "xgl_viewport(0, 0, 241, 160);"))
    assert result["status"] == "PARTIAL"
    assert 0 < result["match_pct"] < 100


def test_doom_stays_the_default(referee):
    assert Referee().out != referee.out and referee.out.name == "voxelburg"
