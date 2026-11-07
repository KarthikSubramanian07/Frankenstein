/* fn_08005404: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_080051BC(int *a, int b, int c);
void fn_08005404(int a, int b)
{
    int buf[2] = {0, 0};
    fn_080051BC(buf, a, b);
}
