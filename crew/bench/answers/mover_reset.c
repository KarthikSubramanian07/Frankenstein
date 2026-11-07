#include "bench.h"

void mover_reset(Mover *m, fixed_t x, fixed_t y)
{
    m->mo_x = x;
    m->mo_y = y;
    m->mo_vx = 0;
    m->mo_vy = 0;
    m->mo_health = 100;
    m->mo_flags = 0x40;
    m->mo_state = 0;
}
