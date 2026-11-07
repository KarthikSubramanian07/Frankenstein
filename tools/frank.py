#!/usr/bin/env python3
"""frank: run FRANKENSTEIN as one product. Python 3.11+, standard library only.

    python3 tools/frank.py up [--mode replay|live] [--run <run_id | crew/exports/<id> | runs/<id>>]
    python3 tools/frank.py status [--json]
    python3 tools/frank.py down
    python3 tools/frank.py preflight
    python3 tools/frank.py logs <service> [-n 40]
    python3 tools/frank.py rehearse [--run doom_r01] [--pace 1]
    python3 tools/frank.py demo-live [--pick 2] [--no-live] [--yes]

`up` starts every lane in order as background processes (logs in runs/_logs/<service>.log, pids in
runs/_pids.json), waits for each one's health check, and skips anything already healthy on its port.
`replay` (the default) spends nothing: runs/live points at a finished real run. `live` also starts the
budgeted crew run with the Play-to-recover director, which calls Muse and SubQ Snap and spends money.
frank only launches each lane's own documented entry point; it never edits a lane's code or files.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import shlex
import shutil
import signal
import socket
import subprocess
import sys
import time
import urllib.error
import urllib.request
from dataclasses import dataclass, field
from datetime import datetime, timezone
from pathlib import Path
from typing import Callable

REPO = Path(__file__).resolve().parents[1]
RUNS = REPO / "runs"
LOGS = RUNS / "_logs"
PIDS = RUNS / "_pids.json"
EXPORTS = REPO / "crew" / "exports"
LIVE = RUNS / "live"
PY = str(REPO / ".venv" / "bin" / "python") if (REPO / ".venv" / "bin" / "python").exists() else sys.executable
FACE_FN = "fn_0801B298"  # the face function (DECISIONS 12:20, B)
LIVE_ARGS = ("--live --director --split train --library learning --library-path runs/_doom_lib.json "
             "--diggers 6 --max-size 200 --budget-usd 4")

# ---------- terminal look ----------
COLOR = sys.stdout.isatty() and not os.environ.get("NO_COLOR")


def _c(code: str, s: str) -> str:
    return f"\033[{code}m{s}\033[0m" if COLOR else s


def green(s): return _c("32", s)
def red(s): return _c("31", s)
def yellow(s): return _c("33", s)
def dim(s): return _c("2", s)
def bold(s): return _c("1", s)
def violet(s): return _c("35", s)


OK, BAD, SKIP, MISS = green("✓"), red("✗"), dim("○"), yellow("!")


def visible_len(s: str) -> int:
    out, i = 0, 0
    while i < len(s):
        if s[i] == "\033":
            while i < len(s) and s[i] != "m":
                i += 1
        else:
            out += 1
        i += 1
    return out


def pad(s: str, w: int) -> str:
    return s + " " * max(0, w - visible_len(s))


def table(headers: list[str], rows: list[list[str]], extra: dict[int, list[str]] | None = None) -> str:
    widths = [max(visible_len(r[i]) for r in [headers] + rows) for i in range(len(headers))]
    line = lambda r: "  " + "  ".join(pad(c, widths[i]) for i, c in enumerate(r)).rstrip()
    out = [bold(line(headers)), dim("  " + "  ".join("─" * w for w in widths))]
    for i, r in enumerate(rows):
        out.append(line(r))
        for x in (extra or {}).get(i, []):
            out.append(dim("      │ " + x[:150]))
    return "\n".join(out)


# ---------- small helpers ----------
def read_env() -> dict[str, str]:
    """.env as a dict (values never printed), overlaid by the real environment."""
    env: dict[str, str] = {}
    p = REPO / ".env"
    if p.exists():
        for raw in p.read_text().splitlines():
            line = raw.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            k, v = line.split("=", 1)
            env[k.strip()] = v.split(" #", 1)[0].strip().strip('"').strip("'")
    for k, v in os.environ.items():
        if v:
            env[k] = v
    return env


def http_get(url: str, timeout: float = 1.5) -> tuple[int, str]:
    try:
        with urllib.request.urlopen(url, timeout=timeout) as r:
            return r.status, r.read(4096).decode("utf-8", "replace")
    except urllib.error.HTTPError as e:
        return e.code, ""
    except Exception:
        return 0, ""


def http_post(url: str, body: dict, timeout: float = 10) -> tuple[int, dict]:
    req = urllib.request.Request(url, data=json.dumps(body).encode(), headers={"Content-Type": "application/json"})
    try:
        with urllib.request.urlopen(req, timeout=timeout) as r:
            return r.status, json.loads(r.read() or b"{}")
    except urllib.error.HTTPError as e:
        return e.code, {}
    except Exception:
        return 0, {}


def port_open(port: int, host: str = "127.0.0.1") -> bool:
    with socket.socket() as s:
        s.settimeout(0.4)
        return s.connect_ex((host, port)) == 0


def port_owner(port: int) -> tuple[int | None, str]:
    """(pid, command name) of whatever listens on the port, via lsof when it exists."""
    if not shutil.which("lsof"):
        return None, ""
    try:
        out = subprocess.run(["lsof", "-nP", f"-iTCP:{port}", "-sTCP:LISTEN", "-Fpc"], capture_output=True,
                             text=True, timeout=3).stdout
    except Exception:
        return None, ""
    pid, name = None, ""
    for line in out.splitlines():
        if line.startswith("p") and pid is None:
            pid = int(line[1:])
        elif line.startswith("c") and not name:
            name = line[1:]
    return pid, name


def alive(pid: int | None) -> bool:
    if not pid:
        return False
    try:
        os.kill(pid, 0)
    except ProcessLookupError:
        return False
    except PermissionError:
        return True
    try:  # a zombie child of ours still answers kill(0)
        st = subprocess.run(["ps", "-o", "stat=", "-p", str(pid)], capture_output=True, text=True, timeout=2).stdout
        return bool(st.strip()) and not st.strip().startswith("Z")
    except Exception:
        return True


PROBE = ('"GET / HTTP', '"GET /health', '"GET /heartbeat', "GET /health", "GET / 200")


def tail(path: Path, n: int = 3) -> list[str]:
    """Last n meaningful log lines; frank's own health probes are skipped."""
    try:
        lines = path.read_text(errors="replace").splitlines()
    except OSError:
        return []
    return [l for l in lines if l.strip() and not any(x in l for x in PROBE)][-n:]


def load_pids() -> dict:
    try:
        return json.loads(PIDS.read_text())
    except (OSError, json.JSONDecodeError):
        return {"services": {}}


def save_pids(state: dict) -> None:
    RUNS.mkdir(exist_ok=True)
    tmp = PIDS.with_suffix(".tmp")
    tmp.write_text(json.dumps(state, indent=1))
    os.replace(tmp, PIDS)


def rel(p: Path) -> str:
    try:
        return str(p.resolve().relative_to(REPO))
    except ValueError:
        return str(p)


# ---------- services ----------
@dataclass
class Service:
    name: str
    lane: str
    cmd: list[str]
    port: int | None = None
    health: str | None = None              # URL; otherwise a port check (or process check if no port)
    extra_ports: list[int] = field(default_factory=list)
    cwd: Path = REPO
    wait_s: float = 15
    modes: tuple[str, ...] = ("replay", "live")
    requires: Callable[[dict], tuple[bool, str]] | None = None   # -> (ok, "why not + exact command")
    optional: bool = False                 # skipped by design, not a failure

    def check(self) -> tuple[bool, str]:
        """(healthy, detail). Health = HTTP 200 on the health URL, or the port answering."""
        if self.health:
            code, body = http_get(self.health)
            if code == 200:
                try:
                    j = json.loads(body)
                    bits = [f"{k}={j[k]}" for k in ("mock", "model", "live", "source_status", "run_id") if k in j]
                    if "boosted" in j:
                        bits.append(f"boosted={len(j['boosted'] or [])}")
                    return True, " ".join(bits)
                except (json.JSONDecodeError, TypeError):
                    return True, ""
            return False, f"HTTP {code}" if code else "no answer"
        if self.port:
            return (True, "") if port_open(self.port) else (False, "port closed")
        return False, ""

    @property
    def ports(self) -> list[int]:
        return ([self.port] if self.port else []) + self.extra_ports


def _have(path: Path, cmd: str) -> Callable[[dict], tuple[bool, str]]:
    return lambda env: (True, "") if path.exists() else (False, f"missing {rel(path)}: run `{cmd}`")


def _agent_ok(env: dict) -> tuple[bool, str]:
    if not env.get("AGENTVERSE_API_KEY"):
        return False, "skipped: no AGENTVERSE_API_KEY in .env"
    if not env.get("FRANKENSTEIN_AGENT_SEED"):
        # run_agent.sh would mint a new seed (a different agent address) and append it to .env
        return False, ("skipped: no FRANKENSTEIN_AGENT_SEED in .env (the registered agent's seed lives on the "
                       "machine that owns it; add it here, then `bash lab/agents/run_agent.sh`)")
    return True, ""


def _phone_ok(env: dict) -> tuple[bool, str]:
    core = REPO / "creature" / "phone" / "core" / "mgba.js"
    if not core.exists():
        return False, ("missing creature/phone/core: run `cd creature/phone && npm install --ignore-scripts "
                       "&& npm run prepare:core`")
    return True, ""


def services(env: dict, mode: str, live_args: str) -> list[Service]:
    stage = REPO / "stage"
    phone_cmd = [PY, "server.py"] + (["--rom", env["FRANK_PHONE_ROM"]] if env.get("FRANK_PHONE_ROM") else [])
    return [
        Service("referee", "A lab", [PY, "-m", "lab.referee", "serve"], 7101, "http://127.0.0.1:7101/health",
                wait_s=20, requires=_have(REPO / "lab" / "out" / "manifest.json", "git pull")),
        Service("crew-api", "B crew", [PY, "-m", "crew.serve", "--port", "7111"], 7111,
                "http://127.0.0.1:7111/health"),
        Service("stage-server", "C stage", ["npm", "run", "server"], 7201, "http://127.0.0.1:7201/health",
                extra_ports=[7202], cwd=stage),
        Service("stage-page", "C stage", ["npm", "run", "dev"], 5173, "http://127.0.0.1:5173/", cwd=stage, wait_s=25),
        Service("bridge", "D creature", [PY, "-m", "creature.bridge", "--events", "runs/live/events.jsonl",
                                         "--manifest", "lab/out/manifest.json", "--viz-map", "lab/out/viz_map.json"],
                7301, "http://127.0.0.1:7304/health", extra_ports=[7300, 7304],
                requires=_have(REPO / "lab" / "out" / "viz_map.json", "git pull")),
        Service("overlay", "D creature", [PY, "creature/overlay/serve.py"], 7302, "http://127.0.0.1:7302/"),
        Service("phone", "D creature", phone_cmd, 7401, "http://127.0.0.1:7401/", cwd=REPO / "creature" / "phone",
                requires=_phone_ok, optional=True),
        Service("asi-agent", "A lab", ["bash", "lab/agents/run_agent.sh"], 8001, None, wait_s=90,
                requires=_agent_ok, optional=True),
        Service("crew-live", "B crew", [PY, "-m", "crew.run"] + shlex.split(live_args), 7112,
                "http://127.0.0.1:7112/heartbeat", modes=("live",), wait_s=60),
        Service("director-feed", "D creature", [PY, "-m", "creature.bridge.director_adapter", "--forward",
                                                "--shots-root", "creature/shots"], None, None, modes=("live",)),
    ]


def svc_state(s: Service, state: dict) -> dict:
    """What we know about one service right now: ours/external, pid, healthy."""
    rec = state.get("services", {}).get(s.name)
    pid = rec.get("pid") if rec else None
    ours = bool(rec) and alive(pid)
    healthy, detail = s.check()
    if not s.port and not s.health:
        healthy, detail = ours, ("forwarding" if ours else "")
    ext_pid = None
    if healthy and not ours and s.port:
        ext_pid, ext_name = port_owner(s.port)
        detail = (detail + " " if detail else "") + f"(already running: {ext_name or 'external'})"
    return {"ours": ours, "pid": pid if ours else ext_pid, "healthy": healthy, "detail": detail.strip(),
            "exited": bool(rec) and not ours, "rec": rec}


# ---------- replay target ----------
def resolve_run(arg: str | None) -> Path:
    if not arg:
        cands = sorted([p.parent for p in EXPORTS.glob("*/EXPORT.json") if p.parent.name.startswith("doom")],
                       key=lambda p: p.name)
        if not cands:
            cands = sorted(p.parent for p in EXPORTS.glob("*/EXPORT.json"))
        if not cands:
            sys.exit("no export in crew/exports/: pass --run <run dir>")
        return cands[0]
    for p in (Path(arg), REPO / arg, RUNS / arg, EXPORTS / arg):
        if (p / "events.jsonl").exists():
            return p.resolve()
    sys.exit(f"--run {arg}: no events.jsonl in {arg}, runs/{arg} or crew/exports/{arg}")


def point_live(target: Path) -> str:
    """Atomically switch runs/live to the target run (relative symlink), like crew.run --live does."""
    if LIVE.exists() and not LIVE.is_symlink():
        sys.exit("runs/live is a real directory, not a symlink: move it aside first")
    target = target.resolve()
    run_id = target.name
    # Give exports a runs/<id> name too, so the Stage's ?replay=<id> and /runs/<id>/metrics.json resolve.
    alias = RUNS / run_id
    if not alias.exists() and not alias.is_symlink() and target.parent != RUNS.resolve():
        os.symlink(os.path.relpath(target, RUNS), alias)
    link = os.path.relpath(target, RUNS)
    tmp = RUNS / ".live.frank.tmp"
    if tmp.is_symlink() or tmp.exists():
        tmp.unlink()
    os.symlink(link, tmp)
    os.replace(tmp, LIVE)
    return link


# ---------- up ----------
def cmd_up(a) -> int:
    env = read_env()
    LOGS.mkdir(parents=True, exist_ok=True)
    state = load_pids()
    state.setdefault("services", {})
    if a.mode == "live" and not a.yes_spend:
        print(yellow("live mode starts a real crew run that spends money (Muse + SubQ Snap, --budget-usd 4)."))
        print("Re-run with --yes-spend (make up MODE=live ARGS=--yes-spend) once you mean it.")
        return 2

    print(bold(f"\nFRANKENSTEIN · up · {a.mode}\n"))
    if a.mode == "replay":
        target = resolve_run(a.run)
        link = point_live(target)
        state["replay"] = {"run_id": target.name, "target": rel(target), "link": link}
        print(f"  {OK} runs/live -> {link}  {dim('(replay: no model spend)')}")
    else:
        state.pop("replay", None)
    state["mode"] = a.mode
    state["started"] = datetime.now(timezone.utc).isoformat(timespec="seconds")
    save_pids(state)

    _ensure_referee_container()
    if not (REPO / "stage" / "node_modules").exists():
        _npm_install()

    failed = 0
    for s in services(env, a.mode, a.crew_args or env.get("FRANK_LIVE_ARGS") or LIVE_ARGS):
        if a.mode not in s.modes:
            continue
        if s.name == "asi-agent" and a.no_agent:
            print(f"  {SKIP} {pad(s.name, 14)} {dim('skipped (--no-agent)')}")
            continue
        if s.requires:
            ok, why = s.requires(env)
            if not ok:
                mark = SKIP if s.optional else MISS
                print(f"  {mark} {pad(s.name, 14)} {dim(why)}")
                state["services"].pop(s.name, None)
                failed += 0 if s.optional else 1
                continue
        cur = svc_state(s, state)
        if cur["healthy"]:
            print(f"  {OK} {pad(s.name, 14)} {dim('healthy, left as is ' + cur['detail'])}")
            continue
        busy = [p for p in s.ports if port_open(p)]
        if busy and s.port and not cur["ours"]:
            pid, name = port_owner(busy[0])
            print(f"  {BAD} {pad(s.name, 14)} port {busy[0]} is held by {name or '?'} (pid {pid}), not healthy")
            failed += 1
            continue
        ok = _start(s, state)
        failed += 0 if ok else 1
    print()
    print(dim("  logs: runs/_logs/<service>.log · stop: make down · board: make status"))
    print()
    return cmd_status(argparse.Namespace(json=False)) or (1 if failed else 0)


def _ensure_referee_container() -> None:
    """lab/setup_referee.sh once: it starts the devkitARM container the referee compiles in."""
    if port_open(7101) or not shutil.which("docker"):
        return
    try:
        names = subprocess.run(["docker", "ps", "--format", "{{.Names}}"], capture_output=True, text=True,
                               timeout=10).stdout.split()
    except Exception:
        names = []
    if "frank-lab" in names:
        return
    print(f"  {dim('…')} lab/setup_referee.sh (starts the frank-lab container; first time pulls ~2 GB)")
    with open(LOGS / "referee-setup.log", "a") as log:
        rc = subprocess.run(["bash", "lab/setup_referee.sh"], cwd=REPO, stdout=log, stderr=subprocess.STDOUT).returncode
    print(f"  {OK if rc == 0 else BAD} referee container {'ready' if rc == 0 else 'failed: see runs/_logs/referee-setup.log'}")


def _npm_install() -> None:
    print(f"  {dim('…')} stage: npm install (node_modules missing)")
    with open(LOGS / "stage-install.log", "a") as log:
        rc = subprocess.run(["npm", "install", "--no-audit", "--no-fund"], cwd=REPO / "stage", stdout=log,
                            stderr=subprocess.STDOUT).returncode
    print(f"  {OK if rc == 0 else BAD} stage dependencies {'installed' if rc == 0 else 'failed: see runs/_logs/stage-install.log'}")


def _start(s: Service, state: dict) -> bool:
    log_path = LOGS / f"{s.name}.log"
    with open(log_path, "a") as log:
        log.write(f"\n--- frank up {datetime.now().isoformat(timespec='seconds')} · {shlex.join(s.cmd)} (cwd {rel(s.cwd)})\n")
        log.flush()
        try:
            p = subprocess.Popen(s.cmd, cwd=s.cwd, stdout=log, stderr=subprocess.STDOUT, stdin=subprocess.DEVNULL,
                                 start_new_session=True, env={**os.environ, "PYTHONUNBUFFERED": "1"})
        except FileNotFoundError as e:
            print(f"  {BAD} {pad(s.name, 14)} cannot start: {e}")
            return False
    state["services"][s.name] = {"pid": p.pid, "pgid": p.pid, "cmd": shlex.join(s.cmd), "cwd": rel(s.cwd),
                                 "log": rel(log_path), "port": s.port, "started": time.time()}
    save_pids(state)
    t0 = time.time()
    while time.time() - t0 < s.wait_s:
        if p.poll() is not None:
            print(f"  {BAD} {pad(s.name, 14)} exited with code {p.returncode}")
            for line in tail(log_path, 4):
                print(dim("      │ " + line[:150]))
            return False
        ok, detail = s.check()
        if not s.port and not s.health:
            ok = time.time() - t0 > 1.5  # process-only service: alive after a moment is all we can say
        if ok:
            print(f"  {OK} {pad(s.name, 14)} started  pid {p.pid}  {dim(f'{time.time() - t0:.1f} s ' + detail)}")
            return True
        time.sleep(0.3)
    print(f"  {BAD} {pad(s.name, 14)} started (pid {p.pid}) but not healthy after {s.wait_s:.0f} s")
    for line in tail(log_path, 4):
        print(dim("      │ " + line[:150]))
    return False


# ---------- down ----------
def cmd_down(a) -> int:
    state = load_pids()
    svcs = state.get("services", {})
    if not svcs:
        print("  nothing frank started is recorded in runs/_pids.json")
        return 0
    print(bold("\nFRANKENSTEIN · down\n"))
    for name in reversed(list(svcs)):
        rec = svcs[name]
        pid = rec.get("pid")
        if not alive(pid):
            print(f"  {SKIP} {pad(name, 14)} {dim('already stopped')}")
            continue
        _stop(pid, rec.get("pgid") or pid)
        print(f"  {OK if not alive(pid) else BAD} {pad(name, 14)} stopped  {dim(f'pid {pid}')}")
    state["services"] = {}
    save_pids(state)
    target = os.readlink(LIVE) if LIVE.is_symlink() else None
    print(dim(f"\n  runs/live still points at {target} (left as is). Services frank did not start are untouched."))
    return 0


def _stop(pid: int, pgid: int) -> None:
    for sig, wait in ((signal.SIGTERM, 5.0), (signal.SIGKILL, 2.0)):
        try:
            os.killpg(pgid, sig)
        except ProcessLookupError:
            return
        except PermissionError:
            try:
                os.kill(pid, sig)
            except ProcessLookupError:
                return
        t0 = time.time()
        while time.time() - t0 < wait:
            try:
                os.waitpid(pid, os.WNOHANG)
            except ChildProcessError:
                pass
            if not alive(pid):
                return
            time.sleep(0.1)


# ---------- the run on stage ----------
def run_summary(run_dir: Path) -> dict | None:
    ev = run_dir / "events.jsonl"
    if not ev.exists():
        return None
    s = {"run_id": run_dir.resolve().name, "label": "", "fn_total": None, "matched": set(), "abandoned": 0, "lies": 0,
         "tick_lies": 0, "cost": None, "elapsed": None, "finished": None, "build": None, "swapped": None,
         "patch": None, "phone": None, "snap": {}, "last_ts": None, "fixture": False, "events": 0}
    with ev.open(errors="replace") as f:
        for line in f:
            try:
                e = json.loads(line)
            except json.JSONDecodeError:
                continue
            s["events"] += 1
            t, p = e.get("type"), e.get("payload") or {}
            s["last_ts"] = e.get("ts") or s["last_ts"]
            if t == "fixture":
                s["fixture"] = True
            elif t == "run.started":
                s["fn_total"], s["label"] = p.get("fn_total"), p.get("label") or ""
            elif t == "fn.matched" and e.get("fn"):
                s["matched"].add(e["fn"])
            elif t == "fn.abandoned":
                s["abandoned"] += 1
            elif t == "verdict" and p.get("claim_was_true") is False:
                s["lies"] += 1
            elif t == "metric.tick":
                s["cost"], s["elapsed"] = p.get("cost_usd"), p.get("elapsed_s")
                s["tick_lies"] = p.get("false_claims") or 0
            elif t == "run.finished":
                s["finished"] = p
                s["cost"], s["elapsed"] = p.get("cost_usd", s["cost"]), p.get("elapsed_s", s["elapsed"])
            elif t == "build.rom":
                s["build"] = p
            elif t == "rom.swapped":
                s["swapped"] = p
            elif t == "patch.verified":
                s["patch"] = p
            elif t == "phone.published":
                s["phone"] = p
            elif t == "snap.decision":
                op = p.get("op", "?")
                s["snap"][op] = s["snap"].get(op, 0) + 1
    try:
        s["fixture"] = s["fixture"] or bool(json.loads((run_dir / "metrics.json").read_text()).get("fixture"))
    except (OSError, json.JSONDecodeError):
        pass
    s["lies"] = max(s["lies"], s["tick_lies"])
    s["face"] = FACE_FN in s["matched"]
    s["matched"] = len(s["matched"])
    return s


def _age(ts: str | None) -> str:
    if not ts:
        return "?"
    try:
        d = time.time() - datetime.fromisoformat(ts.replace("Z", "+00:00")).timestamp()
    except ValueError:
        return "?"
    return f"{d:.0f} s" if d < 120 else f"{d / 60:.0f} min" if d < 7200 else f"{d / 3600:.1f} h"


# ---------- status ----------
def cmd_status(a) -> int:
    env = read_env()
    state = load_pids()
    mode = state.get("mode", "replay")
    rows, extra, js = [], {}, []
    for s in services(env, mode, env.get("FRANK_LIVE_ARGS") or LIVE_ARGS):
        if mode not in s.modes and s.name not in state.get("services", {}):
            continue
        cur = svc_state(s, state)
        port = "/".join(str(p) for p in s.ports) or "-"
        if cur["healthy"]:
            mark, note = OK, cur["detail"]
        else:
            ok, why = s.requires(env) if s.requires else (True, "")
            if not ok:
                mark, note = (SKIP if s.optional else MISS), why
            elif cur["exited"]:
                mark, note = BAD, "exited"
                extra[len(rows)] = tail(LOGS / f"{s.name}.log", 3)
            elif cur["ours"]:
                mark, note = BAD, "running but unhealthy: " + cur["detail"]
                extra[len(rows)] = tail(LOGS / f"{s.name}.log", 3)
            else:
                mark, note = BAD, "not running"
        rows.append([mark + " " + s.name, dim(s.lane), port, str(cur["pid"] or "-"), note])
        js.append({"service": s.name, "lane": s.lane, "ports": s.ports, "healthy": cur["healthy"],
                   "pid": cur["pid"], "ours": cur["ours"], "note": note})

    run = run_summary(LIVE) if LIVE.exists() else None
    if a.json:
        out = {"mode": mode, "services": js, "live": None}
        if run:
            out["live"] = {k: v for k, v in run.items() if k != "tick_lies"}
            out["live"]["target"] = os.readlink(LIVE) if LIVE.is_symlink() else str(LIVE)
        print(json.dumps(out, indent=1))
        return 0

    now = datetime.now().strftime("%H:%M:%S")
    print(bold(f"\nFRANKENSTEIN · status board · {mode} · {now}\n"))
    print(table(["SERVICE", "LANE", "PORT", "PID", "HEALTH / NOTE"], rows, extra))
    print()
    if not run:
        print(f"  {MISS} runs/live has no events.jsonl: `make up` (replay) or a crew run with --live")
        return 0
    target = os.readlink(LIVE) if LIVE.is_symlink() else "runs/live"
    tag = yellow(" SAMPLE DATA") if run["fixture"] else ""
    state_txt = (green("finished") if run["finished"] else yellow(f"running, last event {_age(run['last_ts'])} ago"))
    if mode == "replay" and run["finished"]:
        state_txt = green("finished") + dim(" · replaying a real run, no model spend")
    total = run["fn_total"] or "?"
    pct = f" ({100 * run['matched'] / run['fn_total']:.1f}%)" if run["fn_total"] else ""
    cost = f"${run['cost']:.2f}" if isinstance(run["cost"], (int, float)) else "?"
    el = f"{run['elapsed'] / 60:.1f} min" if isinstance(run["elapsed"], (int, float)) else "?"
    snap = ", ".join(f"{k} {v}" for k, v in sorted(run["snap"].items())) or "none"
    b = run["build"]
    build = (f"{'IDENTICAL' if b.get('identical') else 'DIFFERENT'} sha1 {str(b.get('rom_sha1'))[:12]}… · "
             f"{b.get('pct_agent_code')}% agent code") if b else dim("no build.rom yet")
    live_rows = [
        ["run", bold(run["run_id"]) + tag + dim(f"  ← runs/live -> {target}")],
        ["label", run["label"] or "-"],
        ["state", state_txt],
        ["matched", bold(f"{run['matched']}/{total}") + pct + (dim(f" · {run['abandoned']} abandoned") if run["abandoned"] else "")],
        ["lies caught", bold(str(run["lies"]))],
        ["cost", bold(cost) + dim(f" · {el}")],
        ["snap", snap],
        ["face", (green(f"{FACE_FN} matched") if run["face"] else dim(f"{FACE_FN} not in this run"))],
        ["rom", build + (dim(" · swapped into the game") if run["swapped"] else "")],
    ]
    w = max(len(r[0]) for r in live_rows)
    print(bold("  ON STAGE"))
    for k, v in live_rows:
        print(f"  {dim(k.ljust(w))}  {v}")
    print()
    rid = run["run_id"]
    print(bold("  OPEN"))
    print(f"  {dim('stage   ')}  http://127.0.0.1:5173/?scene=split" + (f"   replay: http://127.0.0.1:5173/?replay={rid}&speed=4" if mode == "replay" else ""))
    print(f"  {dim('obs     ')}  http://127.0.0.1:5173/?scene=split&obs=1   overlay http://127.0.0.1:7302/")
    print(f"  {dim('phone   ')}  http://127.0.0.1:7401/   bridge http://127.0.0.1:7304/state")
    print()
    return 0


# ---------- preflight ----------
def cmd_preflight(a) -> int:
    env = read_env()
    print(bold("\nFRANKENSTEIN · preflight\n"))
    rows: list[list[str]] = []
    fails = 0

    def add(ok: bool | None, what: str, note: str = "", required: bool = True) -> None:
        nonlocal fails
        mark = OK if ok else (SKIP if ok is None else (BAD if required else MISS))
        if ok is False and required:
            fails += 1
        rows.append([mark, what, note])

    # keys (never printed)
    for k, req in (("META_API_KEY", True), ("SUBQ_API_KEY", True), ("GEMINI_API_KEY", False),
                   ("MONGODB_URI", False), ("AGENTVERSE_API_KEY", False), ("FRANKENSTEIN_AGENT_SEED", False)):
        have = bool(env.get(k))
        why = {"MONGODB_URI": "library falls back to local JSON (metrics say so)",
               "GEMINI_API_KEY": "no second opinion", "AGENTVERSE_API_KEY": "no ASI:One front door here",
               "FRANKENSTEIN_AGENT_SEED": "the ASI:One agent's identity is on another machine"}.get(k, "crew cannot run live")
        add(have, f"key {k}", "set" if have else ("empty: " + why), req)

    # tools
    node = shutil.which("node")
    add(bool(node), "node", subprocess.run(["node", "-v"], capture_output=True, text=True).stdout.strip() if node else "install Node 20+")
    try:
        js = subprocess.run([PY, "-c", "import jsonschema"], capture_output=True).returncode == 0
    except Exception:
        js = False
    add(js, "python deps", rel(Path(PY)) if js else "`make setup`")

    # referee: container, health, and one real byte-for-byte check from the export
    docker = shutil.which("docker")
    names = []
    if docker:
        try:
            names = subprocess.run(["docker", "ps", "--format", "{{.Names}}"], capture_output=True, text=True,
                                   timeout=10).stdout.split()
        except Exception:
            pass
    add("frank-lab" in names, "referee container", "frank-lab up" if "frank-lab" in names else "`bash lab/setup_referee.sh` (colima start first)")
    code, body = http_get("http://127.0.0.1:7101/health")
    mock = '"mock": true' in body
    add(code == 200 and not mock, "referee :7101", ("healthy, real" if code == 200 and not mock else
        "MOCK referee: matches would be fake" if mock else "down: `make up` starts it"))

    export = None
    for p in sorted(EXPORTS.glob("doom*/EXPORT.json")) + sorted(EXPORTS.glob("*/EXPORT.json")):
        export = p.parent
        break
    if export:
        ok, note = _verify_export(export)
        add(ok, f"real export {export.name}", note)
        cands = sorted((export / "recovered").glob("fn_*.c"))
        if code == 200 and not mock and cands:
            src = cands[-1]
            c2, res = http_post("http://127.0.0.1:7101/check", {"fn": src.stem, "src": src.read_text()})
            good = c2 == 200 and res.get("status") == "MATCH" and (res.get("lint") or {}).get("ok")
            add(good, "referee re-proves a match", f"{src.stem}: {res.get('status', 'HTTP ' + str(c2))}"
                + (f" in {res.get('elapsed_ms')} ms" if good else ""))
    else:
        add(False, "real export", "none in crew/exports/: `python -m crew.export <run_id>`")

    face = [p for p in list(RUNS.glob(f"*/recovered/{FACE_FN}.c")) + list(EXPORTS.glob(f"*/recovered/{FACE_FN}.c"))]
    add(bool(face), f"face {FACE_FN} recovered", rel(face[0]) if face else "not yet: the hero beat needs it", False)

    rc = subprocess.run([PY, "contracts/validate.py"], cwd=REPO, capture_output=True, text=True)
    bad = [l.strip() for l in (rc.stdout + rc.stderr).splitlines() if l.strip() and not l.strip().startswith("ok ")]
    add(rc.returncode == 0, "schemas (contracts/validate.py)", "all files valid" if rc.returncode == 0 else (bad[-1] if bad else "failed")[:110])

    # stage builds
    stage = REPO / "stage"
    if not (stage / "node_modules").exists():
        LOGS.mkdir(parents=True, exist_ok=True)
        _npm_install()
    t0 = time.time()
    rb = subprocess.run(["npm", "run", "build"], cwd=stage, capture_output=True, text=True)
    LOGS.mkdir(parents=True, exist_ok=True)
    (LOGS / "stage-build.log").write_text(rb.stdout + rb.stderr)
    add(rb.returncode == 0, "stage builds (tsc + vite)", f"{time.time() - t0:.1f} s" if rb.returncode == 0 else
        "failed: runs/_logs/stage-build.log")

    # ports: free, or held by the healthy service that belongs there
    state = load_pids()
    for s in services(env, "live", LIVE_ARGS):
        for p in s.ports:
            if not port_open(p):
                add(True, f"port {p}", f"free ({s.name})")
                continue
            healthy, _ = s.check()
            pid, name = port_owner(p)
            mine = s.name in state.get("services", {})
            add(healthy, f"port {p}", (f"in use by {'our ' if mine else 'a running '}{s.name} (healthy)" if healthy
                                       else f"BUSY: {name or '?'} pid {pid} is not {s.name}"))

    w = max(len(r[1]) for r in rows)
    for mark, what, note in rows:
        print(f"  {mark} {what.ljust(w)}  {dim(note)}")
    print(bold("\n  BY HAND (tick these yourself)"))
    for item in ("mGBA open with the assembled Doom ROM (WAD appended), creature/tap/oam_tap.lua loaded",
                 "controller paired and focused on mGBA; OBS hotkeys don't collide with game keys",
                 "OBS scene Split: mGBA capture at x 20, y 92, 960x640 under http://127.0.0.1:5173/?scene=split&obs=1",
                 "phone loads the play page (needs an HTTPS host with COOP/COEP; localhost won't reach a phone)",
                 "ASI:One chat open on agent1q088qnx…w2hstx0, and the agent answers \"How much of DOOM is back?\"",
                 "display 1920x1080, Do Not Disturb on, sound on, charger in",
                 "Built today / Not ours card one key away (Stage: ?scene=ending&page=credits)"):
        print(f"  {SKIP} {item}")
    print()
    print((green("  ready: required checks pass") if not fails else red(f"  {fails} required check(s) failed")) + "\n")
    return 1 if fails else 0


def _verify_export(d: Path) -> tuple[bool, str]:
    try:
        rec = json.loads((d / "EXPORT.json").read_text())
        metrics = json.loads((d / "metrics.json").read_text())
    except (OSError, json.JSONDecodeError) as e:
        return False, f"unreadable: {e}"
    if metrics.get("fixture"):
        return False, "fixture run, not real"
    bad = [f for f, h in rec.get("files", {}).items()
           if not (d / f).exists() or hashlib.sha1((d / f).read_bytes()).hexdigest() != h]
    man = REPO / "lab" / "out" / "manifest.json"
    same_target = man.exists() and hashlib.sha1(man.read_bytes()).hexdigest() == rec.get("manifest_sha1")
    if bad:
        return False, f"{len(bad)} file(s) differ from EXPORT.json, e.g. {bad[0]}"
    note = f"{metrics.get('matched')}/{metrics.get('fn_total')} matched, {len(rec.get('files', {}))} files hash-verified"
    return True, note + ("" if same_target else " (manifest changed since export)")


# ---------- logs ----------
def cmd_logs(a) -> int:
    p = LOGS / f"{a.service}.log"
    if not p.exists():
        print(f"no log at {rel(p)}; services: " + ", ".join(sorted(x.stem for x in LOGS.glob("*.log"))))
        return 1
    print("\n".join(tail(p, a.n)))
    return 0


# ---------- the demo: rehearsal and the live micro-segment (docs/DEMO_SCRIPT.md) ----------
def cmd_rehearse(a) -> int:
    """Walk the judging-room cut against the running Stage with a stopwatch and screenshots. Spends nothing."""
    code, _ = http_get("http://127.0.0.1:5173/")
    if code != 200:
        print(red("stage-page is not up on :5173. Run `make up` first."))
        return 1
    node = shutil.which("node")
    if not node:
        print(red("node is not installed"))
        return 1
    run = resolve_run(a.run).name if a.run else "doom_r01"
    args = [node, str(REPO / "tools" / "rehearse.mjs"), "--run", run, "--pace", str(a.pace)]
    print(dim(f"rehearsing the 3:00 cut on replay {run} at pace {a.pace} (about {180 * a.pace:.0f} s)"))
    if "vite" in port_owner(5173)[1].lower() or "node" in port_owner(5173)[1].lower():
        print(yellow("note: the Stage is the Vite dev server; a teammate's save reloads it mid-demo. "
                     "For the real demo serve the built Stage (see docs/DEMO_SCRIPT.md, checklist)."))
    return subprocess.call(args, cwd=REPO)


def _live_run_in_progress() -> str | None:
    """A live run is on stage if runs/live has no run.finished and wrote an event in the last 90 s."""
    s = run_summary(LIVE) if LIVE.exists() else None
    if s and not s["finished"] and s["last_ts"]:
        try:
            age = (datetime.now(timezone.utc) - datetime.fromisoformat(s["last_ts"].replace("Z", "+00:00"))).total_seconds()
        except ValueError:
            age = 0
        if age < 90:
            return s["run_id"]
    try:
        out = subprocess.run(["pgrep", "-fl", r"crew\.(run|demo).*--live"], capture_output=True, text=True).stdout.strip()
    except OSError:
        out = ""
    return out.splitlines()[0] if out else None


def cmd_demo_live(a) -> int:
    """The safe live micro-segment: n small unrecovered functions, real Muse and Snap calls, on stage."""
    code, body = http_get("http://127.0.0.1:7101/health")
    if code != 200 or '"mock": false' not in body:
        print(red(f"referee on :7101 is not healthy and real ({code} {body[:80]}). Run `make up` or lab/setup_referee.sh."))
        return 1
    busy = _live_run_in_progress()
    if busy and a.live:
        print(red(f"another live run is on stage ({busy}). Refusing to start a second one; wait for it or use --no-live."))
        return 1
    argv = [PY, "-m", "crew.demo", "--pick", str(a.pick)] + (["--live"] if a.live else [])
    env = {**os.environ, "REFEREE_URL": "http://127.0.0.1:7101"}
    print(bold(f"LIVE SEGMENT · {a.pick} small Doom functions · real Muse Spark + SubQ Snap + Gemini calls"))
    print(dim("rehearsed 12:43: 2 functions, both matched 38 s after start, rebuild proof at 60 s, $0.045"))
    print(dim("on stage: " + ("yes, runs/live switches to this run" if a.live else "no (--no-live), the Stage keeps its replay")))
    if not a.yes:
        if not sys.stdin.isatty():
            print(red("not a terminal: pass --yes to start without the Enter press"))
            return 1
        try:
            input(bold("\n  Judge: press ENTER to hire the agents. "))
        except (EOFError, KeyboardInterrupt):
            print("\ncancelled")
            return 1
    t0 = time.time()
    rc = subprocess.call(argv, cwd=REPO, env=env)
    print(dim(f"wall clock {time.time() - t0:.1f} s, exit {rc}. The Stage's Ending shows the run's build.rom."))
    return rc


def main() -> int:
    ap = argparse.ArgumentParser(prog="frank", description="Run FRANKENSTEIN as one product.")
    sub = ap.add_subparsers(dest="cmd", required=True)
    up = sub.add_parser("up", help="start every lane in order, health-check each one")
    up.add_argument("--mode", choices=["replay", "live"], default="replay")
    up.add_argument("--run", help="replay: run id, runs/<id> or crew/exports/<id> (default: first Doom export)")
    up.add_argument("--crew-args", default="", help=f"live: crew.run flags (default: {LIVE_ARGS})")
    up.add_argument("--no-agent", action="store_true", help="don't start the ASI:One agent")
    up.add_argument("--yes-spend", action="store_true", help="live: confirm the crew run may spend its budget")
    st = sub.add_parser("status", help="one board: services, health, and the run on stage")
    st.add_argument("--json", action="store_true")
    sub.add_parser("down", help="stop everything frank started")
    sub.add_parser("preflight", help="the demo checklist, checked where possible")
    lg = sub.add_parser("logs", help="tail one service's log")
    lg.add_argument("service")
    lg.add_argument("-n", type=int, default=40)
    rh = sub.add_parser("rehearse", help="walk the 3:00 judging cut on replay with a stopwatch and screenshots")
    rh.add_argument("--run", help="replay run id (default doom_r01)")
    rh.add_argument("--pace", type=float, default=1.0, help="1 = real time (3:00); 0.25 = the same walk in 45 s")
    dl = sub.add_parser("demo-live", help="the live micro-segment: 2 small functions, real calls, judge presses Enter")
    dl.add_argument("--pick", type=int, default=2)
    dl.add_argument("--no-live", dest="live", action="store_false", help="don't switch runs/live (timing only)")
    dl.add_argument("--yes", action="store_true", help="start without waiting for Enter")
    a = ap.parse_args()
    return {"up": cmd_up, "status": cmd_status, "down": cmd_down, "preflight": cmd_preflight, "logs": cmd_logs,
            "rehearse": cmd_rehearse, "demo-live": cmd_demo_live}[a.cmd](a)


if __name__ == "__main__":
    sys.exit(main())
