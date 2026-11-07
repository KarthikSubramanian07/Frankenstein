"""Frankenstein on Agentverse: the whole workflow inside an ASI:One chat (Fetch.ai track requirements).

One agent, Agent Chat Protocol, mailbox mode (no inbound ports). It runs next to the local referee and crew.
  "Does this C match fn_0801B724?" + a ```c block   -> referee verdict
  "Verify my fix for fn_X" + a ```c block          -> patch: exactly which functions changed, new ROM SHA-1
  "Recover fn_X"                                   -> crew job (Lane B), then the referee re-verifies before we answer
  "How much of DOOM is back?"                      -> progress from runs/live
  "Prove the rebuild is exact"                     -> ROM rebuilt from the agents' code, two SHA-1s
  "Which functions can I try?"                     -> smallest unrecovered functions
  "Bring back Doomguy's face"                      -> the crew picks the function from plain words, then as "Recover fn_X"
  "Let me play the rebuilt Doom on my TV"          -> player link, one line per device, agent-written share
Every answer keeps Observed (proved by the compiler) apart from Inferred (our reading, not proof).

Run (lab/agents/.venv has uagents): lab/agents/.venv/bin/python -m lab.agents.frankenstein_agent
"""
import json
import os
import re
import secrets
import time
import urllib.error
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CREW_URL = os.environ.get("CREW_URL", "http://127.0.0.1:7111")
FN_RE = re.compile(r"\bfn_[0-9A-Fa-f]{8}\b")
CODE_RE = re.compile(r"```(?:c|C)?\s*\n(.*?)```", re.S)
JOB_TIMEOUT_S = 300  # a real Digger job takes several model turns; the chat gets an 'on it' reply first
MIN_SUGGEST_BYTES = 8  # 2-byte functions are a bare return; too trivial to show anyone
MAX_MSG_BYTES = 20_000  # caps the cost of a pasted wall of code
HTTP_TIMEOUT_S = 10
ROUTE_TIMEOUT_S = 60  # POST /jobs with a query runs Snap's router first (23.5 s seen at 12:56)
WORDS_RECOVER_RE = re.compile(r"\b(recover|bring back|dig up|excavate|restore)\b")
PLAY_RE = re.compile(r"\b(play|playable|gamepad|controller)\b")
DISTRIBUTION = REPO / "creature" / "phone" / "DISTRIBUTION.md"
# The player is only served locally today (creature/phone/README.md: hosting is a team decision); set this once published.
PLAYER_URL = os.environ.get("FRANKENSTEIN_PLAYER_URL", "").strip() or None
JUDGMENT = "**Judgment** (the crew's call, not proof)"
BUSY = "The referee is busy; try again in a minute."
TOO_LONG = (f"That message is over {MAX_MSG_BYTES // 1000} KB, which is more than I check in one go. "
            "Send just the one function you want judged, in a ```c block.")
OBSERVED = "**Observed** (proved by the compiler)"
INFERRED = "**Inferred** (our reading, not proof)"

_referee = None


def referee():
    global _referee
    if _referee is None:
        from lab.referee.core import Referee
        _referee = Referee()
    return _referee


# ---------- answers (pure functions of the text; easy to test) ----------
def answer(text: str) -> str:
    """Markdown reply for one chat message. Never raises."""
    return respond(text)[0]


def respond(text: str) -> tuple[str, dict | None]:
    """(markdown, card) where card is an ASI:One custom card payload dict or None. Never raises."""
    if too_long(text):
        return TOO_LONG, None
    try:
        r = _route(text)
    except (KeyError, ValueError) as e:
        return f"I couldn't do that: {e}. Ask \"which functions can I try?\" for valid ids.", None
    except Exception as e:  # never leave the chat hanging
        return f"{BUSY} ({type(e).__name__})", None
    return r if isinstance(r, tuple) else (r, None)


def too_long(text: str) -> bool:
    return len(text.encode("utf-8", "replace")) > MAX_MSG_BYTES


def _route(text: str) -> str | tuple[str, dict]:
    fn_match = FN_RE.search(text)
    fn = fn_match.group(0)[:3] + fn_match.group(0)[3:].upper() if fn_match else None
    code = _code(text)
    lower = text.lower()
    if code and fn and re.search(r"\b(fix|patch)", lower):
        return answer_patch(fn, code)
    if code and fn:
        return answer_check(fn, code)
    if fn and re.search(r"\b(recover|bring back|decompile|rebuild)\b", lower) and "prove" not in lower:
        return answer_recover(fn)
    if is_words_recover(text):
        return answer_recover_words(text)
    if PLAY_RE.search(lower):
        return answer_play()
    if re.search(r"\b(prove|proof|exact|sha|identical|checksum)", lower):
        return answer_prove()
    if re.search(r"\b(how much|progress|status|recovered|percent|%)", lower):
        return answer_status()
    if re.search(r"\b(which|list|try|small|easy|start)", lower):
        return answer_candidates()
    return HELP


HELP = """I'm Frankenstein's referee. Frankenstein brings back the lost source code of classic games: agents rewrite it from the cartridge, and nothing counts unless a compiler proves it is byte-for-byte identical. Doom (Game Boy Advance) is our first patient.

Try:
- "Which functions can I try?"
- "Does this C match fn_XXXXXXXX?" followed by a ```c block
- "Verify my fix for fn_XXXXXXXX" followed by a ```c block
- "Recover fn_XXXXXXXX", or in plain words: "Bring back Doomguy's face"
- "Let me play the rebuilt Doom on my TV"
- "How much of DOOM is back?"
- "Prove the rebuild is exact"
"""


def answer_check(fn: str, code: str) -> tuple[str, dict]:
    r = referee().check(fn, code)
    v = _verdict(r)
    icon = "\u2705" if v == "MATCH" else "\u274c"
    lines = [f"### Verdict for `{fn}`: {icon} **{v}**", "", OBSERVED]
    lines += _observed_lines(r)
    lines += ["", INFERRED, _inferred(fn)]
    rows = [_card_text(s) for s in _card_rows(r)]
    return "\n".join(lines), _card(f"Verdict for {fn}", v, v == "MATCH", rows)


def answer_patch(fn: str, code: str) -> str:
    from lab.referee.romlink import RomLinker
    r = RomLinker(referee()).patch(fn, code)
    if "error" in r:
        detail = r.get("log") or "; ".join(v["reason"] for v in r.get("lint", {}).get("violations", []))
        return f"### Fix for `{fn}`: **REJECTED ({r['error']})**\n\n{OBSERVED}\n- {detail}\n\nNothing was written to the ROM."
    changed = r["changed_functions"]
    only = changed == [fn]
    lines = [f"### Fix for `{fn}`: **{'VERIFIED' if only else 'CHECK THIS'}**", "", OBSERVED,
             f"- Functions whose bytes changed: {', '.join(f'`{c}`' for c in changed) or 'none (the fix compiles to the original)'}",
             f"- Every other game function is byte-identical ({r['unchanged']} functions)",
             f"- Patched code: {r['patched_bytes']} bytes, written in place of the original {r['original_bytes']}",
             f"- New ROM SHA-1: `{r['rom_sha1']}`", "", INFERRED, _inferred(fn)]
    return "\n".join(lines)


def is_words_recover(text: str) -> bool:
    """Plain-words recovery ("bring back Doomguy's face"): no fn_ id and no code."""
    return not FN_RE.search(text) and not _code(text) and bool(WORDS_RECOVER_RE.search(text.lower()))


def answer_recover(fn: str) -> str:
    job = _http("POST", f"{CREW_URL}/jobs", {"fn": fn, "max_usd": 1.5})
    if job is None:
        return f"The crew (the agents that write the code) isn't reachable right now, so I can't start a recovery of `{fn}`. Try again shortly."
    return _finish_job(fn, job)


def answer_recover_words(text: str) -> str:
    query = " ".join(text.split())[:2000]
    job = _http("POST", f"{CREW_URL}/jobs", {"query": query, "live": True, "max_usd": 1.5}, timeout=ROUTE_TIMEOUT_S, errors=True)
    if job is None:
        return "The crew (the agents that write the code) is down right now, so I can't start that recovery. Nothing was started; try again shortly."
    if "error" in job:
        return f"The crew turned that request down: {job['error']}. Nothing was started."
    if "job_id" not in job:
        return "The crew couldn't tie those words to a function in the game. Try different words, or an id like `fn_0801B724`."
    return _finish_job(job["fn"], job, words=query)


def _judgment_lines(fn: str, judgment: dict | None, words: str) -> list[str]:
    j = judgment or {}
    route = j.get("route") or {}
    p = route.get("p") or {}
    pick = f"- Snap picked `{fn}` for \"{words[:120]}\""
    if fn in p:
        pick += f" (score {p[fn]})"
    lines = [JUDGMENT, pick]
    others = [f"`{f}` ({p.get(f, '?')})" for f in route.get("fns", []) if f != fn][:3]
    if others:
        lines.append(f"- Runners-up: {', '.join(others)}")
    if route.get("basis"):
        lines.append(f"- Why: {route['basis']}")
    for k, v in j.items():  # anything else the crew explains (e.g. a note on why it chose a smaller function)
        if k not in ("route", "snap_decisions", "reviews") and isinstance(v, str) and v:
            lines.append(f"- {v}")
    if j.get("snap_decisions"):
        d = j["snap_decisions"][-1]
        lines.append(f"- Snap's last call: {d.get('action')} at attempt {d.get('attempt')} (confidence {d.get('confidence')})")
    return lines + [""]


def _finish_job(fn: str, job: dict, words: str | None = None) -> str:
    deadline = time.time() + JOB_TIMEOUT_S
    status = {}
    while time.time() < deadline:
        status = _http("GET", f"{CREW_URL}/jobs/{job['job_id']}") or {}
        if status.get("status") in ("matched", "abandoned", "failed"):
            break
        time.sleep(3)
    judgment = []
    if words is not None:
        judgment = _judgment_lines(fn, (status.get("evidence") or {}).get("judgment") or {"route": job.get("route")}, words)
    if status.get("status") != "matched":
        best = status.get("best_pct")
        return "\n".join([f"### Recovery of `{fn}`: **{(status.get('status') or 'still running').upper()}**", ""] + judgment + [
            OBSERVED, f"- Attempts: {status.get('attempts', '?')}, best match so far: {best if best is not None else '?'}%",
            f"- False claims caught: {status.get('false_claims', 0)}", "", "Ask again in a minute; the job keeps going."])
    src = (REPO / status["src_path"]).read_text()
    r = referee().check(fn, src)  # the crew says MATCH; the referee decides
    lines = [f"### Recovery of `{fn}`: **{_verdict(r)}** (re-verified by the referee, not taken on the crew's word)", ""] + judgment + [
             OBSERVED] + _observed_lines(r) + [
             f"- Attempts: {status.get('attempts')}, cost: ${status.get('cost_usd', 0):.2f}, false claims caught: {status.get('false_claims', 0)}",
             "", "```c", src.strip()[:1500], "```", "", INFERRED, _inferred(fn)]
    return "\n".join(lines)


def recovered_files() -> dict[str, Path]:
    """Accepted C from the crew's union of every run (crew/exports/union, each re-verified), the live run and jobs
    started in ASI:One (runs/r_asi_*); newest wins per function. The rebuild re-checks every file anyway."""
    found: dict[str, Path] = {}
    dirs = ([REPO / "crew" / "exports" / "union" / "recovered", REPO / "runs" / "live" / "recovered"]
            + sorted((REPO / "runs").glob("r_asi_*/recovered")))
    for d in dirs:
        for f in d.glob("fn_*.c") if d.exists() else []:
            if f.stem not in found or f.stat().st_mtime > found[f.stem].stat().st_mtime:
                found[f.stem] = f
    return found


def answer_status() -> str:
    s = _http("GET", f"{CREW_URL}/status")
    game = [f for f in referee().functions.values() if f["scope"] == "game"]
    # The count comes from the files on disk (union + live + ASI:One), not from one run's status, so it is the
    # whole game's number; the rebuild intent proves them byte for byte.
    matched, total = len(recovered_files()), len(game)
    pct = round(100.0 * matched / total, 1) if total else 0.0
    lies = None  # the crew's /status counts one run only; the all-runs number is in crew/EXPERIMENTS.md
    lines = ["### How much of DOOM is back", "", OBSERVED,
             f"- Functions recovered and byte-identical: {matched} of {total} ({pct}%)"]
    if lies is not None:
        lines.append(f"- False \"I matched it\" claims caught by the Checker: {lies}")
    lines += ["", INFERRED, "- Which part of the game each function belongs to is our reading of its code, not proof."]
    return "\n".join(lines)


def _rebuild() -> dict:
    """Relink the ROM from every accepted function now: the latest rebuild, never a cached claim."""
    import shutil
    import tempfile
    from lab.referee.romlink import RomLinker
    with tempfile.TemporaryDirectory() as pool:
        for fn, path in recovered_files().items():
            shutil.copy(path, Path(pool) / f"{fn}.c")
        return RomLinker(referee()).rebuild(pool)


def downloads_approved() -> bool:
    """Read at request time, like the player servers: only the exact line `Status: approved` counts."""
    try:
        return any(ln.strip() == "Status: approved" for ln in DISTRIBUTION.read_text().splitlines())
    except OSError:
        return False


def answer_play() -> str:
    r = _rebuild()
    approved = downloads_approved()
    link = f"[Play the rebuilt DOOM]({PLAYER_URL}) (the page shows a QR code for handing off to another device)" if PLAYER_URL \
        else "The player isn't published on a public link yet; ask the team for the player link."
    lines = ["### Play the rebuilt DOOM", "", link, "",
             "- **Phone browser:** touch controls; turn it sideways for the big screen.",
             "- **TV, Xbox / PlayStation browser, Steam Deck:** plug in or pair a controller (Gamepad API supported).",
             "- **Laptop:** keyboard (arrows, Z fires, X uses)."]
    lines.append("- **RetroArch or a real GBA:** download the ROM from the player's \"Play it your way\" panel." if approved
                 else "- **RetroArch or a real GBA:** ROM downloads aren't offered yet; the license check isn't approved.")
    lines += ["", OBSERVED]
    if r["identical"]:
        lines.append(f"- {r['pct_agent_code']}% of this build's game code was written by agents and proven")
    else:
        lines.append("- The latest rebuild is not byte-identical to the original, so no agent-written share is claimed.")
    lines += ["", INFERRED, "- The game runs in a browser emulator (mGBA core); it is not a native port."]
    return "\n".join(lines)


def answer_prove() -> tuple[str, dict]:
    r = _rebuild()
    lines = ["### Is the rebuilt game exact?", "", OBSERVED,
             f"- Original ROM SHA-1: `{r['original_sha1']}`",
             f"- ROM built from the agents' code: `{r['rom_sha1']}`",
             f"- Identical: **{'yes' if r['identical'] else 'NO'}**",
             f"- Functions taken from the agents' compiled code: {r['recovered']} ({r['pct_agent_code']}% of the game's code bytes)"]
    if r["rejected"]:
        lines.append(f"- Rejected from the rebuild (not byte-identical): {len(r['rejected'])}")
    lines += ["", INFERRED, "- None. Every line above is a checksum or a count."]
    rows = [_card_text(f"Original ROM SHA-1: {r['original_sha1']}"), _card_text(f"Rebuilt from agents' code: {r['rom_sha1']}"),
            _card_text(f"{r['recovered']} functions from agent code ({r['pct_agent_code']}% of code bytes)", "muted")]
    return "\n".join(lines), _card("Is the rebuilt game exact?", "IDENTICAL" if r["identical"] else "DIFFERENT", r["identical"], rows)


def answer_candidates() -> str:
    done = set(recovered_files())
    small = sorted((f for f in referee().functions.values() if f["scope"] == "game" and f["id"] not in done and f["mode"] == "thumb" and f["size"] >= MIN_SUGGEST_BYTES),
                   key=lambda f: f["size"])[:8]
    rows = "\n".join(f"- `{f['id']}`: {f['size']} bytes, Thumb" for f in small)
    return ("### Smallest functions nobody has recovered yet\n\n" + rows +
            "\n\nDefine the function under its exact id, non-static, and declare anything it calls by id. Then send (start with @frankenstein-referee so it reaches me):\n"
            "\"Does this C match fn_…?\" with your code in a ```c block.")


# ---------- helpers ----------
def _verdict(r: dict) -> str:
    return {"MATCH": "MATCH", "PARTIAL": "REJECTED", "NO_COMPILE": "DOES NOT COMPILE", "LINT_FAIL": "REJECTED (rule broken)"}[r["status"]]


def _observed_lines(r: dict) -> list[str]:
    if r["status"] == "MATCH":
        return ["- Every instruction is byte-identical to the original, and every call and address points at the same place"]
    if r["status"] == "PARTIAL":
        d = r["first_diff"]
        return [f"- {r['match_pct']}% of instructions identical",
                f"- First difference at byte {d['offset']}:", "```",
                f"expected  {d['expected_ins']}", f"produced  {d['got_ins']}", "```"]
    if r["status"] == "NO_COMPILE":
        return ["- The compiler rejected it:", "```", r["compile"]["log"].strip()[-600:], "```"]
    return [f"- Rule {v['rule']}: {v['reason']}" for v in r["lint"]["violations"]]


def _card_rows(r: dict) -> list[str]:
    if r["status"] == "MATCH":
        return ["Every instruction is byte-identical to the original."]
    if r["status"] == "PARTIAL":
        d = r["first_diff"]
        return [f"{r['match_pct']}% of instructions identical", f"First difference at byte {d['offset']}",
                f"Expected: {d['expected_ins']}", f"Produced: {d['got_ins']}"]
    if r["status"] == "NO_COMPILE":
        return ["The compiler rejected it; see the log in the text reply."]
    return [f"Rule {v['rule']}: {v['reason']}" for v in r["lint"]["violations"]] or ["A rule was broken."]


def _card_text(value: str, style: str = "body") -> dict:
    return {"type": "text", "value": value, "style": style}


def _card(title: str, badge: str, ok: bool, rows: list[dict]) -> dict:
    """ASI:One interactive card, kind "custom" (uagents_core.contrib.protocols.chat.cards.CustomCardPayload)."""
    return {"root": {"type": "section", "title": title, "children": [
        {"type": "badge", "label": badge, "variant": "success" if ok else "warning"},
        *rows,
        _card_text("Observed: proved by the compiler.", "muted")]}}


def _inferred(fn: str) -> str:
    names = _http("GET", f"{CREW_URL}/names/{fn}")
    if names and names.get("name"):
        return f"- Name: `{names['name']}?` ({names.get('basis', 'guess')})"
    return "- No inferred name yet."


def _code(text: str) -> str | None:
    m = CODE_RE.search(text)
    if m:
        return m.group(1)
    return text[text.index("{") - 200 if text.find("{") > 200 else 0:] if "{" in text and ";" in text else None


def _http(method: str, url: str, body: dict | None = None, timeout: float = HTTP_TIMEOUT_S, errors: bool = False) -> dict | None:
    """JSON over HTTP with a timeout and one retry; None on failure. A POST that may have reached the
    server is not retried, so one question never starts two paid crew jobs. errors=True turns an HTTP
    error reply into {"error": ..., "http_status": ...} instead of None."""
    data = json.dumps(body).encode() if body is not None else None
    for attempt in (1, 2):
        try:
            req = urllib.request.Request(url, data=data, method=method, headers={"Content-Type": "application/json"})
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return json.loads(resp.read())
        except urllib.error.HTTPError as e:
            if errors:
                try:
                    msg = json.loads(e.read()).get("error")
                except Exception:
                    msg = None
                return {"error": msg or f"HTTP {e.code}", "http_status": e.code}
            if attempt == 2 or method != "GET" or e.code < 500:
                return None
            time.sleep(1)
        except Exception as e:
            never_sent = isinstance(e, urllib.error.URLError) and isinstance(e.reason, ConnectionRefusedError)
            if attempt == 2 or (method != "GET" and not never_sent):
                return None
            time.sleep(1)
    return None


def _seed() -> str:
    """Stable agent address across restarts: the seed lives in the gitignored .env."""
    env = REPO / ".env"
    text = env.read_text() if env.exists() else ""
    m = re.search(r"^FRANKENSTEIN_AGENT_SEED=(\S+)", text, re.M)
    if m:
        return m.group(1)
    seed = secrets.token_hex(32)
    with env.open("a") as f:
        f.write(f"\nFRANKENSTEIN_AGENT_SEED={seed}\n")
    return seed


# ---------- the agent ----------
def build_agent():
    import asyncio
    from uagents import Agent, Context, Protocol
    from uagents_core.contrib.protocols.chat import (ChatAcknowledgement, ChatMessage, EndSessionContent, TextContent,
                                                     chat_protocol_spec)
    from uagents_core.contrib.protocols.chat.cards import CustomCardPayload, create_card_content

    def card_block(ctx: Context, card: dict | None) -> list:
        if card is None:
            return []
        try:
            return [create_card_content(CustomCardPayload.model_validate(card), is_terminal=True)]
        except Exception as e:  # the markdown is already in the message; a bad card just gets dropped
            ctx.logger.warning(f"card dropped: {e}")
            return []

    agent = Agent(name="frankenstein-referee", seed=_seed(), port=8001, mailbox=True, publish_agent_details=True,
                  readme_path=str(Path(__file__).with_name("AGENT_README.md")),
                  description="Brings back lost games' source code from the cartridge and proves every function byte-identical. First patient: Doom.")
    chat = Protocol(spec=chat_protocol_spec)

    @chat.on_message(ChatMessage)
    async def on_chat(ctx: Context, sender: str, msg: ChatMessage) -> None:
        await ctx.send(sender, ChatAcknowledgement(acknowledged_msg_id=msg.msg_id))
        text = msg.text()
        if not text.strip():
            return
        if too_long(text):
            await ctx.send(sender, ChatMessage(content=[TextContent(text=TOO_LONG), EndSessionContent()]))
            return
        if (FN_RE.search(text) and re.search(r"\b(recover|bring back|decompile)\b", text.lower()) and not _code(text)) \
                or is_words_recover(text):
            await ctx.send(sender, ChatMessage(content=[TextContent(text="On it: the crew is writing C for that function now. "
                                                                      "I'll check their answer with the referee before I report back (usually 1 to 5 minutes).")]))
        try:
            reply, card = await asyncio.to_thread(respond, text)
        except Exception as e:  # respond() catches everything; this is the last line of defence
            ctx.logger.exception(f"respond failed: {e}")
            reply, card = BUSY, None
        ctx.logger.info(f"answered {sender[:16]}…: {reply.splitlines()[0][:80]}")
        await ctx.send(sender, ChatMessage(content=[TextContent(text=reply), *card_block(ctx, card), EndSessionContent()]))

    @chat.on_message(ChatAcknowledgement)
    async def on_ack(ctx: Context, sender: str, msg: ChatAcknowledgement) -> None:
        return None

    agent.include(chat, publish_manifest=True)
    return agent


if __name__ == "__main__":
    build_agent().run()
