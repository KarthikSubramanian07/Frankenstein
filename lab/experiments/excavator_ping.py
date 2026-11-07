"""Send one chat message to the Excavator from a REGISTERED identity (Almanac API, local endpoint :8003).

An unregistered sender made the Excavator hang on a ledger lookup; this one registers like the real agents do,
so the Excavator's ack and replies resolve through the Almanac API.

  lab/agents/.venv/bin/python -m lab.experiments.excavator_ping "Recover fn_08004DA8"
Seed lives in /tmp/excavator_ping.seed (throwaway, but stable across runs so the registration is reused).
"""
import secrets
import sys
from pathlib import Path

from uagents import Agent, Context, Protocol
from uagents_core.contrib.protocols.chat import ChatAcknowledgement, ChatMessage, TextContent, chat_protocol_spec

EXCAVATOR = "agent1qf4w7kmtsgv4fdyuj72nwethhjwhmdh7m3u7kqe5tgz4wyq8nmmmq5gjacp"
SEED_FILE = Path("/tmp/excavator_ping.seed")
PORT = 8003
SEND_AFTER_S = 20.0  # let the startup Almanac registration land before the Excavator looks us up

if not SEED_FILE.exists():
    SEED_FILE.write_text(secrets.token_hex(32))
text = " ".join(sys.argv[1:]) or "Recover fn_08004DA8"
agent = Agent(name="frankenstein-excavator-ping", seed=SEED_FILE.read_text().strip(), port=PORT,
              endpoint=[f"http://127.0.0.1:{PORT}/submit"])
chat = Protocol(spec=chat_protocol_spec)
sent = False


@agent.on_interval(period=SEND_AFTER_S)
async def send_once(ctx: Context) -> None:
    global sent
    if sent:
        return
    sent = True
    ctx.logger.info(f"sending to Excavator: {text}")
    await ctx.send(EXCAVATOR, ChatMessage(content=[TextContent(text=text)]))


@chat.on_message(ChatMessage)
async def on_chat(ctx: Context, sender: str, msg: ChatMessage) -> None:
    await ctx.send(sender, ChatAcknowledgement(acknowledged_msg_id=msg.msg_id))
    ctx.logger.info(f"REPLY from {sender[:20]}: {msg.text()}")


@chat.on_message(ChatAcknowledgement)
async def on_ack(ctx: Context, sender: str, msg: ChatAcknowledgement) -> None:
    ctx.logger.info(f"ack from {sender[:20]}")


agent.include(chat)

if __name__ == "__main__":
    agent.run()
