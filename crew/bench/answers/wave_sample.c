#include "bench.h"

/* Quarter-wave table: angle is 0..0xFFFF for a full turn, result is s16 in 1.14 fixed point. */
s16 wave_sample(u16 angle)
{
    u32 quad = angle >> 14;
    u32 idx = (angle >> 8) & 63;
    s16 v;

    if (quad & 1)
        idx = 63 - idx;
    v = sine_lut[idx];
    if (quad & 2)
        v = -v;
    return v;
}
