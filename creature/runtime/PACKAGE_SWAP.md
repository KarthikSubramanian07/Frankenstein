# Swap verification with packaged ROMs

The referee hashes engine-only files. mGBA runs packages containing that engine plus a processed shareware WAD. `prepare_swap.py` accepts both hash domains only when it can independently read and check the entire chain.

```powershell
python creature/runtime/prepare_swap.py --mode rebuild --baseline creature/runtime/generated/baseline.gba --candidate creature/runtime/generated/rebuilt.gba --report rebuild.json --baseline-engine lab/out/target.gba --candidate-engine lab/out/rebuilt.gba --baseline-package-proof creature/runtime/generated/baseline.gba.package.json --candidate-package-proof creature/runtime/generated/rebuilt.gba.package.json --out creature/runtime/generated/swap-01
```

Both packages must first be built by `package_rom.py`, which produces `.gba.package.json` sidecars. Paths above are examples; use actual files. Supply all four engine/proof options together. Direct SHA-1 mode, with none of these four options, still requires the report hashes to equal the actual playable file hashes.

Packaged mode recomputes the actual engine SHA-1, package SHA-1 and SHA-256, header/layout, WAD length/version, and engine-code preservation using `package_rom.validate_package`. These must match the supplied sidecar. It also compares the **actual processed WAD payload bytes** across baseline and candidate and requires an unchanged engine-header offset. A fabricated JSON hash, edited package, different WAD, or changed engine is rejected unless all actual file checks and the real referee report agree. Provenance sidecars are descriptions, not trusted replacements for the files or referee evidence.

A rebuild requires `identical: true`, both referee engine hashes, identical engines, and identical full packages. A patch requires the candidate engine hash in its referee report, exactly one changed function, a changed package, and explicit `--state-compatible` after compatibility checks. Its baseline must match the patch report's `original_sha1`; older reports without that field use `game.rom_sha1` from `--manifest` (default `lab/out/manifest.json` in this checkout). Patch does not bypass the package and WAD checks. Fixture reports or package proofs are rejected.

## Restore the deliberate static-face display rule

The hero direction is patched static face → original face. Use `--mode restore`, with **two real Lab reports**. `--baseline-report` is the static-face patch report, and `--report` is the byte-identical rebuild report. A patch report is not a substitute for a rebuild report.

```powershell
python creature/runtime/prepare_swap.py --mode restore --baseline creature/runtime/generated/static-face-playable.gba --candidate creature/runtime/generated/restored-playable.gba --baseline-report lab/demo/static_face_report.json --report lab/out/rebuild.json --baseline-engine lab/out/static_face.gba --candidate-engine lab/out/rebuilt.gba --baseline-package-proof creature/runtime/generated/static-face-playable.gba.package.json --candidate-package-proof creature/runtime/generated/restored-playable.gba.package.json --state-compatible --out creature/runtime/generated/restore-01
```

`lab/out/rebuild.json` must be saved from a real `python -m lab.referee rebuild --recovered <actual recovered directory>` run; do not fabricate it. All paths above are examples. Package baseline and candidate with the same WAD and the same `--gus` choice. Passing `--state-compatible` acknowledges an actual layout/state check; use a menu/restart fallback if that check is unavailable.

Restore verifies that the baseline really is the one-function patch, that the candidate is an identical rebuild of that patch's original engine, and that the two actual files differ. The original engine is tied through the patch's `original_sha1` or the manifest fallback. Package/WAD and explicit state-compatibility gates still apply. This restores a hand-written display-rule patch. It does **not** prove the face function was recovered; make that claim only if the actual recovered set contains it.

The output `preflight.json` records package and engine hashes separately. No `rom.swapped` event is emitted. The generated Lua script only attempts desktop mGBA save/load; a browser-core swap needs its own adapter and runtime acknowledgement. A successful preflight proves file relationships, not a successful boot or state restoration.
