import React from 'react';
import {AbsoluteFill, Audio, getStaticFiles, Img, interpolate, OffthreadVideo, random, Sequence, spring, staticFile, useCurrentFrame} from 'remotion';
import {DATA} from './data';
import {s} from './timeline';
import {BODY, C, HEAD, MONO} from './theme';

const has = (name: string) => getStaticFiles().some((f) => f.name === name);
// One motion language: springs everywhere (damping 16, mass 0.7: no overshoot on type); stamps overshoot slightly.
const SP = {damping: 16, mass: 0.7};
const SP_STAMP = {damping: 11, mass: 0.7};
const sp = (f: number, at: number, dur?: number, cfg = SP) => spring({frame: f - at, fps: 30, config: cfg, durationInFrames: dur});
const fadeIO = (f: number, len: number, d = 12) => sp(f, 0, d) * (1 - sp(f, len - d, d));
const ramp = (f: number, a: number, b: number) => sp(f, a, Math.max(1, b - a));
const SHADOW = '0 24px 48px rgba(29,32,38,.12), 0 2px 6px rgba(29,32,38,.08)';

/** One sentence, big and centred, held for its whole slot. Words rise 24 px into place inside a mask,
 * staggered by 2 frames; on exit they slide up and out the same way. */
const Line: React.FC<{text: string; len: number; onDark?: boolean}> = ({text, len, onDark}) => {
  const f = useCurrentFrame();
  const words = text.split(' ');
  return (
    <div style={{position: 'absolute', left: 120, right: 120, top: onDark ? 650 : 96, height: onDark ? 300 : undefined, display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
      <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 80, lineHeight: 1.14, textAlign: 'center', maxWidth: 1680, letterSpacing: '-0.02em', textWrap: 'balance', color: onDark ? C.cream : C.ink, textShadow: onDark ? '0 2px 18px rgba(0,0,0,0.45)' : undefined} as React.CSSProperties}>
        {words.map((w, k) => {
          const inn = sp(f, k * 2, 16);
          const out = sp(f, len - 12 + k * 1, 10);
          const y = (1 - inn) * 100 - out * 100;
          return (
            <span key={k} style={{display: 'inline-block', overflow: 'hidden', verticalAlign: 'top', paddingBottom: '0.2em', marginBottom: '-0.12em', marginRight: '0.24em'}}>
              <span style={{display: 'inline-block', transform: `translateY(${y}%)`, opacity: Math.min(1, inn * 1.4) * (1 - out)}}>{w}</span>
            </span>
          );
        })}
      </div>
    </div>
  );
};

/** Soft dark gradient under footage captions, so text never sits on busy pixels. */
const Scrim: React.FC = () => (
  <div style={{position: 'absolute', left: 0, right: 0, bottom: 0, height: 520, background: 'linear-gradient(to top, rgba(18,20,24,0.88) 0%, rgba(18,20,24,0.62) 45%, rgba(18,20,24,0) 100%)'}} />
);

/** Lines in slots: [start, end, text] in seconds, relative to the scene. */
const Lines: React.FC<{items: [number, number, string][]; onDark?: boolean}> = ({items, onDark}) => (
  <>
    {items.map(([a, b, t]) => (
      <Sequence key={t} from={s(a)} durationInFrames={s(b) - s(a)} layout="none">
        <Line text={t} len={s(b) - s(a)} onDark={onDark} />
      </Sequence>
    ))}
  </>
);

/** Game footage: the 2880x1490 capture, nearest-neighbour scaled. View is a centre point (cx, cy) and a scale k. */
const CAP = {w: 2880, h: 1490};
const WIDE = {cx: 1475, cy: 893, k: 0.893}; // game area x 400..2550 fills the width (drops the key legend), status bar on screen
const Game: React.FC<{clip: string; still: string; from: number; view: {cx: number; cy: number; k: number}; clipLen: number; len: number}> = ({clip, still, from, view: v0, clipLen, len}) => {
  const f = useCurrentFrame();
  const view = {...v0, k: v0.k * (1 + 0.03 * interpolate(f, [0, len], [0, 1], {extrapolateRight: 'clamp'}))}; // slow 3% push
  const cy = view.cy;
  const t = `translate(${960 - view.cx * view.k}px, ${540 - cy * view.k}px) scale(${view.k})`;
  const px: React.CSSProperties = {position: 'absolute', left: 0, top: 0, width: CAP.w, height: CAP.h, imageRendering: 'pixelated'};
  return (
    <div style={{position: 'absolute', inset: 28, borderRadius: 24, overflow: 'hidden', background: '#4A4A4A' /* the status bar's grey, under the capture's bottom edge */}}>
      <div style={{position: 'absolute', left: -28, top: -28, width: CAP.w, height: CAP.h, transform: t, transformOrigin: '0 0'}}>
        {has(still) ? <Img src={staticFile(still)} style={px} /> : null}
        <Sequence durationInFrames={clipLen} layout="none">
          {has(clip) ? <OffthreadVideo src={staticFile(clip)} startFrom={from} muted style={px} /> : null}
        </Sequence>
      </div>
      <Scrim />
      <div style={{position: 'absolute', inset: 0, borderRadius: 24, boxShadow: 'inset 0 0 0 1.5px rgba(255,255,255,0.14)'}} />
    </div>
  );
};

const Fade: React.FC<{len: number; bg?: string; children: React.ReactNode}> = ({len, bg = C.cream, children}) => {
  const f = useCurrentFrame();
  return <AbsoluteFill style={{background: bg, opacity: fadeIO(f, len, 9)}}>{children}</AbsoluteFill>;
};

// 0:00 to 0:08 Doom, full screen.
const Open: React.FC = () => (
  <Fade len={s(8)} bg={C.ink}>
    <Game clip="clips/god_original.mp4" still="clips/god_original_end.png" from={0} view={WIDE} clipLen={s(8)} len={s(8)} />
    <Lines onDark items={[[0, 4, 'This is Doom, from 1993.'], [4, 8, 'For most games this old, the original code is lost.']]} />
  </Fade>
);

// 0:08 to 0:16 A cartridge and a blank page with a question mark.
const Lost: React.FC = () => {
  const f = useCurrentFrame();
  const a = ramp(f, 6, 30);
  const b = ramp(f, 24, 48);
  return (
    <Fade len={s(8)}>
      <svg width={1920} height={1080} style={{position: 'absolute', inset: 0}}>
        <g transform={`translate(640 640)`} opacity={a}>
          <rect x={-180} y={-230} width={360} height={430} rx={28} fill={C.lcd1} stroke={C.ink} strokeWidth={8} />
          <rect x={-130} y={-170} width={260} height={180} rx={10} fill={C.lcd3} stroke={C.ink} strokeWidth={6} />
          <text x={0} y={-62} textAnchor="middle" fontFamily={HEAD} fontWeight={800} fontSize={58} fill={C.lcd0}>DOOM</text>
          {[0, 1, 2, 3, 4].map((k) => <rect key={k} x={-118 + k * 50} y={160} width={30} height={40} fill={C.ink} />)}
        </g>
        <g transform={`translate(1280 640)`} opacity={b}>
          <rect x={-200} y={-250} width={400} height={480} rx={18} fill={C.paper} stroke={C.ink} strokeWidth={8} />
          <text x={0} y={60} textAnchor="middle" fontFamily={HEAD} fontWeight={800} fontSize={240} fill={C.violet}>?</text>
        </g>
      </svg>
      <Lines items={[[0, 4, 'The game still runs, but nobody can read how it works.'], [4, 8, 'So nobody can fix it, or bring it to new devices.']]} />
    </Fade>
  );
};

// A partner mark from public/assets/logos (see SOURCES.md), small, beside a short label.
const Mark: React.FC<{src: string; h?: number}> = ({src, h = 28}) =>
  has(`assets/logos/${src}`) ? <Img src={staticFile(`assets/logos/${src}`)} style={{height: h, width: 'auto', verticalAlign: 'middle'}} /> : null;
const Chip: React.FC<{children: React.ReactNode; style?: React.CSSProperties}> = ({children, style}) => (
  <div style={{display: 'inline-flex', alignItems: 'center', gap: 12, padding: '10px 18px', borderRadius: 999, background: C.paper, border: `2px solid rgba(29,32,38,.14)`, boxShadow: SHADOW, fontFamily: BODY, fontWeight: 600, fontSize: 24, color: C.ink, whiteSpace: 'nowrap', ...style}}>{children}</div>
);
const countUp = (f: number, at: number, n: number) => Math.round(n * sp(f, at, 40));

// 0:16 to 0:28 Raw numbers to readable code, into the checker, EXACT MATCH.
const Rebuild: React.FC = () => {
  const f = useCurrentFrame();
  const hex = DATA.matchHex.split(' ');
  const code = DATA.match.c.split('\n').filter((l) => !l.trim().startsWith('//') && !l.trim().startsWith('/*') && !l.trim().startsWith('*')).join('\n');
  const typed = Math.floor(interpolate(f, [s(0.6), s(4.6)], [0, code.length], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'}));
  const intoBox = ramp(f, s(5.2), s(7));
  const stamp = ramp(f, s(8.6), s(9.2));
  const stampS = sp(f, s(8.6), 18, SP_STAMP);
  const review = ramp(f, s(6.6), s(7.4));
  // group of hex wall (620) + gap (80) + code card (740) = 1440 wide, centred
  return (
    <Fade len={s(12)}>
      <div style={{position: 'absolute', left: 240 - 300 * intoBox, top: 340, width: 620, opacity: 1 - intoBox, fontFamily: MONO, fontSize: 28, lineHeight: 1.5, color: C.gray, wordBreak: 'break-all'}}>
        {hex.slice(0, 150).join(' ')}
      </div>
      <div style={{position: 'absolute', left: interpolate(intoBox, [0, 1], [940, 627]), top: interpolate(intoBox, [0, 1], [340, 455]), width: 740, transform: `scale(${interpolate(intoBox, [0, 1], [1, 0.9])})`, transformOrigin: '50% 0'}}>
        <div style={{background: C.paper, border: `5px solid ${C.ink}`, borderRadius: 22, boxShadow: SHADOW, padding: '22px 30px 30px'}}>
          <div style={{display: 'flex', alignItems: 'center', gap: 12, fontFamily: BODY, fontWeight: 600, fontSize: 22, color: C.gray, marginBottom: 14}}>
            <Mark src="meta.svg" h={22} /> written by Meta Muse
          </div>
          <div style={{fontFamily: MONO, fontSize: 25, lineHeight: 1.45, color: C.ink, whiteSpace: 'pre'}}>{code.slice(0, typed)}</div>
        </div>
      </div>
      {/* the checker */}
      <div style={{position: 'absolute', left: 520, top: 340, width: 880, height: 600, border: `10px solid ${C.ink}`, borderRadius: 34, opacity: intoBox}}>
        <div style={{position: 'absolute', left: 30, top: -22, padding: '0 14px', background: C.cream, fontFamily: BODY, fontWeight: 700, fontSize: 30, color: C.ink}}>checker</div>
      </div>
      <div style={{position: 'absolute', left: 0, right: 0, top: 962, display: 'flex', justifyContent: 'center', opacity: review, transform: `translateY(${(1 - review) * 16}px)`}}>
        <Chip>+ <Mark src="subq-snap.svg" h={24} /> · <Mark src="gemini.svg" h={26} /> review every match</Chip>
      </div>
      <div style={{position: 'absolute', left: 960, top: 640, whiteSpace: 'nowrap', transform: `translate(-50%,-50%) rotate(-4deg) scale(${1.15 - 0.15 * stampS})`, opacity: stamp, border: `12px solid ${C.lcd1}`, borderRadius: 20, padding: '10px 44px', background: 'rgba(251,250,247,0.96)', boxShadow: SHADOW, color: C.lcd1, fontFamily: HEAD, fontWeight: 800, fontSize: 104, letterSpacing: 4}}>
        EXACT MATCH
      </div>
      <Lines items={[[0, 5, 'Our AI agents read the cartridge and rewrite the code, piece by piece.'], [5, 8.5, 'Then a checker rebuilds each piece.'], [8.5, 12, "It passes only if it's an exact match."]]} />
    </Fade>
  );
};

// 0:28 to 0:36 The AI claims a match; NOT A MATCH; the count.
const Lie: React.FC = () => {
  const f = useCurrentFrame();
  const bubble = ramp(f, 6, 26);
  const stamp = ramp(f, s(4), s(4.6));
  const stampS = sp(f, s(4), 18, SP_STAMP);
  const stats = ramp(f, s(4.6), s(5.2));
  return (
    <Fade len={s(8)}>
      <div style={{position: 'absolute', left: 960, top: 430, transform: `translate(-50%,-50%) translateY(${(1 - bubble) * 24}px)`, opacity: bubble}}>
        <div style={{background: C.paper, border: `4px solid ${C.ink}`, borderRadius: 26, padding: '32px 70px 42px', boxShadow: SHADOW, whiteSpace: 'nowrap', textAlign: 'center'}}>
          <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 24, letterSpacing: '0.08em', textTransform: 'uppercase', color: C.gray, marginBottom: 10}}>AI agent</div>
          <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 84, letterSpacing: '-0.02em', color: C.ink}}>Done. It matches!</div>
        </div>
      </div>
      <div style={{position: 'absolute', left: 960, top: 560, display: 'flex', flexDirection: 'column', alignItems: 'center', transform: `translate(-50%,0)`, opacity: stamp}}>
        <div style={{whiteSpace: 'nowrap', transform: `rotate(-4deg) scale(${1.15 - 0.15 * stampS})`, border: `12px solid ${C.coral}`, borderRadius: 20, padding: '8px 40px', background: 'rgba(251,250,247,0.96)', boxShadow: SHADOW, color: C.coral, fontFamily: HEAD, fontWeight: 800, fontSize: 92, letterSpacing: 4}}>NOT A MATCH</div>
        <div style={{marginTop: 22, display: 'flex', alignItems: 'center', gap: 10, fontFamily: BODY, fontWeight: 600, fontSize: 24, color: C.gray}}>caught by the checker · <Mark src="subq-snap.svg" h={22} /></div>
      </div>
      <div style={{position: 'absolute', left: 0, right: 0, top: 790, display: 'flex', justifyContent: 'center', gap: 120, opacity: stats, fontVariantNumeric: 'tabular-nums'}}>
        <div style={{textAlign: 'center'}}>
          <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 150, lineHeight: 1, color: C.coral}}>{countUp(f, s(4.6), DATA.liesCaught)}</div>
          <div style={{fontFamily: BODY, fontWeight: 600, fontSize: 32, color: C.ink, marginTop: 8}}>lies caught</div>
        </div>
        <div style={{textAlign: 'center'}}>
          <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 150, lineHeight: 1, color: C.ink}}>{DATA.fakesAccepted}</div>
          <div style={{fontFamily: BODY, fontWeight: 600, fontSize: 32, color: C.ink, marginTop: 8}}>got through</div>
        </div>
      </div>
      <Lines items={[[0, 4, "Sometimes the AI says it got it right when it didn't."], [4, 8, `The checker caught all ${DATA.liesCaught} of those today.`]]} />
    </Fade>
  );
};

// 0:36 to 0:44 The recovered pieces fly into a block; it becomes the game, checked; ASI:One proof; 20,000 identical answers.
const Count: React.FC = () => {
  const f = useCurrentFrame();
  const N = DATA.functions;
  const cols = 21;
  const cell = 26;
  const fold = ramp(f, s(4.2), s(5.2));
  const check = ramp(f, s(5.2), s(6));
  const phone = ramp(f, s(5.6), s(6.3));
  const eq = ramp(f, s(6.2), s(6.8));
  const rows = Math.ceil(N / cols);
  return (
    <Fade len={s(8)}>
      {/* the pieces */}
      <div style={{position: 'absolute', left: 960 - (cols * cell) / 2 - 300, top: 330, width: cols * cell, height: rows * cell, opacity: 1 - fold, transform: `scale(${1 - 0.4 * fold})`}}>
        {Array.from({length: N}, (_, k) => {
          const p = sp(f, 4 + k * 0.18, 18);
          const x = (k % cols) * cell;
          const y = Math.floor(k / cols) * cell;
          return <div key={k} style={{position: 'absolute', left: x, top: y + (1 - p) * 220, width: cell - 4, height: cell - 4, borderRadius: 4, background: C.lcd1, opacity: Math.min(1, p * 1.5)}} />;
        })}
      </div>
      <div style={{position: 'absolute', left: 960 + 60, top: 400, opacity: 1 - fold, fontVariantNumeric: 'tabular-nums'}}>
        <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 200, lineHeight: 1, color: C.lcd1}}>{countUp(f, 6, N)}</div>
        <div style={{fontFamily: BODY, fontWeight: 600, fontSize: 34, color: C.ink, marginTop: 10, maxWidth: 520}}>pieces rebuilt, each an exact match</div>
      </div>
      {/* the game, checked */}
      <svg width={1920} height={1080} style={{position: 'absolute', inset: 0, opacity: fold}}>
        <g transform={`translate(560 560) scale(${0.8 + 0.12 * fold})`}>
          <rect x={-180} y={-230} width={360} height={430} rx={28} fill={C.lcd1} stroke={C.ink} strokeWidth={8} />
          <rect x={-130} y={-170} width={260} height={180} rx={10} fill={C.lcd3} stroke={C.ink} strokeWidth={6} />
          <text x={0} y={-62} textAnchor="middle" fontFamily={HEAD} fontWeight={800} fontSize={58} fill={C.lcd0}>DOOM</text>
          {[0, 1, 2, 3, 4].map((k) => <rect key={k} x={-118 + k * 50} y={160} width={30} height={40} fill={C.ink} />)}
        </g>
        <path d="M 760 560 L 820 620 L 940 470" stroke={C.lcd1} strokeWidth={28} fill="none" strokeLinecap="round" strokeLinejoin="round" pathLength={1} strokeDasharray={1} strokeDashoffset={1 - check} />
      </svg>
      {/* ASI:One proof, rebuilt in the site's card style from the real reply */}
      <div style={{position: 'absolute', left: 1060, top: 330, width: 520, opacity: phone, transform: `translateY(${(1 - phone) * 24}px)`}}>
        <div style={{background: C.paper, border: `4px solid ${C.ink}`, borderRadius: 28, boxShadow: SHADOW, padding: 28}}>
          <div style={{display: 'flex', alignItems: 'center', gap: 12, fontFamily: BODY, fontWeight: 700, fontSize: 24, color: C.ink}}>
            {has('assets/logos/asi-one.webp') ? <Img src={staticFile('assets/logos/asi-one.webp')} style={{width: 36, height: 36, borderRadius: 8}} /> : null} Ask in ASI:One <Mark src="fetchai.svg" h={18} />
          </div>
          <div style={{marginTop: 18, marginLeft: 'auto', width: 'fit-content', background: C.ink, color: C.cream, borderRadius: 18, padding: '12px 18px', fontFamily: BODY, fontSize: 26}}>Prove the rebuild is exact</div>
          <div style={{marginTop: 14, width: 'fit-content', border: `3px solid ${C.lcd1}`, color: C.lcd1, borderRadius: 14, padding: '8px 16px', fontFamily: HEAD, fontWeight: 800, fontSize: 34, letterSpacing: 2}}>IDENTICAL</div>
        </div>
      </div>
      <div style={{position: 'absolute', left: 1060, top: 690, width: 520, opacity: eq, fontVariantNumeric: 'tabular-nums'}}>
        <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 84, lineHeight: 1, color: C.lcd1}}>{countUp(f, s(6.2), DATA.equivalence.identical).toLocaleString('en-US')} / {DATA.equivalence.total.toLocaleString('en-US')}</div>
        <div style={{fontFamily: BODY, fontWeight: 600, fontSize: 30, color: C.ink, marginTop: 10}}>test inputs, identical answers</div>
      </div>
      <Lines items={[[0, 4, `${N} pieces of Doom are back. Each one is an exact match.`], [4, 8, 'Put back together, the game is identical to the original.']]} />
    </Fade>
  );
};

const HP = {cx: 840, cy: 1317, k: 2.05};
const DIGITS = {cx: 840, cy: 1317}; // centre of "200%" incl. the % sign, measured on god_200_end.png
const zoomView = (p: number) => ({cx: WIDE.cx + (HP.cx - WIDE.cx) * p, cy: WIDE.cy + (HP.cy - WIDE.cy) * p, k: WIDE.k + (HP.k - WIDE.k) * p});

// 0:44 to 0:49 Original Doom, cheat on, zoom into 100%.
const Before: React.FC = () => {
  const f = useCurrentFrame();
  const z = ramp(f, s(0.2), s(1.8));
  return (
    <Fade len={s(5)} bg={C.ink}>
      <Game clip="clips/god_original.mp4" still="clips/god_original_end.png" from={s(3)} view={zoomView(z)} clipLen={s(5)} len={s(5)} />
      <Lines onDark items={[[0, 5, 'Now that we have the code, we can change it.']]} />
    </Fade>
  );
};

// 0:49 to 0:55 Edited build, same cheat, zoom into 200%, green ring pulse.
const After: React.FC = () => {
  const f = useCurrentFrame();
  const z = ramp(f, s(0.2), s(1.8));
  const ring = interpolate(f, [s(2.2), s(2.8), s(4.0)], [0, 1, 0.55], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
  const r = 410 + 22 * Math.sin(Math.max(0, f - s(2.2)) / 6);
  return (
    <Fade len={s(6)} bg={C.ink}>
      {/* starts 5 s into the clip: the cheat fires and health turns 200%; the clip's real last frame holds after it ends */}
      <Game clip="clips/god_200.mp4" still="clips/god_200_end.png" from={s(5)} view={zoomView(z)} clipLen={s(4.3)} len={s(6)} />
      <div style={{position: 'absolute', left: 960 + (DIGITS.cx - HP.cx) * HP.k - r, top: 540 + (DIGITS.cy - HP.cy) * HP.k - r * 0.44, width: 2 * r, height: 2 * r * 0.44, borderRadius: '50%', border: `14px solid ${C.mint}`, opacity: ring, boxShadow: `0 0 40px ${C.mint}`}} />
      <Lines onDark items={[[0, 6, "We changed one line of the AI's code. Same cheat, double the health."]]} />
    </Fade>
  );
};

// 0:55 to 1:00 End card: a centred stack on an 8 px grid.
const PARTNERS = ['meta.svg', 'subquadratic.svg', 'fetchai.svg', 'mongodb.svg', 'gemini.svg'];
const End: React.FC = () => {
  const f = useCurrentFrame();
  return (
    <Fade len={s(5)} bg={C.ink}>
      <div style={{position: 'absolute', inset: 0, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', textAlign: 'center', color: C.cream, padding: '0 120px'}}>
        <div style={{display: 'flex', alignItems: 'center', gap: 32}}>
          {has('assets/bolt.svg') ? <Img src={staticFile('assets/bolt.svg')} style={{width: 112, height: 112, imageRendering: 'pixelated', borderRadius: 16}} /> : null}
          <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 136, lineHeight: 1, color: C.lcd3, letterSpacing: '-0.02em'}}>{DATA.close[0]}</div>
        </div>
        {DATA.close.slice(1).map((l, k) => (
          <div key={l} style={{fontFamily: HEAD, fontWeight: 800, fontSize: 56, lineHeight: 1.15, marginTop: k === 0 ? 32 : 8, textWrap: 'balance', maxWidth: 1400} as React.CSSProperties}>{l}</div>
        ))}
        <div style={{fontFamily: BODY, fontWeight: 600, fontSize: 40, opacity: 0.85, marginTop: 24}}>Built for any game we can compile. Doom is the first.</div>
        <div style={{display: 'flex', alignItems: 'center', gap: 48, marginTop: 40, padding: '20px 44px', borderRadius: 24, background: C.cream}}>
          {PARTNERS.map((m, k) => (
            <div key={m} style={{opacity: sp(f, 14 + k * 6, 14), transform: `translateY(${(1 - sp(f, 14 + k * 6, 14)) * 12}px)`}}><Mark src={m} h={m === 'subquadratic.svg' ? 44 : m === 'fetchai.svg' ? 36 : 48} /></div>
          ))}
        </div>
        <div style={{fontFamily: BODY, fontSize: 24, marginTop: 32, opacity: 0.85}}>Built today: the AI agents, the checker, the patch, this film. Not ours: Doom (id Software), GBADoom (doomhack), mGBA.</div>
        <div style={{fontFamily: MONO, fontSize: 20, color: C.mint, marginTop: 16}}>{DATA.url} · {DATA.repo}</div>
        <div style={{fontFamily: BODY, fontWeight: 600, fontSize: 22, marginTop: 8}}>{DATA.team.join(' · ')}</div>
      </div>
    </Fade>
  );
};

const SLOTS: [number, number, React.FC][] = [
  [0, 8, Open], [8, 16, Lost], [16, 28, Rebuild], [28, 36, Lie], [36, 44, Count], [44, 49, Before], [49, 55, After], [55, 60, End],
];

// One narration file per section (docs/FILM_SCRIPT.md): s1 at 0:00, s2 at 0:16, s3 at 0:28, s4 at 0:44.
// A missing file means that section is silent.
const SECTIONS: [string, number][] = [['s1', 0], ['s2', 16], ['s3', 28], ['s4', 44]];
const voiceFile = (id: string) => ['m4a', 'wav', 'mp3'].map((e) => `voice/${id}.${e}`).find(has);

/** A subtle animated film grain over the whole frame (2%). */
const Grain: React.FC = () => {
  const f = useCurrentFrame();
  const seed = Math.floor(f / 2);
  return (
    <AbsoluteFill style={{pointerEvents: 'none', opacity: 0.05, mixBlendMode: 'multiply'}}>
      <svg width={1920} height={1080}>
        <filter id={`g${seed}`}>
          <feTurbulence type="fractalNoise" baseFrequency="0.9" numOctaves={2} seed={Math.floor(random(seed) * 1000)} />
          <feColorMatrix type="saturate" values="0" />
        </filter>
        <rect width={1920} height={1080} filter={`url(#g${seed})`} />
      </svg>
    </AbsoluteFill>
  );
};

export const Main: React.FC = () => (
  <AbsoluteFill style={{background: C.cream, WebkitFontSmoothing: 'antialiased', MozOsxFontSmoothing: 'grayscale'} as React.CSSProperties}>
    {SLOTS.map(([a, b, S]) => (
      <Sequence key={a} from={s(a)} durationInFrames={s(b) - s(a)}>
        <S />
      </Sequence>
    ))}
    {voiceFile('narration') ? <Audio src={staticFile(voiceFile('narration') as string)} /> : null}
    {voiceFile('narration') ? null : SECTIONS.map(([id, t]) => {
      const v = voiceFile(id);
      return v ? (
        <Sequence key={v} from={s(t)} layout="none">
          <Audio src={staticFile(v)} />
        </Sequence>
      ) : null;
    })}
    <Grain />
  </AbsoluteFill>
);
