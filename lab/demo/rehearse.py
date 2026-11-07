"""Rehearse every Lane A demo beat against the live referee. Stdlib only.

    python3 -m lab.demo.rehearse        # exits 1 if any beat fails

Overwrites lab/out/rebuilt.gba and lab/out/patched.gba (same as the live demo does). Starts or stops nothing.
"""
import json
import subprocess
import sys
import time
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
REFEREE = "http://127.0.0.1:7101"
FN = "fn_0801B724"
WRONG, RIGHT = "int fn_0801B724(void) { return 1; }\n", "int fn_0801B724(void) { return 0; }\n"
RECOVERED = "crew/exports/doom_r01/recovered"
AGENTS = {"lab.agents.frankenstein_agent": "/tmp/cv/agent.log", "lab.agents.excavator_agent": "/tmp/excavator.log"}
PUBLISHED = "Manifest published successfully"


def call(path: str, body: dict | None = None, timeout: float = 180) -> dict:
    data = None if body is None else json.dumps(body).encode()
    req = urllib.request.Request(REFEREE + path, data=data, headers={"Content-Type": "application/json"})
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return json.loads(r.read())


def beat_health():
    h = call("/health", timeout=5)
    assert h.get("ok") and h.get("mock") is False, f"referee not real/healthy: {h}"
    return "referee real on :7101"


def beat_reject():
    r = call("/check", {"fn": FN, "src": WRONG})
    assert r["status"] != "MATCH" and r.get("first_diff"), f"expected rejection with first_diff, got {r['status']}"
    d = r["first_diff"]
    return f"{r['status']} {r['match_pct']}%  first_diff @+{d['offset']}: expected `{d.get('expected_ins')}` got `{d.get('got_ins')}`"


def beat_match():
    r = call("/check", {"fn": FN, "src": RIGHT})
    assert r["status"] == "MATCH" and r["lint"]["ok"], f"expected MATCH, got {r['status']} lint={r['lint']}"
    return f"MATCH 100%  ({r['elapsed_ms']} ms)"


def beat_rebuild():
    r = call("/rebuild", {"recovered_dir": RECOVERED})
    assert r.get("identical") is True, f"rebuild not identical: {r}"
    return f"identical  sha1 {r['rom_sha1'][:12]}  recovered {r['recovered']}  agent code {r.get('pct_agent_code')}%"


def beat_patch():
    r = call("/patch", {"fn": FN, "src": WRONG})
    assert r.get("changed_functions") == [FN], f"changed_functions={r.get('changed_functions')} {r.get('error', '')}"
    return f"changed_functions {r['changed_functions']}  unchanged {r['unchanged']}  sha1 {r['rom_sha1'][:12]}"


def beat_static_face():
    p = subprocess.run([sys.executable, "-m", "lab.demo.build_demo_roms"], cwd=REPO, capture_output=True, text=True, timeout=300)
    last = (p.stdout.strip().splitlines() or [p.stderr.strip()[-200:]])[-1]
    assert p.returncode == 0 and "fn_0801B298" in last, f"exit {p.returncode}: {last}"
    return last


def beat_memory_probe():
    path = REPO / "lab/out/memory_probe.json"
    if not path.exists():
        return "not run yet (lab/out/memory_probe.json missing)"
    m = json.loads(path.read_text())
    u, v = m["unmodified"], m["variant"]
    return (f"{m['fn_count']} fns, {m['model']}: unmodified {u['matched']} MATCH (mean {u['mean_pct']}%)  "
            f"vs variant {v['matched']} MATCH (mean {v['mean_pct']}%)")


def beat_agents():
    out = []
    for mod, log in AGENTS.items():
        alive = subprocess.run(["pgrep", "-f", mod], capture_output=True).returncode == 0
        text = Path(log).read_text(errors="replace") if Path(log).exists() else ""
        assert alive, f"{mod} not running (start lab/agents/run_*.sh)"
        assert PUBLISHED in text, f"{log} has no '{PUBLISHED}'"
        out.append(mod.rsplit(".", 1)[1])
    return "alive + published: " + ", ".join(out)


BEATS = [("health", beat_health), ("reject", beat_reject), ("match", beat_match), ("rebuild", beat_rebuild),
         ("patch", beat_patch), ("static-face", beat_static_face), ("memory-probe", beat_memory_probe),
         ("agents", beat_agents)]


def main() -> int:
    failed = 0
    for name, fn in BEATS:
        t = time.monotonic()
        try:
            status, msg = "PASS", fn()
        except Exception as e:  # any failure, including HTTP errors and timeouts, is one FAIL line
            status, msg, failed = "FAIL", f"{type(e).__name__}: {e}", failed + 1
        print(f"{status}  {name:13s} {time.monotonic() - t:6.2f}s  {msg}", flush=True)
    print(f"{len(BEATS) - failed}/{len(BEATS)} beats PASS")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
