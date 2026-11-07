#include "bench.h"

u32 rng_next(void)
{
    rng_seed = rng_seed * 1103515245u + 12345u;
    return (rng_seed >> 16) & 0x7FFF;
}
