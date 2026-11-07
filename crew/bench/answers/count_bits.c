#include "bench.h"

s32 count_bits(u32 v)
{
    s32 n = 0;
    while (v) {
        v &= v - 1;
        n++;
    }
    return n;
}
