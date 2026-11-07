fn_08005EDC:
 8005edc:	b510      	push	{r4, lr}
 8005ede:	480c      	ldr	r0, [pc, #48]	@ (8005f10 <fn_08005EDC+0x34>)
 8005ee0:	f017 face 	bl	801d480 <fn_0801D480>
 8005ee4:	2200      	movs	r2, #0
 8005ee6:	0003      	movs	r3, r0
 8005ee8:	2126      	movs	r1, #38	@ 0x26
 8005eea:	203c      	movs	r0, #60	@ 0x3c
 8005eec:	f016 f920 	bl	801c130 <fn_0801C130>
 8005ef0:	4c08      	ldr	r4, [pc, #32]	@ (8005f14 <fn_08005EDC+0x38>)
 8005ef2:	4b09      	ldr	r3, [pc, #36]	@ (8005f18 <fn_08005EDC+0x3c>)
 8005ef4:	6822      	ldr	r2, [r4, #0]
 8005ef6:	2050      	movs	r0, #80	@ 0x50
 8005ef8:	58d1      	ldr	r1, [r2, r3]
 8005efa:	f7ff ffb7 	bl	8005e6c <fn_08005E6C>
 8005efe:	6822      	ldr	r2, [r4, #0]
 8005f00:	4b06      	ldr	r3, [pc, #24]	@ (8005f1c <fn_08005EDC+0x40>)
 8005f02:	2070      	movs	r0, #112	@ 0x70
 8005f04:	58d1      	ldr	r1, [r2, r3]
 8005f06:	f7ff ffb1 	bl	8005e6c <fn_08005E6C>
 8005f0a:	bc10      	pop	{r4}
 8005f0c:	bc01      	pop	{r0}
 8005f0e:	4700      	bx	r0
 8005f10:	08149e94 	.word	0x08149e94
 8005f14:	030064c4 	.word	0x030064c4	@ data_030064C4
 8005f18:	00005630 	.word	0x00005630
 8005f1c:	00005634 	.word	0x00005634
