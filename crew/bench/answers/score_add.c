#include "bench.h"

void score_add(u32 points)
{
    u32 s = score + points * combo;
    if (s > 999999)
        s = 999999;
    score = s;
    if (s >= next_life) {
        if (lives < 9)
            lives++;
        next_life += 20000;
    }
}
