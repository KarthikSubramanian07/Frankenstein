# Same code, other devices: behavioral equivalence of recovered functions

Six functions the crew recovered (`crew/exports/union/recovered`, each a referee MATCH) were compiled for two machines that aren't a Game Boy Advance:

- this Mac (arm64, Apple clang `-O2`)
- WebAssembly (`zig cc --target=wasm32-freestanding -O2`, run in Node and in a browser)

Their outputs were compared with the original GBA machine code from `lab/out/target.gba`, which the Unicorn emulator ran one instruction at a time. Both builds got the same inputs (fixed seed 20261107).

| Function | What it does (inferred) | Inputs | Mismatches, `-O2` | Mismatches, `-O2 -fwrapv` |
|---|---|---|---|---|
| `fn_03002660` | fixed-point multiply ? | 1,000,100 | 0 | 0 |
| `fn_03000D94` | absolute value ? | 1,000,010 | 0 | 0 |
| `fn_0800FDFC` | approximate distance ? | 1,000,100 | 19 | 0 |
| `fn_0800549C` | grow a bounding box ? | 1,000,000 | 0 | 0 |
| `fn_08006B00` | random number ? | 999,936 draws | 0 | 0 |
| `fn_08006B20` | random number ? | 999,936 draws | 0 | 0 |

Numbers are from `results.json` (`-O2`) and `results_fwrapv.json` (`-O2 -fwrapv`). The random-number functions were checked from every one of the 256 start positions, with 3,906 draws in a row from each, against the ROM's own 256-byte table.

## The 19 mismatches

All 19 are the edge-case pairs that contain -2,147,483,648 (`INT_MIN`). The function takes an absolute value, and `abs(INT_MIN)` is undefined behaviour in C, so each compiler may produce something different. GCC on the GBA wrapped around, while clang on arm64 and wasm assumed it can't happen. Every one of the million random inputs matched. With `-fwrapv`, which makes signed overflow wrap the way the GBA's hardware does, all 19 match too. The finding stands: carrying recovered code to a new platform also brings over the original's undefined behaviour, and a check like this one catches it.

## What this proves, and what it doesn't

- Proves: on these inputs, the agents' C gives the same results on arm64 and in WebAssembly as the original machine code gives on the GBA's processor. The outputs are observed, not inferred.
- Doesn't prove: anything about the other 562 functions, or the game as a whole. This is not a port of Doom, and the function names above are our guesses.
- The `stub.c` globals are host-side stand-ins for the game's memory, written by us; they are not agent code.

## Run it

```sh
python3 -m venv /tmp/eqv && /tmp/eqv/bin/pip install unicorn ziglang
/tmp/eqv/bin/python lab/demo/equivalence/run.py 1000000            # writes results.json
/tmp/eqv/bin/python lab/demo/equivalence/run.py 1000000 -fwrapv    # writes results_fwrapv.json
/tmp/eqv/bin/python lab/demo/equivalence/vectors.py                # rebuilds web/agents.wasm and web/vectors.json
cd lab/demo/equivalence/web && python3 -m http.server 7451         # open http://127.0.0.1:7451 on any device
```

The page in `web/` compares 20,000 outputs (5,000 per function) live in the browser. Its inputs and expected outputs come from the original GBA machine code, and it shows "N of N identical". It needs only static hosting, so it works on a phone. A one-million-input run takes about a minute on this Mac. `lab/out/target.gba` is built locally and never committed.
