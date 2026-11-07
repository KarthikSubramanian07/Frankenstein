"""Frankenstein Excavator: the second agent. It digs C out of the crew, then asks a separate agent to judge it.

  "Recover fn_XXXXXXXX" / "Recover the face"  -> crew job (Lane B) -> recovered C sent to the Frankenstein Referee
                                                 agent by agent-to-agent ChatMessage -> its verdict, quoted, to the user
  "selftest fn_0801B724" (hidden)             -> skips the crew; sends a known one-liner to the Referee agent
Agent Chat Protocol, Agentverse mailbox, port 8002. Every reply keeps Observed apart from Inferred.

Run: lab/agents/run_excavator.sh   (mailbox: python3 -m lab.agents.connect_mailbox --port 8002)
"""
import asyncio
import re
import secrets
import time
from pathlib import Path

from lab.agents.frankenstein_agent import (BUSY, CREW_URL, FN_RE, INFERRED, JOB_TIMEOUT_S, OBSERVED, REPO, TOO_LONG, _http,
                                           too_long)

REFEREE_AGENT = "agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0"
REFEREE_TIMEOUT_S = 120  # mailbox round trip: Agentverse relays both legs
REFEREE_TRIES = 2  # ask once, re-send once if the first ask gets no reply in half the budget
SELFTEST_C = "int fn_0801B724(const void *e){ (void)e; return 0; }"
SEED_KEY = "FRANKENSTEIN_EXCAVATOR_SEED"
JOB_MAX_USD = 0.5  # per crew job; the crew reserves 1.2x this against its hourly cap

# Replies from the Referee agent, oldest first. ponytail: one question in flight at a time is assumed per reply;
# with concurrent recoveries we match by fn id in the reply's first line.
_referee_replies: asyncio.Queue | None = None


def _seed() -> str:
    env = REPO / ".env"
    text = env.read_text() if env.exists() else ""
    m = re.search(rf"^{SEED_KEY}=(\S+)", text, re.M)
    if m:
        return m.group(1)
    seed = secrets.token_hex(32)
    with env.open("a") as f:
        f.write(f"\n{SEED_KEY}={seed}\n")
    return seed


def _norm(fn: str) -> str:
    return "fn_" + fn[3:].upper()


def run_crew_job(fn: str | None, query: str) -> tuple[str | None, str, dict]:
    """Blocking. Returns (src or None, fn, last job status). src is None when the crew didn't match."""
    # $0.5 is plenty: the Digger stops at attempt_budget() (4 tries for small fns, ~$0.04), not at max_usd. A smaller
    # cap only shrinks the $ reservation (max_usd * 1.2) against CREW_HOURLY_USD, so more jobs fit per hour.
    job = _http("POST", f"{CREW_URL}/jobs", {"fn": fn, "max_usd": JOB_MAX_USD} if fn else {"query": query[:200], "live": True, "max_usd": JOB_MAX_USD},
                errors=True)
    if job is None:
        return None, fn or "?", {"status": "crew_down"}
    if "http_status" in job:  # e.g. 429 when the hourly spend cap is reached: say so instead of "crew down"
        return None, fn or "?", {"status": "refused", "error": job["error"], "http_status": job["http_status"]}
    if "job_id" not in job:
        return None, fn or "?", {"status": "unrouted", "route": job}
    fn = fn or (job.get("route") or {}).get("fns", ["?"])[0]
    deadline = time.time() + JOB_TIMEOUT_S
    status: dict = {}
    while time.time() < deadline:
        status = _http("GET", f"{CREW_URL}/jobs/{job['job_id']}") or {}
        if status.get("status") in ("matched", "abandoned", "failed"):
            break
        time.sleep(3)
    if status.get("status") != "matched":
        return None, fn, status
    return (REPO / status["src_path"]).read_text(), fn, status


def crew_failure_reply(fn: str, status: dict) -> str:
    s = status.get("status")
    if s == "crew_down":
        return ("The crew (the agents that write the C) is down right now, so I can't start a recovery. "
                "Nothing was sent to the Referee agent. Try again shortly.")
    if s == "refused":
        busy = " The crew is busy; try again in a minute." if status["http_status"] == 429 else ""
        return (f"The crew refused the job (HTTP {status['http_status']}): {status['error']}.{busy} "
                "Nothing was sent to the Referee agent.")
    if s == "unrouted":
        return "The crew couldn't tie those words to a function in the game. Try an id like `fn_0801B724`."
    best = status.get("best_pct")
    return (f"### Recovery of `{fn}`: **{(s or 'still running').upper()}**\n\n{OBSERVED}\n"
            f"- Attempts: {status.get('attempts', '?')}, best match so far: {best if best is not None else '?'}%\n"
            "- The crew has no matching C yet, so there was nothing to send to the Referee agent.")


def verdict_reply(fn: str, src: str, referee_text: str | None, status: dict | None) -> str:
    head = f"### Excavation of `{fn}`"
    lines = [head, "", OBSERVED]
    if status:
        lines.append(f"- The crew reported a match after {status.get('attempts', '?')} attempts "
                     f"(cost ${status.get('cost_usd', 0):.2f}); I did not take its word for it.")
    if referee_text is None:
        lines += [f"- I sent the C to the Frankenstein Referee agent (`{REFEREE_AGENT[:20]}…`), a separate agent, "
                  f"(asked {REFEREE_TRIES} times) and got no reply within {REFEREE_TIMEOUT_S} s. No verdict, so this is **not** verified."]
    else:
        lines += [f"- Verdict from the Frankenstein Referee agent (`{REFEREE_AGENT[:20]}…`), a separate agent "
                  "that compiles the C and compares bytes. Its reply, quoted:", ""]
        lines += ["> " + ln for ln in referee_text.strip().splitlines()]
    lines += ["", "```c", src.strip()[:1500], "```", "", INFERRED,
              "- Which game routine this is comes from the crew's reading, not from the compiler."]
    return "\n".join(lines)


def build_agent():
    from uagents import Agent, Context, Protocol
    from uagents_core.contrib.protocols.chat import (ChatAcknowledgement, ChatMessage, EndSessionContent, TextContent,
                                                     chat_protocol_spec)

    agent = Agent(name="frankenstein-excavator", seed=_seed(), port=8002, mailbox=True, publish_agent_details=True,
                  readme_path=str(Path(__file__).with_name("EXCAVATOR_README.md")),
                  description="Recovers DOOM GBA functions with an agent crew, then has the Frankenstein Referee agent verify them.")
    chat = Protocol(spec=chat_protocol_spec)

    async def ask_referee(ctx: Context, fn: str, src: str) -> str | None:
        global _referee_replies
        _referee_replies = _referee_replies or asyncio.Queue()
        question = f"Does this C match {fn}?\n\n```c\n{src.strip()}\n```"
        ctx.logger.info(f"asking Referee agent about {fn}")
        # ponytail: a late reply to the first ask can sit in the queue; it is for the same fn and C, so harmless
        for attempt in range(1, REFEREE_TRIES + 1):
            if attempt > 1:
                ctx.logger.info(f"no reply from Referee agent about {fn}; asking again")
            await ctx.send(REFEREE_AGENT, ChatMessage(content=[TextContent(text=question)]))
            deadline = time.time() + REFEREE_TIMEOUT_S / REFEREE_TRIES
            while (left := deadline - time.time()) > 0:
                try:
                    text = await asyncio.wait_for(_referee_replies.get(), left)
                except asyncio.TimeoutError:
                    break
                if fn in text.splitlines()[0]:
                    return text
        return None

    async def excavate(ctx: Context, user: str, text: str) -> None:
        try:
            await _excavate(ctx, user, text)
        except Exception as e:  # a background task's exception would otherwise vanish and leave the user waiting
            ctx.logger.exception(f"excavate failed: {e}")
            await ctx.send(user, ChatMessage(content=[TextContent(text=BUSY), EndSessionContent()]))

    async def _excavate(ctx: Context, user: str, text: str) -> None:
        fn_m = FN_RE.search(text)
        fn = _norm(fn_m.group(0)) if fn_m else None
        status = None
        if fn and re.search(r"\bselftest\b", text.lower()):
            src = SELFTEST_C.replace("fn_0801B724", fn)
        else:
            src, fn, status = await asyncio.to_thread(run_crew_job, fn, text)
            if src is None:
                await ctx.send(user, ChatMessage(content=[TextContent(text=crew_failure_reply(fn, status)), EndSessionContent()]))
                return
        verdict = await ask_referee(ctx, fn, src)
        ctx.logger.info(f"Referee agent verdict for {fn}: {(verdict or 'NO REPLY').splitlines()[0][:80]}")
        await ctx.send(user, ChatMessage(content=[TextContent(text=verdict_reply(fn, src, verdict, status)), EndSessionContent()]))

    @chat.on_message(ChatMessage)
    async def on_chat(ctx: Context, sender: str, msg: ChatMessage) -> None:
        await ctx.send(sender, ChatAcknowledgement(acknowledged_msg_id=msg.msg_id))
        text = msg.text()
        if sender == REFEREE_AGENT:
            ctx.logger.info(f"reply from Referee agent: {text.splitlines()[0][:80] if text else '(empty)'}")
            if text.strip() and _referee_replies is not None:
                _referee_replies.put_nowait(text)
            return
        if not text.strip():
            return
        if too_long(text):
            await ctx.send(sender, ChatMessage(content=[TextContent(text=TOO_LONG), EndSessionContent()]))
            return
        lower = text.lower()
        if not (re.search(r"\b(recover|bring back|dig|excavate|selftest)\b", lower)):
            await ctx.send(sender, ChatMessage(content=[TextContent(text=HELP), EndSessionContent()]))
            return
        if "selftest" not in lower:
            await ctx.send(sender, ChatMessage(content=[TextContent(text=(
                "On it: the crew is writing C now. When it says it matched, I'll send the C to the Frankenstein "
                "Referee agent and report its verdict (usually 1 to 5 minutes)."))]))
        # Background task: the crew takes minutes and the Referee's reply must reach on_chat while we wait.
        asyncio.create_task(excavate(ctx, sender, text))

    @chat.on_message(ChatAcknowledgement)
    async def on_ack(ctx: Context, sender: str, msg: ChatAcknowledgement) -> None:
        return None

    agent.include(chat, publish_manifest=True)
    return agent


HELP = """I'm Frankenstein's Excavator. A crew of coding agents digs DOOM's lost C source out of the Game Boy Advance ROM; \
I hand what they find to a separate agent, the Frankenstein Referee, which accepts it only if it compiles byte-identical.

Try:
- "Recover fn_XXXXXXXX"
- "Recover the face" (the crew picks the function from your words)
"""


if __name__ == "__main__":
    build_agent().run()
