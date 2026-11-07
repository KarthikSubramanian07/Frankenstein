#include "bench.h"

u32 tick_frame(void)
{
    u32 f = frame_count + 1;
    frame_count = f;
    if ((f & 63) == 0)
        blink_phase ^= 1;
    return f;
}
