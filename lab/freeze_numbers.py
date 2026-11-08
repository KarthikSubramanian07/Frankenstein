"""Write the frozen numbers into every judge-facing file Lane A owns, in one pass.

Run after Lane B's 16:00 freeze:  python3 -m lab.freeze_numbers [--dry-run]
Numbers come only from `tools/counts.py` (repo-only) and a fresh `rebuild` of crew/exports/union/recovered;
it refuses unless the rebuild is identical and splices exactly counts.py's function count.
"""
import json
import re
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]


def _json_tail(out: str) -> dict:
    return json.loads(out[out.index("{"):])


def frozen() -> dict:
    counts = _json_tail(subprocess.run([sys.executable, "tools/counts.py"], cwd=REPO, capture_output=True,
                                       text=True, check=True).stdout)
    out = subprocess.run([sys.executable, "-m", "lab.referee", "rebuild", "--recovered",
                          "crew/exports/union/recovered", "--json"], cwd=REPO, capture_output=True, text=True)
    rebuild = json.loads(out.stdout.strip().splitlines()[-1])
    if not rebuild.get("identical") or rebuild["recovered"] != counts["functions"]:
        raise SystemExit(f"refusing: rebuild identical={rebuild.get('identical')} recovered={rebuild.get('recovered')} "
                         f"vs counts.py functions={counts['functions']}")
    return {"X": counts["functions"], "Y": counts["pct_bytes"], "L": counts["false_claims_caught"],
            "F": counts["fakes_rejected"], "sha1": rebuild["rom_sha1"]}


def edits(n: dict) -> dict:
    x, y, lies, fakes = n["X"], n["Y"], n["L"], n["F"]
    num = r"\b(?:1[5-9]\d|2\d\d)\b"  # a stale function count (150 to 299)
    return {
        "docs/FILM_SCRIPT.md": [(r"\[\d+\]", f"{x}"), (num + r"(?= of (Doom's )?568)", f"{x}"), (r"\b\d\d / \d\d / 0", f"{lies} / {fakes} / 0")],
        "docs/SUBMISSION.md": [(r"\[X\]", f"{x}"), (r"\[Y\]", f"{y}"), (r"\b3\d fakes", f"{fakes} fakes"),
                               (num + r"(?= of (Doom's )?568)", f"{x}"), (r"\| \d{1,2}\.\d\d%", f"| {y}%")],
        "docs/DEMO_SCRIPT_V2.md": [(r"0\.2 s, 24, " + num + ", " + num, f"0.2 s, {lies}, {x}, {x}"),
                                   (num + r"(?= (of 568|rebuilt|agent-written|of Doom's|functions))", f"{x}"),
                                   (r"\b\d{1,2}\.\d\d%(?= of the code)", f"{y}%"), (r"\b3\d fakes", f"{fakes} fakes")],
        "lab/FETCH_SUBMISSION.md": [(num + r"(?= agent-written)", f"{x}")],
        "lab/agents/AGENT_README.md": [(num + r"(?= of its 568)", f"{x}")],
        "lab/agents/EXCAVATOR_README.md": [(num + r"(?= of its 568)", f"{x}")],
        "lab/film/src/data.ts": [(r"functions: \d+", f"functions: {x}"), (r"pctBytes: [\d.]+", f"pctBytes: {y}"),
                                 (r"liesCaught: \d+", f"liesCaught: {lies}"),
                                 (r"fakesRejected: \d+", f"fakesRejected: {fakes}"),
                                 (r"PLACEHOLDER until the 16:00 freeze", "frozen at 16:00")],
    }


def main() -> None:
    dry = "--dry-run" in sys.argv
    n = frozen()
    print("frozen:", n)
    for rel, subs in edits(n).items():
        path = REPO / rel
        text = path.read_text()
        new = text
        for pattern, repl in subs:
            new = re.sub(pattern, repl, new)
        changed = sum(a != b for a, b in zip(text.splitlines(), new.splitlines()))
        print(f"{rel}: {changed} line(s) {'would change' if dry else 'changed'}")
        if not dry and new != text:
            path.write_text(new)


if __name__ == "__main__":
    main()
