@ fn_080003F4: thumb, 20 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_080003F4:
  0000:  2300      movs r3, #0
  0002:  6083      str r3, [r0, #8]
  0004:  60c3      str r3, [r0, #12]
  0006:  4b02      ldr r3, [pc, #8] @ =.L10
  0008:  6001      str r1, [r0, #0]
  000a:  6042      str r2, [r0, #4]
  000c:  6103      str r3, [r0, #16]
  000e:  4770      bx lr
.L10:
  0010:  00400064  .word 0x00400064
