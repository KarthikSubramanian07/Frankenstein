@ fn_08000264: thumb, 84 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000264:
  0000:  2806      cmp r0, #6
  0002:  d809      bhi.n .L18
  0004:  4b10      ldr r3, [pc, #64] @ =.L48 (.Ltab0)
  0006:  0080      lsls r0, r0, #2
  0008:  581b      ldr r3, [r3, r0]
  000a:  469f      mov pc, r3
.Lc:
  000c:  4a0f      ldr r2, [pc, #60] @ =.L4c (data_8D700FE5)
  000e:  7813      ldrb r3, [r2, #0]
  0010:  2b00      cmp r3, #0
  0012:  d001      beq.n .L18
  0014:  3b01      subs r3, #1
  0016:  7013      strb r3, [r2, #0]
.L18:
  0018:  2000      movs r0, #0
.L1a:
  001a:  4770      bx lr
.L1c:
  001c:  2101      movs r1, #1
  001e:  4a0c      ldr r2, [pc, #48] @ =.L50 (data_0AA61C24)
  0020:  7813      ldrb r3, [r2, #0]
  0022:  404b      eors r3, r1
  0024:  2007      movs r0, #7
  0026:  7013      strb r3, [r2, #0]
  0028:  e7f7      b.n .L1a
.L2a:
  002a:  4a08      ldr r2, [pc, #32] @ =.L4c (data_8D700FE5)
  002c:  7813      ldrb r3, [r2, #0]
  002e:  2b03      cmp r3, #3
  0030:  d8f2      bhi.n .L18
  0032:  3301      adds r3, #1
  0034:  7013      strb r3, [r2, #0]
  0036:  e7ef      b.n .L18
.L38:
  0038:  4b04      ldr r3, [pc, #16] @ =.L4c (data_8D700FE5)
  003a:  7818      ldrb r0, [r3, #0]
  003c:  3001      adds r0, #1
  003e:  e7ec      b.n .L1a
.L40:
  0040:  2001      movs r0, #1
  0042:  4240      negs r0, r0
  0044:  e7e9      b.n .L1a
  0046:  46c0      nop @ (mov r8, r8)
.L48:
  0048:  00000000  .word .Ltab0
.L4c:
  004c:  00000000  .word data_8D700FE5
.L50:
  0050:  00000000  .word data_0AA61C24
@ read-only data referenced by this function
.Ltab0:
  .word .Lc, .L2a, .L38, .L1c
  .word .L18, .L18, .L40
