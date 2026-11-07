#!/usr/bin/env python3
"""hackclock: hackathon gates scaled to the real event window, injected into every Claude Code prompt.

Put .hackathon.json in the event repo root:
  {"name": "SpeedHacks", "start": "2026-10-11T11:00:00-07:00",
   "deadline": "2026-10-11T17:00:00-07:00", "judged": "video_at_deadline"}
judged: "live" (table or stage demo; video is backup), "video_at_deadline" (video recorded or
uploaded before the deadline and judged), "video_editable_after" (video link can be added after code freeze).

  hackclock.py             banner for the current moment (use as a UserPromptSubmit hook)
  hackclock.py --plan      full schedule with clock times (paste into PLAN.md at kickoff)
  hackclock.py --selftest
"""
import json
import os
import sys
from datetime import datetime, timedelta

# Eddy's record: rules failed at all four events (05_synthesis/playbook_audit.md), shown at the phase where they bite.
HISTORY = {
    "BEFORE START": "History: sponsor APIs untested before kickoff and no idea process at all 4 events.",
    "SPIKE": "History: Dial was first tested at 12:48 on event day (SpeedHacks).",
    "BUILD": "History: Platypus spent 39 of 183 commits on tests, CI and a Rust port; Mechanica entered 10 tracks.",
    "FREEZE": "History: Platypus merged features until 4:42 against its own 3:45 freeze.",
    "RECORD": "History: Platypus's video was an ad (product at 2:38 of 4:30); Mechanica had no video.",
    "SUBMIT": "History: Platypus repo private for hours, recording stamped 5:02; Mechanica submitted 6 min late.",
    "DEADLINE PASSED": "History: no timed rehearsal at any of 4 events.",
}


def clamp(x, lo, hi):
    return max(lo, min(hi, x))


def gates(start, deadline, judged):
    """Ordered (time, phase, rule) list. All buffers scale with the window and are clamped."""
    w = (deadline - start).total_seconds() / 60
    m = lambda minutes: timedelta(minutes=minutes)
    submit = deadline - m(clamp(0.05 * w, 30, 60))
    video_len = clamp(0.10 * w, 45, 120) if judged != "live" else clamp(0.05 * w, 20, 60)
    record = submit - m(video_len)
    freeze = min(start + m(w * 2 / 3), record - m(clamp(0.15 * w, 30, 300)))
    timebox = round(clamp(0.10 * w, 30, 120))
    record_rule = ("Record the REAL product in one take; product on screen in the first 10 s; no produced ad."
                   if judged != "live" else "Record a backup video of the real run; rehearse the live pitch.")
    return [
        (start, "SPIKE", "Deploy hello world to a public URL. Spike only the riskiest assumption; if it fails, change the plan."),
        (start + m(clamp(0.10 * w, 30, 120)), "SKELETON", "Walking skeleton of the whole demo path, hardcoded is fine. Nothing else starts first."),
        (start + m(0.25 * w), "BUILD", f"Each feature must make the demo better; timebox {timebox} min. No tests, CI, security work, logos or ads beyond what protects the demo. Ask 'can we demo right now?' every {timebox} min."),
        (freeze, "FREEZE", "No new features. Harden the demo path: fresh-state runs with reset, repo PUBLIC, seed data, write the README."),
        (record, "RECORD", record_rule),
        (submit, "SUBMIT", "Disqualifier audit now (repo public, video length, tracks, teammates listed), then SUBMIT and confirm the status says submitted."),
        (deadline, "DEADLINE PASSED", "Do not touch code. Rehearse the pitch out loud 3 times with a timer."),
    ]


def banner(cfg, now):
    start, deadline = (datetime.fromisoformat(cfg[k]) for k in ("start", "deadline"))
    now = now.astimezone(start.tzinfo)
    g = gates(start, deadline, cfg.get("judged", "live"))
    past = [x for x in g if x[0] <= now]
    phase, rule = (past[-1][1], past[-1][2]) if past else (
        "BEFORE START", "Lock the idea and target prize, test every sponsor API, write the click-by-click demo script.")
    nxt = next((x for x in g if x[0] > now), None)
    left = int((deadline - now).total_seconds() // 60)
    lines = [
        f"[hackclock] {cfg.get('name', 'hackathon')} {now:%a %H:%M} | {left} min to deadline {deadline:%a %H:%M} | phase {phase}"
        + (f" | next {nxt[1]} at {nxt[0]:%a %H:%M}" if nxt else ""),
        f"NOW: {rule}",
        HISTORY.get(phase, ""),
        "If the user asks for work that breaks the current phase rule, say so before doing it.",
    ]
    return "\n".join(x for x in lines if x)


def plan(cfg):
    start, deadline = (datetime.fromisoformat(cfg[k]) for k in ("start", "deadline"))
    return "\n".join(f"{t:%a %H:%M}  {p:<16} {r}" for t, p, r in gates(start, deadline, cfg.get("judged", "live")))


def selftest():
    t = datetime.fromisoformat
    # SpeedHacks: 6 h window, judged video due at the deadline.
    g = {p: ts for ts, p, _ in gates(t("2026-10-11T11:00:00-07:00"), t("2026-10-11T17:00:00-07:00"), "video_at_deadline")}
    assert g["SUBMIT"] == t("2026-10-11T16:30:00-07:00"), g["SUBMIT"]
    assert g["RECORD"] == t("2026-10-11T15:45:00-07:00"), g["RECORD"]
    assert g["FREEZE"] == t("2026-10-11T14:51:00-07:00"), g["FREEZE"]
    # 36 h overnight (Cal Hacks shape): freeze falls at two thirds of the window.
    g = {p: ts for ts, p, _ in gates(t("2026-10-23T21:00:00-07:00"), t("2026-10-25T09:00:00-07:00"), "live")}
    assert g["FREEZE"] == t("2026-10-24T21:00:00-07:00"), g["FREEZE"]
    assert g["SUBMIT"] == t("2026-10-25T08:00:00-07:00"), g["SUBMIT"]
    cfg = {"start": "2026-10-11T11:00:00-07:00", "deadline": "2026-10-11T17:00:00-07:00", "judged": "video_at_deadline"}
    assert "phase FREEZE" in banner(cfg, t("2026-10-11T15:00:00-07:00"))
    assert "phase BEFORE START" in banner(cfg, t("2026-10-11T10:00:00-07:00"))
    print("selftest ok")


def main():
    if "--selftest" in sys.argv:
        return selftest()
    path = os.path.join(os.environ.get("CLAUDE_PROJECT_DIR", os.getcwd()), ".hackathon.json")
    if not os.path.exists(path):
        return  # no event config: stay silent so the hook is harmless outside hackathons
    with open(path) as f:
        cfg = json.load(f)
    print(plan(cfg) if "--plan" in sys.argv else banner(cfg, datetime.now().astimezone()))


if __name__ == "__main__":
    main()
