fn_08005BC4:
 8005bc4:	23f0      	movs	r3, #240	@ 0xf0
 8005bc6:	b510      	push	{r4, lr}
 8005bc8:	4c07      	ldr	r4, [pc, #28]	@ (8005be8 <fn_08005BC4+0x24>)
 8005bca:	6822      	ldr	r2, [r4, #0]
 8005bcc:	00db      	lsls	r3, r3, #3
 8005bce:	50d0      	str	r0, [r2, r3]
 8005bd0:	f7fd ff04 	bl	80039dc <fn_080039DC>
 8005bd4:	2200      	movs	r2, #0
 8005bd6:	6823      	ldr	r3, [r4, #0]
 8005bd8:	4904      	ldr	r1, [pc, #16]	@ (8005bec <fn_08005BC4+0x28>)
 8005bda:	545a      	strb	r2, [r3, r1]
 8005bdc:	4904      	ldr	r1, [pc, #16]	@ (8005bf0 <fn_08005BC4+0x2c>)
 8005bde:	525a      	strh	r2, [r3, r1]
 8005be0:	bc10      	pop	{r4}
 8005be2:	bc01      	pop	{r0}
 8005be4:	4700      	bx	r0
 8005be6:	46c0      	nop			@ (mov r8, r8)
 8005be8:	030064c4 	.word	0x030064c4
 8005bec:	00000792 	.word	0x00000792
 8005bf0:	0000078c 	.word	0x0000078c
