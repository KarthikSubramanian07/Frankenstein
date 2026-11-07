"""Frankenstein on Agentverse: the whole workflow inside an ASI:One chat (Fetch.ai track requirements).

One agent, Agent Chat Protocol, mailbox mode (no inbound ports). It runs next to the local referee and crew.
  "Does this C match fn_0801B724?" + a ```c block   -> referee verdict
  "Verify my fix for fn_X" + a ```c block          -> patch: exactly which functions changed, new ROM SHA-1
  "Recover fn_X"                                   -> crew job (Lane B), then the referee re-verifies before we answer
  "How much of DOOM is back?"                      -> progress from runs/live
  "Prove the rebuild is exact"                     -> ROM rebuilt from the agents' code, two SHA-1s
  "Which functions can I try?"                     -> smallest unrecovered functions
Every answer keeps Observed (proved by the compiler) apart from Inferred (our reading, not proof).

Run (lab/agents/.venv has uagents): lab/agents/.venv/bin/python -m lab.agents.frankenstein_agent
"""
import json
import os
import re
import secrets
import time
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
CREW_URL = os.environ.get("CREW_URL", "http://127.0.0.1:7111")
FN_RE = re.compile(r"\bfn_[0-9A-Fa-f]{8}\b")
CODE_RE = re.compile(r"```(?:c|C)?\s*\n(.*?)```", re.S)
JOB_TIMEOUT_S = 90
MIN_SUGGEST_BYTES = 8  # 2-byte functions are a bare return; too trivial to show anyone
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
    fn_match = FN_RE.search(text)
    fn = fn_match.group(0)[:3] + fn_match.group(0)[3:].upper() if fn_match else None
    code = _code(text)
    lower = text.lower()
    try:
        if code and fn and re.search(r"\b(fix|patch)", lower):
            return answer_patch(fn, code)
        if code and fn:
            return answer_check(fn, code)
        if fn and re.search(r"\b(recover|bring back|decompile|rebuild)\b", lower) and "prove" not in lower:
            return answer_recover(fn)
        if re.search(r"\b(prove|proof|exact|sha|identical|checksum)", lower):
            return answer_prove()
        if re.search(r"\b(how much|progress|status|recovered|percent|%)", lower):
            return answer_status()
        if re.search(r"\b(which|list|try|small|easy|start)", lower):
            return answer_candidates()
    except (KeyError, ValueError) as e:
        return f"I couldn't do that: {e}. Ask \"which functions can I try?\" for valid ids."
    except Exception as e:  # never leave the chat hanging
        return f"Something on our side failed ({type(e).__name__}). The referee may be offline; try again in a minute."
    return HELP


HELP = """I'm Frankenstein's referee. Agents rebuild DOOM's lost C source for the Game Boy Advance, and nothing counts unless a compiler proves it is byte-for-byte identical.

Try:
- "Which functions can I try?"
- "Does this C match fn_XXXXXXXX?" followed by a ```c block
- "Verify my fix for fn_XXXXXXXX" followed by a ```c block
- "Recover fn_XXXXXXXX"
- "How much of DOOM is back?"
- "Prove the rebuild is exact"
"""


def answer_check(fn: str, code: str) -> str:
    r = referee().check(fn, code)
    lines = [f"### Verdict for `{fn}`: **{_verdict(r)}**", "", OBSERVED]
    lines += _observed_lines(r)
    lines += ["", INFERRED, _inferred(fn)]
    return "\n".join(lines)


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


def answer_recover(fn: str) -> str:
    job = _http("POST", f"{CREW_URL}/jobs", {"fn": fn, "max_usd": 1.5})
    if job is None:
        return f"The crew (the agents that write the code) isn't reachable right now, so I can't start a recovery of `{fn}`. Try again shortly."
    deadline = time.time() + JOB_TIMEOUT_S
    status = {}
    while time.time() < deadline:
        status = _http("GET", f"{CREW_URL}/jobs/{job['job_id']}") or {}
        if status.get("status") in ("matched", "abandoned", "failed"):
            break
        time.sleep(3)
    if status.get("status") != "matched":
        best = status.get("best_pct")
        return (f"### Recovery of `{fn}`: **{(status.get('status') or 'still running').upper()}**\n\n{OBSERVED}\n"
                f"- Attempts: {status.get('attempts', '?')}, best match so far: {best if best is not None else '?'}%\n"
                f"- False claims caught: {status.get('false_claims', 0)}\n\nAsk again in a minute; the job keeps going.")
    src = (REPO / status["src_path"]).read_text()
    r = referee().check(fn, src)  # the crew says MATCH; the referee decides
    lines = [f"### Recovery of `{fn}`: **{_verdict(r)}** (re-verified by the referee, not taken on the crew's word)", "",
             OBSERVED] + _observed_lines(r) + [
             f"- Attempts: {status.get('attempts')}, cost: ${status.get('cost_usd', 0):.2f}, false claims caught: {status.get('false_claims', 0)}",
             "", "```c", src.strip()[:1500], "```", "", INFERRED, _inferred(fn)]
    return "\n".join(lines)


def answer_status() -> str:
    s = _http("GET", f"{CREW_URL}/status")
    game = [f for f in referee().functions.values() if f["scope"] == "game"]
    if s:
        matched, total, pct, lies = s.get("matched"), s.get("fn_total") or len(game), s.get("pct_recovered"), s.get("false_claims")
    else:
        recovered = list((REPO / "runs" / "live" / "recovered").glob("fn_*.c")) if (REPO / "runs" / "live").exists() else []
        matched, total, lies = len(recovered), len(game), None
        pct = round(100.0 * matched / total, 1) if total else 0.0
    lines = ["### How much of DOOM is back", "", OBSERVED,
             f"- Functions recovered and byte-identical: {matched} of {total} ({pct}%)"]
    if lies is not None:
        lines.append(f"- False \"I matched it\" claims caught by the Checker: {lies}")
    lines += ["", INFERRED, "- Which part of the game each function belongs to is our reading of its code, not proof."]
    return "\n".join(lines)


def answer_prove() -> str:
    from lab.referee.romlink import RomLinker
    r = RomLinker(referee()).rebuild(str(REPO / "runs" / "live" / "recovered"))
    lines = ["### Is the rebuilt game exact?", "", OBSERVED,
             f"- Original ROM SHA-1: `{r['original_sha1']}`",
             f"- ROM built from the agents' code: `{r['rom_sha1']}`",
             f"- Identical: **{'yes' if r['identical'] else 'NO'}**",
             f"- Functions taken from the agents' compiled code: {r['recovered']} ({r['pct_agent_code']}% of the game's code bytes)"]
    if r["rejected"]:
        lines.append(f"- Rejected from the rebuild (not byte-identical): {len(r['rejected'])}")
    lines += ["", INFERRED, "- None. Every line above is a checksum or a count."]
    return "\n".join(lines)


def answer_candidates() -> str:
    done = {p.stem for p in (REPO / "runs" / "live" / "recovered").glob("fn_*.c")} if (REPO / "runs" / "live").exists() else set()
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
                f"- First difference at byte {d['offset']}: original `{d['expected_ins']}`, yours `{d['got_ins']}`"]
    if r["status"] == "NO_COMPILE":
        return ["- The compiler rejected it:", "```", r["compile"]["log"].strip()[-600:], "```"]
    return [f"- Rule {v['rule']}: {v['reason']}" for v in r["lint"]["violations"]]


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


def _http(method: str, url: str, body: dict | None = None) -> dict | None:
    try:
        data = json.dumps(body).encode() if body is not None else None
        req = urllib.request.Request(url, data=data, method=method, headers={"Content-Type": "application/json"})
        with urllib.request.urlopen(req, timeout=10) as resp:
            return json.loads(resp.read())
    except Exception:
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

    agent = Agent(name="frankenstein-referee", seed=_seed(), port=8001, mailbox=True, publish_agent_details=True,
                  readme_path=str(Path(__file__).with_name("AGENT_README.md")),
                  description="Rebuilds DOOM's lost source for the Game Boy Advance and proves every function byte-identical.")
    chat = Protocol(spec=chat_protocol_spec)

    @chat.on_message(ChatMessage)
    async def on_chat(ctx: Context, sender: str, msg: ChatMessage) -> None:
        await ctx.send(sender, ChatAcknowledgement(acknowledged_msg_id=msg.msg_id))
        text = msg.text()
        if not text.strip():
            return
        reply = await asyncio.to_thread(answer, text)
        ctx.logger.info(f"answered {sender[:16]}…: {reply.splitlines()[0][:80]}")
        await ctx.send(sender, ChatMessage(content=[TextContent(text=reply), EndSessionContent()]))

    @chat.on_message(ChatAcknowledgement)
    async def on_ack(ctx: Context, sender: str, msg: ChatAcknowledgement) -> None:
        return None

    agent.include(chat, publish_manifest=True)
    return agent


if __name__ == "__main__":
    build_agent().run()
