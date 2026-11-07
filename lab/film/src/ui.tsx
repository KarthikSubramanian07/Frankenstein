import React from 'react';
import {AbsoluteFill, interpolate, spring, useCurrentFrame, useVideoConfig} from 'remotion';
import {BODY, C, HEAD, MONO, SPRING} from './theme';

export const clamp01 = (v: number) => Math.min(1, Math.max(0, v));
const pop = (f: number, fps: number, at: number, cfg = SPRING.pop) => spring({frame: f - at, fps, config: cfg});

/** Scene wrapper: local frame starts at 0; fades and drifts in and out over 9 frames. */
export const Scene: React.FC<{len: number; bg?: string; children: React.ReactNode}> = ({len, bg = C.cream, children}) => {
  const f = useCurrentFrame();
  const o = interpolate(f, [0, 9, len - 9, len], [0, 1, 1, 0], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
  const y = interpolate(f, [0, 9], [24, 0], {extrapolateRight: 'clamp'});
  return <AbsoluteFill style={{background: bg, opacity: o, transform: `translateY(${y}px)`}}>{children}</AbsoluteFill>;
};

/** Kinetic headline. Each line shows from `at` until the next line's `at` (or the scene end); words pop in. */
export const Caption: React.FC<{lines: {t: string; at: number}[]; top?: number; size?: number; color?: string}> = ({
  lines,
  top = 70,
  size = 76,
  color = C.ink,
}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  const i = lines.reduce((acc, l, k) => (f >= l.at ? k : acc), -1);
  if (i < 0) return null;
  const line = lines[i];
  const words = line.t.split(' ');
  return (
    <div style={{position: 'absolute', top, left: 120, right: 120, textAlign: 'center', fontFamily: HEAD, fontWeight: 800, fontSize: size, lineHeight: 1.08, color, letterSpacing: -1.5}}>
      {words.map((w, k) => {
        const p = pop(f, fps, line.at + k * 1.6);
        return (
          <span key={`${i}-${k}`} style={{display: 'inline-block', marginRight: '0.26em', opacity: clamp01(p * 1.6), transform: `translateY(${(1 - p) * 0.45}em) scale(${0.85 + 0.15 * p})`}}>
            {w}
          </span>
        );
      })}
    </div>
  );
};

/** The small detail line for experts, bottom of frame. */
export const Expert: React.FC<{text: string; at?: number}> = ({text, at = 20}) => {
  const f = useCurrentFrame();
  const o = interpolate(f, [at, at + 10], [0, 1], {extrapolateLeft: 'clamp', extrapolateRight: 'clamp'});
  return (
    <div style={{position: 'absolute', bottom: 46, left: 0, right: 0, textAlign: 'center', opacity: o, fontFamily: MONO, fontSize: 25, color: C.gray}}>
      <span style={{color: C.coral, fontWeight: 700, marginRight: 14}}>FOR EXPERTS</span>
      {text}
    </div>
  );
};

/** A rubber stamp that slams in at `at`. */
export const Stamp: React.FC<{text: string; at: number; color: string; x: number; y: number; size?: number; rot?: number}> = ({text, at, color, x, y, size = 110, rot = -8}) => {
  const f = useCurrentFrame();
  const {fps} = useVideoConfig();
  if (f < at) return null;
  const p = pop(f, fps, at, SPRING.slam);
  const scale = interpolate(p, [0, 1], [2.6, 1]);
  return (
    <div
      style={{
        position: 'absolute', left: x, top: y, transform: `translate(-50%,-50%) rotate(${rot}deg) scale(${scale})`, opacity: clamp01(p * 2),
        border: `10px solid ${color}`, borderRadius: 18, padding: '6px 34px', color, fontFamily: HEAD, fontWeight: 800, fontSize: size, letterSpacing: 4,
        background: 'rgba(251,250,247,0.88)', boxShadow: '8px 10px 0 rgba(29,32,38,0.18)',
      }}
    >
      {text}
    </div>
  );
};

/** Game Boy style bezel around real game footage. */
export const Lcd: React.FC<{x: number; y: number; w: number; h: number; label?: string; children: React.ReactNode}> = ({x, y, w, h, label, children}) => (
  <div style={{position: 'absolute', left: x, top: y, width: w, height: h, background: C.lcd0, borderRadius: 28, padding: 22, boxSizing: 'border-box', boxShadow: '10px 12px 0 rgba(29,32,38,0.2)'}}>
    <div style={{width: '100%', height: '100%', borderRadius: 10, position: 'relative', overflow: 'hidden', background: '#000', border: `4px solid ${C.lcd1}`, boxSizing: 'border-box'}}>{children}</div>
    {label ? (
      <div style={{position: 'absolute', left: 0, right: 0, bottom: -52, textAlign: 'center', fontFamily: BODY, fontWeight: 700, fontSize: 28, color: C.ink}}>{label}</div>
    ) : null}
  </div>
);

/** Shown where a real asset hasn't arrived yet. Never stands in for UI. */
export const Pending: React.FC<{what: string}> = ({what}) => (
  <AbsoluteFill style={{alignItems: 'center', justifyContent: 'center', background: '#2A2D33', color: C.gray, fontFamily: MONO, fontSize: 26}}>asset pending: {what}</AbsoluteFill>
);

export const Card: React.FC<{style?: React.CSSProperties; children: React.ReactNode}> = ({style, children}) => (
  <div style={{background: C.paper, border: `4px solid ${C.ink}`, borderRadius: 22, boxShadow: '8px 10px 0 rgba(29,32,38,0.16)', ...style}}>{children}</div>
);
