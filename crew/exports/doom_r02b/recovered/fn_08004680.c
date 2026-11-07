/* fn_08004680: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S_08004680 { int f0; int f1; int f2; int f3; int f4; unsigned char f5; unsigned char pad[31]; int f6; int f7; };
void fn_08004680(struct S_08004680 *a, int b, int c, int d, int e) {
    a->f2 = d;
    a->f3 = e;
    a->f6 = 0;
    a->f4 = 0;
    a->f5 = 0;
    a->f0 = b;
    a->f1 = c;
    a->f7 = 1;
}
