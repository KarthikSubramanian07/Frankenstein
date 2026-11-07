#include "bench.h"

/* Integer divide rounding to nearest; b is never 0. */
s32 div_round(s32 a, s32 b)
{
    s32 half = b / 2;
    if ((a < 0) != (b < 0))
        return (a - half) / b;
    return (a + half) / b;
}
