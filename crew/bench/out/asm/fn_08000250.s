@ fn_08000250: thumb, 18 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000250:
  0000:  4288      cmp r0, r1
  0002:  db02      blt.n .La
  0004:  0001      movs r1, r0
  0006:  4290      cmp r0, r2
  0008:  dc01      bgt.n .Le
.La:
  000a:  0008      movs r0, r1
  000c:  4770      bx lr
.Le:
  000e:  0011      movs r1, r2
  0010:  e7fb      b.n .La
