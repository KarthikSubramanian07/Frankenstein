@ fn_080002B8: thumb, 40 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_080002B8:
  0000:  223f      movs r2, #63 @ 0x3f
  0002:  0a03      lsrs r3, r0, #8
  0004:  0b81      lsrs r1, r0, #14
  0006:  4013      ands r3, r2
  0008:  0440      lsls r0, r0, #17
  000a:  d500      bpl.n .Le
  000c:  1ad3      subs r3, r2, r3
.Le:
  000e:  4a05      ldr r2, [pc, #20] @ =.L24 (data_8ECACF13)
  0010:  005b      lsls r3, r3, #1
  0012:  5e98      ldrsh r0, [r3, r2]
  0014:  2302      movs r3, #2
  0016:  420b      tst r3, r1
  0018:  d002      beq.n .L20
  001a:  4240      negs r0, r0
  001c:  0400      lsls r0, r0, #16
  001e:  1400      asrs r0, r0, #16
.L20:
  0020:  4770      bx lr
  0022:  46c0      nop @ (mov r8, r8)
.L24:
  0024:  00000000  .word data_8ECACF13
