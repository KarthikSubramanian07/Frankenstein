#!/usr/bin/env python3
"""Generate the site's illustrations with Gemini (gemini-3-pro-image), reproducibly.

    python3 site/tools/generate_art.py                 # all scenes -> site/tools/out/<scene>.png
    python3 site/tools/generate_art.py hero lie        # only some scenes
    python3 site/tools/generate_art.py --variant 2 hero  # write <scene>-v2.png (keep earlier takes)

Then build the web sizes with site/tools/build_art.sh (cwebp, 800/1400/2000 px).

Shipped takes (Nov 7): hero, patient, ask, dig, alive from the first run; lie, learn and play from
--variant 2 after the prompts were tightened (no stray handheld, no on-screen characters).

Stdlib only. Reads GEMINI_API_KEY from the environment or the repo's .env.
Every scene shares one style suffix and one palette, so the set reads as one world.
"""
from __future__ import annotations

import base64
import json
import os
import sys
import threading
import time
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

MODEL = "gemini-3-pro-image"
URL = f"https://generativelanguage.googleapis.com/v1beta/models/{MODEL}:generateContent"
ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent / "out"

PALETTE = (
    "Colour palette, strictly: warm cream and off-white, soft cartridge grey, "
    "handheld-screen greens (deep #0F380F, #306230, pea green #8BAC0F, pale #9BBC0F), "
    "with small accents of mint green, soft violet and coral red. No other strong colours."
)
STYLE = (
    "Soft matte 3D render of toy-like objects, rounded edges, smooth satin surfaces with subtle "
    "fingerprint-free finish, gentle studio lighting, soft contact shadows, shallow depth of field, "
    "on a seamless warm cream backdrop. Calm, minimalist composition with generous negative space, "
    "playful and physical, like a beautifully art-directed product diorama. "
    + PALETTE
    + " Any screen shows only soft abstract pale green shapes, never characters, sprites or creatures. "
    "Absolutely no words, letters, numbers, logos, labels or trademarks anywhere in the image."
)
# Only scenes that show the handheld get this, so it doesn't wander into every picture.
HANDHELD = (
    " The handheld is our own original design, not any real console: a chunky squarish slab with all "
    "four corners equally and generously rounded, two-tone cream top half and cartridge-grey bottom half, "
    "a wide pale green screen centred in the top half with a thick soft bezel, a small plus-shaped pad on "
    "the left and two large round mint and coral buttons on the right, no speaker grille, no brand, no logo."
)

SCENES: dict[str, dict] = {
    "hero": {
        "handheld": True,
        "ratio": "21:9",
        "prompt": (
            "A tiny laboratory diorama. On the left, the handheld game console lies on a small padded "
            "operating table with two bolt-shaped electrodes on curved stands. Small glossy marbles roll "
            "out of it along a cream chute, drop into a big cream funnel, pass under a large magnifying "
            "glass on a stand, and continue on a chute towards the right, where a game cartridge stands "
            "upright and glows softly mint green. One coral red marble has been diverted into a small "
            "open bin under the magnifier. Wide panoramic framing, objects spread left to right."
        ),
    },
    "patient": {
        "ratio": "4:3",
        "prompt": (
            "A dusty grey game cartridge resting on a small round plinth under a glass bell jar, "
            "a few soft cobwebs inside the jar, a fine layer of dust. Beside the jar, a tiny rounded "
            "toy tombstone with no inscription and a single small pale green sprout. Melancholy but cute."
        ),
    },
    "ask": {
        "ratio": "4:3",
        "prompt": (
            "A rounded speech bubble shaped object standing on its tail, next to a small cute mailbox "
            "with its flag raised. A single mint green marble rolls out of the mailbox slot onto a short "
            "cream chute that curves away. Friendly front-door feeling."
        ),
    },
    "dig": {
        "ratio": "4:3",
        "prompt": (
            "Three tiny cute rounded robots with small shovels digging into a large chunky microchip "
            "that lies like a hill. Glossy marbles of different pastel colours are being dug out of "
            "the chip and collected in a small cart. Busy, cheerful little crew."
        ),
    },
    "lie": {
        "ratio": "4:3",
        "prompt": (
            "A small strict-looking toy referee figure, round body, holding a whistle, standing at the "
            "end of a cream chute. A coral red marble has stopped right in front of the referee. The "
            "referee raises a small coral red flag. Only the referee, the chute and the marble are in the scene. Comic, deadpan moment."
        ),
    },
    "alive": {
        "handheld": True,
        "ratio": "4:3",
        "prompt": (
            "The handheld game console on the small padded operating table, jolted awake by a stylised "
            "soft yellow lightning bolt between two bolt-shaped electrodes. Its screen glows bright "
            "pale green. Small marbles bounce into the air around it like confetti. Joyful."
        ),
    },
    "learn": {
        "ratio": "4:3",
        "prompt": (
            "A small wooden-toy library shelf holding rows of round glass jars, each jar filled with "
            "marbles of one single colour, jars differ only by colour. One jar on the front edge is "
            "being filled by a marble dropping in from above. Nothing else on or under the shelf. Orderly and calm."
        ),
    },
    "play": {
        "handheld": True,
        "ratio": "16:9",
        "prompt": (
            "Three screens side by side, each showing the same simple pale green landscape of soft hills and a round sun: a rounded "
            "smartphone on a little stand, a small rounded retro television, and the handheld game "
            "console. A cream chute connects them and small marbles flow between the three devices. "
            "A small plain rounded cream game controller with a plus-shaped pad and two round buttons lies in front."
        ),
    },
}


def api_key() -> str:
    key = os.environ.get("GEMINI_API_KEY", "")
    env = ROOT / ".env"
    if not key and env.exists():
        for line in env.read_text().splitlines():
            if line.strip().startswith("GEMINI_API_KEY="):
                key = line.split("=", 1)[1].strip().strip('"').strip("'")
    if not key:
        sys.exit("GEMINI_API_KEY is not set (environment or .env)")
    return key


def generate(name: str, variant: int, key: str, lock: threading.Lock) -> str:
    scene = SCENES[name]
    body = {
        "contents": [{"parts": [{"text": scene["prompt"] + (HANDHELD if scene.get("handheld") else "") + " " + STYLE}]}],
        "generationConfig": {"responseModalities": ["IMAGE"], "imageConfig": {"aspectRatio": scene["ratio"]}},
    }
    req = urllib.request.Request(
        URL, data=json.dumps(body).encode(), method="POST",
        headers={"Content-Type": "application/json", "x-goog-api-key": key},
    )
    t0 = time.time()
    for attempt in range(3):
        try:
            with urllib.request.urlopen(req, timeout=240) as r:
                data = json.load(r)
            break
        except (urllib.error.URLError, TimeoutError) as e:
            if attempt == 2:
                return f"{name}: failed ({e})"
            time.sleep(5 * (attempt + 1))
    parts = data.get("candidates", [{}])[0].get("content", {}).get("parts", [])
    img = next((p["inlineData"]["data"] for p in parts if "inlineData" in p), None)
    if not img:
        return f"{name}: no image in response ({json.dumps(data)[:200]})"
    OUT.mkdir(parents=True, exist_ok=True)
    path = OUT / (f"{name}.png" if variant == 1 else f"{name}-v{variant}.png")
    path.write_bytes(base64.b64decode(img))
    with lock:
        print(f"{name}: {path.name} in {time.time() - t0:.0f} s", flush=True)
    return str(path)


def main(argv: list[str]) -> None:
    variant = 1
    if "--variant" in argv:
        i = argv.index("--variant")
        variant = int(argv[i + 1])
        argv = argv[:i] + argv[i + 2:]
    names = argv or list(SCENES)
    unknown = [n for n in names if n not in SCENES]
    if unknown:
        sys.exit(f"unknown scenes: {unknown}; known: {list(SCENES)}")
    key, lock = api_key(), threading.Lock()
    with ThreadPoolExecutor(max_workers=len(names)) as pool:
        for result in pool.map(lambda n: generate(n, variant, key, lock), names):
            if "failed" in result or "no image" in result:
                print(result, flush=True)


if __name__ == "__main__":
    main(sys.argv[1:])
