"""Build the "face comes back from static" demo ROMs. Run from the repo root:
    python3 -m lab.demo.build_demo_roms
static_face.gba: target ROM with fn_0801B298 swapped for static_face.c (display rule, not a recovery).
target.gba:      the unmodified ROM, i.e. the face restored."""
import hashlib
import json
import shutil
import sys
from pathlib import Path

from lab.referee.core import OUT
from lab.referee.romlink import RomLinker

FN = "fn_0801B298"


def main() -> int:
    src = (Path(__file__).parent / "static_face.c").read_text()
    result = RomLinker().patch(FN, src)
    if "error" in result:
        print(result)
        return 1
    if result["changed_functions"] != [FN]:
        print(f"refusing: patch changed {result['changed_functions']}, expected only {FN}")
        return 1
    static_rom = OUT / "static_face.gba"
    shutil.copyfile(OUT / "patched.gba", static_rom)
    report = {**result, "rom_path": str(static_rom.relative_to(OUT.parents[1])), "fn": FN,
              "display_rule": "code we haven't recovered yet shows as static"}
    (Path(__file__).with_name("static_face_report.json")).write_text(json.dumps(report, indent=1) + "\n")
    for path in (static_rom, OUT / "target.gba"):
        print(f"{hashlib.sha1(path.read_bytes()).hexdigest()}  {path.name}")
    print(f"changed_functions: {result['changed_functions']}  ({result['patched_bytes']} of {result['original_bytes']} bytes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
