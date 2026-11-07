#!/usr/bin/env bash
# Copy the crew's union into the site and rebuild the road summary the meter reads.
#   site/tools/sync_union.sh            # sync only
#   site/tools/sync_union.sh --deploy   # sync, then deploy to tryfrankenstein.pages.dev
# Writes site/data/union.json (an exact copy of crew/exports/union/UNION.json), refreshes
# crew/exports/union/CLOSE.json (tools/close_tier.py) and writes site/data/road.json (stage/server/road.mjs).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
cp crew/exports/union/UNION.json site/data/union.json
python3 tools/close_tier.py
node stage/server/road.mjs > site/data/road.json
python3 -c "import json;u=json.load(open('site/data/union.json'));r=json.load(open('site/data/road.json'));print(f\"site/data: {u['functions']} of {u['of']} functions, {u['pct_bytes']}% of the code bytes, close {len(r['close']['fns'])}, climb {len(r['climb'])}\")"
if [ "${1:-}" = "--deploy" ]; then
  npx --yes wrangler@4 pages deploy site --project-name tryfrankenstein --branch main --commit-dirty=true
fi
