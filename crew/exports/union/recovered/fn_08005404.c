/* fn_08005404: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_080051BC(int *a, int b, int c);
void fn_08005404(int a, int b)
{
    int buf[2];
    buf[0] = 0;
    buf[1] = 0;
    fn_080051BC(buf, a, b);
}
