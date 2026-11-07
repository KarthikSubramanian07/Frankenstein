#!/usr/bin/env bash
# Start the Frankenstein Excavator agent (Agentverse mailbox, Agent Chat Protocol). It asks the Referee agent (run_agent.sh) to verify.
# First run: creates lab/agents/.venv with uagents and openai. Its seed (FRANKENSTEIN_EXCAVATOR_SEED) lives in the gitignored .env.
set -euo pipefail
cd "$(dirname "$0")/../.."
[ -x lab/agents/.venv/bin/python ] || { python3 -m venv lab/agents/.venv && lab/agents/.venv/bin/pip install -q uagents openai; }
# python.org builds of Python on macOS ship without CA certificates; use certifi's bundle for Agentverse TLS.
export SSL_CERT_FILE="$(lab/agents/.venv/bin/python -c 'import certifi; print(certifi.where())')"
# A previous instance can take up to a minute to release port 8002; starting early kills the new event loop.
for _ in $(seq 1 45); do lsof -iTCP:8002 -sTCP:LISTEN -t >/dev/null 2>&1 || break; sleep 2; done
if lsof -iTCP:8002 -sTCP:LISTEN -t >/dev/null 2>&1; then echo "port 8002 still in use: stop the old agent first (pkill -f lab.agents.excavator_agent)" >&2; exit 1; fi
exec lab/agents/.venv/bin/python -m lab.agents.excavator_agent
