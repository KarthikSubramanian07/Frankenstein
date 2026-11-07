@ fn_08000304: thumb, 32 bytes. Bench target (original code written today), not GBADoom.
@ compiled with arm-none-eabi-gcc 16.2.0 -O2 -mthumb -mthumb-interwork -mcpu=arm7tdmi -ffreestanding -fno-builtin
@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;
@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.
fn_08000304:
  0000:  4b05      ldr r3, [pc, #20] @ =.L18 (data_489E11BC)
  0002:  6818      ldr r0, [r3, #0]
  0004:  3001      adds r0, #1
  0006:  6018      str r0, [r3, #0]
  0008:  0683      lsls r3, r0, #26
  000a:  d104      bne.n .L16
  000c:  2101      movs r1, #1
  000e:  4a03      ldr r2, [pc, #12] @ =.L1c (data_D3D51AE4)
  0010:  7813      ldrb r3, [r2, #0]
  0012:  404b      eors r3, r1
  0014:  7013      strb r3, [r2, #0]
.L16:
  0016:  4770      bx lr
.L18:
  0018:  00000000  .word data_489E11BC
.L1c:
  001c:  00000000  .word data_D3D51AE4
