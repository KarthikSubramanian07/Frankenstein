/* fn_08002520: recovered by the Frankenstein crew, run transfer_cold_2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned int data_03001D98[6];
void fn_08002520(unsigned int a) {
    data_03001D98[5] &= ~a;
}
