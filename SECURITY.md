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
  they need no inbound connections. Their own uAgents servers (8001, 8002) are forced onto 127.0.0.1
  as well. The phone page serves a fixed list of named files plus the ROM, with no directory listing.
- **Spend caps.** The jobs API allows at most 3 jobs at once and $5 in any rolling hour, counting every job and
  every route (`CREW_MAX_JOBS` and `CREW_HOURLY_USD` change these). A job reserves its whole budget when it starts,
  and anything past a cap gets HTTP 429. `max_usd` is clamped between $0.10 and $5. Queries are cleaned of control
  characters and cut to 200 characters. Request bodies are capped at 256 KB, and heartbeats at 6 MB.
- **Lint and a sandbox for untrusted C.** Lint (`lab/LINT.md`) reads the source the way the preprocessor does,
  and again after macro expansion. Only `<system>` headers may be included. Code compiles in a pinned devkitARM
  container that has no network and sees an empty `.env`. Each compile stops after 60 s or 20 errors. If a
  compile log mentions any file other than the candidate and its headers, the referee withholds the log.
- **The web surfaces.** The site's CSP is `default-src 'self'` with `frame-ancestors 'none'`, plus HSTS and
  `nosniff`. The only remote script is GSAP from cdnjs, pinned with a subresource-integrity hash; the CSP allows only that one path. The referee sends no wildcard CORS header.
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

## Fixed in the 2026-11-08 review

| Severity | Finding | Commit |
|---|---|---|
| Critical | The bench referee (7121) sent `Access-Control-Allow-Origin: *`, took `text/plain` posts and had no include rule, so any web page open on the laptop could read `.env` through a compile log. | `083f10b` |
| High | Any web page could start paid crew jobs with a `text/plain` POST, or by DNS rebinding. | `083f10b` |
| Medium | The same cross-site gap on the director (7112), the referee (7101) and the bridge (7300 to 7304). The uAgents servers bound `0.0.0.0` with wildcard CORS, so anyone on the network could reach `/connect`. Every "prove" message re-linked all 235 functions, with no limit on how many ran at once. | `083f10b`, `41bea39`, `b4fec5d` |
| Low | Stage sockets had no Origin check. The sandbox container had no resource limits, and compile work folders were never deleted (1.4 GB). MongoDB errors could carry the URI into `metrics.json`. GSAP had no integrity hash. Actions were pinned to tags. Dependencies had 5 advisories, including zod (high) in `lab/film`. | `b4fec5d`, `41bea39`, `fc66fae`, `080c1fa`, `26d4588` |

**Local services refuse browsers.** Every localhost API (referee 7101, bench referee 7121, crew jobs 7111,
director 7112, bridge 7300/7301/7304, Stage 7201/7202) answers only `Host` 127.0.0.1, localhost or [::1], which
defeats DNS rebinding. It also refuses any non-loopback `Origin`, and POSTs that spend money or change state must
be `application/json`, so a cross-site `text/plain` POST gets 415 (`crew/httpguard.py`). No service sends a wildcard CORS
header, and Stage sockets accept only `STAGE_ORIGINS`. The uAgents servers (8001, 8002) are forced onto 127.0.0.1
and accept browser requests only from agentverse.ai. The bench referee applies the same include and directive
lint as the lab referee, and it withholds any compile log that names another file. The `frank-lab` sandbox runs read-only, with
no capabilities, 2 GB of memory and 256 processes, and each compile's work folder is deleted. MongoDB errors
are scrubbed of credentials before they reach `metrics.json`. GitHub Actions are pinned to commit SHAs, with
`contents: read` and no persisted credentials.

**Repository settings.** `main` is protected: changes go through a pull request, the offline test job must pass,
and force pushes and deletion are blocked. Secret scanning with push protection, Dependabot alerts and security
updates, CodeQL default setup, and weekly grouped Dependabot version updates (`.github/dependabot.yml`) are on.
Merged branches are deleted automatically.

**After pulling these fixes,** restart every service that is still running older code. Recreate the `frank-lab` container
(`lab/setup_referee.sh`) so it picks up the new limits.

## Still open

- The bench referee compiles on the host rather than in the container. The include lint gates it, and it serves
  only the 20 bench functions.
- `creature/overlay/serve.py` lists the overlay folder. It is confined to that folder and to localhost.
