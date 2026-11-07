# God mode in the demo: which code is the agents'

Checked 15:08 by Lane A against the referee (`python3 -m lab.referee check`):

| Function | Role (name inferred ?) | In the union | Referee now |
|---|---|---|---|
| `fn_080054C8` | the god-mode cheat itself: toggles god mode, sets health, sets the on-screen message | yes | MATCH 100% |
| `fn_08005828` | the cheat-key reader: collects button presses and calls the matching cheat | **no** (original code) | not recovered |
| `fn_0801B724` | a status-bar input handler; in this build it only returns 0 and plays no part in cheats | yes | MATCH 100% |

On the GBA there is no keyboard, so GBADoom has no typed IDDQD. God mode is the button sequence **Up, Up, Down, Down, Left, Left, Right, Right** during play.

Honest wording: "That button sequence ran the god-mode function our agents rebuilt from machine code, proven byte for byte. The code that reads the buttons is still the original." Don't say "every line of IDDQD is the agents'".

The judge-change version is `lab/demo/god_200/`: the same recovered function, one edit, health becomes 200%. Untested in emulator.
