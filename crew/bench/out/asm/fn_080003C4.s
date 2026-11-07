@ fn_080003C4: thumb, 46 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_080003C4:
  0000:  0003      movs r3, r0
  0002:  b510      push {r4, lr}
  0004:  2000      movs r0, #0
  0006:  0014      movs r4, r2
  0008:  2900      cmp r1, #0
  000a:  dc04      bgt.n .L16
  000c:  e00c      b.n .L28
.Le:
  000e:  3001      adds r0, #1
  0010:  3304      adds r3, #4
  0012:  4281      cmp r1, r0
  0014:  d008      beq.n .L28
.L16:
  0016:  781a      ldrb r2, [r3, #0]
  0018:  42a2      cmp r2, r4
  001a:  d1f8      bne.n .Le
  001c:  785a      ldrb r2, [r3, #1]
  001e:  2a00      cmp r2, #0
  0020:  d0f5      beq.n .Le
.L22:
  0022:  bc10      pop {r4}
  0024:  bc02      pop {r1}
  0026:  4708      bx r1
.L28:
  0028:  2001      movs r0, #1
  002a:  4240      negs r0, r0
  002c:  e7f9      b.n .L22
