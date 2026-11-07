fn_08016E00:
 8016e00:	b5f0      	push	{r4, r5, r6, r7, lr}
 8016e02:	46c6      	mov	lr, r8
 8016e04:	4b24      	ldr	r3, [pc, #144]	@ (8016e98 <fn_08016E00+0x98>)
 8016e06:	681a      	ldr	r2, [r3, #0]
 8016e08:	4698      	mov	r8, r3
 8016e0a:	2394      	movs	r3, #148	@ 0x94
 8016e0c:	b500      	push	{lr}
 8016e0e:	5cd3      	ldrb	r3, [r2, r3]
 8016e10:	2202      	movs	r2, #2
 8016e12:	0019      	movs	r1, r3
 8016e14:	2702      	movs	r7, #2
 8016e16:	4391      	bics	r1, r2
 8016e18:	2901      	cmp	r1, #1
 8016e1a:	d005      	beq.n	8016e28 <fn_08016E00+0x28>
 8016e1c:	3b02      	subs	r3, #2
 8016e1e:	425a      	negs	r2, r3
 8016e20:	4153      	adcs	r3, r2
 8016e22:	425b      	negs	r3, r3
 8016e24:	401f      	ands	r7, r3
 8016e26:	3701      	adds	r7, #1
 8016e28:	2600      	movs	r6, #0
 8016e2a:	2301      	movs	r3, #1
 8016e2c:	4c1b      	ldr	r4, [pc, #108]	@ (8016e9c <fn_08016E00+0x9c>)
 8016e2e:	42bb      	cmp	r3, r7
 8016e30:	dd15      	ble.n	8016e5e <fn_08016E00+0x5e>
 8016e32:	2226      	movs	r2, #38	@ 0x26
 8016e34:	5ea3      	ldrsh	r3, [r4, r2]
 8016e36:	3414      	adds	r4, #20
 8016e38:	2b00      	cmp	r3, #0
 8016e3a:	d1f8      	bne.n	8016e2e <fn_08016E00+0x2e>
 8016e3c:	4643      	mov	r3, r8
 8016e3e:	4a18      	ldr	r2, [pc, #96]	@ (8016ea0 <fn_08016E00+0xa0>)
 8016e40:	681b      	ldr	r3, [r3, #0]
 8016e42:	1071      	asrs	r1, r6, #1
 8016e44:	5099      	str	r1, [r3, r2]
 8016e46:	22fd      	movs	r2, #253	@ 0xfd
 8016e48:	00d2      	lsls	r2, r2, #3
 8016e4a:	18b6      	adds	r6, r6, r2
 8016e4c:	2201      	movs	r2, #1
 8016e4e:	0076      	lsls	r6, r6, #1
 8016e50:	4252      	negs	r2, r2
 8016e52:	52f2      	strh	r2, [r6, r3]
 8016e54:	bc80      	pop	{r7}
 8016e56:	46b8      	mov	r8, r7
 8016e58:	bcf0      	pop	{r4, r5, r6, r7}
 8016e5a:	bc01      	pop	{r0}
 8016e5c:	4700      	bx	r0
 8016e5e:	0020      	movs	r0, r4
 8016e60:	f002 f8f2 	bl	8019048 <fn_08019048>
 8016e64:	4643      	mov	r3, r8
 8016e66:	681a      	ldr	r2, [r3, #0]
 8016e68:	23fd      	movs	r3, #253	@ 0xfd
 8016e6a:	00db      	lsls	r3, r3, #3
 8016e6c:	18f3      	adds	r3, r6, r3
 8016e6e:	005b      	lsls	r3, r3, #1
 8016e70:	52d0      	strh	r0, [r2, r3]
 8016e72:	0020      	movs	r0, r4
 8016e74:	3009      	adds	r0, #9
 8016e76:	f002 f8e7 	bl	8019048 <fn_08019048>
 8016e7a:	22fd      	movs	r2, #253	@ 0xfd
 8016e7c:	4643      	mov	r3, r8
 8016e7e:	1c75      	adds	r5, r6, #1
 8016e80:	00d2      	lsls	r2, r2, #3
 8016e82:	681b      	ldr	r3, [r3, #0]
 8016e84:	18ad      	adds	r5, r5, r2
 8016e86:	006d      	lsls	r5, r5, #1
 8016e88:	5358      	strh	r0, [r3, r5]
 8016e8a:	2226      	movs	r2, #38	@ 0x26
 8016e8c:	5ea3      	ldrsh	r3, [r4, r2]
 8016e8e:	3414      	adds	r4, #20
 8016e90:	3602      	adds	r6, #2
 8016e92:	2b00      	cmp	r3, #0
 8016e94:	d1cb      	bne.n	8016e2e <fn_08016E00+0x2e>
 8016e96:	e7d1      	b.n	8016e3c <fn_08016E00+0x3c>
 8016e98:	030064c4 	.word	0x030064c4	@ data_030064C4
 8016e9c:	0812f388 	.word	0x0812f388	@ data_0812F388
 8016ea0:	00001098 	.word	0x00001098
