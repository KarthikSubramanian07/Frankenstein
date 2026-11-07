/* fn_08012770: recovered by the Frankenstein crew, run doom_align_on.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { int unk; int arr[888]; };
extern struct S *data_030064C4;
void fn_08012770(int a){
 struct S *p = data_030064C4;
 int i;
 for(i=0;i<32;i++){
  if(p->arr[i+856]==0) break;
 }
 if(i==32) return;
 p->arr[i+856]=a;
}
