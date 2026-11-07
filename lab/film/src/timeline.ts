// Every beat in frames (30 fps). Matches docs/FILM_SCRIPT.md: 0:00 hook, 0:06 problem, 0:11 how, 0:20 trust,
// 0:28 proof, 0:36 warm start, 0:40 why source, 0:46 partners, 0:53 end.
export const FPS = 30;
export const DURATION = 1800;
const s = (sec: number) => Math.round(sec * FPS);

export const SCENES = {
  hook: [s(0), s(6)],
  problem: [s(6), s(11)],
  how: [s(11), s(20)],
  trust: [s(20), s(28)],
  proof: [s(28), s(36)],
  warm: [s(36), s(40)],
  why: [s(40), s(46)],
  partners: [s(46), s(53)],
  end: [s(53), s(60)],
} as const;
