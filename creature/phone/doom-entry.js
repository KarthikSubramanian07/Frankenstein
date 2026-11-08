// Real menu inputs, timed by emulated frames, from tools/mgba_headless/scenario.lua.
// This does not simulate gameplay or assert that a level has been visually verified.
export const DOOM_ENTRY = Object.freeze([
  {frame: 240, key: 'start', down: true}, {frame: 248, key: 'start', down: false},
  {frame: 300, key: 'a', down: true}, {frame: 308, key: 'a', down: false},
  {frame: 360, key: 'a', down: true}, {frame: 368, key: 'a', down: false},
  {frame: 420, key: 'a', down: true}, {frame: 428, key: 'a', down: false},
]);

export function prepareDoom(core, {onStep = () => {}, timeoutMs = 30000} = {}) {
  if (typeof core.addCoreCallbacks !== 'function') return Promise.resolve(false);
  return new Promise(resolve => {
    let frame = 0, finished = false, timer;
    const finish = completed => {
      if (finished) return;
      finished = true;
      clearTimeout(timer);
      // Remove callbacks outside the WASM callback stack.
      queueMicrotask(() => {
        core.buttonUnpress('start'); core.buttonUnpress('a');
        core.addCoreCallbacks({videoFrameEndedCallback: null});
        core.pauseGame();
        resolve(completed);
      });
    };
    core.addCoreCallbacks({videoFrameEndedCallback: () => {
      frame++;
      for (const action of DOOM_ENTRY) if (action.frame === frame)
        (action.down ? core.buttonPress : core.buttonUnpress)(action.key);
      if (frame === 240) onStep('Opening Doom');
      if (frame === 420) onStep('Starting your game');
      if (frame >= 600) finish(true);
    }});
    timer = setTimeout(() => finish(false), timeoutMs);
  });
}
