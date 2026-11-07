"""Chat answers of the Frankenstein Referee agent, offline: answer() is pure and needs no uagents.
Check and prove use the referee, so the frank-lab container must be running."""
from lab.agents.frankenstein_agent import MAX_MSG_BYTES, answer, respond

FN = "fn_0801B724"


def ask_check(body: str) -> str:
    return f"Does this C match {FN}?\n```c\nint {FN}(const void *e){{ (void)e; {body} }}\n```"


def test_help_for_unrecognised_text():
    assert "Try:" in answer("hello there")


def test_candidates_lists_function_ids():
    reply = answer("Which functions can I try?")
    assert "Smallest functions" in reply and "`fn_" in reply


def test_check_match_has_card():
    text, card = respond(ask_check("return 0;"))
    assert "**MATCH**" in text.splitlines()[0] and FN in text.splitlines()[0]
    assert card["root"]["children"][0] == {"type": "badge", "label": "MATCH", "variant": "success"}


def test_check_rejected_shows_first_difference():
    text, card = respond(ask_check("return 1;"))
    assert "**REJECTED**" in text.splitlines()[0]
    assert "expected  movs\tr0, #0" in text and "produced  movs\tr0, #1" in text
    values = [c.get("value", "") for c in card["root"]["children"]]
    assert any(v.startswith("Expected:") for v in values) and any(v.startswith("Produced:") for v in values)
    assert "**Observed**" in text and "**Inferred**" in text


def test_status_reports_counts():
    assert "Functions recovered and byte-identical" in answer("How much of DOOM is back?")


def test_prove_gives_two_sha1s_and_card():
    text, card = respond("Prove the rebuild is exact")
    assert "Original ROM SHA-1" in text and "ROM built from the agents' code" in text
    assert card["root"]["children"][0]["label"] in ("IDENTICAL", "DIFFERENT")


def test_over_long_message_is_refused_politely():
    reply = answer(ask_check("return 0;" + " " * MAX_MSG_BYTES))
    assert "KB" in reply and "MATCH" not in reply


def test_referee_exception_becomes_busy_reply(monkeypatch):
    import lab.agents.frankenstein_agent as fa

    def broken():
        raise RuntimeError("container gone")
    monkeypatch.setattr(fa, "referee", broken)
    assert answer(ask_check("return 0;")).startswith("The referee is busy; try again in a minute.")


def fake_crew(monkeypatch, src_file, posted):
    """Crew that routes plain words to fn_0801B724 and reports a match."""
    import lab.agents.frankenstein_agent as fa
    route = {"query": "bring back the face", "fns": [FN, "fn_08013A98"], "p": {FN: 0.83, "fn_08013A98": 0.4},
             "basis": "SubQ Snap over the whole-program disassembly"}

    def http(method, url, body=None, **kw):
        if method == "POST":
            posted.append(body)
            return {"job_id": "j1", "fn": FN, "route": route}
        if url.endswith("/jobs/j1"):
            return {"status": "matched", "src_path": str(src_file), "attempts": 2, "cost_usd": 0.1,
                    "evidence": {"judgment": {"route": route, "snap_decisions": [
                        {"attempt": 2, "action": "accept", "confidence": 0.9}]}}}
        return None
    monkeypatch.setattr(fa, "_http", http)


def test_plain_words_recovery_forwards_query_and_reverifies(monkeypatch, tmp_path):
    src = tmp_path / f"{FN}.c"
    src.write_text(f"int {FN}(const void *e){{ (void)e; return 1; }}\n")  # crew says matched; the referee disagrees
    posted = []
    fake_crew(monkeypatch, src, posted)
    reply = answer("bring back Doomguy's face")
    assert posted == [{"query": "bring back Doomguy's face", "live": True, "max_usd": 1.5}]
    assert "**Judgment**" in reply and f"Snap picked `{FN}`" in reply and "Runners-up" in reply
    assert "**REJECTED**" in reply.splitlines()[0]


def test_plain_words_recovery_when_crew_is_down(monkeypatch):
    import lab.agents.frankenstein_agent as fa
    monkeypatch.setattr(fa, "_http", lambda *a, **k: None)
    assert "crew" in answer("bring back Doomguy's face") and "down" in answer("bring back Doomguy's face")


def test_play_lists_devices_and_refuses_unapproved_downloads(monkeypatch, tmp_path):
    import lab.agents.frankenstein_agent as fa
    monkeypatch.setattr(fa, "PLAYER_URL", None)
    dist = tmp_path / "DISTRIBUTION.md"
    dist.write_text("# ROM distribution\n\nStatus: not approved\n")
    monkeypatch.setattr(fa, "DISTRIBUTION", dist)
    reply = answer("let me play the rebuilt Doom on my TV")
    assert "ask the team for the player link" in reply and "Gamepad API" in reply and "Phone browser" in reply
    assert "downloads aren't offered" in reply
    assert "of this build's game code was written by agents and proven" in reply or "not byte-identical" in reply
    dist.write_text("Status: approved\n")
    monkeypatch.setattr(fa, "PLAYER_URL", "https://example.test/play")
    reply = answer("let me play the rebuilt Doom on my TV")
    assert "(https://example.test/play)" in reply and "download the ROM" in reply
