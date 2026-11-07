/* fn_0800A43C: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08007D00(void);
void fn_0800A43C(unsigned char *p) {
    unsigned char v = p[0x5c] - 1;
    p[0x5c] = v;
    if (v != 0)
        return;
    fn_08007D00();
}
