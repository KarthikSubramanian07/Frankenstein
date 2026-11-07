#include "bench.h"

/* Index of the first live pickup of a kind, or -1. */
s32 pickup_find(const Pickup *list, s32 n, u8 kind)
{
    s32 i;
    for (i = 0; i < n; i++) {
        if (list[i].pk_kind == kind && list[i].pk_count != 0)
            return i;
    }
    return -1;
}
