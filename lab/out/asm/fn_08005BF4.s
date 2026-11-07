fn_08005BF4:
 8005bf4:	20ed      	movs	r0, #237	@ 0xed
 8005bf6:	2201      	movs	r2, #1
 8005bf8:	4b0b      	ldr	r3, [pc, #44]	@ (8005c28 <fn_08005BF4+0x34>)
 8005bfa:	681b      	ldr	r3, [r3, #0]
 8005bfc:	00c0      	lsls	r0, r0, #3
 8005bfe:	5819      	ldr	r1, [r3, r0]
 8005c00:	1a52      	subs	r2, r2, r1
 8005c02:	b510      	push	{r4, lr}
 8005c04:	501a      	str	r2, [r3, r0]
 8005c06:	2901      	cmp	r1, #1
 8005c08:	d00b      	beq.n	8005c22 <fn_08005BF4+0x2e>
 8005c0a:	4908      	ldr	r1, [pc, #32]	@ (8005c2c <fn_08005BF4+0x38>)
 8005c0c:	22cc      	movs	r2, #204	@ 0xcc
 8005c0e:	0052      	lsls	r2, r2, #1
 8005c10:	5099      	str	r1, [r3, r2]
 8005c12:	2101      	movs	r1, #1
 8005c14:	4a06      	ldr	r2, [pc, #24]	@ (8005c30 <fn_08005BF4+0x3c>)
 8005c16:	5499      	strb	r1, [r3, r2]
 8005c18:	f7fd feee 	bl	80039f8 <fn_080039F8>
 8005c1c:	bc10      	pop	{r4}
 8005c1e:	bc01      	pop	{r0}
 8005c20:	4700      	bx	r0
 8005c22:	4904      	ldr	r1, [pc, #16]	@ (8005c34 <fn_08005BF4+0x40>)
 8005c24:	e7f2      	b.n	8005c0c <fn_08005BF4+0x18>
 8005c26:	46c0      	nop			@ (mov r8, r8)
 8005c28:	030064c4 	.word	0x030064c4
 8005c2c:	08149dd0 	.word	0x08149dd0
 8005c30:	000003ed 	.word	0x000003ed
 8005c34:	08149dc0 	.word	0x08149dc0
