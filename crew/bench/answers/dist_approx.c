#include "bench.h"

/* Octagonal distance estimate: max + min/2 - min/8. */
s32 dist_approx(s32 x0, s32 y0, s32 x1, s32 y1)
{
    s32 dx = abs_diff(x0, x1);
    s32 dy = abs_diff(y0, y1);
    s32 lo, hi;

    if (dx < dy) {
        lo = dx;
        hi = dy;
    } else {
        lo = dy;
        hi = dx;
    }
    return hi + (lo >> 1) - (lo >> 3);
}
