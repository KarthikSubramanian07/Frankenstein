#include "bench.h"

s32 abs_diff(s32 a, s32 b)
{
    s32 d = a - b;
    return d < 0 ? -d : d;
}
