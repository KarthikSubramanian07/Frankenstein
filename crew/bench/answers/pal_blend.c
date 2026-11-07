#include "bench.h"

/* Blend two RGB555 colours; t is 0..16. */
u16 pal_blend(u16 a, u16 b, u32 t)
{
    u32 r = ((a & 31) * (16 - t) + (b & 31) * t) >> 4;
    u32 g = (((a >> 5) & 31) * (16 - t) + ((b >> 5) & 31) * t) >> 4;
    u32 bl = (((a >> 10) & 31) * (16 - t) + ((b >> 10) & 31) * t) >> 4;
    return (u16)(r | (g << 5) | (bl << 10));
}
