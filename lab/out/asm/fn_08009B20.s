fn_08009B20:
 8009b20:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8009b22:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8009b24:	0004      	movs	r4, r0
 8009b26:	2a00      	cmp	r2, #0
 8009b28:	d03e      	beq.n	8009ba8 <fn_08009B20+0x88>
 8009b2a:	2120      	movs	r1, #32
 8009b2c:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8009b2e:	320c      	adds	r2, #12
 8009b30:	438b      	bics	r3, r1
 8009b32:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8009b34:	6901      	ldr	r1, [r0, #16]
 8009b36:	ca0c      	ldmia	r2, {r2, r3}
 8009b38:	68c0      	ldr	r0, [r0, #12]
 8009b3a:	f01b fd11 	bl	8025560 <fn_08025560>
 8009b3e:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009b40:	6ccb      	ldr	r3, [r1, #76]	@ 0x4c
 8009b42:	6220      	str	r0, [r4, #32]
 8009b44:	035b      	lsls	r3, r3, #13
 8009b46:	d432      	bmi.n	8009bae <fn_08009B20+0x8e>
 8009b48:	23f8      	movs	r3, #248	@ 0xf8
 8009b4a:	061b      	lsls	r3, r3, #24
 8009b4c:	18c0      	adds	r0, r0, r3
 8009b4e:	6220      	str	r0, [r4, #32]
 8009b50:	2209      	movs	r2, #9
 8009b52:	0020      	movs	r0, r4
 8009b54:	f008 fa62 	bl	801201c <fn_0801201C>
 8009b58:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009b5a:	2209      	movs	r2, #9
 8009b5c:	0020      	movs	r0, r4
 8009b5e:	f008 fa5d 	bl	801201c <fn_0801201C>
 8009b62:	23f0      	movs	r3, #240	@ 0xf0
 8009b64:	6a04      	ldr	r4, [r0, #32]
 8009b66:	061b      	lsls	r3, r3, #24
 8009b68:	18e4      	adds	r4, r4, r3
 8009b6a:	4b16      	ldr	r3, [pc, #88]	@ (8009bc4 <fn_08009B20+0xa4>)
 8009b6c:	681a      	ldr	r2, [r3, #0]
 8009b6e:	235a      	movs	r3, #90	@ 0x5a
 8009b70:	6204      	str	r4, [r0, #32]
 8009b72:	5cc1      	ldrb	r1, [r0, r3]
 8009b74:	23ea      	movs	r3, #234	@ 0xea
 8009b76:	00db      	lsls	r3, r3, #3
 8009b78:	58d3      	ldr	r3, [r2, r3]
 8009b7a:	225c      	movs	r2, #92	@ 0x5c
 8009b7c:	434a      	muls	r2, r1
 8009b7e:	189b      	adds	r3, r3, r2
 8009b80:	6bda      	ldr	r2, [r3, #60]	@ 0x3c
 8009b82:	2380      	movs	r3, #128	@ 0x80
 8009b84:	0ce4      	lsrs	r4, r4, #19
 8009b86:	011b      	lsls	r3, r3, #4
 8009b88:	4e0f      	ldr	r6, [pc, #60]	@ (8009bc8 <fn_08009B20+0xa8>)
 8009b8a:	18e3      	adds	r3, r4, r3
 8009b8c:	009b      	lsls	r3, r3, #2
 8009b8e:	58f1      	ldr	r1, [r6, r3]
 8009b90:	0005      	movs	r5, r0
 8009b92:	0010      	movs	r0, r2
 8009b94:	0017      	movs	r7, r2
 8009b96:	f01b fd21 	bl	80255dc <fn_080255DC>
 8009b9a:	00a4      	lsls	r4, r4, #2
 8009b9c:	63e8      	str	r0, [r5, #60]	@ 0x3c
 8009b9e:	59a1      	ldr	r1, [r4, r6]
 8009ba0:	0038      	movs	r0, r7
 8009ba2:	f01b fd1b 	bl	80255dc <fn_080255DC>
 8009ba6:	6428      	str	r0, [r5, #64]	@ 0x40
 8009ba8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8009baa:	bc01      	pop	{r0}
 8009bac:	4700      	bx	r0
 8009bae:	f7fc ffa7 	bl	8006b00 <fn_08006B00>
 8009bb2:	0005      	movs	r5, r0
 8009bb4:	f7fc ffa4 	bl	8006b00 <fn_08006B00>
 8009bb8:	6a23      	ldr	r3, [r4, #32]
 8009bba:	1a28      	subs	r0, r5, r0
 8009bbc:	0540      	lsls	r0, r0, #21
 8009bbe:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009bc0:	18c0      	adds	r0, r0, r3
 8009bc2:	e7c1      	b.n	8009b48 <fn_08009B20+0x28>
 8009bc4:	030064c4 	.word	0x030064c4
 8009bc8:	081397cc 	.word	0x081397cc
