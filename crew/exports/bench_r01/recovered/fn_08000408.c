/* fn_08000408: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08000408(unsigned int x)
{
    unsigned int v = data_8D4B0B19 * x + data_8DC03A2F;
    if (v > 999999)
        v = 999999;
    data_8DC03A2F = v;
    if (data_125FD592 <= v) {
        if (data_A8918DEC <= 8)
            data_A8918DEC++;
        data_125FD592 += 20000;
    }
}
