/* fn_08002520: recovered by the Frankenstein crew, run transfer_warm_2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_03001D98[];
void fn_08002520(int a) {
    data_03001D98[5] &= ~a;
}
