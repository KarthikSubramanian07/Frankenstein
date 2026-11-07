/* fn_0300170C: recovered by the Frankenstein crew, run doom_play01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

unsigned int *fn_0300170C(unsigned int *a, unsigned int b)
{
    while ((unsigned int)a > 0x06015600) {
        unsigned int c = *--a - b;
        if ((c & 0x80008000) == 0)
            return a;
    }
    return 0;
}
