#include "bench.h"

s32 clamp_s32(s32 v, s32 lo, s32 hi)
{
    if (v < lo)
        return lo;
    if (v > hi)
        return hi;
    return v;
}
