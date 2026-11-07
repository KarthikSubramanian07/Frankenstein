"""Ping every dependency Lane B needs and say plainly what works. Never prints secrets.

    python -m crew.doctor
"""
from __future__ import annotations

import json
import sys
import time
import urllib.error
import urllib.request

from .config import Config
from .referee import make_referee


def _get(url: str, key: str, timeout: float = 15):
    req = urllib.request.Request(url, headers={"Authorization": f"Bearer {key}"})
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return json.loads(r.read())


def main() -> int:
    cfg = Config()
    ok = True
    rows = []
    # Meta Model API
    if not cfg.api_key:
        rows.append(("meta", "FAIL", "META_API_KEY missing in .env")); ok = False
    else:
        try:
            t = time.time()
            ids = [m["id"] for m in _get(f"{cfg.base_url}/models", cfg.api_key)["data"]]
            have = [m for m in (cfg.model, cfg.escalation_model) if m and m in ids]
            rows.append(("meta", "OK" if cfg.model in ids else "FAIL",
                         f"{len(ids)} models; using {', '.join(have) or 'NONE'} ({(time.time()-t)*1000:.0f} ms)"))
            ok &= cfg.model in ids
        except Exception as e:
            rows.append(("meta", "FAIL", str(e)[:120])); ok = False
    # SubQ
    if not cfg.subq_key:
        rows.append(("subq", "WARN", "SUBQ_API_KEY missing: Snap triage/escalation/gate off"))
    else:
        try:
            ids = [m["id"] for m in _get(f"{cfg.subq_url}/models", cfg.subq_key)["data"]]
            rows.append(("subq", "OK", f"models: {', '.join(ids)}" + ("" if "subq-preview" in ids else
                         " (no subq-preview: Cartographer needs early access)")))
        except Exception as e:
            rows.append(("subq", "FAIL", str(e)[:120]))
    # Referee
    try:
        ref = make_referee(cfg.referee_url)
        t = time.time()
        h = ref.health()
        rows.append(("referee", "OK" if getattr(ref, "kind", "") == "lab" else "WARN",
                     f"{cfg.referee_url} {h} ({(time.time()-t)*1000:.0f} ms)"))
    except Exception as e:
        rows.append(("referee", "FAIL", f"{cfg.referee_url}: {str(e)[:100]} (run lab/setup_referee.sh, "
                                        "or REFEREE_URL=mock for wiring)")); ok = False
    # MongoDB
    if cfg.mongodb_uri:
        try:
            from pymongo import MongoClient
            MongoClient(cfg.mongodb_uri, serverSelectionTimeoutMS=4000).admin.command("ping")
            rows.append(("mongodb", "OK", f"db {cfg.mongodb_db}"))
        except Exception as e:
            rows.append(("mongodb", "FAIL", str(e)[:120]))
    else:
        rows.append(("mongodb", "WARN", "MONGODB_URI missing: idiom library uses local JSON"))
    rows.append(("target", "OK", f"{cfg.manifest_path.relative_to(cfg.runs_dir.parent)}"))
    for name, st, msg in rows:
        print(f"{st:5} {name:8} {msg}")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
