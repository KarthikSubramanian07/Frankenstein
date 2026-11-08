import React from 'react';
import {AbsoluteFill, Audio, Easing, getStaticFiles, Img, interpolate, OffthreadVideo, random, Sequence, spring, staticFile, useCurrentFrame} from 'remotion';
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
    <div style={{position: 'absolute', left: 120, right: 120, top: onDark ? 690 : 96, height: onDark ? 300 : undefined, display: 'flex', alignItems: 'center', justifyContent: 'center'}}>
      <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 80, lineHeight: 1.14, textAlign: 'center', maxWidth: 1680, letterSpacing: '-0.02em', textWrap: 'balance', color: onDark ? C.cream : C.ink, textShadow: onDark ? '0 2px 18px rgba(0,0,0,0.45)' : undefined} as React.CSSProperties}>
        {words.map((w, k) => {
          const inn = sp(f, k * 2, 16);
          const out = sp(f, len - 12 + k * 1, 10);
          const y = (1 - inn) * 100 - out * 100;
          return (
            <span key={k} style={{display: 'inline-block', overflow: 'hidden', verticalAlign: 'top', paddingBottom: '0.08em', marginRight: '0.24em'}}>
              <span style={{display: 'inline-block', transform: `translateY(${y}%)`, opacity: Math.min(1, inn * 1.4) * (1 - out)}}>{w}</span>
            </span>
          );
        })}
      </div>
    </div>
  );
};

/** Quiet corner tag: top-left, small caps, 60% opacity, inside the safe margin. */
const Tag: React.FC<{text: string; dark?: boolean}> = ({text, dark}) => {
  const f = useCurrentFrame();
  return (
    <div style={{position: 'absolute', left: 120, top: 44, fontFamily: BODY, fontWeight: 700, fontSize: 30, letterSpacing: '0.08em', textTransform: 'uppercase', color: dark ? '#FFFFFF' : C.ink, opacity: (dark ? 0.8 : 0.75) * interpolate(f, [8, 20], [0, 1], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'})}}>
      {text}
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

// 0:16 to 0:28 Raw numbers to readable code, into the checker, EXACT MATCH.
const Rebuild: React.FC = () => {
  const f = useCurrentFrame();
  const hex = DATA.matchHex.split(' ');
  const code = DATA.match.c.split('\n').filter((l) => !l.trim().startsWith('//') && !l.trim().startsWith('/*') && !l.trim().startsWith('*')).join('\n');
  const typed = Math.floor(interpolate(f, [s(0.6), s(4.6)], [0, code.length], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'}));
  const intoBox = ramp(f, s(5.2), s(7));
  const stamp = ramp(f, s(8.6), s(9.2));
  const stampS = sp(f, s(8.6), 18, SP_STAMP);
  const hexO = 1 - intoBox;
  return (
    <Fade len={s(12)}>
      <div style={{position: 'absolute', left: 110 - 260 * intoBox, top: 330, width: 760, opacity: hexO, fontFamily: MONO, fontSize: 30, lineHeight: 1.5, color: C.gray, wordBreak: 'break-all'}}>
        {hex.slice(0, 168).join(' ')}
      </div>
      <div
        style={{
          position: 'absolute', left: interpolate(intoBox, [0, 1], [1010, 610]), top: interpolate(intoBox, [0, 1], [330, 380]), width: 700, padding: 34,
          background: C.paper, border: `5px solid ${C.ink}`, borderRadius: 22, boxShadow: SHADOW, fontFamily: MONO, fontSize: 30, lineHeight: 1.45, color: C.ink, whiteSpace: 'pre-wrap',
          transform: `scale(${interpolate(intoBox, [0, 1], [1, 0.9])})`,
        }}
      >
        {code.slice(0, typed)}
      </div>
      {/* the checker box */}
      <div style={{position: 'absolute', left: 540, top: 330, width: 840, height: 640, border: `10px solid ${C.ink}`, borderRadius: 34, opacity: intoBox}} />
      <div
        style={{
          position: 'absolute', left: 960, top: 650, whiteSpace: 'nowrap', transform: `translate(-50%,-50%) rotate(-4deg) scale(${1.15 - 0.15 * stampS})`, opacity: stamp,
          border: `12px solid ${C.lcd1}`, borderRadius: 20, padding: '10px 44px', background: 'rgba(251,250,247,0.94)', boxShadow: SHADOW, color: C.lcd1, fontFamily: HEAD, fontWeight: 800, fontSize: 104, letterSpacing: 4,
        }}
      >
        EXACT MATCH
      </div>
      <Tag text="Software Archaeology · Meta Muse writes the code" />
      <Lines items={[[0, 5, 'Our AI agents read the cartridge and rewrite the code, piece by piece.'], [5, 8.5, 'Then a checker rebuilds each piece.'], [8.5, 12, "It passes only if it's an exact match."]]} />
    </Fade>
  );
};

// 0:28 to 0:36 The AI claims a match; NOT A MATCH.
const Lie: React.FC = () => {
  const f = useCurrentFrame();
  const bubble = ramp(f, 6, 26);
  const stamp = ramp(f, s(4), s(4.6));
  const stampS = sp(f, s(4), 18, SP_STAMP);
  return (
    <Fade len={s(8)}>
      <div style={{position: 'absolute', left: 960, top: 440, transform: `translate(-50%,-50%) translateY(${(1 - bubble) * 24}px)`, opacity: bubble}}>
        <div style={{background: C.paper, border: `4px solid ${C.ink}`, borderRadius: 26, padding: '34px 70px 44px', boxShadow: SHADOW, whiteSpace: 'nowrap'}}>
          <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 24, letterSpacing: '0.08em', textTransform: 'uppercase', color: C.gray, marginBottom: 10}}>AI agent</div>
          <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 84, letterSpacing: '-0.02em', color: C.ink}}>Done. It matches!</div>
        </div>
      </div>
      <div
        style={{
          position: 'absolute', left: 1180, top: 610, whiteSpace: 'nowrap', transform: `translate(-50%,-50%) rotate(-4deg) scale(${1.15 - 0.15 * stampS})`, opacity: stamp,
          border: `12px solid ${C.coral}`, borderRadius: 20, padding: '10px 44px', background: 'rgba(251,250,247,0.94)', boxShadow: SHADOW, color: C.coral, fontFamily: HEAD, fontWeight: 800, fontSize: 96, letterSpacing: 4,
        }}
      >
        NOT A MATCH
      </div>
      <div style={{position: 'absolute', left: 0, right: 0, top: 790, textAlign: 'center', opacity: ramp(f, s(4.4), s(5)), fontFamily: HEAD, fontWeight: 800, color: C.coral, fontVariantNumeric: 'tabular-nums'}}>
        <span style={{fontSize: 160}}>{DATA.liesCaught}</span>
        <span style={{fontSize: 32, color: C.ink, marginLeft: 14, marginRight: 56}}>lies caught</span>
        <span style={{fontSize: 160}}>{DATA.fakesAccepted}</span>
        <span style={{fontSize: 32, color: C.ink, marginLeft: 14}}>let through</span>
      </div>
      <Tag text="Trust but verify · SubQ Snap and Gemini screen every match" />
      <Lines items={[[0, 4, "Sometimes the AI says it got it right when it didn't."], [4, 8, `The checker caught all ${DATA.liesCaught} of those today.`]]} />
    </Fade>
  );
};

// 0:36 to 0:44 568 squares fill; they fold into a cartridge with a check mark.
const Count: React.FC = () => {
  const f = useCurrentFrame();
  const N = DATA.functions;
  const T = DATA.totalFunctions;
  const filled = Math.round(interpolate(f, [s(0.3), s(1.6)], [0, N], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.out(Easing.cubic)}));
  const fold = ramp(f, s(4.2), s(5.6));
  const check = ramp(f, s(5.6), s(6.6));
  const cols = 36;
  const cell = 26;
  return (
    <Fade len={s(8)}>
      <div style={{position: 'absolute', left: 960 - (cols * cell) / 2, top: 300, width: cols * cell, display: 'flex', flexWrap: 'wrap', opacity: 1 - fold, transform: `scale(${1 - 0.55 * fold})`, transformOrigin: '50% 40%'}}>
        {Array.from({length: T}, (_, k) => (
          <div key={k} style={{width: cell - 4, height: cell - 4, margin: 2, borderRadius: 4, background: k < filled ? C.lcd1 : '#DDD6C8'}} />
        ))}
      </div>
      <div style={{position: 'absolute', left: 0, right: 0, top: 770, textAlign: 'center', opacity: 1 - fold, fontFamily: HEAD, fontWeight: 800, fontSize: 160, color: C.lcd1, fontVariantNumeric: 'tabular-nums'}}>
        {filled}
        <span style={{color: C.gray, fontSize: 84}}> / {T}</span>
      </div>
      <svg width={1920} height={1080} style={{position: 'absolute', inset: 0, opacity: fold}}>
        <g transform={`translate(960 610) scale(${0.85 + 0.15 * fold})`}>
          <rect x={-180} y={-230} width={360} height={430} rx={28} fill={C.lcd1} stroke={C.ink} strokeWidth={8} />
          <rect x={-130} y={-170} width={260} height={180} rx={10} fill={C.lcd3} stroke={C.ink} strokeWidth={6} />
          <text x={0} y={-62} textAnchor="middle" fontFamily={HEAD} fontWeight={800} fontSize={58} fill={C.lcd0}>DOOM</text>
          {[0, 1, 2, 3, 4].map((k) => <rect key={k} x={-118 + k * 50} y={160} width={30} height={40} fill={C.ink} />)}
        </g>
        <path d="M 1180 600 L 1250 670 L 1390 500" stroke={C.lcd1} strokeWidth={30} fill="none" strokeLinecap="round" strokeLinejoin="round" pathLength={1} strokeDasharray={1} strokeDashoffset={1 - check} />
      </svg>
      <Tag text="The system that gets better · each run starts from the last run's best try" />
      <Lines items={[[0, 4, `${N} of Doom's ${T} pieces are back so far.`], [4, 8, 'Put back together, the game is identical to the original.']]} />
    </Fade>
  );
};

// The HEALTH number in the 2880x1490 capture (measured on god_200_end.png): centre (840, 1300); zoom so it fills ~40%.
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

// 0:55 to 1:00 End card.
const End: React.FC = () => (
  <Fade len={s(5)} bg={C.ink}>
    <div style={{position: 'absolute', top: 110, left: 120, right: 120, textAlign: 'center'}}>
      <div style={{display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 30}}>
        {has('assets/bolt.svg') ? <Img src={staticFile('assets/bolt.svg')} style={{width: 120, height: 120, imageRendering: 'pixelated', borderRadius: 16}} /> : null}
        <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 140, color: C.lcd3, letterSpacing: '-0.02em'}}>{DATA.close[0]}</div>
      </div>
      {DATA.close.slice(1).map((l) => (
        <div key={l} style={{fontFamily: HEAD, fontWeight: 800, fontSize: 60, color: C.cream, marginTop: 6, textWrap: 'balance'} as React.CSSProperties}>{l}</div>
      ))}
      <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 44, color: C.cream, opacity: 0.9, marginTop: 20}}>Built for any game we can compile. Doom is the first.</div>
    </div>
    <div style={{position: 'absolute', top: 660, left: 0, right: 0, display: 'flex', flexDirection: 'column', alignItems: 'center', textAlign: 'center', color: C.cream}}>
      <div style={{maxWidth: 1400, fontFamily: BODY, fontSize: 26, lineHeight: 1.5, textWrap: 'balance'} as React.CSSProperties}>
        Built today: the AI agents, the checker, the patch, this film. Not ours: Doom (id Software), GBADoom (doomhack), mGBA.
      </div>
      <div style={{maxWidth: 1400, fontFamily: BODY, fontSize: 26, lineHeight: 1.5, marginTop: 8, textWrap: 'balance'} as React.CSSProperties}>
        Made with Meta Muse, SubQ Snap, Fetch.ai ASI:One, MongoDB Atlas and Gemini.
      </div>
      <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 28, color: C.mint, marginTop: 26}}>Ask for proof in Fetch.ai ASI:One</div>
      <div style={{fontFamily: MONO, fontSize: 20, color: C.mint, marginTop: 10}}>{DATA.url} · {DATA.repo}</div>
      <div style={{fontFamily: BODY, fontWeight: 600, fontSize: 22, marginTop: 10}}>{DATA.team.join(' · ')}</div>
    </div>
  </Fade>
);

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
    {SECTIONS.map(([id, t]) => {
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
