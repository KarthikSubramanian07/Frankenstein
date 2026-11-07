"""T4 isolation: the crew can never read answer keys or the visual-only map, however the path is spelled."""
from __future__ import annotations

import os

import pytest

from crew.config import ROOT, Config
from crew.guard import GuardError, check, safe_read
from crew.target import Target


@pytest.mark.parametrize("rel", [
    "lab/secrets/x",
    "lab/secrets",
    "lab/secrets/deep/er/names.json",
    "crew/bench/answers/x",
    "crew/bench/answers/names.json",
    "lab/out/viz_map.json",
    "crew/../lab/secrets/x",
    "crew/bench/out/../answers/bench.h",
    "lab/out/./viz_map.json",
    "lab/out/asm/../viz_map.json",
])
def test_forbidden_paths(rel):
    with pytest.raises(GuardError):
        check(ROOT / rel)
    with pytest.raises(GuardError):
        safe_read(ROOT / rel)


def test_relative_spelling_is_blocked(monkeypatch):
    monkeypatch.chdir(ROOT / "crew")
    with pytest.raises(GuardError):
        check("../lab/secrets/x")
    with pytest.raises(GuardError):
        check("bench/answers/names.json")


def test_symlink_into_secrets_is_blocked(tmp_path):
    link = tmp_path / "innocent.txt"
    os.symlink(ROOT / "lab" / "secrets" / "x", link)
    with pytest.raises(GuardError):
        check(link)
    d = tmp_path / "answers_dir"
    os.symlink(ROOT / "crew" / "bench" / "answers", d)
    with pytest.raises(GuardError):
        safe_read(d / "names.json")


@pytest.mark.parametrize("rel", ["crew/config.py", "contracts/fixtures/manifest.sample.json",
                                 "crew/bench/out/manifest.json", "lab/out/NOTICE.md"])
def test_normal_files_ok(rel):
    assert check(ROOT / rel) == (ROOT / rel).resolve()
    assert safe_read(ROOT / rel)


def test_lookalike_names_are_not_blocked(tmp_path):
    (tmp_path / "secrets_notes.txt").write_text("fine")
    assert safe_read(tmp_path / "secrets_notes.txt") == "fine"
    assert check(ROOT / "lab" / "out" / "viz_map.json.bak")  # only the exact file is visual-only


def test_target_cannot_be_pointed_at_viz_map(monkeypatch):
    monkeypatch.setenv("FRANK_MANIFEST", "lab/out/viz_map.json")
    with pytest.raises(GuardError):
        Target(Config())
