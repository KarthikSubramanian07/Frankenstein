fn_08009BCC:
 8009bcc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8009bce:	46c6      	mov	lr, r8
 8009bd0:	b500      	push	{lr}
 8009bd2:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8009bd4:	0004      	movs	r4, r0
 8009bd6:	b082      	sub	sp, #8
 8009bd8:	2a00      	cmp	r2, #0
 8009bda:	d05c      	beq.n	8009c96 <fn_08009BCC+0xca>
 8009bdc:	2120      	movs	r1, #32
 8009bde:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8009be0:	320c      	adds	r2, #12
 8009be2:	438b      	bics	r3, r1
 8009be4:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8009be6:	6901      	ldr	r1, [r0, #16]
 8009be8:	ca0c      	ldmia	r2, {r2, r3}
 8009bea:	68c0      	ldr	r0, [r0, #12]
 8009bec:	f01b fcb8 	bl	8025560 <fn_08025560>
 8009bf0:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009bf2:	6ccb      	ldr	r3, [r1, #76]	@ 0x4c
 8009bf4:	6220      	str	r0, [r4, #32]
 8009bf6:	035b      	lsls	r3, r3, #13
 8009bf8:	d453      	bmi.n	8009ca2 <fn_08009BCC+0xd6>
 8009bfa:	2209      	movs	r2, #9
 8009bfc:	0020      	movs	r0, r4
 8009bfe:	f008 fa0d 	bl	801201c <fn_0801201C>
 8009c02:	23fc      	movs	r3, #252	@ 0xfc
 8009c04:	225a      	movs	r2, #90	@ 0x5a
 8009c06:	6a05      	ldr	r5, [r0, #32]
 8009c08:	061b      	lsls	r3, r3, #24
 8009c0a:	18ed      	adds	r5, r5, r3
 8009c0c:	4b2b      	ldr	r3, [pc, #172]	@ (8009cbc <fn_08009BCC+0xf0>)
 8009c0e:	6205      	str	r5, [r0, #32]
 8009c10:	9301      	str	r3, [sp, #4]
 8009c12:	0006      	movs	r6, r0
 8009c14:	5c82      	ldrb	r2, [r0, r2]
 8009c16:	205c      	movs	r0, #92	@ 0x5c
 8009c18:	21ea      	movs	r1, #234	@ 0xea
 8009c1a:	4350      	muls	r0, r2
 8009c1c:	681b      	ldr	r3, [r3, #0]
 8009c1e:	00c9      	lsls	r1, r1, #3
 8009c20:	585b      	ldr	r3, [r3, r1]
 8009c22:	181b      	adds	r3, r3, r0
 8009c24:	2080      	movs	r0, #128	@ 0x80
 8009c26:	0ced      	lsrs	r5, r5, #19
 8009c28:	0100      	lsls	r0, r0, #4
 8009c2a:	6bda      	ldr	r2, [r3, #60]	@ 0x3c
 8009c2c:	4f24      	ldr	r7, [pc, #144]	@ (8009cc0 <fn_08009BCC+0xf4>)
 8009c2e:	182b      	adds	r3, r5, r0
 8009c30:	009b      	lsls	r3, r3, #2
 8009c32:	58f9      	ldr	r1, [r7, r3]
 8009c34:	0010      	movs	r0, r2
 8009c36:	4690      	mov	r8, r2
 8009c38:	f01b fcd0 	bl	80255dc <fn_080255DC>
 8009c3c:	00ad      	lsls	r5, r5, #2
 8009c3e:	59e9      	ldr	r1, [r5, r7]
 8009c40:	63f0      	str	r0, [r6, #60]	@ 0x3c
 8009c42:	4640      	mov	r0, r8
 8009c44:	f01b fcca 	bl	80255dc <fn_080255DC>
 8009c48:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009c4a:	6430      	str	r0, [r6, #64]	@ 0x40
 8009c4c:	2209      	movs	r2, #9
 8009c4e:	0020      	movs	r0, r4
 8009c50:	f008 f9e4 	bl	801201c <fn_0801201C>
 8009c54:	21ea      	movs	r1, #234	@ 0xea
 8009c56:	2680      	movs	r6, #128	@ 0x80
 8009c58:	9b01      	ldr	r3, [sp, #4]
 8009c5a:	681a      	ldr	r2, [r3, #0]
 8009c5c:	235a      	movs	r3, #90	@ 0x5a
 8009c5e:	00c9      	lsls	r1, r1, #3
 8009c60:	5852      	ldr	r2, [r2, r1]
 8009c62:	215c      	movs	r1, #92	@ 0x5c
 8009c64:	6a04      	ldr	r4, [r0, #32]
 8009c66:	04f6      	lsls	r6, r6, #19
 8009c68:	19a4      	adds	r4, r4, r6
 8009c6a:	6204      	str	r4, [r0, #32]
 8009c6c:	0005      	movs	r5, r0
 8009c6e:	5cc3      	ldrb	r3, [r0, r3]
 8009c70:	2080      	movs	r0, #128	@ 0x80
 8009c72:	4359      	muls	r1, r3
 8009c74:	0ce4      	lsrs	r4, r4, #19
 8009c76:	1853      	adds	r3, r2, r1
 8009c78:	0100      	lsls	r0, r0, #4
 8009c7a:	6bde      	ldr	r6, [r3, #60]	@ 0x3c
 8009c7c:	1823      	adds	r3, r4, r0
 8009c7e:	009b      	lsls	r3, r3, #2
 8009c80:	58f9      	ldr	r1, [r7, r3]
 8009c82:	0030      	movs	r0, r6
 8009c84:	f01b fcaa 	bl	80255dc <fn_080255DC>
 8009c88:	00a4      	lsls	r4, r4, #2
 8009c8a:	63e8      	str	r0, [r5, #60]	@ 0x3c
 8009c8c:	59e1      	ldr	r1, [r4, r7]
 8009c8e:	0030      	movs	r0, r6
 8009c90:	f01b fca4 	bl	80255dc <fn_080255DC>
 8009c94:	6428      	str	r0, [r5, #64]	@ 0x40
 8009c96:	b002      	add	sp, #8
 8009c98:	bc80      	pop	{r7}
 8009c9a:	46b8      	mov	r8, r7
 8009c9c:	bcf0      	pop	{r4, r5, r6, r7}
 8009c9e:	bc01      	pop	{r0}
 8009ca0:	4700      	bx	r0
 8009ca2:	f7fc ff2d 	bl	8006b00 <fn_08006B00>
 8009ca6:	0005      	movs	r5, r0
 8009ca8:	f7fc ff2a 	bl	8006b00 <fn_08006B00>
 8009cac:	6a23      	ldr	r3, [r4, #32]
 8009cae:	1a2d      	subs	r5, r5, r0
 8009cb0:	056d      	lsls	r5, r5, #21
 8009cb2:	195b      	adds	r3, r3, r5
 8009cb4:	6223      	str	r3, [r4, #32]
 8009cb6:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 8009cb8:	e79f      	b.n	8009bfa <fn_08009BCC+0x2e>
 8009cba:	46c0      	nop			@ (mov r8, r8)
 8009cbc:	030064c4 	.word	0x030064c4	@ data_030064C4
 8009cc0:	081397cc 	.word	0x081397cc	@ data_081397CC
