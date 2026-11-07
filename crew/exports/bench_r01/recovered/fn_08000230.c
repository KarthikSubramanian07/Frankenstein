/* fn_08000230: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned int data_A7868023;
unsigned int fn_08000230(void) {
    data_A7868023 = data_A7868023 * 1103515245u + 12345u;
    return (data_A7868023 >> 16) & 0x7FFF;
}
