/* Answer-key header for the FRANKENSTEIN real-compiler bench. Written today (2026-11-07).
   Never shown to the crew: build.py emits an anonymized per-function ctx header instead.
   Format rules (build.py parses this file): one declaration per block, struct blocks are
   "typedef struct NAME {" ... "} NAME;", every field name is globally unique, no macros. */
#ifndef BENCH_H
#define BENCH_H

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed char s8;
typedef short s16;
typedef int s32;
typedef s32 fixed_t;

typedef struct Mover {
    fixed_t mo_x;
    fixed_t mo_y;
    fixed_t mo_vx;
    fixed_t mo_vy;
    s16 mo_health;
    u8 mo_flags;
    u8 mo_state;
} Mover;

typedef struct Pickup {
    u8 pk_kind;
    u8 pk_count;
    u16 pk_timer;
} Pickup;

extern u32 frame_count;
extern u8 blink_phase;
extern const s16 sine_lut[64];
extern u32 score;
extern u32 combo;
extern u8 lives;
extern u32 next_life;
extern u32 rng_seed;
extern Mover actors[16];
extern u8 menu_cursor;
extern u8 sound_on;

s32 clamp_s32(s32 v, s32 lo, s32 hi);
s32 abs_diff(s32 a, s32 b);
void mover_reset(Mover *m, fixed_t x, fixed_t y);
u32 rng_next(void);

#endif
