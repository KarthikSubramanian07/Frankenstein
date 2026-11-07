fn_08005C38:
 8005c38:	2201      	movs	r2, #1
 8005c3a:	4b0a      	ldr	r3, [pc, #40]	@ (8005c64 <fn_08005C38+0x2c>)
 8005c3c:	480a      	ldr	r0, [pc, #40]	@ (8005c68 <fn_08005C38+0x30>)
 8005c3e:	681b      	ldr	r3, [r3, #0]
 8005c40:	5819      	ldr	r1, [r3, r0]
 8005c42:	1a52      	subs	r2, r2, r1
 8005c44:	b510      	push	{r4, lr}
 8005c46:	501a      	str	r2, [r3, r0]
 8005c48:	2901      	cmp	r1, #1
 8005c4a:	d008      	beq.n	8005c5e <fn_08005C38+0x26>
 8005c4c:	4907      	ldr	r1, [pc, #28]	@ (8005c6c <fn_08005C38+0x34>)
 8005c4e:	22cc      	movs	r2, #204	@ 0xcc
 8005c50:	0052      	lsls	r2, r2, #1
 8005c52:	5099      	str	r1, [r3, r2]
 8005c54:	f7fd fed0 	bl	80039f8 <fn_080039F8>
 8005c58:	bc10      	pop	{r4}
 8005c5a:	bc01      	pop	{r0}
 8005c5c:	4700      	bx	r0
 8005c5e:	4904      	ldr	r1, [pc, #16]	@ (8005c70 <fn_08005C38+0x38>)
 8005c60:	e7f5      	b.n	8005c4e <fn_08005C38+0x16>
 8005c62:	46c0      	nop			@ (mov r8, r8)
 8005c64:	030064c4 	.word	0x030064c4	@ data_030064C4
 8005c68:	0000076c 	.word	0x0000076c
 8005c6c:	08149dec 	.word	0x08149dec
 8005c70:	08149ddc 	.word	0x08149ddc
