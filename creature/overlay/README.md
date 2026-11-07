# Optional recovery overlay

The primary hero shot is the static face inside the ROM. This page is an optional presentation effect over a real mGBA capture. It does not modify the game or prove that a ROM swap happened.

From the repository root:

```sh
python creature/overlay/serve.py
```

Open http://127.0.0.1:7302/ and start the bridge on websocket 7301. Use `?ws=ws://127.0.0.1:7301` to override the websocket URL. The canvas preserves the GBA 240:160 aspect ratio, with transparent letterboxing, at any source size. Prefer 960x640 (4x) for the Split scene. Align to the game content, excluding mGBA's window chrome.

Visual checks: http://127.0.0.1:7302/?preview=1&sample=1. This mode has conspicuous SAMPLE DATA labeling and manual 0/50/100% buttons. Its checkered background is only a preview surface, not simulated gameplay. Do not use preview mode in OBS. `?motion=off` disables the completion sweep and freezes the static pattern; system reduced-motion preference is respected.

The page consumes contract sprite frames `{v:1, heal:{hud,weapons,world,enemies}, ...}`. Extra bridge fields accepted: `fixture`, `run_id`, `status`, `source_status`, `tap_connected`, and `sample_age_s`. Heal fractions are clamped to 0..1; absent fractions remain unrecovered. `hud` controls the bottom 32 pixels; `weapons` controls x=76..163, y=64..127; world/enemies share the rest of the view using the lesser recovery fraction. These are presentation regions, not detected object boundaries or proof of execution. The overlay uses hidden-answer-key file groupings only through viz_map; the agents do not see that mapping.

A stale websocket (>5 seconds), explicit unavailable source, or disconnected emulator restores static and NO SIGNAL rather than leaving a clean game that could imply fresh progress. Samples remain labeled; on a new run completion state resets. A fully healed region draws no static. The short mint sweep is omitted in reduced-motion mode. No flashing or audio is added.

Checkpoint status: implementation is runnable without third-party dependencies; live bridge/game and OBS alignment must be verified on the capture machine. Do not claim 60 fps or a seamless swap from this page.
