/* fn_080022E4: recovered by the Frankenstein crew, run transfer_cold_2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int fn_080055C8(int a, int b, int c);
extern void *fn_080062C0(int n);
extern void fn_080054DC(void *p, int a, int n);
extern void fn_0800051C(int l, const char *f, int b, int c);
extern int fn_08003120(void);
void *fn_080022E4(int a, int b, int c) {
    int n = fn_080055C8(a, b, c) + 1;
    void *p = fn_080062C0(n);
    if (p != 0) {
        int aa = a;
        int nn = n;
        void *qq = p;
        fn_080054DC(qq, aa, nn);
        return qq;
    }
    fn_0800051C(fn_08003120(), "x", b, c);
    __builtin_unreachable();
}
