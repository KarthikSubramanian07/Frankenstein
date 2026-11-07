fn_0801ACC0:
 801acc0:	4b08      	ldr	r3, [pc, #32]	@ (801ace4 <fn_0801ACC0+0x24>)
 801acc2:	7819      	ldrb	r1, [r3, #0]
 801acc4:	2900      	cmp	r1, #0
 801acc6:	d10b      	bne.n	801ace0 <fn_0801ACC0+0x20>
 801acc8:	4b07      	ldr	r3, [pc, #28]	@ (801ace8 <fn_0801ACC0+0x28>)
 801acca:	0042      	lsls	r2, r0, #1
 801accc:	681b      	ldr	r3, [r3, #0]
 801acce:	1812      	adds	r2, r2, r0
 801acd0:	0092      	lsls	r2, r2, #2
 801acd2:	1898      	adds	r0, r3, r2
 801acd4:	4b05      	ldr	r3, [pc, #20]	@ (801acec <fn_0801ACC0+0x2c>)
 801acd6:	18c0      	adds	r0, r0, r3
 801acd8:	6803      	ldr	r3, [r0, #0]
 801acda:	2b00      	cmp	r3, #0
 801acdc:	d000      	beq.n	801ace0 <fn_0801ACC0+0x20>
 801acde:	6001      	str	r1, [r0, #0]
 801ace0:	4770      	bx	lr
 801ace2:	46c0      	nop			@ (mov r8, r8)
 801ace4:	080258a6 	.word	0x080258a6
 801ace8:	030064c4 	.word	0x030064c4
 801acec:	000055d0 	.word	0x000055d0
