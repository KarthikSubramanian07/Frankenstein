// The handheld is a UI illustration. The moving controls are the real input nodes.
// Call after the ROM/core are ready, with the final touch layout selected, while
// gameplay input is still disabled. Include arrival.css, then await playArrival({layout}).
const PARTS = [
  ['#dpad', [18, 66, 72, 72]],
  ['#actions', [234, 62, 70, 70]],
  ['#controls > [data-slot="l"]', [23, -5, 65, 20]],
  ['#controls > [data-slot="r"]', [232, -5, 65, 20]],
  ['#controls > [data-slot="select"]', [120, 150, 34, 13]],
  ['#controls > [data-slot="start"]', [168, 150, 34, 13]],
];
const DURATION = 1800;
let active = null;

/** FLIP transform from the actual control rectangle back to its handheld position. */
export function arrivalTransform(from, to) {
  if (![from.left, from.top, from.width, from.height, to.left, to.top, to.width, to.height].every(Number.isFinite)
      || to.width <= 0 || to.height <= 0) throw new Error('Control geometry is unavailable');
  return `translate(${from.left - to.left}px, ${from.top - to.top}px) scale(${from.width / to.width}, ${from.height / to.height})`;
}

/** Non-blocking presentation: missing animation support or interruption reveals the controls. */
export function playArrival(options = {}) {
  if (active) return active;
  active = runArrival(options).finally(() => { active = null; });
  return active;
}

async function runArrival({layout = () => {}, signal} = {}) {
  if (signal?.aborted) return {completed: false, reason: 'aborted'};
  if (document.hidden || window.matchMedia('(prefers-reduced-motion: reduce)').matches)
    return {completed: false, reason: 'reduced-motion-or-hidden'};
  if (typeof Element.prototype.animate !== 'function') return {completed: false, reason: 'unsupported'};

  const root = document.documentElement;
  const controls = document.getElementById('controls');
  const pieces = PARTS.map(([selector, box]) => ({el: document.querySelector(selector), box}));
  if (!controls || pieces.some(part => !part.el)) return {completed: false, reason: 'missing-controls'};

  const overlay = document.createElement('div');
  overlay.className = 'arrival';
  overlay.setAttribute('role', 'status');
  overlay.setAttribute('aria-live', 'polite');
  overlay.innerHTML = '<div class="arrival-copy"><span>DOOM</span><p>Made for your thumbs.</p></div>'
    + '<div class="arrival-handheld" aria-hidden="true"><div class="arrival-display"><span>DOOM</span>'
    + '<i></i><small>GAME BOY ADVANCE</small></div><div class="arrival-speaker"></div></div>'
    + '<p class="arrival-caption">Same game. Your screen.</p>';
  const animations = [];
  const settled = [];
  let timer, reason = 'completed', endEarly;
  const interrupted = new Promise(resolve => { endEarly = resolve; });
  const stop = event => { reason = event?.type || 'interrupted'; endEarly(); };
  const blockInput = event => { if (event.cancelable) event.preventDefault(); event.stopImmediatePropagation(); };
  const events = ['keydown', 'keyup', 'pointerdown', 'pointerup', 'pointermove', 'touchstart', 'touchmove', 'touchend'];
  const animate = (el, keyframes, options = {}) => {
    const animation = el.animate(keyframes, {duration: DURATION, fill: 'both', ...options});
    animations.push(animation);
    // Capture the promise before cancel() can reject it during an interruption.
    settled.push(animation.finished.catch(() => {}));
  };

  try {
    root.dataset.arrival = 'active';
    pieces.forEach(({el}) => el.classList.add('arrival-part'));
    document.body.append(overlay);
    layout();
    const scale = Math.max(0.35, Math.min((innerWidth - 36) / 320, (innerHeight - 140) / 184, 1.35));
    const x = (innerWidth - 320 * scale) / 2;
    const y = (innerHeight - 184 * scale) / 2;
    const handheld = overlay.querySelector('.arrival-handheld');
    Object.assign(handheld.style, {left: `${x}px`, top: `${y}px`, width: `${320 * scale}px`, height: `${184 * scale}px`});
    overlay.style.setProperty('--arrival-scale', scale);

    for (const type of events) window.addEventListener(type, blockInput, {capture: true, passive: false});
    window.addEventListener('resize', stop, {once: true});
    window.addEventListener('orientationchange', stop, {once: true});
    document.addEventListener('visibilitychange', stop, {once: true});
    signal?.addEventListener('abort', stop, {once: true});
    timer = setTimeout(() => { reason = 'timeout'; endEarly(); }, DURATION + 350);

    for (const {el, box: [px, py, pw, ph]} of pieces) {
      const transform = arrivalTransform({left: x + px * scale, top: y + py * scale, width: pw * scale, height: ph * scale}, el.getBoundingClientRect());
      animate(el, [
        {transform, opacity: 0, offset: 0},
        {transform, opacity: 1, offset: 0.12},
        {transform, opacity: 1, offset: 0.36, easing: 'cubic-bezier(.22,.8,.24,1)'},
        {transform: 'none', opacity: 1, offset: 0.94},
        {transform: 'none', opacity: 1, offset: 1},
      ]);
    }
    animate(handheld, [
      {opacity: 0, transform: 'scale(.97)', offset: 0},
      {opacity: 1, transform: 'scale(1)', offset: 0.13},
      {opacity: 1, transform: 'scale(1)', offset: 0.36},
      {opacity: 0, transform: 'scale(1.07)', offset: 0.72},
      {opacity: 0, transform: 'scale(1.07)', offset: 1},
    ]);
    for (const el of overlay.querySelectorAll('.arrival-copy, .arrival-caption')) animate(el, [
      {opacity: 0, offset: 0}, {opacity: 1, offset: 0.14}, {opacity: 1, offset: 0.42},
      {opacity: 0, offset: 0.75}, {opacity: 0, offset: 1},
    ]);
    animate(overlay, [{opacity: 1, offset: 0}, {opacity: 1, offset: 0.7}, {opacity: 0, offset: 1}]);
    await Promise.race([Promise.all(settled), interrupted]);
    return {completed: reason === 'completed', reason};
  } catch (error) {
    // Cosmetic failure must never prevent the real game from starting.
    console.warn('Control introduction skipped:', error.message);
    return {completed: false, reason: 'presentation-error'};
  } finally {
    clearTimeout(timer);
    animations.forEach(animation => animation.cancel());
    for (const type of events) window.removeEventListener(type, blockInput, {capture: true});
    window.removeEventListener('resize', stop);
    window.removeEventListener('orientationchange', stop);
    document.removeEventListener('visibilitychange', stop);
    signal?.removeEventListener('abort', stop);
    pieces.forEach(({el}) => el.classList.remove('arrival-part'));
    overlay.remove();
    delete root.dataset.arrival;
    layout();
  }
}
