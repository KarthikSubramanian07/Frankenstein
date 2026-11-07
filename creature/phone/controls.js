// Controls: Doom actions, device detection, glyphs we draw ourselves, per-device profiles, the controller map.
// Input ids: gamepad 'b0'..'b16' and stick directions 'a0-' / 'a0+'; keyboard KeyboardEvent.code; touch 't:<slot>'.

export const ACTIONS = {
  fire: {label: 'FIRE', gba: ['b']},
  use: {label: 'USE', gba: ['a']},
  strafe_l: {label: 'STRAFE L', gba: ['l']},
  strafe_r: {label: 'STRAFE R', gba: ['r']},
  fwd: {label: 'FORWARD', gba: ['up']},
  back: {label: 'BACK', gba: ['down']},
  turn_l: {label: 'TURN L', gba: ['left']},
  turn_r: {label: 'TURN R', gba: ['right']},
  weapon_next: {label: 'NEXT WEAPON', gba: ['a', 'r']},
  weapon_prev: {label: 'PREV WEAPON', gba: ['a', 'l']},
  map: {label: 'MAP', gba: ['select']},
  menu: {label: 'MENU', gba: ['start']},
  pause: {label: 'PAUSE', gba: [], locked: true},
};
export const ACTION_ORDER = ['fire', 'use', 'fwd', 'back', 'turn_l', 'turn_r', 'strafe_l', 'strafe_r', 'weapon_next', 'weapon_prev', 'map', 'menu', 'pause'];

export const DEVICES = {
  xbox: {name: 'Xbox-style', pad: true},
  playstation: {name: 'PlayStation-style', pad: true},
  nintendo: {name: 'Nintendo-style', pad: true},
  '8bitdo': {name: '8BitDo', pad: true},
  steamdeck: {name: 'Steam Deck', pad: true},
  generic: {name: 'Generic gamepad', pad: true},
  keyboard: {name: 'Keyboard', pad: false},
  touch: {name: 'Touch', pad: false},
};

// Gamepad API id strings carry vendor ids: Chrome "(… Vendor: 054c Product: 0ce6)", Firefox "054c-0ce6-…".
export function detectPad(id = '') {
  const s = id.toLowerCase();
  const vendor = (s.match(/vendor:\s*([0-9a-f]{4})/) || s.match(/^([0-9a-f]{4})-[0-9a-f]{4}-/) || [])[1];
  if (vendor === '28de' || /steam deck|valve|steam virtual/.test(s)) return 'steamdeck';
  if (vendor === '2dc8' || /8bitdo/.test(s)) return '8bitdo';
  if (vendor === '054c' || /dualsense|dualshock|playstation|ps[345] /.test(s)) return 'playstation';
  if (vendor === '057e' || /pro controller|joy-con|nintendo|switch/.test(s)) return 'nintendo';
  if (vendor === '045e' || /xbox|xinput|microsoft/.test(s)) return 'xbox';
  return 'generic';
}

// Positional labels per family (standard mapping: index 0 is always the bottom face button).
const FACE = {
  xbox: ['A', 'B', 'X', 'Y'], steamdeck: ['A', 'B', 'X', 'Y'], generic: ['↓', '→', '←', '↑'],
  playstation: ['✕', '○', '□', '△'], nintendo: ['B', 'A', 'Y', 'X'], '8bitdo': ['B', 'A', 'Y', 'X'],
};
const REST = {
  xbox: ['LB', 'RB', 'LT', 'RT', 'View', 'Menu', 'LS', 'RS'], steamdeck: ['L1', 'R1', 'L2', 'R2', 'View', 'Menu', 'L3', 'R3'],
  playstation: ['L1', 'R1', 'L2', 'R2', 'Create', 'Options', 'L3', 'R3'], nintendo: ['L', 'R', 'ZL', 'ZR', '−', '+', 'LS', 'RS'],
  '8bitdo': ['L', 'R', 'L2', 'R2', 'Select', 'Start', 'L3', 'R3'], generic: ['L1', 'R1', 'L2', 'R2', 'Select', 'Start', 'L3', 'R3'],
};
const STICK = {'a0-': 'L stick ←', 'a0+': 'L stick →', 'a1-': 'L stick ↑', 'a1+': 'L stick ↓', 'a2-': 'R stick ←', 'a2+': 'R stick →', 'a3-': 'R stick ↑', 'a3+': 'R stick ↓'};
const KEYS = {ArrowUp: '↑', ArrowDown: '↓', ArrowLeft: '←', ArrowRight: '→', Backspace: '⌫', Enter: 'Enter', Escape: 'Esc', Space: 'Space', Tab: 'Tab', ShiftLeft: 'Shift', ShiftRight: 'R Shift', ControlLeft: 'Ctrl', ControlRight: 'R Ctrl', AltLeft: 'Alt', AltRight: 'R Alt'};
const TOUCH = {'t:fire': 'FIRE button', 't:use': 'USE button', 't:l': 'Left shoulder', 't:r': 'Right shoulder', 't:select': 'Small left', 't:start': 'Small right', 't:up': 'D-pad ↑', 't:down': 'D-pad ↓', 't:left': 'D-pad ←', 't:right': 'D-pad →', 't:pause': 'Pause button'};

export function inputLabel(device, id) {
  if (device === 'keyboard') return KEYS[id] || id.replace(/^Key|^Digit/, '');
  if (device === 'touch') return TOUCH[id] || id;
  if (STICK[id]) return STICK[id];
  const n = Number(id.slice(1));
  if (n <= 3) return FACE[device][n];
  if (n <= 11) return REST[device][n - 4];
  return ['D-pad ↑', 'D-pad ↓', 'D-pad ←', 'D-pad →', 'Home'][n - 12] || id;
}
// A chip: PlayStation face buttons get small drawn shapes; everything else is a text keycap.
export function glyph(device, id) {
  const label = inputLabel(device, id);
  const n = /^b[0-3]$/.test(id) ? Number(id[1]) : -1;
  if (device === 'playstation' && n >= 0) {
    const shape = [
      '<path d="M5 5L15 15M15 5L5 15"/>', '<circle cx="10" cy="10" r="5.5"/>', '<rect x="4.5" y="4.5" width="11" height="11"/>', '<path d="M10 4L16 15H4Z"/>'][n];
    return `<span class="glyph face" title="${label}"><svg viewBox="0 0 20 20" aria-hidden="true">${shape}</svg><span class="sr">${['Cross', 'Circle', 'Square', 'Triangle'][n]}</span></span>`;
  }
  return `<span class="glyph${n >= 0 ? ' face' : ''}${device === 'keyboard' ? ' key' : ''}">${label}</span>`;
}

const PAD_DEFAULT = {fire: ['b0', 'b7'], use: ['b1', 'b2', 'b6'], fwd: ['b12', 'a1-'], back: ['b13', 'a1+'], turn_l: ['b14', 'a2-'], turn_r: ['b15', 'a2+'],
  strafe_l: ['b4', 'a0-'], strafe_r: ['b5', 'a0+'], weapon_next: ['b3'], weapon_prev: [], map: ['b8'], menu: ['b9'], pause: ['b16']};
const DEFAULTS = {
  keyboard: {fire: ['KeyZ'], use: ['KeyX'], fwd: ['ArrowUp'], back: ['ArrowDown'], turn_l: ['ArrowLeft'], turn_r: ['ArrowRight'], strafe_l: ['KeyA'], strafe_r: ['KeyS'],
    weapon_next: ['KeyE'], weapon_prev: ['KeyQ'], map: ['Backspace'], menu: ['Enter'], pause: ['Escape']},
  touch: {fire: ['t:fire'], use: ['t:use'], fwd: ['t:up'], back: ['t:down'], turn_l: ['t:left'], turn_r: ['t:right'], strafe_l: ['t:l'], strafe_r: ['t:r'],
    weapon_next: [], weapon_prev: [], map: ['t:select'], menu: ['t:start'], pause: ['t:pause']},
};
export const ALL_INPUTS = {
  pad: [...Array(17).keys()].map(i => `b${i}`).concat(Object.keys(STICK)),
  touch: ['t:fire', 't:use', 't:l', 't:r', 't:select', 't:start', 't:up', 't:down', 't:left', 't:right'],
};
const STORE = 'player2.controls.v1';
const clone = o => JSON.parse(JSON.stringify(o));
function load() { try { return JSON.parse(localStorage.getItem(STORE)) || {}; } catch { return {}; } }
function save(all) { try { localStorage.setItem(STORE, JSON.stringify(all)); } catch { /* Private mode: the mapping lasts for this visit. */ } }
const saved = load();
export function defaults(device) { return clone(DEFAULTS[device] || PAD_DEFAULT); }
export function profile(device) {
  const p = saved.profiles?.[device];
  return {binds: p?.binds ? {...defaults(device), ...p.binds} : defaults(device), swapAB: Boolean(p?.swapAB), custom: Boolean(p?.binds)};
}
export function storeProfile(device, p) { saved.profiles = {...saved.profiles, [device]: {binds: p.binds, swapAB: p.swapAB}}; save(saved); }
export function resetProfile(device) { if (saved.profiles) delete saved.profiles[device]; save(saved); }
export function padOverride() { return saved.pad || null; }
export function setPadOverride(device) { if (device) saved.pad = device; else delete saved.pad; save(saved); }

// Bind one input to an action. If another action held it, swap: that action takes this action's old inputs.
export function bind(p, action, input) {
  const from = Object.keys(p.binds).find(a => a !== action && p.binds[a].includes(input));
  if (from && ACTIONS[from].locked) return {refused: from}; // PAUSE keeps its input, so nobody gets locked out.
  const old = p.binds[action].filter(i => i !== input);
  p.binds[action] = [input];
  if (!from) return {swapped: null};
  p.binds[from] = p.binds[from].filter(i => i !== input);
  p.binds[from].push(...old);
  return {swapped: from, gave: old};
}
// Resolve pressed input ids to GBA buttons (and page actions) for a profile. swapAB mirrors the face buttons.
export function resolve(p, pressed) {
  const keys = new Set(), page = new Set();
  const swap = {b0: 'b1', b1: 'b0', b2: 'b3', b3: 'b2'};
  const ids = new Set([...pressed].map(id => (p.swapAB && swap[id]) || id));
  for (const [action, inputs] of Object.entries(p.binds)) {
    if (!inputs.some(i => ids.has(i))) continue;
    if (ACTIONS[action].gba.length) ACTIONS[action].gba.forEach(k => keys.add(k)); else page.add(action);
  }
  return {keys, page};
}
export function actionsOf(p, input) {
  const swap = {b0: 'b1', b1: 'b0', b2: 'b3', b3: 'b2'};
  const id = (p.swapAB && swap[input]) || input;
  return Object.keys(p.binds).filter(a => p.binds[a].includes(id));
}
const GROUP = [['fwd', 'back', 'MOVE'], ['turn_l', 'turn_r', 'TURN'], ['strafe_l', 'strafe_r', 'STRAFE']];
function summary(actions) {
  let names = [...new Set(actions)];
  const out = [];
  for (const [a, b, label] of GROUP) if (names.includes(a) && names.includes(b)) { out.push(label); names = names.filter(n => n !== a && n !== b); }
  return out.concat(names.map(n => ACTIONS[n].label)).join(' · ');
}

// The visual map: an outline gamepad we draw, each control labelled with its Doom action, unmapped controls dimmed.
export function padSvg(device, p) {
  const deck = device === 'steamdeck', ps = device === 'playstation';
  const lab = ids => summary(ids.flatMap(id => actionsOf(p, id)));
  const ctl = (ids, draw) => `<g class="ctl${lab(ids) ? '' : ' unbound'}" data-inputs="${ids.join(' ')}">${draw}</g>`;
  const face = (n, cx, cy) => `<circle cx="${cx}" cy="${cy}" r="13"/><text class="cap" x="${cx}" y="${cy + 4.5}" text-anchor="middle">${FACE[device][n]}</text>`;
  const pill = (x, y, w, h, t) => `<rect x="${x}" y="${y}" width="${w}" height="${h}" rx="${h / 2}"/><text class="cap" x="${x + w / 2}" y="${y + h / 2 + 4}" text-anchor="middle">${t}</text>`;
  const stick = (cx, cy, t) => `<circle cx="${cx}" cy="${cy}" r="24"/><circle cx="${cx}" cy="${cy}" r="14" class="inner"/><text class="cap" x="${cx}" y="${cy + 4}" text-anchor="middle">${t}</text>`;
  const dpad = (cx, cy) => `<path d="M${cx - 9} ${cy - 30}h18v21h21v18h-21v21h-18v-21h-21v-18h21z"/>`;
  const R = REST[device];
  const [ls, dp] = ps ? [[250, 245], [190, 170]] : [[190, 170], [250, 245]];
  const body = deck
    ? '<rect class="body" x="40" y="96" width="560" height="200" rx="60"/><rect class="screen" x="214" y="120" width="212" height="132" rx="6"/>'
    : '<path class="body" d="M215 100H425C505 100 548 130 568 200C588 270 580 330 532 330C494 330 474 292 446 262H194C166 292 146 330 108 330C60 330 52 270 72 200C92 130 135 100 215 100Z"/>';
  const fx = deck ? 540 : 470, sx = deck ? 470 : 400;
  return `<svg class="padmap" viewBox="0 0 640 360" role="img" aria-label="${DEVICES[device].name} controller map">${body}
  ${ctl(['b6'], pill(120, 22, 90, 24, R[2]))}${ctl(['b4'], pill(120, 58, 110, 24, R[0]))}
  ${ctl(['b7'], pill(430, 22, 90, 24, R[3]))}${ctl(['b5'], pill(410, 58, 110, 24, R[1]))}
  <g class="labels">
    <text x="112" y="39" text-anchor="end">${lab(['b6']) || '—'}</text><text x="112" y="75" text-anchor="end">${lab(['b4']) || '—'}</text>
    <text x="528" y="39">${lab(['b7']) || '—'}</text><text x="528" y="75">${lab(['b5']) || '—'}</text>
  </g>
  ${ctl(['a0-', 'a0+', 'a1-', 'a1+'], stick(deck ? 110 : ls[0], deck ? 150 : ls[1], 'L'))}
  ${ctl(['b12', 'b13', 'b14', 'b15'], dpad(deck ? 110 : dp[0], deck ? 240 : dp[1]))}
  ${ctl(['a2-', 'a2+', 'a3-', 'a3+'], stick(deck ? 540 : sx, deck ? 240 : 245, 'R'))}
  ${ctl(['b3'], face(3, fx, 140))}${ctl(['b2'], face(2, fx - 32, 170))}${ctl(['b1'], face(1, fx + 32, 170))}${ctl(['b0'], face(0, fx, 200))}
  ${ctl(['b8'], pill(deck ? 160 : 280, deck ? 104 : 150, 34, 18, ''))}${ctl(['b9'], pill(deck ? 446 : 326, deck ? 104 : 150, 34, 18, ''))}
  <g class="labels callouts">
    ${callout(lab(['a0-', 'a0+', 'a1-', 'a1+']), deck ? [110, 150] : ls, deck ? [20, 112] : (ps ? [128, 300] : [40, 130]))}
    ${callout(lab(['b12', 'b13', 'b14', 'b15']), deck ? [110, 240] : dp, deck ? [20, 322] : (ps ? [40, 130] : [150, 300]))}
    ${callout(lab(['a2-', 'a2+', 'a3-', 'a3+']), deck ? [540, 240] : [sx, 245], deck ? [620, 322] : [400, 316], 'middle')}
    ${callout(lab(['b3']), [fx, 140], [fx + 22, 120], 'start')}${callout(lab(['b1']), [fx + 32, 170], [fx + 50, 174], 'start')}
    ${callout(lab(['b0']), [fx, 200], [fx + 22, 226], 'start')}${callout(lab(['b2']), [fx - 32, 170], [fx - 50, deck ? 300 : 216], 'end')}
    ${callout(lab(['b8']), [deck ? 177 : 297, deck ? 113 : 159], [deck ? 177 : 290, deck ? 90 : 138], 'end')}${callout(lab(['b9']), [deck ? 463 : 343, deck ? 113 : 159], [deck ? 463 : 350, deck ? 90 : 138], 'start')}
  </g>
  <text class="cap small" x="${deck ? 177 : 297}" y="${deck ? 136 : 184}" text-anchor="middle">${R[4]}</text><text class="cap small" x="${deck ? 463 : 343}" y="${deck ? 136 : 184}" text-anchor="middle">${R[5]}</text>
  </svg>`;
}
function callout(text, [x1, y1], [x2, y2], anchor = 'start') {
  return `<text class="${text ? '' : 'dim'}" x="${x2}" y="${y2}" text-anchor="${anchor}">${text || '—'}</text>`;
}
// Unmapped: pad controls with no action, and actions with no input.
export function unmapped(device, p) {
  const inputs = DEVICES[device].pad ? ALL_INPUTS.pad.filter(i => !/^a3/.test(i)) : device === 'touch' ? ALL_INPUTS.touch : [];
  const freeInputs = inputs.filter(i => !actionsOf(p, i).length);
  const freeActions = ACTION_ORDER.filter(a => !p.binds[a]?.length);
  return {freeInputs, freeActions};
}
