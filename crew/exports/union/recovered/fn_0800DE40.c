/* fn_0800DE40: recovered by the Frankenstein crew, run doom_r11.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int fn_08006B00(void);
typedef struct { int u0; int u1; int u2; unsigned char *p; int c; int v1; int v2; int m1; int m2; } S;
void fn_0800DE40(S *q) {
    int t = q->c - 1;
    q->c = t;
    if (t != 0) return;
    if (q->p[t + 38] != q->v1) {
        q->p[t + 38] = (unsigned char)q->v1;
        q->c = (fn_08006B00() & q->m1) + 1;
    } else {
        q->p[t + 38] = (unsigned char)q->v2;
        q->c = (fn_08006B00() & q->m2) + 1;
    }
}
