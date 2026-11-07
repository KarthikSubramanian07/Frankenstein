# Security

Frankenstein compiles code that strangers send it and spends real money on every model call. Here is what we
protect and how.

## Threat model

1. The repo is public: anything ever committed is published.
2. ASI:One is an open front door. Anyone can send words and C to our agents, which call the crew jobs API and the referee.
3. Candidate C, written by agents or pasted by people, is untrusted code that we compile.
4. Every Muse and Snap call costs money, so the cheapest attack is draining the budget.
5. The demo laptop runs every service, so a web page open on it must not be able to drive them.

## What we enforce

- **No secrets in git.** API keys live only in `.env`, which is gitignored. We scanned the full history (all
  branches) for the live Meta, SubQ and Gemini keys, and for common key formats (`sk-`, `AIza`, `ghp_`,
  `mongodb+srv://` with a password, private keys, bearer tokens). Nothing was found. Run logs and
  `crew/exports/` contain no keys and no Authorization headers.
- **The crew can't read the answer keys.** `crew/guard.py` blocks `lab/secrets/`, `crew/bench/answers/` and
  `lab/out/viz_map.json` from every crew file read. Exports hold only the functions the Checker accepted and
  names marked as inferred, never the original Doom names.
- **Every service listens on localhost only.** That covers the referee (7101), bench referee (7121), crew jobs
  API (7111), director (7112), Stage (5173, 7201, 7202), bridge (7300, 7301, 7304), overlay (7302) and phone page
  (7401). We checked this by reading the code and with `lsof`. The ASI:One agents use Agentverse mailbox mode, so
  they need no inbound connections. Their own uAgents servers (8001, 8002) are the one exception still to check
  (see Lane A below). The phone page serves six named files plus the ROM, with no directory listing.
- **Spend caps.** The jobs API allows at most 3 jobs at once and $5 in any rolling hour, counting every job and
  every route (`CREW_MAX_JOBS` and `CREW_HOURLY_USD` change these). A job reserves its whole budget when it starts,
  and anything past a cap gets HTTP 429. `max_usd` is clamped between $0.10 and $5. Queries are cleaned of control
  characters and cut to 200 characters. Request bodies are capped at 256 KB, and heartbeats at 6 MB.
- **Lint and a sandbox for untrusted C.** Lint (`lab/LINT.md`) reads the source the way the preprocessor does,
  and again after macro expansion. Only `<system>` headers may be included. Code compiles in a pinned devkitARM
  container that has no network and sees an empty `.env`. Each compile stops after 60 s or 20 errors. If a
  compile log mentions any file other than the candidate and its headers, the referee withholds the log.
- **The web surfaces.** The site's CSP is `default-src 'self'` with `frame-ancestors 'none'`, plus HSTS and
  `nosniff`. No page loads remote scripts (only fonts). The referee sends no wildcard CORS header.
- **CI and dependencies.** Workflows run with `contents: read`, there is no `pull_request_target`, and secrets
  reach jobs only through `env`. `npm audit --omit=dev` finds 0 issues in `stage/` and `creature/phone/`.

## Reporting a problem

Open a GitHub issue titled `security` and leave out the details. We will contact you and fix it in the open.
Please don't test against someone else's machine.

## Fixed in the 2026-11-07 review

| Severity | Finding | Commit |
|---|---|---|
| Critical | Lint L009 matched raw text, so `%:include "/work/.env"` (a digraph), a backslash-newline splice, or a `"/*"` inside a string let pasted C include any file in the repo mount. GCC printed that file's lines in the compile log, and the ASI:One check intent sent the log back to the user. | `e84e353` (Lane A extended it in `8b37939`) |
| High | No concurrency or spend cap on the jobs API, and `/route` (a whole-program Snap call) was unlimited. | `cb923c8` |
| Medium | Compiles had no timeout or error cap. The referee sent `Access-Control-Allow-Origin: *`, so any web page could post to it. `/rebuild` read any directory named in the request body. | `e84e353` |
| Medium | The referee container mounted `.env` and had network access. | `11f8e98` (applies to newly created containers) |
| Low | Director heartbeats had no body, frame or list caps. Negative or non-numeric Content-Length broke the handlers. `crew.export` ran `rmtree` on a path built from an unchecked run id. | `cb923c8` |

## Requests per lane

**Lane A (lab)**
1. *High until done:* restart the referee (`python -m lab.referee serve`) and both agents on every machine that
   runs them. Running processes still hold the code from before `e84e353`. Recreate the `frank-lab` container
   between demo runs so that it gets `--network none` and the empty `.env`.
2. *Low, unverified:* the uAgents servers on 8001 and 8002 may bind all interfaces, which is the uAgents default
   as we understand it. uAgents isn't installed on the reviewer's machine. Check with
   `lsof -nP -iTCP:8001 -sTCP:LISTEN`. Only signed agent envelopes are accepted there, so the exposure is about
   the same as public ASI:One access. Keep the macOS firewall on at the venue anyway.
3. *Low:* `lab/agents/excavator_agent.py` forwards the whole chat message as `query`, and `_http` reports every
   error (including a 429 spend cap) as "crew down". Suggested patch: send `{"query": text[:200]}`, and in `_http`
   catch `urllib.error.HTTPError` and return `json.loads(e.read())`, so the user sees "hourly spend cap reached".

**Lane C (stage)**
1. *Low:* in `stage/server/index.mjs`, `safeRun` accepts `..` and `.`. Every path it builds ends in a fixed
   filename, so the reach is one level up. Patch:
   `const safeRun = (id) => (typeof id === 'string' && /^[A-Za-z0-9][\w.-]*$/.test(id) && !id.includes('..') ? id : null);`
2. *Low:* the server on 7201 sends `access-control-allow-origin: *`. The data is public, but this lets any web page
   open on the demo laptop read it. Consider allowing only `http://127.0.0.1:5173`.

**Lane D (creature)**
1. *Info:* `creature/overlay/serve.py` uses `SimpleHTTPRequestHandler`, which lists the overlay folder. It is
   confined to that folder and localhost.
2. *Low:* commit `creature/phone/package-lock.json` so `npm ci` pins the mgba-wasm dependency tree.

**Shared**
- *Info:* GitHub Actions are pinned to major tags (`@v4`), not commit SHAs. That is fine for today.
