SAMPLES = {
"f_loop": r"""
extern int g_count;
extern unsigned char g_buf[64];
int g_count;
unsigned char g_buf[64];
int side(int x) { g_count += x; return x * 3; }
int f_loop(int a, int b, unsigned char *p)
{
    int i, acc = 0;
    int k = a & 7;
    unsigned int u = (unsigned int)b;
    for (i = 0; i < 8; i++) {
        acc += p[i] * (a + 1);
        p[i] = (unsigned char)(acc ^ b);
    }
    while (k != 0) {
        acc = acc - k;
        k--;
    }
    if (a < b)
        acc += side(a);
    else
        acc = acc * 2 + (int)(u >> 3);
    g_buf[a & 63] = (unsigned char)acc;
    return acc + g_count;
}
""",
"f_mem": r"""
extern int g_count;
int g_count;
struct S { int x; int y; short z; };
int side(int x) { g_count += x; return x + 1; }
int f_mem(int a, int b, struct S *s)
{
    int t = s->x + a;
    int v = b * 4;
    int w = a - b;
    s->y = t;
    s->z = (short)(v + w);
    if (t > v && s->x != 0)
        w = w + side(t);
    t = t + 1;
    v = v | w;
    return t * v + (a == b) + (w < 0);
}
""",
"f_dma": r"""
extern unsigned int g_regs[4];
unsigned int g_regs[4];
extern unsigned char *data_base;
unsigned char *data_base;
void f_dma(int a, int b, unsigned char *base)
{
    unsigned char *src = base + 16;
    unsigned char *end = base + 16 + (a & 3) * 8;
    unsigned char *dst = data_base;
    int n = 0;
    dst += 8;
    while (src != end) {
        g_regs[0] = (unsigned int)src;
        src += 8;
        g_regs[1] = (unsigned int)dst;
        g_regs[2] = 0x80000078 + n;
        dst += 8;
        n++;
    }
    g_regs[3] = n * b;
}
""",
"f_arith": r"""
int f_arith(int a, int b, unsigned char *p)
{
    int x = a * 3 + b;
    int y = (a ^ b) & 0xff;
    int z;
    unsigned int q = (unsigned int)a;
    z = x - y;
    z += 1;
    if (x != y) {
        z = z << 2;
    } else {
        z = z - 5;
    }
    q = q + (unsigned int)z;
    return (int)(q >> 1) + (x < y ? x : y) + p[(a & 3)];
}
""",
"f_switchy": r"""
extern int g_count;
int g_count;
int f_switchy(int a, int b, unsigned char *p)
{
    int r = 10;
    int m = b & 3;
    switch (a & 7) {
    case 0:
        r = m + 1;
        break;
    case 1:
        r = p[1] ? 1 : 10;
        break;
    case 2:
        r = (m == 2) + (b > a);
        break;
    default:
        r = a * b - m;
    }
    for (m = 0; m < 3; m++)
        g_count = g_count + r;
    return r + m;
}
""",
}
DRIVER = r"""
#include <stdio.h>
#include <string.h>
%(decl)s
int main(void) {
    unsigned int seed = 12345;
    for (int it = 0; it < 400; it++) {
        seed = seed * 1103515245u + 12345u; int a = (int)(seed >> 8) %% 41 - 20;
        seed = seed * 1103515245u + 12345u; int b = (int)(seed >> 8) %% 41 - 20;
        unsigned char buf[96]; for (int i = 0; i < 96; i++) { seed = seed * 1103515245u + 12345u; buf[i] = seed >> 16; }
        %(call)s
    }
    return 0;
}
"""
CALLS = {
"f_loop": ("int f_loop(int,int,unsigned char*);", 'printf("%d %d", f_loop(a,b,buf), g_count); for(int i=0;i<64;i++) printf(" %d", g_buf[i]); for(int i=0;i<8;i++) printf(" %d", buf[i]); printf("\\n");', "extern int g_count; extern unsigned char g_buf[64];"),
"f_mem": ("struct S { int x; int y; short z; }; int f_mem(int,int,struct S*);", 'struct S s = {a*7, b, 3}; int r = f_mem(a,b,&s); printf("%d %d %d %d %d\\n", r, s.x, s.y, s.z, g_count);', "extern int g_count;"),
"f_dma": ("void f_dma(int,int,unsigned char*);", 'data_base = buf + 40; f_dma(a,b,buf); printf("%u %u %u %u\\n", g_regs[0]-(unsigned)(unsigned long)buf, g_regs[1]-(unsigned)(unsigned long)buf, g_regs[2], g_regs[3]);', "extern unsigned int g_regs[4]; extern unsigned char *data_base;"),
"f_arith": ("int f_arith(int,int,unsigned char*);", 'printf("%d\\n", f_arith(a,b,buf));', ""),
"f_switchy": ("int f_switchy(int,int,unsigned char*);", 'printf("%d %d\\n", f_switchy(a,b,buf), g_count);', "extern int g_count;"),
}
