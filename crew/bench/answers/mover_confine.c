#include "bench.h"

/* Keep a mover inside the 240x160 screen (positions are 16.16 fixed point). */
void mover_confine(Mover *m)
{
    m->mo_x = clamp_s32(m->mo_x, 0, 239 << 16);
    m->mo_y = clamp_s32(m->mo_y, 0, 159 << 16);
}
