#!/usr/bin/env bash
# Start the Frankenstein agent (Agentverse mailbox, Agent Chat Protocol). Needs the local referee container.
# First run: creates lab/agents/.venv with uagents and openai. The agent's seed lives in the gitignored .env.
set -euo pipefail
cd "$(dirname "$0")/../.."
[ -x lab/agents/.venv/bin/python ] || { python3 -m venv lab/agents/.venv && lab/agents/.venv/bin/pip install -q uagents openai; }
# python.org builds of Python on macOS ship without CA certificates; use certifi's bundle for Agentverse TLS.
export SSL_CERT_FILE="$(lab/agents/.venv/bin/python -c 'import certifi; print(certifi.where())')"
exec lab/agents/.venv/bin/python -m lab.agents.frankenstein_agent
