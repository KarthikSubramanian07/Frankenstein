fn_08018C48:
 8018c48:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8018c4a:	464e      	mov	r6, r9
 8018c4c:	46de      	mov	lr, fp
 8018c4e:	4657      	mov	r7, sl
 8018c50:	4645      	mov	r5, r8
 8018c52:	4b41      	ldr	r3, [pc, #260]	@ (8018d58 <fn_08018C48+0x110>)
 8018c54:	681a      	ldr	r2, [r3, #0]
 8018c56:	4b41      	ldr	r3, [pc, #260]	@ (8018d5c <fn_08018C48+0x114>)
 8018c58:	58d3      	ldr	r3, [r2, r3]
 8018c5a:	b5e0      	push	{r5, r6, r7, lr}
 8018c5c:	0006      	movs	r6, r0
 8018c5e:	4283      	cmp	r3, r0
 8018c60:	dd6f      	ble.n	8018d42 <fn_08018C48+0xfa>
 8018c62:	4f3f      	ldr	r7, [pc, #252]	@ (8018d60 <fn_08018C48+0x118>)
 8018c64:	683d      	ldr	r5, [r7, #0]
 8018c66:	0083      	lsls	r3, r0, #2
 8018c68:	18ed      	adds	r5, r5, r3
 8018c6a:	682c      	ldr	r4, [r5, #0]
 8018c6c:	4698      	mov	r8, r3
 8018c6e:	2c00      	cmp	r4, #0
 8018c70:	d008      	beq.n	8018c84 <fn_08018C48+0x3c>
 8018c72:	0020      	movs	r0, r4
 8018c74:	bcf0      	pop	{r4, r5, r6, r7}
 8018c76:	46bb      	mov	fp, r7
 8018c78:	46b2      	mov	sl, r6
 8018c7a:	46a9      	mov	r9, r5
 8018c7c:	46a0      	mov	r8, r4
 8018c7e:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8018c80:	bc02      	pop	{r1}
 8018c82:	4708      	bx	r1
 8018c84:	4837      	ldr	r0, [pc, #220]	@ (8018d64 <fn_08018C48+0x11c>)
 8018c86:	f004 fc53 	bl	801d530 <fn_0801D530>
 8018c8a:	f004 fcc5 	bl	801d618 <fn_0801D618>
 8018c8e:	4b36      	ldr	r3, [pc, #216]	@ (8018d68 <fn_08018C48+0x120>)
 8018c90:	4681      	mov	r9, r0
 8018c92:	6804      	ldr	r4, [r0, #0]
 8018c94:	0018      	movs	r0, r3
 8018c96:	469b      	mov	fp, r3
 8018c98:	f004 fc24 	bl	801d4e4 <fn_0801D4E4>
 8018c9c:	4643      	mov	r3, r8
 8018c9e:	3304      	adds	r3, #4
 8018ca0:	469a      	mov	sl, r3
 8018ca2:	3001      	adds	r0, #1
 8018ca4:	d044      	beq.n	8018d30 <fn_08018C48+0xe8>
 8018ca6:	42a6      	cmp	r6, r4
 8018ca8:	db44      	blt.n	8018d34 <fn_08018C48+0xec>
 8018caa:	4658      	mov	r0, fp
 8018cac:	f004 fc40 	bl	801d530 <fn_0801D530>
 8018cb0:	f004 fcb2 	bl	801d618 <fn_0801D618>
 8018cb4:	6803      	ldr	r3, [r0, #0]
 8018cb6:	1b34      	subs	r4, r6, r4
 8018cb8:	42a3      	cmp	r3, r4
 8018cba:	dc44      	bgt.n	8018d46 <fn_08018C48+0xfe>
 8018cbc:	0031      	movs	r1, r6
 8018cbe:	482b      	ldr	r0, [pc, #172]	@ (8018d6c <fn_08018C48+0x124>)
 8018cc0:	f7e7 fc72 	bl	80005a8 <fn_080005A8>
 8018cc4:	683d      	ldr	r5, [r7, #0]
 8018cc6:	4445      	add	r5, r8
 8018cc8:	002a      	movs	r2, r5
 8018cca:	2102      	movs	r1, #2
 8018ccc:	2010      	movs	r0, #16
 8018cce:	f004 fd2d 	bl	801d72c <fn_0801D72C>
 8018cd2:	4649      	mov	r1, r9
 8018cd4:	7b4d      	ldrb	r5, [r1, #13]
 8018cd6:	7b0b      	ldrb	r3, [r1, #12]
 8018cd8:	022d      	lsls	r5, r5, #8
 8018cda:	431d      	orrs	r5, r3
 8018cdc:	042d      	lsls	r5, r5, #16
 8018cde:	142d      	asrs	r5, r5, #16
 8018ce0:	80c5      	strh	r5, [r0, #6]
 8018ce2:	7bcb      	ldrb	r3, [r1, #15]
 8018ce4:	7b8a      	ldrb	r2, [r1, #14]
 8018ce6:	021b      	lsls	r3, r3, #8
 8018ce8:	4313      	orrs	r3, r2
 8018cea:	8103      	strh	r3, [r0, #8]
 8018cec:	6001      	str	r1, [r0, #0]
 8018cee:	0004      	movs	r4, r0
 8018cf0:	481f      	ldr	r0, [pc, #124]	@ (8018d70 <fn_08018C48+0x128>)
 8018cf2:	4699      	mov	r9, r3
 8018cf4:	f004 fc1c 	bl	801d530 <fn_0801D530>
 8018cf8:	f004 fc8e 	bl	801d618 <fn_0801D618>
 8018cfc:	4653      	mov	r3, sl
 8018cfe:	58c3      	ldr	r3, [r0, r3]
 8018d00:	18c0      	adds	r0, r0, r3
 8018d02:	60e0      	str	r0, [r4, #12]
 8018d04:	2d01      	cmp	r5, #1
 8018d06:	dd24      	ble.n	8018d52 <fn_08018C48+0x10a>
 8018d08:	2302      	movs	r3, #2
 8018d0a:	001a      	movs	r2, r3
 8018d0c:	005b      	lsls	r3, r3, #1
 8018d0e:	429d      	cmp	r5, r3
 8018d10:	dafb      	bge.n	8018d0a <fn_08018C48+0xc2>
 8018d12:	3a01      	subs	r2, #1
 8018d14:	4b17      	ldr	r3, [pc, #92]	@ (8018d74 <fn_08018C48+0x12c>)
 8018d16:	80a2      	strh	r2, [r4, #4]
 8018d18:	681a      	ldr	r2, [r3, #0]
 8018d1a:	464b      	mov	r3, r9
 8018d1c:	4641      	mov	r1, r8
 8018d1e:	041b      	lsls	r3, r3, #16
 8018d20:	5053      	str	r3, [r2, r1]
 8018d22:	4b15      	ldr	r3, [pc, #84]	@ (8018d78 <fn_08018C48+0x130>)
 8018d24:	681b      	ldr	r3, [r3, #0]
 8018d26:	0072      	lsls	r2, r6, #1
 8018d28:	52d6      	strh	r6, [r2, r3]
 8018d2a:	683b      	ldr	r3, [r7, #0]
 8018d2c:	505c      	str	r4, [r3, r1]
 8018d2e:	e7a0      	b.n	8018c72 <fn_08018C48+0x2a>
 8018d30:	42a6      	cmp	r6, r4
 8018d32:	dac3      	bge.n	8018cbc <fn_08018C48+0x74>
 8018d34:	464a      	mov	r2, r9
 8018d36:	4653      	mov	r3, sl
 8018d38:	46cc      	mov	ip, r9
 8018d3a:	58d3      	ldr	r3, [r2, r3]
 8018d3c:	449c      	add	ip, r3
 8018d3e:	46e1      	mov	r9, ip
 8018d40:	e7c2      	b.n	8018cc8 <fn_08018C48+0x80>
 8018d42:	2400      	movs	r4, #0
 8018d44:	e795      	b.n	8018c72 <fn_08018C48+0x2a>
 8018d46:	3401      	adds	r4, #1
 8018d48:	00a4      	lsls	r4, r4, #2
 8018d4a:	5903      	ldr	r3, [r0, r4]
 8018d4c:	18c3      	adds	r3, r0, r3
 8018d4e:	4699      	mov	r9, r3
 8018d50:	e7ba      	b.n	8018cc8 <fn_08018C48+0x80>
 8018d52:	2200      	movs	r2, #0
 8018d54:	e7de      	b.n	8018d14 <fn_08018C48+0xcc>
 8018d56:	46c0      	nop			@ (mov r8, r8)
 8018d58:	030064c4 	.word	0x030064c4
 8018d5c:	00001114 	.word	0x00001114
 8018d60:	0300658c 	.word	0x0300658c
 8018d64:	0814a304 	.word	0x0814a304
 8018d68:	0814a2f8 	.word	0x0814a2f8
 8018d6c:	0814a310 	.word	0x0814a310
 8018d70:	0814a338 	.word	0x0814a338
 8018d74:	030065c4 	.word	0x030065c4
 8018d78:	030065a4 	.word	0x030065a4
