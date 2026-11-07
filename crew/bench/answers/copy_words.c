#include "bench.h"

void copy_words(u32 *dst, const u32 *src, u32 count)
{
    while (count--)
        *dst++ = *src++;
}
