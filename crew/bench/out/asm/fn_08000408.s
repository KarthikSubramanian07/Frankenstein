@ fn_08000408: thumb, 76 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000408:
  0000:  4b0c      ldr r3, [pc, #48] @ =.L34 (data_8D4B0B19)
  0002:  681b      ldr r3, [r3, #0]
  0004:  4343      muls r3, r0
  0006:  4a0c      ldr r2, [pc, #48] @ =.L38 (data_8DC03A2F)
  0008:  6811      ldr r1, [r2, #0]
  000a:  1859      adds r1, r3, r1
  000c:  4b0b      ldr r3, [pc, #44] @ =.L3c
  000e:  4299      cmp r1, r3
  0010:  d900      bls.n .L14
  0012:  0019      movs r1, r3
.L14:
  0014:  6011      str r1, [r2, #0]
  0016:  4a0a      ldr r2, [pc, #40] @ =.L40 (data_125FD592)
  0018:  6813      ldr r3, [r2, #0]
  001a:  428b      cmp r3, r1
  001c:  d806      bhi.n .L2c
  001e:  4809      ldr r0, [pc, #36] @ =.L44 (data_A8918DEC)
  0020:  7801      ldrb r1, [r0, #0]
  0022:  2908      cmp r1, #8
  0024:  d903      bls.n .L2e
.L26:
  0026:  4908      ldr r1, [pc, #32] @ =.L48
  0028:  185b      adds r3, r3, r1
  002a:  6013      str r3, [r2, #0]
.L2c:
  002c:  4770      bx lr
.L2e:
  002e:  3101      adds r1, #1
  0030:  7001      strb r1, [r0, #0]
  0032:  e7f8      b.n .L26
.L34:
  0034:  00000000  .word data_8D4B0B19
.L38:
  0038:  00000000  .word data_8DC03A2F
.L3c:
  003c:  000f423f  .word 0x000f423f
.L40:
  0040:  00000000  .word data_125FD592
.L44:
  0044:  00000000  .word data_A8918DEC
.L48:
  0048:  00004e20  .word 0x00004e20
