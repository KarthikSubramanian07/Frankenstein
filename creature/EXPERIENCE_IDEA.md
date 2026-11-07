# Experience extension proposal for A / B / C / D

Enzo's request: explore using SubQ's speed to EXTEND the experience of playing Doom once code is recovered. This is a proposal, not a shipped feature or a claim that a game can already generate new levels.

## Product check
Official https://subq.ai/ describes Snap1.1 as a fast multimodal decision model with a fixed answer space (choices/scores), and explicitly distinguishes it from open-ended generation. SubQ Small is a separate early-access language model. Do not assume Snap generates new game content or that Small access exists.

## Best near-term direction: Doom reacts to how you play
Existing crew/director.py already makes actual gameplay steer recovery: real sampled executing functions + screenshot -> Snap ranks what the crew rebuilds next. Finish that loop before adding another sponsor feature. Sparse frame PC samples are observations, not complete execution coverage.

A possible second beat after the verified recovery: the player chooses a mode such as NIGHTMARE / SPEED / MERCY. Snap selects among a tiny allowlisted set of preimplemented, validated changes using observed play state. Muse writes recovered C modifications if generation is needed; A verifies the exact changed function; D loads the result at a safe boundary. C shows the chosen mode and decision latency, separate from compiler proof.

This would demonstrate: once code returns, the old game can respond to the player again. Do not promise instantaneous compilation, a live level generator, or uninterrupted patch swaps until measured.

## Lane requests
- A: which single recovered Thumb-ROM function can take a visible constant change while fitting its original size? Can weapon timing, palette behavior or face expression be changed safely? Provide constraints and referee evidence. Do not bypass patch verification.
- B: keep Play-to-recover director first. Can Snap choose an allowlisted post-recovery action using the existing decisions wrapper with bounded calls? Are there current game-state observations beyond PC/screenshot? No new provider or API key needed for proposal; do not spend on this until core loop works.
- C: consider a compact in-game-style choice at the finale, plus observed decision latency; label generated intent and inferred visual assessment separately from proved byte changes.
- D: complete real telemetry/boot/rebuild loop; use safe menu/death/restart boundary if state-compatible swap is unproved.

## Stretch only: new playable content
If sponsor table confirms access to an actual generation model, investigate a validated map-configuration or scenario generated between rounds. Requires schema validation, engine support, playability validation, distribution review, and clear separation from original recovered game. It is an extensive new feature; cut it if it threatens the frozen demo.

## Acceptance / cut
Keep only if one fixed, repeatable choice -> verified visible change works before freeze. Record actual end-to-end latency and a before/after. The baseline Doom demo must remain usable when the model is unavailable. Avoid adding simulated sponsor results. Responses can be committed in each lane's own folder and linked here by D.
