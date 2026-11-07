@ fn_080002E4: thumb, 20 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_080002E4:
  0000:  0003      movs r3, r0
  0002:  2000      movs r0, #0
  0004:  2b00      cmp r3, #0
  0006:  d004      beq.n .L12
.L8:
  0008:  1e5a      subs r2, r3, #1
  000a:  4013      ands r3, r2
  000c:  3001      adds r0, #1
  000e:  2b00      cmp r3, #0
  0010:  d1fa      bne.n .L8
.L12:
  0012:  4770      bx lr
