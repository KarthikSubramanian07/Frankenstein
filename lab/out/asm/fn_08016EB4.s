fn_08016EB4:
 8016eb4:	b5f0      	push	{r4, r5, r6, r7, lr}
 8016eb6:	46c6      	mov	lr, r8
 8016eb8:	4b24      	ldr	r3, [pc, #144]	@ (8016f4c <fn_08016EB4+0x98>)
 8016eba:	681a      	ldr	r2, [r3, #0]
 8016ebc:	4698      	mov	r8, r3
 8016ebe:	2394      	movs	r3, #148	@ 0x94
 8016ec0:	b500      	push	{lr}
 8016ec2:	5cd3      	ldrb	r3, [r2, r3]
 8016ec4:	2202      	movs	r2, #2
 8016ec6:	0019      	movs	r1, r3
 8016ec8:	2702      	movs	r7, #2
 8016eca:	4391      	bics	r1, r2
 8016ecc:	2901      	cmp	r1, #1
 8016ece:	d005      	beq.n	8016edc <fn_08016EB4+0x28>
 8016ed0:	3b02      	subs	r3, #2
 8016ed2:	425a      	negs	r2, r3
 8016ed4:	4153      	adcs	r3, r2
 8016ed6:	425b      	negs	r3, r3
 8016ed8:	401f      	ands	r7, r3
 8016eda:	3701      	adds	r7, #1
 8016edc:	2600      	movs	r6, #0
 8016ede:	2301      	movs	r3, #1
 8016ee0:	4c1b      	ldr	r4, [pc, #108]	@ (8016f50 <fn_08016EB4+0x9c>)
 8016ee2:	42bb      	cmp	r3, r7
 8016ee4:	dd15      	ble.n	8016f12 <fn_08016EB4+0x5e>
 8016ee6:	2226      	movs	r2, #38	@ 0x26
 8016ee8:	5ea3      	ldrsh	r3, [r4, r2]
 8016eea:	3414      	adds	r4, #20
 8016eec:	2b00      	cmp	r3, #0
 8016eee:	d1f8      	bne.n	8016ee2 <fn_08016EB4+0x2e>
 8016ef0:	4643      	mov	r3, r8
 8016ef2:	4a18      	ldr	r2, [pc, #96]	@ (8016f54 <fn_08016EB4+0xa0>)
 8016ef4:	681b      	ldr	r3, [r3, #0]
 8016ef6:	1071      	asrs	r1, r6, #1
 8016ef8:	5099      	str	r1, [r3, r2]
 8016efa:	22fd      	movs	r2, #253	@ 0xfd
 8016efc:	00d2      	lsls	r2, r2, #3
 8016efe:	18b6      	adds	r6, r6, r2
 8016f00:	2201      	movs	r2, #1
 8016f02:	0076      	lsls	r6, r6, #1
 8016f04:	4252      	negs	r2, r2
 8016f06:	52f2      	strh	r2, [r6, r3]
 8016f08:	bc80      	pop	{r7}
 8016f0a:	46b8      	mov	r8, r7
 8016f0c:	bcf0      	pop	{r4, r5, r6, r7}
 8016f0e:	bc01      	pop	{r0}
 8016f10:	4700      	bx	r0
 8016f12:	0020      	movs	r0, r4
 8016f14:	f002 f8f2 	bl	80190fc <fn_080190FC>
 8016f18:	4643      	mov	r3, r8
 8016f1a:	681a      	ldr	r2, [r3, #0]
 8016f1c:	23fd      	movs	r3, #253	@ 0xfd
 8016f1e:	00db      	lsls	r3, r3, #3
 8016f20:	18f3      	adds	r3, r6, r3
 8016f22:	005b      	lsls	r3, r3, #1
 8016f24:	52d0      	strh	r0, [r2, r3]
 8016f26:	0020      	movs	r0, r4
 8016f28:	3009      	adds	r0, #9
 8016f2a:	f002 f8e7 	bl	80190fc <fn_080190FC>
 8016f2e:	22fd      	movs	r2, #253	@ 0xfd
 8016f30:	4643      	mov	r3, r8
 8016f32:	1c75      	adds	r5, r6, #1
 8016f34:	00d2      	lsls	r2, r2, #3
 8016f36:	681b      	ldr	r3, [r3, #0]
 8016f38:	18ad      	adds	r5, r5, r2
 8016f3a:	006d      	lsls	r5, r5, #1
 8016f3c:	5358      	strh	r0, [r3, r5]
 8016f3e:	2226      	movs	r2, #38	@ 0x26
 8016f40:	5ea3      	ldrsh	r3, [r4, r2]
 8016f42:	3414      	adds	r4, #20
 8016f44:	3602      	adds	r6, #2
 8016f46:	2b00      	cmp	r3, #0
 8016f48:	d1cb      	bne.n	8016ee2 <fn_08016EB4+0x2e>
 8016f4a:	e7d1      	b.n	8016ef0 <fn_08016EB4+0x3c>
 8016f4c:	030064c4 	.word	0x030064c4
 8016f50:	0812f45c 	.word	0x0812f45c
 8016f54:	00001098 	.word	0x00001098
