# ROM swap preflight

`prepare_swap.py` uses Python 3.11+ standard library. It checks actual file SHA-1s against a real referee report, makes separately verified ROM copies, and generates a manual mGBA Lua save/load/state-restore attempt. It does **not** emit `rom.swapped`, boot a game, or claim runtime success.

```powershell
python creature/runtime/prepare_swap.py --mode rebuild --baseline playable.gba --candidate rebuilt-playable.gba --report rebuild.json --out creature/runtime/generated/run-01
```

Run from a full repository checkout. Choose a new output directory each time; keep generated ROMs and preflight outputs out of commits. Both ROMs must be actual playable packages. `lab/out/target.gba` has no WAD. For engine-only referee reports, use the two actual engines and both verified package sidecars described in [PACKAGE_SWAP.md](PACKAGE_SWAP.md). This checks the engine preservation and identical processed-WAD payload independently of the report.

For a patch, pass `--mode patch`. The report must list exactly one changed function, candidate hash must match the report, and candidate bytes must differ from baseline. Save-state compatibility must be checked before acknowledging `--state-compatible`. Lane A's in-place patch must fit the original function and keep layout stable. If this is not established, open the patched ROM at a menu/restart and label that fallback.

For the static-face → restored finale, use `--mode restore`, the original patch report as `--baseline-report`, and a real identical rebuild as `--report`. This restores a deliberate display rule. It does not establish that the face function was recovered; the current 28-function recovery does not include it.

After preflight, pause mGBA and load generated `swap.lua` through Tools > Scripting. The copies must remain unchanged; the printed SHA-1 is a preflight file measurement, **not** a loaded-emulator SHA-1 measurement. mGBA's documented checksum API exposes CRC32 only. The script checks save/load API success and attempts baseline rollback if candidate state restore fails. On ROM load failure, reopen the baseline and restore state manually as needed. Visually confirm game, audio and controls before the orchestrator emits any success event. A save state from a different engine/package may be rejected despite equal code layout.

## Host audit (2026-11-07)

- Python 3.13 present.
- `wsl.exe` exists, but listing distributions returns Wsl/E_ACCESSDENIED in this execution environment.
- mGBA, Lua interpreter and Docker not found on PATH; no mGBA/Docker directories found in standard Program Files folders. This does not exclude portable installs elsewhere.
- No real ROM boot, controller, tap, state swap, screenshot or capture verification completed on this host.
- `lab/setup_referee.sh` requires Docker and a Bash-capable environment. Do not use the referee's hidden answer-key paths from this lane.

The Lua tap's APIs and generated swap script follow https://mgba.io/docs/scripting.html (checked 2026-11-07). Real emulator verification remains necessary.
