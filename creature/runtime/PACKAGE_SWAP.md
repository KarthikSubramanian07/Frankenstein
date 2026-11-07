# Swap verification with packaged ROMs

The referee hashes engine-only files. mGBA runs packages containing that engine plus a processed shareware WAD. `prepare_swap.py` accepts both hash domains only when it can independently read and check the entire chain.

```powershell
python creature/runtime/prepare_swap.py --mode rebuild --baseline creature/runtime/generated/baseline.gba --candidate creature/runtime/generated/rebuilt.gba --report rebuild.json --baseline-engine lab/out/target.gba --candidate-engine lab/out/rebuilt.gba --baseline-package-proof creature/runtime/generated/baseline.gba.package.json --candidate-package-proof creature/runtime/generated/rebuilt.gba.package.json --out creature/runtime/generated/swap-01
```

Both packages must first be built by `package_rom.py`, which produces `.gba.package.json` sidecars. Paths above are examples; use actual files. Supply all four engine/proof options together. Direct SHA-1 mode, with none of these four options, still requires the report hashes to equal the actual playable file hashes.

Packaged mode recomputes the actual engine SHA-1, package SHA-1 and SHA-256, header/layout, WAD length/version, and engine-code preservation using `package_rom.validate_package`. These must match the supplied sidecar. It also compares the **actual processed WAD payload bytes** across baseline and candidate and requires an unchanged engine-header offset. A fabricated JSON hash, edited package, different WAD, or changed engine is rejected unless all actual file checks and the real referee report agree. Provenance sidecars are descriptions, not trusted replacements for the files or referee evidence.

A rebuild requires `identical: true`, both referee engine hashes, identical engines, and identical full packages. A patch requires the candidate engine hash in its referee report, exactly one changed function, a changed package, and explicit `--state-compatible` after compatibility checks. Patch does not bypass the package and WAD checks. Fixture reports or package proofs are rejected.

The output `preflight.json` records package and engine hashes separately. No `rom.swapped` event is emitted. The generated Lua script only attempts desktop mGBA save/load; a browser-core swap needs its own adapter and runtime acknowledgement. A successful preflight proves file relationships, not a successful boot or state restoration.
