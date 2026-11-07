fn_08007C20:
 8007c20:	b5f0      	push	{r4, r5, r6, r7, lr}
 8007c22:	46c6      	mov	lr, r8
 8007c24:	b500      	push	{lr}
 8007c26:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8007c28:	b082      	sub	sp, #8
 8007c2a:	02db      	lsls	r3, r3, #11
 8007c2c:	d503      	bpl.n	8007c36 <fn_08007C20+0x16>
 8007c2e:	2356      	movs	r3, #86	@ 0x56
 8007c30:	5ec3      	ldrsh	r3, [r0, r3]
 8007c32:	3301      	adds	r3, #1
 8007c34:	d006      	beq.n	8007c44 <fn_08007C20+0x24>
 8007c36:	2001      	movs	r0, #1
 8007c38:	b002      	add	sp, #8
 8007c3a:	bc80      	pop	{r7}
 8007c3c:	46b8      	mov	r8, r7
 8007c3e:	bcf0      	pop	{r4, r5, r6, r7}
 8007c40:	bc02      	pop	{r1}
 8007c42:	4708      	bx	r1
 8007c44:	23ea      	movs	r3, #234	@ 0xea
 8007c46:	255a      	movs	r5, #90	@ 0x5a
 8007c48:	265c      	movs	r6, #92	@ 0x5c
 8007c4a:	4c2a      	ldr	r4, [pc, #168]	@ (8007cf4 <fn_08007C20+0xd4>)
 8007c4c:	6822      	ldr	r2, [r4, #0]
 8007c4e:	00db      	lsls	r3, r3, #3
 8007c50:	58d1      	ldr	r1, [r2, r3]
 8007c52:	5d43      	ldrb	r3, [r0, r5]
 8007c54:	46b4      	mov	ip, r6
 8007c56:	001e      	movs	r6, r3
 8007c58:	4663      	mov	r3, ip
 8007c5a:	4373      	muls	r3, r6
 8007c5c:	18cb      	adds	r3, r1, r3
 8007c5e:	6d9e      	ldr	r6, [r3, #88]	@ 0x58
 8007c60:	2e00      	cmp	r6, #0
 8007c62:	d0e8      	beq.n	8007c36 <fn_08007C20+0x16>
 8007c64:	6c1e      	ldr	r6, [r3, #64]	@ 0x40
 8007c66:	000b      	movs	r3, r1
 8007c68:	2787      	movs	r7, #135	@ 0x87
 8007c6a:	46b0      	mov	r8, r6
 8007c6c:	3315      	adds	r3, #21
 8007c6e:	33ff      	adds	r3, #255	@ 0xff
 8007c70:	6c1b      	ldr	r3, [r3, #64]	@ 0x40
 8007c72:	013f      	lsls	r7, r7, #4
 8007c74:	59d7      	ldr	r7, [r2, r7]
 8007c76:	4498      	add	r8, r3
 8007c78:	68c3      	ldr	r3, [r0, #12]
 8007c7a:	1bdb      	subs	r3, r3, r7
 8007c7c:	17df      	asrs	r7, r3, #31
 8007c7e:	19db      	adds	r3, r3, r7
 8007c80:	407b      	eors	r3, r7
 8007c82:	4598      	cmp	r8, r3
 8007c84:	dbd7      	blt.n	8007c36 <fn_08007C20+0x16>
 8007c86:	4f1c      	ldr	r7, [pc, #112]	@ (8007cf8 <fn_08007C20+0xd8>)
 8007c88:	6903      	ldr	r3, [r0, #16]
 8007c8a:	59d7      	ldr	r7, [r2, r7]
 8007c8c:	1bdb      	subs	r3, r3, r7
 8007c8e:	17df      	asrs	r7, r3, #31
 8007c90:	19db      	adds	r3, r3, r7
 8007c92:	407b      	eors	r3, r7
 8007c94:	4598      	cmp	r8, r3
 8007c96:	dbce      	blt.n	8007c36 <fn_08007C20+0x16>
 8007c98:	2300      	movs	r3, #0
 8007c9a:	275b      	movs	r7, #91	@ 0x5b
 8007c9c:	4e17      	ldr	r6, [pc, #92]	@ (8007cfc <fn_08007C20+0xdc>)
 8007c9e:	5190      	str	r0, [r2, r6]
 8007ca0:	6403      	str	r3, [r0, #64]	@ 0x40
 8007ca2:	63c3      	str	r3, [r0, #60]	@ 0x3c
 8007ca4:	6b83      	ldr	r3, [r0, #56]	@ 0x38
 8007ca6:	9300      	str	r3, [sp, #0]
 8007ca8:	5dc3      	ldrb	r3, [r0, r7]
 8007caa:	9301      	str	r3, [sp, #4]
 8007cac:	5d43      	ldrb	r3, [r0, r5]
 8007cae:	001d      	movs	r5, r3
 8007cb0:	4663      	mov	r3, ip
 8007cb2:	436b      	muls	r3, r5
 8007cb4:	003d      	movs	r5, r7
 8007cb6:	18c9      	adds	r1, r1, r3
 8007cb8:	6c4b      	ldr	r3, [r1, #68]	@ 0x44
 8007cba:	6383      	str	r3, [r0, #56]	@ 0x38
 8007cbc:	6c0b      	ldr	r3, [r1, #64]	@ 0x40
 8007cbe:	141b      	asrs	r3, r3, #16
 8007cc0:	55c3      	strb	r3, [r0, r7]
 8007cc2:	5990      	ldr	r0, [r2, r6]
 8007cc4:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8007cc6:	3f59      	subs	r7, #89	@ 0x59
 8007cc8:	433b      	orrs	r3, r7
 8007cca:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8007ccc:	6902      	ldr	r2, [r0, #16]
 8007cce:	68c1      	ldr	r1, [r0, #12]
 8007cd0:	f007 fb80 	bl	800f3d4 <fn_0800F3D4>
 8007cd4:	6823      	ldr	r3, [r4, #0]
 8007cd6:	9900      	ldr	r1, [sp, #0]
 8007cd8:	599a      	ldr	r2, [r3, r6]
 8007cda:	6391      	str	r1, [r2, #56]	@ 0x38
 8007cdc:	9901      	ldr	r1, [sp, #4]
 8007cde:	5551      	strb	r1, [r2, r5]
 8007ce0:	599a      	ldr	r2, [r3, r6]
 8007ce2:	6cd3      	ldr	r3, [r2, #76]	@ 0x4c
 8007ce4:	43bb      	bics	r3, r7
 8007ce6:	64d3      	str	r3, [r2, #76]	@ 0x4c
 8007ce8:	2301      	movs	r3, #1
 8007cea:	4058      	eors	r0, r3
 8007cec:	0600      	lsls	r0, r0, #24
 8007cee:	0e00      	lsrs	r0, r0, #24
 8007cf0:	e7a2      	b.n	8007c38 <fn_08007C20+0x18>
 8007cf2:	46c0      	nop			@ (mov r8, r8)
 8007cf4:	030064c4 	.word	0x030064c4
 8007cf8:	00000874 	.word	0x00000874
 8007cfc:	0000086c 	.word	0x0000086c
