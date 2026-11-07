fn_08005DAC:
 8005dac:	4b0c      	ldr	r3, [pc, #48]	@ (8005de0 <fn_08005DAC+0x34>)
 8005dae:	681b      	ldr	r3, [r3, #0]
 8005db0:	b510      	push	{r4, lr}
 8005db2:	4283      	cmp	r3, r0
 8005db4:	d10d      	bne.n	8005dd2 <fn_08005DAC+0x26>
 8005db6:	4b0b      	ldr	r3, [pc, #44]	@ (8005de4 <fn_08005DAC+0x38>)
 8005db8:	4a0b      	ldr	r2, [pc, #44]	@ (8005de8 <fn_08005DAC+0x3c>)
 8005dba:	001c      	movs	r4, r3
 8005dbc:	681b      	ldr	r3, [r3, #0]
 8005dbe:	5c9a      	ldrb	r2, [r3, r2]
 8005dc0:	2a00      	cmp	r2, #0
 8005dc2:	d109      	bne.n	8005dd8 <fn_08005DAC+0x2c>
 8005dc4:	2200      	movs	r2, #0
 8005dc6:	4909      	ldr	r1, [pc, #36]	@ (8005dec <fn_08005DAC+0x40>)
 8005dc8:	545a      	strb	r2, [r3, r1]
 8005dca:	4909      	ldr	r1, [pc, #36]	@ (8005df0 <fn_08005DAC+0x44>)
 8005dcc:	525a      	strh	r2, [r3, r1]
 8005dce:	f7fb fee7 	bl	8001ba0 <fn_08001BA0>
 8005dd2:	bc10      	pop	{r4}
 8005dd4:	bc01      	pop	{r0}
 8005dd6:	4700      	bx	r0
 8005dd8:	f7fe f924 	bl	8004024 <fn_08004024>
 8005ddc:	6823      	ldr	r3, [r4, #0]
 8005dde:	e7f1      	b.n	8005dc4 <fn_08005DAC+0x18>
 8005de0:	08025a44 	.word	0x08025a44	@ data_08025A44
 8005de4:	030064c4 	.word	0x030064c4	@ data_030064C4
 8005de8:	0000025f 	.word	0x0000025f
 8005dec:	00000792 	.word	0x00000792
 8005df0:	0000078c 	.word	0x0000078c
