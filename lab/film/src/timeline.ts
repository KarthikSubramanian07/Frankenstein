// Every slot in frames (30 fps), from docs/FILM_SCRIPT.md v3.
export const FPS = 30;
export const DURATION = 1800;
export const s = (sec: number) => Math.round(sec * FPS);
