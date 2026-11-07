/* fn_03000DBC: recovered by the Frankenstein crew, run doom_play01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

unsigned char *fn_03000DBC(unsigned char *s, int c, unsigned int n)
{
    unsigned char *end = s + n;
    do {
        if (*s == c)
            return s;
        s++;
    } while (s != end);
    return 0;
}
