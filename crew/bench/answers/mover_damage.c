#include "bench.h"

s32 mover_damage(Mover *m, s16 amount)
{
    if (m->mo_flags & 0x80)
        return 0;
    m->mo_health -= amount;
    if (m->mo_health <= 0) {
        m->mo_health = 0;
        m->mo_flags |= 0x01;
        m->mo_state = 3;
        return 1;
    }
    m->mo_flags |= 0x80;
    return 0;
}
