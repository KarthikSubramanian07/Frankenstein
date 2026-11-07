fn_08009F9C:
 8009f9c:	4b09      	ldr	r3, [pc, #36]	@ (8009fc4 <fn_08009F9C+0x28>)
 8009f9e:	681a      	ldr	r2, [r3, #0]
 8009fa0:	235a      	movs	r3, #90	@ 0x5a
 8009fa2:	b510      	push	{r4, lr}
 8009fa4:	5cc1      	ldrb	r1, [r0, r3]
 8009fa6:	23ea      	movs	r3, #234	@ 0xea
 8009fa8:	00db      	lsls	r3, r3, #3
 8009faa:	58d3      	ldr	r3, [r2, r3]
 8009fac:	225c      	movs	r2, #92	@ 0x5c
 8009fae:	434a      	muls	r2, r1
 8009fb0:	189b      	adds	r3, r3, r2
 8009fb2:	6a59      	ldr	r1, [r3, #36]	@ 0x24
 8009fb4:	2900      	cmp	r1, #0
 8009fb6:	d102      	bne.n	8009fbe <fn_08009F9C+0x22>
 8009fb8:	bc10      	pop	{r4}
 8009fba:	bc01      	pop	{r0}
 8009fbc:	4700      	bx	r0
 8009fbe:	f010 f983 	bl	801a2c8 <fn_0801A2C8>
 8009fc2:	e7f9      	b.n	8009fb8 <fn_08009F9C+0x1c>
 8009fc4:	030064c4 	.word	0x030064c4
