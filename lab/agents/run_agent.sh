#!/usr/bin/env bash
# Start the Frankenstein agent (Agentverse mailbox, Agent Chat Protocol). Needs the local referee container.
# First run: creates lab/agents/.venv with uagents and openai. The agent's seed lives in the gitignored .env.
set -euo pipefail
cd "$(dirname "$0")/../.."
[ -x lab/agents/.venv/bin/python ] || { python3 -m venv lab/agents/.venv && lab/agents/.venv/bin/pip install -q uagents openai; }
# python.org builds of Python on macOS ship without CA certificates; use certifi's bundle for Agentverse TLS.
export SSL_CERT_FILE="$(lab/agents/.venv/bin/python -c 'import certifi; print(certifi.where())')"
# A previous instance can take up to a minute to release port 8001; starting early kills the new event loop.
for _ in $(seq 1 45); do lsof -iTCP:8001 -sTCP:LISTEN -t >/dev/null 2>&1 || break; sleep 2; done
if lsof -iTCP:8001 -sTCP:LISTEN -t >/dev/null 2>&1; then echo "port 8001 still in use: stop the old agent first (pkill -f lab.agents.frankenstein_agent)" >&2; exit 1; fi
exec lab/agents/.venv/bin/python -m lab.agents.frankenstein_agent
