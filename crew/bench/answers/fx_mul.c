#include "bench.h"

fixed_t fx_mul(fixed_t a, fixed_t b)
{
    return (fixed_t)(((long long)a * b) >> 16);
}
