/* fn_080003C4: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed char s8;
typedef short s16;
typedef int s32;
typedef s32 fixed_t;
typedef struct struct_AC5D52 {
    u8 f_00;
    u8 f_01;
    u16 f_02;
} struct_AC5D52;
int fn_080003C4(struct_AC5D52 *p, int n, int v)
{
    int i;
    for (i = 0; i < n; i++) {
        if (p[i].f_00 == v && p[i].f_01 != 0)
            return i;
    }
    return -1;
}
