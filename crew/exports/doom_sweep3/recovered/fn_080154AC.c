/* fn_080154AC: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_080154AC(int a, int b);
void fn_08010314(int a, int *buf);
void fn_0801A2E4(int *out, int b);
void fn_080154AC(int a, int b)
{
    int out[2];
    int buf[4];
    fn_08010314(a, buf);
    out[0] = buf[3] / 2 + buf[2] / 2;
    out[1] = buf[0] / 2 + buf[1] / 2;
    fn_0801A2E4(out, b);
}
