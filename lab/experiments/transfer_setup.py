"""Cross-game transfer, step 1: pick the Voxelburg function set and rebuild Doom's idiom library + case memory.

    python3 lab/experiments/transfer_setup.py

Writes lab/exports/transfer/fns.txt and lab/exports/transfer/warm/library/idioms{,.cases}.json (crew's own
on-disk format; read by crew.library.Library / CaseMemory with --library-path). Doom's original local-json store
(runs/_library/) no longer exists, so both are rebuilt from the published export crew/exports/doom_r01:
idioms from its `idiom.learned` events, cases from its Checker-accepted recovered/*.c plus the Doom asm.
Reads crew/ only; writes only under lab/exports/transfer/.
"""
import json
import random
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))
from crew.library import asm_signature  # noqa: E402  (crew code, unmodified)

OUT = REPO / "lab/exports/transfer"
DOOM_EXPORT = REPO / "crew/exports/doom_r01"
SEED, N, MIN_B, MAX_B = 20261107, 20, 16, 200


def pick_functions() -> list[str]:
    m = json.loads((REPO / "lab/out/games/voxelburg/manifest.json").read_text())
    pool = sorted(f["id"] for f in m["functions"]
                  if f["scope"] == "game" and f["mode"] == "thumb" and MIN_B <= f["size"] <= MAX_B)
    return sorted(random.Random(SEED).sample(pool, N))


def doom_idioms() -> list[dict]:
    items = []
    for line in (DOOM_EXPORT / "events.jsonl").read_text().splitlines():
        ev = json.loads(line)
        if ev["type"] == "idiom.learned":
            p = ev["payload"]
            items.append({"idiom_id": p["idiom_id"], "title": p["title"], "applies_when": p["applies_when"],
                          "do": p["do"], "example": "", "source_fn": ev["fn"], "uses": 0,
                          "status": "candidate", "tries": 0, "wins": 0})
    return items


def doom_cases() -> list[dict]:
    fns = {f["id"]: f for f in json.loads((REPO / "lab/out/manifest.json").read_text())["functions"]}
    cases = []
    for p in sorted((DOOM_EXPORT / "recovered").glob("fn_*.c")):
        f = fns[p.stem]
        src = re.sub(r"^/\*.*?\*/\s*", "", p.read_text(), count=1, flags=re.S)  # drop the run header
        asm = (REPO / f["asm_path"]).read_text()
        cases.append({"fn": p.stem, "size": f["size"], "split": f["split"], "sig": asm_signature(asm),
                      "src": src.strip()[:6000], "run_id": "doom_r01"})
    return cases


def main() -> None:
    fns = pick_functions()
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / "fns.txt").write_text(",".join(fns) + "\n")
    lib = OUT / "warm/library"
    lib.mkdir(parents=True, exist_ok=True)
    idioms, cases = doom_idioms(), doom_cases()
    assert idioms and cases and all(c["split"] == "train" for c in cases)
    (lib / "idioms.json").write_text(json.dumps(idioms, indent=2))
    (lib / "idioms.cases.json").write_text(json.dumps(cases))
    print(f"{len(fns)} voxelburg fns; warm store: {len(idioms)} idioms, {len(cases)} cases")


if __name__ == "__main__":
    main()
