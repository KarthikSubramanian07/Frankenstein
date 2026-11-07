@ fn_080002F8: thumb, 10 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_080002F8:
  0000:  1a40      subs r0, r0, r1
  0002:  17c3      asrs r3, r0, #31
  0004:  18c0      adds r0, r0, r3
  0006:  4058      eors r0, r3
  0008:  4770      bx lr
