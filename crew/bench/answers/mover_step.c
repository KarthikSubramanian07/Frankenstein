#include "bench.h"

void mover_step(Mover *m)
{
    m->mo_x += m->mo_vx;
    m->mo_y += m->mo_vy;
    m->mo_vx -= m->mo_vx >> 3;
    m->mo_vy += 0x4000;
    if (m->mo_vy > 0x60000)
        m->mo_vy = 0x60000;
}
