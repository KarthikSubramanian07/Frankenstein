"""Create the agent's Agentverse mailbox without the browser inspector (same call its Connect button makes).

Needs AGENTVERSE_API_KEY in .env (Agentverse dashboard, API Keys) and the agent running (lab/agents/run_agent.sh).
Run: python3 -m lab.agents.connect_mailbox [--port 8002]   (8001 Referee, 8002 Excavator)
"""
import argparse
import json
import os
import urllib.error
import urllib.request

from lab.memory_probe import load_env


def main() -> None:
    ap = argparse.ArgumentParser(prog="python3 -m lab.agents.connect_mailbox")
    ap.add_argument("--port", type=int, default=8001)
    agent_url = f"http://127.0.0.1:{ap.parse_args().port}/connect"
    load_env()
    token = os.environ.get("AGENTVERSE_API_KEY")
    if not token:
        raise SystemExit("AGENTVERSE_API_KEY missing: create one in Agentverse (API Keys) and add it to .env")
    body = json.dumps({"user_token": token, "agent_type": "mailbox"}).encode()
    req = urllib.request.Request(agent_url, data=body, method="POST", headers={"Content-Type": "application/json"})
    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            print(json.loads(resp.read()))
    except urllib.error.HTTPError as e:
        print(f"HTTP {e.code}: {e.read().decode()[:500]}")
    except urllib.error.URLError as e:
        print(f"agent not reachable at {agent_url}: {e.reason}. Start it with lab/agents/run_agent.sh or run_excavator.sh")


if __name__ == "__main__":
    main()
