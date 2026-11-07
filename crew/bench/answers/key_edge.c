#include "bench.h"

/* Keys that went down this frame. */
u16 key_edge(u16 now, u16 prev)
{
    return now & ~prev;
}
