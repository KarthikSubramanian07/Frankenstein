fn_0801AC0C:
 801ac0c:	4b08      	ldr	r3, [pc, #32]	@ (801ac30 <fn_0801AC0C+0x24>)
 801ac0e:	7819      	ldrb	r1, [r3, #0]
 801ac10:	2900      	cmp	r1, #0
 801ac12:	d10b      	bne.n	801ac2c <fn_0801AC0C+0x20>
 801ac14:	4b07      	ldr	r3, [pc, #28]	@ (801ac34 <fn_0801AC0C+0x28>)
 801ac16:	0042      	lsls	r2, r0, #1
 801ac18:	681b      	ldr	r3, [r3, #0]
 801ac1a:	1812      	adds	r2, r2, r0
 801ac1c:	0092      	lsls	r2, r2, #2
 801ac1e:	1898      	adds	r0, r3, r2
 801ac20:	4b05      	ldr	r3, [pc, #20]	@ (801ac38 <fn_0801AC0C+0x2c>)
 801ac22:	18c0      	adds	r0, r0, r3
 801ac24:	6803      	ldr	r3, [r0, #0]
 801ac26:	2b00      	cmp	r3, #0
 801ac28:	d000      	beq.n	801ac2c <fn_0801AC0C+0x20>
 801ac2a:	6001      	str	r1, [r0, #0]
 801ac2c:	4770      	bx	lr
 801ac2e:	46c0      	nop			@ (mov r8, r8)
 801ac30:	080257f6 	.word	0x080257f6
 801ac34:	030064c4 	.word	0x030064c4
 801ac38:	000055d0 	.word	0x000055d0
