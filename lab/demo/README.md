# Demo ROMs: the face comes back from static

`lab/out/static_face.gba` is the target ROM with one function, `fn_0801B298` (status-bar face update), swapped for `lab/demo/static_face.c`. Every tick the face jumps to a random one of its 42 frames, so it flickers like static. Every other function is byte-identical to the original.
`lab/out/target.gba` is the face restored: the unmodified ROM. Once the agents recover `fn_0801B298`, `rebuild` produces the same bytes.

Build both from the repo root (needs the `frank-lab` container running):

    python3 -m lab.demo.build_demo_roms

It prints both SHA-1s and refuses to write the ROM unless `changed_functions` is exactly `['fn_0801B298']`.

Add the shareware WAD on Windows. Run this from the upstream GBADoom `GbaWadUtil` folder, once per ROM:

    GbaWadUtil.exe -in DOOM1.WAD -rom static_face.gba -romout doom_static.gba -gus data\dgguspat\timidity.cfg
    GbaWadUtil.exe -in DOOM1.WAD -rom target.gba -romout doom_restored.gba -gus data\dgguspat\timidity.cfg

On stage: "Code we haven't recovered yet shows as static. That is a display rule we wrote for the demo, not something the agents broke. When the agents recover this function, the face comes back." The static ROM is hand-patched demo code. Present it as a visualization, never as a recovery.
