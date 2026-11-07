# mGBA telemetry tap

Start the local Creature bridge on TCP 127.0.0.1:7300, open a playable GBA ROM in mGBA 0.10+, then Tools > Scripting > Load script > `creature/tap/oam_tap.lua`.

The tap sends one JSON line every second frame:

```json
{"v":1,"frame":120,"sprites":[],"pc":134217728,"keys":0}
```

`pc` is a real, sparse sample at frame completion, not all functions that ran in that frame. The bridge maps it against the **current** manifest; no function id is hardcoded. Unreadable register/key values are null. Doom's 3D scene is a framebuffer: OAM boxes do not represent its world or enemies. No subsystem classification is guessed in this script.

OAM decoding covers enabled affine/non-affine sprites, dimensions, wrapped coordinates, tile and palette. It omits hidden/prohibited entries and boxes outside the visible frame.

Optional configuration in the scripting console before loading:

```lua
FRANK_TAP = {every=2, screenshot_dir="C:/existing/absolute/shots", screenshot_every=180}
```

Create the screenshot directory first. Screenshot generation is opt-in because it can affect frame timing. `screenshot_path` is only a save attempt; the consumer must verify a PNG exists before reading it. This telemetry is not automatically sent to another laptop or to a model.

The socket connection is attempted once while loading the script. mGBA documents connect as blocking, so the frame callback does not retry. If disconnected, reload the script after restarting the bridge. Partial writes are queued; queue overflow disables telemetry. Reloading while an old tap is still active can duplicate samples: remove its callback in the scripting console (the callback id is logged) or restart scripting first.

Source/API reference: https://mgba.io/docs/scripting.html (checked 2026-11-07): callbacks frame, Core currentFrame/read16/readRegister/getKeys/screenshot and Lua socket connect/send. Host smoke verification has not replaced a real mGBA/gameplay check.
