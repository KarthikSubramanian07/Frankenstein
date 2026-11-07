# LANE 0 — Bootstrap (run first, by one person, ~15 minutes)

One teammate runs this at 10:00 in an empty folder, with all the Markdown files from this kit sitting next to it. When it pushes, everyone else clones and starts their own lane prompt. Nobody writes lane code until the foundation tag exists.

Paste everything below the line into Claude Code as the first message.

---

You are bootstrapping the FRANKENSTEIN monorepo for a hackathon. Speed matters: the whole team is waiting on this push. Target: committed and pushed in 15 minutes. Build only the foundation described here; do not start any lane's real work.

The kit files are in the current folder: `00_START_HERE.md`, `01_CONTRACTS.md`, `02_DESIGN.md`, `03_PITCH_DECK.md`, `LANE_0_BOOTSTRAP.md`, `LANE_A_LAB.md`, `LANE_B_CREW.md`, `LANE_C_STAGE.md`, `LANE_D_CREATURE.md`, and `design_system.html`. Read `01_CONTRACTS.md` fully before writing anything; it defines every shape below.

## 1. Repo and layout (2 minutes)

- `git init`, default branch `main`. Create the GitHub repo `frankenstein` as **public** (the Fetch.ai prize requires a public repo) with `gh repo create` if `gh` is authenticated; otherwise create the local repo and print the exact commands for the owner to run.
- Create exactly this tree (empty dirs get a `.gitkeep`):

```
frankenstein/
  README.md
  DECISIONS.md
  .env.example
  .gitignore
  .editorconfig
  Makefile
  requirements-dev.txt
  docs/              # all kit Markdown + design_system.html, moved here unchanged
  contracts/
    CONTRACTS.md     # copy of docs/01_CONTRACTS.md
    schemas/
    fixtures/
    make_fixtures.py
    validate.py
  lab/      README.md  __init__.py  secrets/.gitkeep  out/.gitkeep  agents/.gitkeep
  crew/     README.md  __init__.py
  stage/    README.md
  creature/ README.md
  runs/     .gitkeep
```

## 2. Shared files (4 minutes)

- `.gitignore`: `.env`, `lab/secrets/*` (keep `.gitkeep`), `lab/out/*` (keep `.gitkeep`), `runs/*` (keep `.gitkeep`), `node_modules/`, `__pycache__/`, `.venv/`, `*.gba`, `*.elf`, `*.o`, `dist/`, `.DS_Store`, OBS and video exports (`*.mkv`, `*.mp4`) except under `docs/`.
- `.env.example`: exactly the variables in the contracts section 2.
- `.editorconfig`: UTF-8, LF, 2 spaces for JS/TS/JSON/YAML, 4 for Python.
- `requirements-dev.txt`: `jsonschema`, `python-dotenv`. Lanes keep their own dependencies in their own folder (`lab/pyproject.toml`, `crew/pyproject.toml`, `stage/package.json`, `creature/...`) so no lane ever blocks another on a lockfile.
- `Makefile`: `fixtures` (runs `contracts/make_fixtures.py`), `validate` (runs `contracts/validate.py` over fixtures and any `runs/*`), `help`.
- `DECISIONS.md`: a dated log. Seed it with:
  - Target game: **GBADoom** (https://github.com/doomhack/GBADoom, prBoom port in C, GPLv2+, Doom shareware IWAD). No commercial ROMs, ever. Fallbacks (only if GBADoom won't build by 11:15): Attack on Voxelburg, then Celeste Classic GBA. Owner: Lane A, confirmed by 11:15.
  - Visual direction: "Frankenstein, the game" (five scenes) per `docs/02_DESIGN.md`.
  - Partner prizes: Meta $5,000 (best use of Meta Model API), Fetch.ai $2,500 1st and $2,500 2nd. Others: ask at kickoff, record here.
  - Submission deadline: confirm at kickoff, record here.
- `README.md` (judge-facing stub, Lane C polishes later): one-paragraph pitch, the five scenes, the lane map with owners' names left as `[name]`, how to run the mocks (`make fixtures`, `python -m lab.referee mock serve`, Stage replay), and a "Credits" section that credits the original creators of the target game.
- Each lane's `README.md`: owner `[name]`, what the lane owns (one paragraph from `docs/00_START_HERE.md` section 5), its entry points from the contracts, and "Start with `docs/LANE_X_….md`".

## 3. Schemas (3 minutes)

Write JSON Schema (draft 2020-12) files in `contracts/schemas/` for every shape in the contracts: `manifest`, `viz_map`, `referee_result`, `rebuild_result`, `patch_result`, `event` (envelope plus a `oneOf` per event type with its payload), `metrics`, `sprite_frame`, `crew_job`, `crew_status`. Additive fields allowed (`additionalProperties: true` on payloads), required fields enforced. Every top-level object may carry `"fixture": true`.

## 4. Fixtures (4 minutes)

`contracts/make_fixtures.py` (stdlib only, seeded, deterministic) writes, consistent with each other:

- `manifest.sample.json`: game `doom`, 84 `game` functions + 12 `library`, Thumb, addresses ascending from `0x08000200`, about 30% `heldout`, sensible sizes and difficulties, callers/callees forming a small call graph.
- `viz_map.sample.json`: subsystems `hud` ("Doomguy's face and the status bar"), `weapons` ("the shotgun"), `enemies` ("the imps"), `world` ("the renderer"), covering all game functions, each with a screen region (`hud` = bottom 32 px, others = the 3D view).
- `referee_result.match.json`, `referee_result.partial.json` (first diff at offset 14, `adds r0, r1, #0` vs `adds r0, r2, #0`).
- `events.sample.jsonl`: a believable 20-minute run, 6 diggers, every event type in the contracts at least once: ~60 `fn.matched`, ~9 false claims (claim then a `verdict` with `claim_was_true: false`), ~3 lint fails, ~12 `idiom.learned`, ~40 `narration` (mix of ticker lines and short announcer lines), `metric.tick` every 5 s, one `build.rom` with `identical: true`, one `patch.verified`, one `phone.published`. First line `{"type":"fixture"}`.
- `names.sample.json`: inferred names for ~40 functions, all `inferred: true`.
- `metrics.sample.json`: two held-out runs (`library: on` and `off`) plus one training run, with curves.
- `sprite_frame.sample.json`.
- `crew_job.sample.json`, `crew_status.sample.json`.

`contracts/validate.py` validates every fixture and any `runs/*/events.jsonl` / `metrics.json` against the schemas and exits non-zero on failure. Run `make fixtures validate` and fix until green.

## 5. Commit, tag, push (2 minutes)

- Commit with the runner's own git identity. No AI co-author lines or trailers. Message: `foundation: monorepo skeleton, contracts, schemas, fixtures`.
- Tag `v0-foundation`. Push `main` and the tag.
- Print, for the team channel: the clone URL, "foundation is live", and the one-line rule below.

**Team git rule (put it at the top of README.md too):** everyone commits only inside their own lane folder, pulls with `git pull --rebase` before every push, and pushes small commits to `main` often. Changes to `contracts/` need a line in `DECISIONS.md` and a ping in the team channel. Nobody force-pushes `main`.

## Do not

- Do not download or commit the target game's source or ROM; Lane A puts the answer key in `lab/secrets/` (gitignored) on their machine.
- Do not add frameworks, linters, CI, or lockfiles at the root.
- Do not ask questions. If something is ambiguous, pick the option that matches the contracts, note it in `DECISIONS.md`, and push.

Start now.
