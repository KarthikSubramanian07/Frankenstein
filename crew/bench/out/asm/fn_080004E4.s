@ fn_080004E4: thumb, 72 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_080004E4:
  0000:  b510      push {r4, lr}
  0002:  4c10      ldr r4, [pc, #64] @ =.L44 (data_E151E092)
  0004:  0022      movs r2, r4
  0006:  2300      movs r3, #0
  0008:  2040      movs r0, #64 @ 0x40
  000a:  3212      adds r2, #18
.Lc:
  000c:  7811      ldrb r1, [r2, #0]
  000e:  4208      tst r0, r1
  0010:  d008      beq.n .L24
  0012:  3301      adds r3, #1
  0014:  3214      adds r2, #20
  0016:  2b10      cmp r3, #16
  0018:  d1f8      bne.n .Lc
  001a:  2400      movs r4, #0
.L1c:
  001c:  0020      movs r0, r4
  001e:  bc10      pop {r4}
  0020:  bc02      pop {r1}
  0022:  4708      bx r1
.L24:
  0024:  009a      lsls r2, r3, #2
  0026:  18d3      adds r3, r2, r3
  0028:  009b      lsls r3, r3, #2
  002a:  18e4      adds r4, r4, r3
  002c:  f7fffffe  bl fn_08000230
  0030:  21f0      movs r1, #240 @ 0xf0
  0032:  f7fffffe  bl __aeabi_uidivmod
  0036:  2200      movs r2, #0
  0038:  0020      movs r0, r4
  003a:  0409      lsls r1, r1, #16
  003c:  f7fffffe  bl fn_080003F4
  0040:  e7ec      b.n .L1c
  0042:  46c0      nop @ (mov r8, r8)
.L44:
  0044:  00000000  .word data_E151E092
