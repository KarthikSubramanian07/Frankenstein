fn_08018B94:
 8018b94:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8018b96:	464e      	mov	r6, r9
 8018b98:	46de      	mov	lr, fp
 8018b9a:	4657      	mov	r7, sl
 8018b9c:	4645      	mov	r5, r8
 8018b9e:	4b41      	ldr	r3, [pc, #260]	@ (8018ca4 <fn_08018B94+0x110>)
 8018ba0:	681a      	ldr	r2, [r3, #0]
 8018ba2:	4b41      	ldr	r3, [pc, #260]	@ (8018ca8 <fn_08018B94+0x114>)
 8018ba4:	58d3      	ldr	r3, [r2, r3]
 8018ba6:	b5e0      	push	{r5, r6, r7, lr}
 8018ba8:	0006      	movs	r6, r0
 8018baa:	4283      	cmp	r3, r0
 8018bac:	dd6f      	ble.n	8018c8e <fn_08018B94+0xfa>
 8018bae:	4f3f      	ldr	r7, [pc, #252]	@ (8018cac <fn_08018B94+0x118>)
 8018bb0:	683d      	ldr	r5, [r7, #0]
 8018bb2:	0083      	lsls	r3, r0, #2
 8018bb4:	18ed      	adds	r5, r5, r3
 8018bb6:	682c      	ldr	r4, [r5, #0]
 8018bb8:	4698      	mov	r8, r3
 8018bba:	2c00      	cmp	r4, #0
 8018bbc:	d008      	beq.n	8018bd0 <fn_08018B94+0x3c>
 8018bbe:	0020      	movs	r0, r4
 8018bc0:	bcf0      	pop	{r4, r5, r6, r7}
 8018bc2:	46bb      	mov	fp, r7
 8018bc4:	46b2      	mov	sl, r6
 8018bc6:	46a9      	mov	r9, r5
 8018bc8:	46a0      	mov	r8, r4
 8018bca:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8018bcc:	bc02      	pop	{r1}
 8018bce:	4708      	bx	r1
 8018bd0:	4837      	ldr	r0, [pc, #220]	@ (8018cb0 <fn_08018B94+0x11c>)
 8018bd2:	f004 fc55 	bl	801d480 <fn_0801D480>
 8018bd6:	f004 fcc7 	bl	801d568 <fn_0801D568>
 8018bda:	4b36      	ldr	r3, [pc, #216]	@ (8018cb4 <fn_08018B94+0x120>)
 8018bdc:	4681      	mov	r9, r0
 8018bde:	6804      	ldr	r4, [r0, #0]
 8018be0:	0018      	movs	r0, r3
 8018be2:	469b      	mov	fp, r3
 8018be4:	f004 fc26 	bl	801d434 <fn_0801D434>
 8018be8:	4643      	mov	r3, r8
 8018bea:	3304      	adds	r3, #4
 8018bec:	469a      	mov	sl, r3
 8018bee:	3001      	adds	r0, #1
 8018bf0:	d044      	beq.n	8018c7c <fn_08018B94+0xe8>
 8018bf2:	42a6      	cmp	r6, r4
 8018bf4:	db44      	blt.n	8018c80 <fn_08018B94+0xec>
 8018bf6:	4658      	mov	r0, fp
 8018bf8:	f004 fc42 	bl	801d480 <fn_0801D480>
 8018bfc:	f004 fcb4 	bl	801d568 <fn_0801D568>
 8018c00:	6803      	ldr	r3, [r0, #0]
 8018c02:	1b34      	subs	r4, r6, r4
 8018c04:	42a3      	cmp	r3, r4
 8018c06:	dc44      	bgt.n	8018c92 <fn_08018B94+0xfe>
 8018c08:	0031      	movs	r1, r6
 8018c0a:	482b      	ldr	r0, [pc, #172]	@ (8018cb8 <fn_08018B94+0x124>)
 8018c0c:	f7e7 fccc 	bl	80005a8 <fn_080005A8>
 8018c10:	683d      	ldr	r5, [r7, #0]
 8018c12:	4445      	add	r5, r8
 8018c14:	002a      	movs	r2, r5
 8018c16:	2102      	movs	r1, #2
 8018c18:	2010      	movs	r0, #16
 8018c1a:	f004 fd2f 	bl	801d67c <fn_0801D67C>
 8018c1e:	4649      	mov	r1, r9
 8018c20:	7b4d      	ldrb	r5, [r1, #13]
 8018c22:	7b0b      	ldrb	r3, [r1, #12]
 8018c24:	022d      	lsls	r5, r5, #8
 8018c26:	431d      	orrs	r5, r3
 8018c28:	042d      	lsls	r5, r5, #16
 8018c2a:	142d      	asrs	r5, r5, #16
 8018c2c:	80c5      	strh	r5, [r0, #6]
 8018c2e:	7bcb      	ldrb	r3, [r1, #15]
 8018c30:	7b8a      	ldrb	r2, [r1, #14]
 8018c32:	021b      	lsls	r3, r3, #8
 8018c34:	4313      	orrs	r3, r2
 8018c36:	8103      	strh	r3, [r0, #8]
 8018c38:	6001      	str	r1, [r0, #0]
 8018c3a:	0004      	movs	r4, r0
 8018c3c:	481f      	ldr	r0, [pc, #124]	@ (8018cbc <fn_08018B94+0x128>)
 8018c3e:	4699      	mov	r9, r3
 8018c40:	f004 fc1e 	bl	801d480 <fn_0801D480>
 8018c44:	f004 fc90 	bl	801d568 <fn_0801D568>
 8018c48:	4653      	mov	r3, sl
 8018c4a:	58c3      	ldr	r3, [r0, r3]
 8018c4c:	18c0      	adds	r0, r0, r3
 8018c4e:	60e0      	str	r0, [r4, #12]
 8018c50:	2d01      	cmp	r5, #1
 8018c52:	dd24      	ble.n	8018c9e <fn_08018B94+0x10a>
 8018c54:	2302      	movs	r3, #2
 8018c56:	001a      	movs	r2, r3
 8018c58:	005b      	lsls	r3, r3, #1
 8018c5a:	429d      	cmp	r5, r3
 8018c5c:	dafb      	bge.n	8018c56 <fn_08018B94+0xc2>
 8018c5e:	3a01      	subs	r2, #1
 8018c60:	4b17      	ldr	r3, [pc, #92]	@ (8018cc0 <fn_08018B94+0x12c>)
 8018c62:	80a2      	strh	r2, [r4, #4]
 8018c64:	681a      	ldr	r2, [r3, #0]
 8018c66:	464b      	mov	r3, r9
 8018c68:	4641      	mov	r1, r8
 8018c6a:	041b      	lsls	r3, r3, #16
 8018c6c:	5053      	str	r3, [r2, r1]
 8018c6e:	4b15      	ldr	r3, [pc, #84]	@ (8018cc4 <fn_08018B94+0x130>)
 8018c70:	681b      	ldr	r3, [r3, #0]
 8018c72:	0072      	lsls	r2, r6, #1
 8018c74:	52d6      	strh	r6, [r2, r3]
 8018c76:	683b      	ldr	r3, [r7, #0]
 8018c78:	505c      	str	r4, [r3, r1]
 8018c7a:	e7a0      	b.n	8018bbe <fn_08018B94+0x2a>
 8018c7c:	42a6      	cmp	r6, r4
 8018c7e:	dac3      	bge.n	8018c08 <fn_08018B94+0x74>
 8018c80:	464a      	mov	r2, r9
 8018c82:	4653      	mov	r3, sl
 8018c84:	46cc      	mov	ip, r9
 8018c86:	58d3      	ldr	r3, [r2, r3]
 8018c88:	449c      	add	ip, r3
 8018c8a:	46e1      	mov	r9, ip
 8018c8c:	e7c2      	b.n	8018c14 <fn_08018B94+0x80>
 8018c8e:	2400      	movs	r4, #0
 8018c90:	e795      	b.n	8018bbe <fn_08018B94+0x2a>
 8018c92:	3401      	adds	r4, #1
 8018c94:	00a4      	lsls	r4, r4, #2
 8018c96:	5903      	ldr	r3, [r0, r4]
 8018c98:	18c3      	adds	r3, r0, r3
 8018c9a:	4699      	mov	r9, r3
 8018c9c:	e7ba      	b.n	8018c14 <fn_08018B94+0x80>
 8018c9e:	2200      	movs	r2, #0
 8018ca0:	e7de      	b.n	8018c60 <fn_08018B94+0xcc>
 8018ca2:	46c0      	nop			@ (mov r8, r8)
 8018ca4:	030064c4 	.word	0x030064c4
 8018ca8:	00001114 	.word	0x00001114
 8018cac:	0300658c 	.word	0x0300658c
 8018cb0:	0814a230 	.word	0x0814a230
 8018cb4:	0814a224 	.word	0x0814a224
 8018cb8:	0814a23c 	.word	0x0814a23c
 8018cbc:	0814a264 	.word	0x0814a264
 8018cc0:	030065c4 	.word	0x030065c4
 8018cc4:	030065a4 	.word	0x030065a4
