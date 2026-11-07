@ fn_08000230: thumb, 32 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000230:
  0000:  4b04      ldr r3, [pc, #16] @ =.L14 (data_A7868023)
  0002:  681a      ldr r2, [r3, #0]
  0004:  4804      ldr r0, [pc, #16] @ =.L18
  0006:  4350      muls r0, r2
  0008:  4a04      ldr r2, [pc, #16] @ =.L1c
  000a:  1880      adds r0, r0, r2
  000c:  6018      str r0, [r3, #0]
  000e:  0040      lsls r0, r0, #1
  0010:  0c40      lsrs r0, r0, #17
  0012:  4770      bx lr
.L14:
  0014:  00000000  .word data_A7868023
.L18:
  0018:  41c64e6d  .word 0x41c64e6d
.L1c:
  001c:  00003039  .word 0x00003039
