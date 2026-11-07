import React from 'react';
import {AbsoluteFill, Audio, getStaticFiles, Img, interpolate, OffthreadVideo, Sequence, spring, staticFile, useCurrentFrame, useVideoConfig} from 'remotion';
import {DATA} from './data';
import {SCENES} from './timeline';
import {BODY, C, HEAD, MONO, SPRING} from './theme';
import {Card, Caption, clamp01, Expert, Lcd, Pending, Scene, Stamp} from './ui';

const files = () => new Set(getStaticFiles().map((f) => f.name));
const has = (name: string) => files().has(name);
const Clip: React.FC<{name: string; from?: number}> = ({name, from = 0}) =>
  has(name) ? <OffthreadVideo src={staticFile(name)} startFrom={from} muted style={{width: '100%', height: '100%', objectFit: 'cover'}} /> : <Pending what={name} />;

const fmt = (n: number) => n.toLocaleString('en-US');

// 0:00 Hook: the changed game, side by side.
const Hook: React.FC<{len: number}> = ({len}) => (
  <Scene len={len}>
    <Caption size={62} lines={[{t: "Doom, rebuilt by AI from machine code. Then changed.", at: 0}]} />
    <Lcd x={120} y={270} w={1680} h={602}>
      {/* Start 2.6 s in: the cheat has fired, so 100% vs 200% shows from the first second; the real last frame holds after. */}
      {has('clips/side_by_side_end.png') ? <Img src={staticFile('clips/side_by_side_end.png')} style={{position: 'absolute', width: '100%', height: '100%', objectFit: 'cover'}} /> : null}
      <Sequence durationInFrames={125} layout="none">
        <div style={{position: 'absolute', inset: 0}}>
          <Clip name="clips/side_by_side.mp4" from={78} />
        </div>
      </Sequence>
    </Lcd>
    <Readout at={12} />
    <Expert text="GBADoom · god-mode function fn_080054C8 recovered by the agents, one line edited, rebuilt" at={30} />
  </Scene>
);

/** Big health readouts under each half of the side by side, readable muted. */
const Readout: React.FC<{at: number}> = ({at}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  const p = spring({frame: f - at, fps, config: SPRING.pop});
  // One flash on the 200% side: a pulse and an underline drawn under it, so the eye finds the difference.
  const pulse = 1 + 0.18 * Math.exp(-Math.max(0, f - at - 10) / 6) * (f >= at + 10 ? 1 : 0);
  const line = interpolate(f, [at + 10, at + 22], [0, 1], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
  const flash = interpolate(f, [at + 10, at + 14, at + 28], [0, 1, 0], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
  const item = (x: number, v: string, col: string, s: number) => (
    <div style={{position: 'absolute', left: x, top: 900, width: 840, textAlign: 'center', opacity: clamp01(p * 1.5), transform: `scale(${(0.8 + 0.2 * p) * s})`, fontFamily: HEAD, fontWeight: 800, fontSize: 64, color: col}}>{v}</div>
  );
  return (
    <>
      <div style={{position: 'absolute', left: 960, top: 292, width: 818, height: 558, border: `10px solid ${C.coral}`, borderRadius: 12, opacity: flash, boxSizing: 'border-box'}} />
      {item(120, 'health 100%', C.gray, 1)}
      {item(960, 'health 200%', C.coral, pulse)}
      <div style={{position: 'absolute', left: 1380 - 190 * line, top: 985, width: 380 * line, height: 10, borderRadius: 5, background: C.coral}} />
    </>
  );
};

/** Shows only the game area of the 2880x1490 player capture (x 322..2557), dropping the key legend. */
const CAP = {w: 2880, h: 1490, x0: 330, x1: 2550};
const GameCrop: React.FC<{innerW: number; children: React.ReactNode}> = ({innerW, children}) => {
  const k = innerW / (CAP.x1 - CAP.x0);
  return <div style={{position: 'absolute', left: -CAP.x0 * k, top: 0, width: CAP.w * k, height: CAP.h * k}}>{children}</div>;
};

// 0:06 Problem: cartridge, recipe with its lines missing.
const Problem: React.FC<{len: number}> = ({len}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  const cart = spring({frame: f - 8, fps, config: SPRING.pop});
  const card = spring({frame: f - 35, fps, config: SPRING.pop});
  const stat = spring({frame: f - 60, fps, config: SPRING.pop});
  const boil = Math.floor(f / 4) % 2; // hand-drawn lines boil at about 8 fps
  return (
    <Scene len={len}>
      <Caption size={70} lines={[{t: 'Most classic games survive only as a cartridge.', at: 0}, {t: 'The source code is gone.', at: 75}]} />
      <svg width={1920} height={1080} style={{position: 'absolute', inset: 0}}>
        <g transform={`translate(520 610) scale(${cart}) rotate(${-6 + boil * 0.8})`}>
          <rect x={-170} y={-210} width={340} height={400} rx={26} fill={C.lcd1} stroke={C.ink} strokeWidth={8} />
          <rect x={-120} y={-150} width={240} height={170} rx={10} fill={C.lcd3} stroke={C.ink} strokeWidth={6} />
          <text x={0} y={-50} textAnchor="middle" fontFamily={HEAD} fontWeight={800} fontSize={54} fill={C.lcd0}>DOOM</text>
          {[0, 1, 2, 3, 4].map((k) => (
            <rect key={k} x={-110 + k * 48} y={150} width={28} height={40} fill={C.ink} />
          ))}
          <text x={0} y={95} textAnchor="middle" fontFamily={MONO} fontSize={26} fill={C.cream}>machine code only</text>
        </g>
        <g opacity={clamp01(card * 1.5)}>
          <path d={`M 760 ${610 + boil} C 860 ${580 - boil} 980 ${640 + boil} 1080 600`} stroke={C.coral} strokeWidth={7} fill="none" strokeDasharray="16 14" />
          <path d="M 1060 580 L 1090 602 L 1056 622" stroke={C.coral} strokeWidth={7} fill="none" />
        </g>
        <g transform={`translate(1400 600) scale(${card}) rotate(${4 - boil * 0.8})`}>
          <rect x={-230} y={-250} width={460} height={500} rx={20} fill={C.paper} stroke={C.ink} strokeWidth={8} />
          <text x={-190} y={-180} fontFamily={HEAD} fontWeight={800} fontSize={46} fill={C.ink}>Recipe (source)</text>
          {[0, 1, 2, 3, 4, 5].map((k) => (
            <line key={k} x1={-190} x2={150 - (k % 3) * 60} y1={-110 + k * 56} y2={-110 + k * 56} stroke={C.gray} strokeWidth={6} strokeDasharray="4 18" />
          ))}
          <text x={120} y={150} fontFamily={HEAD} fontWeight={800} fontSize={150} fill={C.violet}>?</text>
        </g>
      </svg>
      <div style={{position: 'absolute', left: 0, right: 0, top: 900, textAlign: 'center', opacity: clamp01(stat * 1.4), transform: `scale(${0.9 + 0.1 * stat})`, fontFamily: BODY, fontWeight: 700, fontSize: 40, color: C.ink}}>
        <span style={{color: C.coral, fontFamily: HEAD, fontSize: 64}}>{DATA.endangeredPct}%</span> of classic games are endangered.
        <span style={{fontWeight: 400, fontSize: 24, color: C.gray, marginLeft: 16}}>(VGHF and SPN, 2023)</span>
      </div>
      <Expert text="Only the compiled ROM ships. The C source that made it is lost." at={40} />
    </Scene>
  );
};

// 0:14 How: machine code becomes C, then MATCH.
const How: React.FC<{len: number}> = ({len}) => {
  const f = useCurrentFrame();
  const asm = DATA.match.asm;
  const c = DATA.match.c;
  const asmShown = Math.floor(interpolate(f, [15, 90], [0, asm.length], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'}));
  const cShown = Math.floor(interpolate(f, [70, 190], [0, c.length], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'}));
  return (
    <Scene len={len}>
      <Caption size={70} lines={[{t: "Meta's Muse writes the C.", at: 0}, {t: "Byte for byte, or it doesn't count.", at: 120}, {t: `From memory alone: ${DATA.memoryProbe.compiled} of ${DATA.memoryProbe.of} compiled.`, at: 215}]} />
      <Card style={{position: 'absolute', left: 90, top: 250, width: 800, height: 700, padding: 32, boxSizing: 'border-box', background: C.ink, borderColor: C.ink}}>
        <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 26, color: C.lcd3, marginBottom: 16}}>MACHINE CODE · from the cartridge</div>
        {asm.length ? (
          asm.slice(0, Math.max(asmShown, 0)).slice(0, 14).map((l, k) => (
            <div key={k} style={{fontFamily: MONO, fontSize: 30, color: C.cream, lineHeight: 1.4, whiteSpace: 'pre'}}>{l}</div>
          ))
        ) : (
          <div style={{fontFamily: MONO, fontSize: 24, color: C.gray}}>asset pending: DATA.match.asm</div>
        )}
      </Card>
      <svg width={120} height={80} style={{position: 'absolute', left: 905, top: 560}}>
        <path d="M 10 40 L 100 40 M 80 18 L 104 40 L 80 62" stroke={C.coral} strokeWidth={9} fill="none" />
      </svg>
      <Card style={{position: 'absolute', left: 1030, top: 250, width: 800, height: 700, padding: 32, boxSizing: 'border-box'}}>
        <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 26, color: C.lcd1, marginBottom: 16}}>C · written by Meta's Muse Spark</div>
        <div style={{fontFamily: MONO, fontSize: 27, color: C.ink, lineHeight: 1.45, whiteSpace: 'pre-wrap'}}>{c ? c.slice(0, cShown) : 'asset pending: DATA.match.c'}</div>
      </Card>
      <Stamp text="MATCH" at={205} color={C.lcd1} x={1500} y={830} />
      <Expert text={`ARM Thumb machine code → C → GCC → byte-identical · each check ${DATA.checkSeconds} s · ${DATA.match.fn}`} at={40} />
    </Scene>
  );
};

// 0:23 Trust: a real false claim, caught at one instruction.
const Trust: React.FC<{len: number}> = ({len}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  const L = DATA.lie;
  const a = spring({frame: f - 8, fps, config: SPRING.pop});
  const b = spring({frame: f - 45, fps, config: SPRING.pop});
  const counts = [
    {n: DATA.liesCaught, t: 'lies caught', col: C.coral},
    {n: DATA.fakesRejected, t: 'fakes rejected', col: C.coral},
    {n: DATA.fakesAccepted, t: 'let through', col: C.lcd1},
  ];
  return (
    <Scene len={len}>
      <Caption size={76} lines={[{t: "Agents lie. Compilers don't.", at: 0}]} />
      <Card style={{position: 'absolute', left: 110, top: 290, width: 720, padding: 38, boxSizing: 'border-box', opacity: clamp01(a * 1.5), transform: `scale(${0.9 + 0.1 * a})`}}>
        <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 26, color: C.gray}}>AGENT · claim</div>
        <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 64, color: C.ink, marginTop: 8}}>“{L.claim}”</div>
      </Card>
      <Card style={{position: 'absolute', left: 890, top: 290, width: 920, padding: 38, boxSizing: 'border-box', background: C.ink, opacity: clamp01(b * 1.5), transform: `scale(${0.9 + 0.1 * b})`}}>
        <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 26, color: C.lcd3}}>REFEREE · re-runs the compiler</div>
        <div style={{fontFamily: MONO, fontSize: 31, color: C.cream, marginTop: 14}}>{L.pct}% match · first difference at {L.offset}</div>
        <div style={{fontFamily: MONO, fontSize: 36, color: C.mint, marginTop: 16}}>expected {L.expected}</div>
        <div style={{fontFamily: MONO, fontSize: 36, color: C.coral, marginTop: 8}}>got&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {L.got}</div>
      </Card>
      <Stamp text="REJECTED" at={85} color={C.coral} x={1530} y={760} size={96} />
      <div style={{position: 'absolute', top: 640, left: 140, width: 1000, display: 'flex', justifyContent: 'center', gap: 80}}>
        {counts.map((c, k) => {
          const p = spring({frame: f - 120 - k * 8, fps, config: SPRING.pop});
          return (
            <div key={k} style={{textAlign: 'center', opacity: clamp01(p * 1.5), transform: `translateY(${(1 - p) * 30}px)`}}>
              <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 150, color: c.col, lineHeight: 1}}>{c.n}</div>
              <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 38, color: C.ink}}>{c.t}</div>
            </div>
          );
        })}
      </div>
      <Expert text={`real event: ${L.run} · ${L.fn} · attempt ${L.attempt} · one instruction gave it away`} at={40} />
    </Scene>
  );
};

// 0:31 Proof: the count and two identical checksums.
const Proof: React.FC<{len: number}> = ({len}) => {
  const f = useCurrentFrame();
  const N = DATA.functions;
  const T = DATA.totalFunctions;
  const filled = Math.round(interpolate(f, [12, 110], [0, N], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: (t) => 1 - (1 - t) ** 3}));
  const cols = 24;
  const cell = 24;
  const shaO = interpolate(f, [120, 135], [0, 1], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
  return (
    <Scene len={len}>
      <Caption size={70} lines={[{t: `${N} of ${T} functions, proven.`, at: 0}, {t: 'SHA-1 identical.', at: 130}]} />
      <div style={{position: 'absolute', left: 130, top: 250, width: cols * cell, display: 'flex', flexWrap: 'wrap'}}>
        {Array.from({length: T}, (_, k) => (
          <div key={k} style={{width: cell - 3, height: cell - 3, margin: 1.5, borderRadius: 3, background: k < filled ? C.mint : '#DDD6C8', boxShadow: k < filled ? `inset 0 0 0 2px ${C.lcd1}` : 'none'}} />
        ))}
      </div>
      <div style={{position: 'absolute', left: 130, top: 840, fontFamily: HEAD, fontWeight: 800, fontSize: 84, color: C.ink}}>
        {filled}<span style={{color: C.gray, fontSize: 50}}> / {T} proven</span>
      </div>
      <div style={{position: 'absolute', left: 820, top: 330, width: 1000, opacity: shaO}}>
        {['ORIGINAL', 'REBUILT'].map((t) => (
          <Card key={t} style={{padding: '22px 30px', marginBottom: 26}}>
            <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 26, color: C.gray}}>{t} ROM · SHA-1</div>
            <div style={{fontFamily: MONO, fontWeight: 700, fontSize: 31, color: C.ink, marginTop: 6}}>{DATA.sha1}</div>
          </Card>
        ))}
      </div>
      <Stamp text="IDENTICAL" at={160} color={C.lcd1} x={1320} y={700} size={96} rot={-5} />
      <Expert text={`${DATA.pctBytes}% of code bytes so far, small functions first · agent C spliced in, the rest original`} at={40} />
    </Scene>
  );
};

// 0:36 Run over run: a near-miss became a MATCH.
const Warm: React.FC<{len: number}> = ({len}) => {
  const f = useCurrentFrame();
  const W = DATA.warmStart;
  const w = interpolate(f, [8, 40], [0, W.before], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
  const bar = (label: string, pct: number, col: string, top: number) => (
    <div style={{position: 'absolute', left: 200, top, width: 1520}}>
      <div style={{fontFamily: MONO, fontSize: 34, color: C.ink, marginBottom: 12}}>{label}</div>
      <div style={{height: 96, background: '#DDD6C8', borderRadius: 14, overflow: 'hidden'}}>
        <div style={{height: '100%', width: `${pct}%`, background: col, display: 'flex', alignItems: 'center', justifyContent: 'flex-end', paddingRight: 18, boxSizing: 'border-box', fontFamily: HEAD, fontWeight: 800, fontSize: 48, color: C.ink}}>{Math.round(pct)}%</div>
      </div>
    </div>
  );
  return (
    <Scene len={len}>
      <Caption size={64} lines={[{t: `Run over run: a ${W.before}% near-miss became a ${W.after}.`, at: 0}]} />
      {bar(`${W.fn} · run ${W.beforeRun} · stuck at ${W.before}%`, w, C.lcd3, 290)}
      {bar(`${W.fn} · next run ${W.afterRun}, from its best try · ${W.after} on attempt ${W.attempt}`, interpolate(f, [45, 70], [0, 100], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'}), C.mint, 520)}
      <Stamp text={W.after} at={72} color={C.lcd1} x={1560} y={770} size={96} />
      <div style={{position: 'absolute', top: 800, left: 200, fontFamily: BODY, fontWeight: 600, fontSize: 40, color: C.ink}}>(No held-out gain yet; we don't claim one.)</div>
    </Scene>
  );
};

// 0:41 Why source: change it, run it somewhere new.
const Why: React.FC<{len: number}> = ({len}) => {
  const f = useCurrentFrame();
  const n = Math.round(interpolate(f, [20, 80], [0, DATA.equivalence.identical], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'}));
  return (
    <Scene len={len}>
      <Caption size={66} lines={[{t: 'One line of recovered C changed.', at: 0}, {t: `${fmt(DATA.equivalence.identical)} of ${fmt(DATA.equivalence.total)} identical in a browser.`, at: 90}]} />
      <Lcd x={110} y={270} w={800} h={549} label="Change it: health 200%">
        <GameCrop innerW={748}>
          {has('clips/god_200_end.png') ? <Img src={staticFile('clips/god_200_end.png')} style={{position: 'absolute', width: '100%', height: '100%'}} /> : null}
          <Sequence durationInFrames={135} layout="none">
            <div style={{position: 'absolute', inset: 0}}>
              <Clip name="clips/god_200.mp4" from={140} />
            </div>
          </Sequence>
        </GameCrop>
      </Lcd>
      <Card style={{position: 'absolute', left: 1030, top: 270, width: 800, height: 420, overflow: 'hidden', padding: 0}}>
        <Clip name="clips/equivalence.mp4" />
      </Card>
      <div style={{position: 'absolute', left: 1030, top: 720, width: 800, textAlign: 'center'}}>
        <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 80, color: C.lcd1}}>{fmt(n)} / {fmt(DATA.equivalence.total)}</div>
        <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 28, color: C.ink}}>identical: the agents' C in a browser vs the original Game Boy Advance machine code</div>
      </div>
      <Expert text="4 recovered functions, 20,000 recorded outputs, in WebAssembly; 6 checked natively on arm64 on about 1 M inputs each" at={40} />
    </Scene>
  );
};

// 0:49 Partners: each one's job.
const Partners: React.FC<{len: number}> = ({len}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  const cards = [
    {who: "Meta's Muse", job: 'writes the C', col: C.lcd1},
    {who: 'SubQ Snap', job: 'judges every match', col: C.violet, line: DATA.snap[0]},
    {who: 'The compiler', job: 'proves it, byte for byte', col: C.ink},
    {who: 'Fetch.ai ASI:One', job: 'lets anyone ask', col: C.coral},
  ];
  return (
    <Scene len={len}>
      <Caption size={62} lines={[{t: 'Muse writes · Snap judges · the compiler proves · ASI:One asks', at: 0}]} />
      <div style={{position: 'absolute', top: 340, left: 0, right: 0, display: 'flex', justifyContent: 'center', gap: 36}}>
        {cards.map((c, k) => {
          const p = spring({frame: f - 12 - k * 14, fps, config: SPRING.pop});
          return (
            <Card key={k} style={{width: 420, height: 440, padding: 38, boxSizing: 'border-box', opacity: clamp01(p * 1.5), transform: `translateY(${(1 - p) * 60}px) rotate(${(k % 2 ? 1.5 : -1.5) * p}deg)`}}>
              <div style={{height: 18, width: 110, background: c.col, borderRadius: 9, marginBottom: 32}} />
              <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 58, color: C.ink, lineHeight: 1.05}}>{c.who}</div>
              <div style={{fontFamily: BODY, fontWeight: 600, fontSize: 40, color: C.gray, marginTop: 18}}>{c.job}</div>
              {'line' in c && c.line ? <div style={{fontFamily: MONO, fontSize: 24, color: C.violet, marginTop: 22}}>{c.line}</div> : null}
            </Card>
          );
        })}
      </div>
      <Expert text="MongoDB Atlas holds the crew's memory · Gemini is the second lab screening every match" at={30} />
    </Scene>
  );
};

// 0:55 End: built today / not ours.
const End: React.FC<{len: number}> = ({len}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  const p = spring({frame: f - 4, fps, config: SPRING.pop});
  const col = (title: string, items: string[], color: string) => (
    <div style={{width: 640}}>
      <div style={{fontFamily: BODY, fontWeight: 700, fontSize: 28, color, marginBottom: 10}}>{title}</div>
      <div style={{fontFamily: BODY, fontSize: 26, color: C.cream, lineHeight: 1.45}}>{items.join(' · ')}</div>
    </div>
  );
  return (
    <Scene len={len} bg={C.ink}>
      <div style={{position: 'absolute', top: 110, left: 0, right: 0, textAlign: 'center', transform: `scale(${0.85 + 0.15 * p})`, opacity: clamp01(p * 1.5)}}>
        <div style={{display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 34}}>
          {has('assets/bolt.svg') ? <Img src={staticFile('assets/bolt.svg')} style={{width: 140, height: 140, imageRendering: 'pixelated'}} /> : null}
          <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 150, color: C.lcd3, letterSpacing: -3}}>FRANKENSTEIN</div>
        </div>
        <div style={{fontFamily: HEAD, fontWeight: 800, fontSize: 64, color: C.cream, marginTop: 4}}>Lost games, rebuilt and proven.</div>
        <div style={{fontFamily: MONO, fontSize: 34, color: C.mint, marginTop: 22}}>{DATA.url}</div>
        <div style={{fontFamily: MONO, fontSize: 26, color: C.cream, marginTop: 10}}>{DATA.repo}</div>
        <div style={{fontFamily: BODY, fontWeight: 600, fontSize: 28, color: C.cream, marginTop: 14}}>Team: {DATA.team.join(' · ')}</div>
      </div>
      <div style={{position: 'absolute', top: 720, left: 0, right: 0, display: 'flex', justifyContent: 'center', gap: 120}}>
        {col('BUILT TODAY', DATA.builtToday, C.mint)}
        {col('NOT OURS', DATA.notOurs, C.gray)}
      </div>
    </Scene>
  );
};

const ORDER: [keyof typeof SCENES, React.FC<{len: number}>][] = [
  ['hook', Hook], ['problem', Problem], ['how', How], ['trust', Trust], ['proof', Proof], ['warm', Warm], ['why', Why], ['partners', Partners], ['end', End],
];

const voice = () => ['voice/narration.m4a', 'voice/narration.wav', 'voice/narration.mp3'].find(has);

export const Main: React.FC = () => {
  const v = voice();
  return (
    <AbsoluteFill style={{background: C.cream}}>
      {ORDER.map(([k, S]) => {
        const [a, b] = SCENES[k];
        return (
          <Sequence key={k} from={a} durationInFrames={b - a} name={k}>
            <S len={b - a} />
          </Sequence>
        );
      })}
      {v ? <Audio src={staticFile(v)} /> : null}
    </AbsoluteFill>
  );
};
