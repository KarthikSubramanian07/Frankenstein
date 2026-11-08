import React from 'react';
import {AbsoluteFill, Audio, Easing, getStaticFiles, Img, interpolate, OffthreadVideo, Sequence, staticFile, useCurrentFrame} from 'remotion';
import {DATA} from './data';
import {s} from './timeline';
import {BODY, C, HEAD, MONO} from './theme';

const has = (name: string) => getStaticFiles().some((f) => f.name === name);
const ease = Easing.inOut(Easing.cubic);
const fadeIO = (f: number, len: number, d = 9) =>
  interpolate(f, [0, d, len - d, len], [0, 1, 1, 0], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
const ramp = (f: number, a: number, b: number) => interpolate(f, [a, b], [0, 1], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: ease});

/** One sentence, big and centred, held for its whole slot. `onDark` puts it on a dark pill over footage. */
const Line: React.FC<{text: string; len: number; onDark?: boolean; top?: number}> = ({text, len, onDark, top}) => {
  const f = useCurrentFrame();
  const o = fadeIO(f, len, 10);
  const box: React.CSSProperties = onDark
    ? {background: 'rgba(29,32,38,0.82)', color: C.cream, padding: '18px 40px', borderRadius: 20}
    : {color: C.ink};
  return (
    <div style={{position: 'absolute', left: 0, right: 0, top: top ?? (onDark ? 50 : 90), display: 'flex', justifyContent: 'center', opacity: o}}>
      <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 80, lineHeight: 1.12, textAlign: 'center', maxWidth: 1640, letterSpacing: -1, ...box}}>{text}</div>
    </div>
  );
};

/** Lines in slots: [start, end, text] in seconds, relative to the scene. */
const Lines: React.FC<{items: [number, number, string][]; onDark?: boolean; top?: number}> = ({items, onDark, top}) => (
  <>
    {items.map(([a, b, t]) => (
      <Sequence key={t} from={s(a)} durationInFrames={s(b) - s(a)} layout="none">
        <Line text={t} len={s(b) - s(a)} onDark={onDark} top={top} />
      </Sequence>
    ))}
  </>
);

/** Game footage: the 2880x1490 capture, nearest-neighbour scaled. View is a centre point (cx, cy) and a scale k. */
const CAP = {w: 2880, h: 1490};
const WIDE = {cx: 1440, cy: 866, k: 0.865}; // game area x 330..2550 fills the width, status bar on screen
const Game: React.FC<{clip: string; still: string; from: number; view: {cx: number; cy: number; k: number}; clipLen: number}> = ({clip, still, from, view, clipLen}) => {
  const t = `translate(${960 - view.cx * view.k}px, ${540 - view.cy * view.k}px) scale(${view.k})`;
  const px: React.CSSProperties = {position: 'absolute', left: 0, top: 0, width: CAP.w, height: CAP.h, imageRendering: 'pixelated'};
  return (
    <AbsoluteFill style={{background: '#000', overflow: 'hidden'}}>
      <div style={{position: 'absolute', left: 0, top: 0, width: CAP.w, height: CAP.h, transform: t, transformOrigin: '0 0'}}>
        {has(still) ? <Img src={staticFile(still)} style={px} /> : null}
        <Sequence durationInFrames={clipLen} layout="none">
          {has(clip) ? <OffthreadVideo src={staticFile(clip)} startFrom={from} muted style={px} /> : null}
        </Sequence>
      </div>
    </AbsoluteFill>
  );
};

const Fade: React.FC<{len: number; bg?: string; children: React.ReactNode}> = ({len, bg = C.cream, children}) => {
  const f = useCurrentFrame();
  return <AbsoluteFill style={{background: bg, opacity: fadeIO(f, len, 9)}}>{children}</AbsoluteFill>;
};

// 0:00 to 0:08 Doom, full screen.
const Open: React.FC = () => (
  <Fade len={s(8)} bg="#000">
    <Game clip="clips/god_original.mp4" still="clips/god_original_end.png" from={0} view={WIDE} clipLen={s(8)} />
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
  const stamp = ramp(f, s(8.6), s(9.4));
  const hexO = 1 - intoBox;
  return (
    <Fade len={s(12)}>
      <div style={{position: 'absolute', left: 110, top: 330, width: 760, opacity: hexO, fontFamily: MONO, fontSize: 30, lineHeight: 1.5, color: C.gray, wordBreak: 'break-all'}}>
        {hex.slice(0, 168).join(' ')}
      </div>
      <div
        style={{
          position: 'absolute', left: interpolate(intoBox, [0, 1], [1010, 610]), top: interpolate(intoBox, [0, 1], [330, 380]), width: 700, padding: 34,
          background: C.paper, border: `5px solid ${C.ink}`, borderRadius: 22, fontFamily: MONO, fontSize: 30, lineHeight: 1.45, color: C.ink, whiteSpace: 'pre-wrap',
          transform: `scale(${interpolate(intoBox, [0, 1], [1, 0.9])})`,
        }}
      >
        {code.slice(0, typed)}
      </div>
      {/* the checker box */}
      <div style={{position: 'absolute', left: 540, top: 330, width: 840, height: 640, border: `10px solid ${C.ink}`, borderRadius: 34, opacity: intoBox}} />
      <div
        style={{
          position: 'absolute', left: 960, top: 650, whiteSpace: 'nowrap', transform: `translate(-50%,-50%) rotate(-6deg) scale(${interpolate(stamp, [0, 1], [1.25, 1])})`, opacity: stamp,
          border: `12px solid ${C.lcd1}`, borderRadius: 20, padding: '10px 44px', background: 'rgba(251,250,247,0.94)', color: C.lcd1, fontFamily: HEAD, fontWeight: 800, fontSize: 104, letterSpacing: 4,
        }}
      >
        EXACT MATCH
      </div>
      <Lines items={[[0, 5, 'Our AI agents read the cartridge and rewrite the code, piece by piece.'], [5, 8.5, 'Then a checker rebuilds each piece.'], [8.5, 12, "It passes only if it's an exact match."]]} />
    </Fade>
  );
};

// 0:28 to 0:36 The AI claims a match; NOT A MATCH.
const Lie: React.FC = () => {
  const f = useCurrentFrame();
  const bubble = ramp(f, 6, 26);
  const stamp = ramp(f, s(4), s(4.8));
  return (
    <Fade len={s(8)}>
      <div style={{position: 'absolute', left: 960, top: 560, transform: `translate(-50%,-50%) scale(${0.94 + 0.06 * bubble})`, opacity: bubble}}>
        <div style={{background: C.paper, border: `6px solid ${C.ink}`, borderRadius: 48, padding: '50px 80px', fontFamily: BODY, fontWeight: 700, fontSize: 92, color: C.ink, whiteSpace: 'nowrap'}}>
          <span style={{display: 'inline-block', background: C.ink, color: C.cream, borderRadius: 999, fontSize: 44, padding: '10px 22px', marginRight: 30, verticalAlign: 'middle'}}>AI</span>
          Done. It matches!
        </div>
        <div style={{position: 'absolute', left: 120, bottom: -46, width: 0, height: 0, borderLeft: '40px solid transparent', borderRight: '40px solid transparent', borderTop: `50px solid ${C.ink}`}} />
      </div>
      <div
        style={{
          position: 'absolute', left: 1180, top: 760, whiteSpace: 'nowrap', transform: `translate(-50%,-50%) rotate(-8deg) scale(${interpolate(stamp, [0, 1], [1.25, 1])})`, opacity: stamp,
          border: `12px solid ${C.coral}`, borderRadius: 20, padding: '10px 44px', background: 'rgba(251,250,247,0.94)', color: C.coral, fontFamily: HEAD, fontWeight: 800, fontSize: 96, letterSpacing: 4,
        }}
      >
        NOT A MATCH
      </div>
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
      <div style={{position: 'absolute', left: 0, right: 0, top: 790, textAlign: 'center', opacity: 1 - fold, fontFamily: HEAD, fontWeight: 800, fontSize: 110, color: C.lcd1}}>
        {filled}
        <span style={{color: C.gray, fontSize: 64}}> / {T}</span>
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
      <Lines items={[[0, 4, `${N} of Doom's ${T} pieces are back so far.`], [4, 8, 'Put back together, the game is identical to the original.']]} />
    </Fade>
  );
};

// The HEALTH number in the 2880x1490 capture (measured on god_200_end.png): centre (840, 1300); zoom so it fills ~40%.
const HP = {cx: 840, cy: 1255, k: 2.05};
const zoomView = (p: number) => ({cx: WIDE.cx + (HP.cx - WIDE.cx) * p, cy: WIDE.cy + (HP.cy - WIDE.cy) * p, k: WIDE.k + (HP.k - WIDE.k) * p});

// 0:44 to 0:49 Original Doom, cheat on, zoom into 100%.
const Before: React.FC = () => {
  const f = useCurrentFrame();
  const z = ramp(f, s(1.2), s(3));
  return (
    <Fade len={s(5)} bg="#000">
      <Game clip="clips/god_original.mp4" still="clips/god_original_end.png" from={s(3)} view={zoomView(z)} clipLen={s(5)} />
      <Lines onDark items={[[0, 5, 'Now that we have the code, we can change it.']]} />
    </Fade>
  );
};

// 0:49 to 0:55 Edited build, same cheat, zoom into 200%, green ring pulse.
const After: React.FC = () => {
  const f = useCurrentFrame();
  const z = ramp(f, s(0.6), s(2.4));
  const ring = interpolate(f, [s(2.6), s(3.2), s(4.4)], [0, 1, 0.55], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
  const r = 410 + 22 * Math.sin(Math.max(0, f - s(2.6)) / 6);
  return (
    <Fade len={s(6)} bg="#000">
      {/* starts 5 s into the clip: the cheat fires and health turns 200%; the clip's real last frame holds after it ends */}
      <Game clip="clips/god_200.mp4" still="clips/god_200_end.png" from={s(5)} view={zoomView(z)} clipLen={s(4.3)} />
      <div style={{position: 'absolute', left: 960 - r, top: 668 - r * 0.5, width: 2 * r, height: 2 * r * 0.5, borderRadius: '50%', border: `14px solid ${C.mint}`, opacity: ring, boxShadow: `0 0 40px ${C.mint}`}} />
      <Lines onDark items={[[0, 6, "We changed one line of the AI's code. Same cheat, double the health."]]} />
    </Fade>
  );
};

// 0:55 to 1:00 End card.
const End: React.FC = () => (
  <Fade len={s(5)} bg={C.ink}>
    <div style={{position: 'absolute', top: 200, left: 0, right: 0, textAlign: 'center'}}>
      <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 130, color: C.lcd3, letterSpacing: -2}}>Frankenstein.</div>
      <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 76, color: C.cream, marginTop: 6}}>Lost games, brought back.</div>
    </div>
    <div style={{position: 'absolute', top: 620, left: 120, right: 120, textAlign: 'center', fontFamily: BODY, fontSize: 28, lineHeight: 1.6, color: C.cream}}>
      <div>Built today: the AI agents, the checker, the patch, this film. Not ours: Doom (id Software), GBADoom (doomhack), mGBA.</div>
      <div>Made with Meta Muse, SubQ Snap, Fetch.ai ASI:One, MongoDB Atlas, Gemini.</div>
      <div style={{fontFamily: MONO, color: C.mint, marginTop: 16}}>{DATA.url} · {DATA.repo}</div>
      <div style={{marginTop: 6}}>{DATA.team.join(' · ')}</div>
    </div>
  </Fade>
);

const SLOTS: [number, number, React.FC][] = [
  [0, 8, Open], [8, 16, Lost], [16, 28, Rebuild], [28, 36, Lie], [36, 44, Count], [44, 49, Before], [49, 55, After], [55, 60, End],
];

const voice = () => ['voice/narration.m4a', 'voice/narration.wav', 'voice/narration.mp3'].find(has);

export const Main: React.FC = () => {
  const v = voice();
  return (
    <AbsoluteFill style={{background: C.cream}}>
      {SLOTS.map(([a, b, S]) => (
        <Sequence key={a} from={s(a)} durationInFrames={s(b) - s(a)}>
          <S />
        </Sequence>
      ))}
      {v ? <Audio src={staticFile(v)} /> : null}
    </AbsoluteFill>
  );
};
