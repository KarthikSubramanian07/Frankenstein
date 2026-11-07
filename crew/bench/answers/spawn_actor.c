#include "bench.h"

/* Claim a free actor slot and drop it somewhere along the top of the screen. */
Mover *spawn_actor(void)
{
    s32 i;
    for (i = 0; i < 16; i++) {
        Mover *m = &actors[i];
        if ((m->mo_flags & 0x40) == 0) {
            mover_reset(m, (rng_next() % 240) << 16, 0);
            return m;
        }
    }
    return 0;
}
