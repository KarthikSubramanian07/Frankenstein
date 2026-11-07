# Portability north star: choose a game, scan, play anywhere

**Direction from Enzo, 2026-11-07. All four lanes should read this.**

The demo ends with judges scanning a QR code and playing on their own phones immediately. Doom is the available demonstration game. The larger product lets someone select an old game, bring its verified behavior to a new device, and adapt its controls and presentation to that device.

Explore Subquadratic's fast model capabilities for two extensions:
1. A **local model proposes controls for the available interface**, and the player can edit every mapping.
2. **Generate the rest of the display** when its size or aspect ratio extends the original game screen.

These are product requirements and research directions, not completed features. This replaces the earlier narrower proposal about choosing a Doom difficulty mode. The existing recovery/verification work supplies the game; the portability layer makes it usable elsewhere.

## 1. The judging-room experience

1. Show an old game being recovered and verified, with the existing compiler evidence.
2. Show the game as a selectable item in the portable-play experience. Doom is today's supported proof case.
3. Put a real HTTPS play URL behind a QR code. The judge scans it with a normal phone camera.
4. The page loads the game and immediately exposes usable touch controls. No account, emulator installation, file chooser, API key, or manual control setup in the judging flow.
5. The judge can play first, then edit controls. Rotate or change the viewport and the layout adapts.
6. If the extension experiment works, the extra display area fills coherently while the original game continues. The demo identifies generated presentation.
7. Explain that new games and interfaces plug into the same package/action/adapter/profile structure.

**Phone play is part of the intended demo, not a bonus finale.** Desktop gameplay remains an essential recovery and recording tool. A localhost QR does not satisfy the phone requirement; the judge's phone needs a reachable published endpoint and permitted game assets.

“Any old game, anywhere” is the north star. Current support must still be listed honestly by game, core/runtime, device and input adapter; success with Doom does not establish universal compatibility.

## 2. Editable controls for any interface

### Intended behavior

Discover the target's available inputs, the game's actual action set and the player's preferences. A local model proposes a mapping/layout profile. The human can inspect, test, change, save and reset it.

Examples of interfaces to accommodate through adapters: phone touch, keyboard/mouse, gamepad and accessibility switches. New adapters may add other inputs. Do not claim a camera, microphone or custom controller works until its adapter is implemented and tested.

The editable profile should cover bindings, button positions/sizes, handedness, stick/directional behavior, dead zones where relevant, and device orientation. “Move fire to my left thumb” is an example of a useful preference, not a requirement for a conversational onboarding flow before play.

### Implementation shape

- Each game/core declares **real supported actions**, including menu navigation, confirm/back and start.
- Each input adapter declares observable capabilities and turns physical input into canonical actions.
- The local model proposes a declarative mapping/profile. Validate it against the game and adapter capabilities before applying it.
- The player can directly edit bindings and layout, preview them, undo/reset, and save a per-game/per-device preference.
- A deterministic local input dispatcher executes the accepted mapping. No model call or network round trip belongs between pressing a button and the emulator receiving it.
- Supply a working default immediately. Load or improve a model/profile afterward, without blocking the first playable frame. Handle key-up, pointer cancellation, multiple touches and device disconnection so inputs do not stay stuck.

**“Local model” means actual inference on the device or an explicitly local companion host.** A remote API response is not local inference. The runtime, downloadable model, licensing, model size and real phone performance are research gates. Existing handwritten touch controls are a baseline, not evidence that model-generated mapping is implemented.

Suggested profile contents: version, game/core identity, adapter/capabilities, semantic actions, bindings, touch layout, orientation, preferences and proposal source. This is a design sketch, not a change to contracts/ yet.

## 3. Generate the extra display area

The target is more than resizing or stretching the old frame. When a modern phone, tablet, wide monitor or portrait display leaves extra space, explore a model-generated continuation of the visual experience.

- Preserve the original game framebuffer at the correct pixel aspect ratio and keep the real HUD, targets and controls readable.
- Generate peripheral content consistent with the current scene, art direction and motion. Explore sides on wide displays and appropriate extra regions on tall displays.
- Maintain temporal coherence: the extension should follow turns and scene changes without flickering or showing contradictory geometry.
- Keep generated peripheral visuals distinct from authoritative playable world state. A generated enemy or corridor is not automatically a real enemy or traversable space.
- If recovered source allows a true wider renderer, evaluate that separately: it can reveal real additional world state. Do not describe decorative outpainting as additional playable geometry.
- Rendering and controls must keep working while a generation request is pending. Use asynchronous updates/caching and a clear original-view fallback; never make the game wait on a model per frame.
- Let the player turn the extension off. Plain borders or mirrored fill may be fallback modes, but must not be presented as AI generation.

Research must establish a model that actually produces the required image/video output, its local/cloud runtime, observed latency and device cost. No real-time generative-video capability has been verified in this project.

## 4. What SubQ can do, and what must be confirmed

Enzo's intent is a very fast, adaptive, JEV-like experience. Verify the actual sponsor product rather than assuming API or model equivalence.

Checked primary sources on 2026-11-07:
- https://subq.ai/ describes **Snap 1.1** as a multimodal decision model returning choices/scores/labels, and distinguishes that from open-ended generation.
- https://subq.ai/small describes **SubQ 1.1 Small** as a separate early-access language model with API access.
- These pages do not establish downloadable on-device weights, an offline mobile runtime, or image/video outpainting.

Useful proposed Snap roles: rank valid control profiles, choose a supported layout or route an adaptation task. Whether it can construct the full required profile through its structured interface needs an implementation check. Actual local inference and pixel generation need confirmed models/runtimes.

**Questions for the sponsor table:** Which currently accessible product generates structured profiles or code? Is there a supported local deployment/weight/runtime option? Is there an image/video-generation product or integration for screen continuation? What access, hardware and measured latency can we use today?

Do not put sponsor secrets in the phone page. If an API is used, keep credentials server-side and label the inference as remote. Sponsor-generated suggestions and compiler-verified recovery remain different kinds of evidence.

## 5. Concrete lane requests

| Lane | Next response requested in its own HANDOFFS.md | Deliverable |
|---|---|---|
| A / Lab | Define the portable game artifact identity, supported core/runtime and action metadata. Confirm which recovered rendering hooks could expose a wider real viewport. State the permitted route for phone delivery of engine/data. | Package identity + compatibility/action notes + distribution path; no universal-port claim |
| B / Crew | Investigate the actual available SubQ generation/local-runtime capability. Propose a validated, editable mapping profile with deterministic dispatch; identify a real image/video generator if available. Preserve actual model/provider/runtime and latency in results. | Capability findings + mapping proposal; extension experiment plan |
| C / Stage | Make selection → QR → phone play the visible final product flow. Design an editable control-profile UI and an extended-display comparison with generated regions identified. Leave room for more supported games. | Scene/product flow and minimal editing/comparison surfaces |
| D / Creature | Own the working browser player, input adapters/profile application, orientation/layout behavior, core/game loading, reachable play URL + QR and real phone checks. Prototype screen extension only with a verified generation route. | Scan-to-play demo + editable profile path + device evidence |

Keep code ownership: A lab/, B crew/, C stage/, D creature/. Existing cross-lane contracts still apply; propose new shared schema before changing it. Publish small checkpoints and answer the numbered requirements through each lane's handoffs.

## 6. Acceptance and order of work

**Demo must-have:** real QR resolves to a reachable game page; a judge can start and control Doom on a physical phone without setup. Verify iOS Safari and Android Chrome, actual first-play timing, orientation changes and control release. A button press should feel immediate without a model/network round trip.

**Adaptation proof:** show at least two supported input interfaces and one human mapping/layout edit taking effect. Call the model/local part implemented only after actual inference produces a validated profile on the declared host.

**Screen-extension proof:** compare original and extended aspect ratios during real play. Measure generation latency and gameplay smoothness; show how generated areas behave during movement. If no viable generator is available, record the blocker and keep the original view playable.

Priority: QR phone play → editable deterministic mappings → verified local-model proposal → generated display extension. Do not let model downloads or optional generation delay the first playable frame. Public game delivery still needs the team's distribution decision.

This document announces the product direction. It does not say those experiments are shipped, that the game has been natively ported, or that every legacy game/device is already supported.
