fn_08018CC8:
 8018cc8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8018cca:	46de      	mov	lr, fp
 8018ccc:	4657      	mov	r7, sl
 8018cce:	464e      	mov	r6, r9
 8018cd0:	4645      	mov	r5, r8
 8018cd2:	b5e0      	push	{r5, r6, r7, lr}
 8018cd4:	7803      	ldrb	r3, [r0, #0]
 8018cd6:	2b2d      	cmp	r3, #45	@ 0x2d
 8018cd8:	d019      	beq.n	8018d0e <fn_08018CC8+0x46>
 8018cda:	f7ff fee7 	bl	8018aac <fn_08018AAC>
 8018cde:	4b41      	ldr	r3, [pc, #260]	@ (8018de4 <fn_08018CC8+0x11c>)
 8018ce0:	681a      	ldr	r2, [r3, #0]
 8018ce2:	4b41      	ldr	r3, [pc, #260]	@ (8018de8 <fn_08018CC8+0x120>)
 8018ce4:	58d3      	ldr	r3, [r2, r3]
 8018ce6:	0004      	movs	r4, r0
 8018ce8:	4298      	cmp	r0, r3
 8018cea:	da07      	bge.n	8018cfc <fn_08018CC8+0x34>
 8018cec:	4e3f      	ldr	r6, [pc, #252]	@ (8018dec <fn_08018CC8+0x124>)
 8018cee:	6835      	ldr	r5, [r6, #0]
 8018cf0:	0083      	lsls	r3, r0, #2
 8018cf2:	18ed      	adds	r5, r5, r3
 8018cf4:	4698      	mov	r8, r3
 8018cf6:	682b      	ldr	r3, [r5, #0]
 8018cf8:	2b00      	cmp	r3, #0
 8018cfa:	d00a      	beq.n	8018d12 <fn_08018CC8+0x4a>
 8018cfc:	0020      	movs	r0, r4
 8018cfe:	bcf0      	pop	{r4, r5, r6, r7}
 8018d00:	46bb      	mov	fp, r7
 8018d02:	46b2      	mov	sl, r6
 8018d04:	46a9      	mov	r9, r5
 8018d06:	46a0      	mov	r8, r4
 8018d08:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8018d0a:	bc02      	pop	{r1}
 8018d0c:	4708      	bx	r1
 8018d0e:	2400      	movs	r4, #0
 8018d10:	e7f4      	b.n	8018cfc <fn_08018CC8+0x34>
 8018d12:	4837      	ldr	r0, [pc, #220]	@ (8018df0 <fn_08018CC8+0x128>)
 8018d14:	f004 fbb4 	bl	801d480 <fn_0801D480>
 8018d18:	f004 fc26 	bl	801d568 <fn_0801D568>
 8018d1c:	6803      	ldr	r3, [r0, #0]
 8018d1e:	001f      	movs	r7, r3
 8018d20:	4b34      	ldr	r3, [pc, #208]	@ (8018df4 <fn_08018CC8+0x12c>)
 8018d22:	4681      	mov	r9, r0
 8018d24:	0018      	movs	r0, r3
 8018d26:	469b      	mov	fp, r3
 8018d28:	f004 fb84 	bl	801d434 <fn_0801D434>
 8018d2c:	4643      	mov	r3, r8
 8018d2e:	3304      	adds	r3, #4
 8018d30:	469a      	mov	sl, r3
 8018d32:	3001      	adds	r0, #1
 8018d34:	d010      	beq.n	8018d58 <fn_08018CC8+0x90>
 8018d36:	42bc      	cmp	r4, r7
 8018d38:	db10      	blt.n	8018d5c <fn_08018CC8+0x94>
 8018d3a:	4658      	mov	r0, fp
 8018d3c:	f004 fba0 	bl	801d480 <fn_0801D480>
 8018d40:	f004 fc12 	bl	801d568 <fn_0801D568>
 8018d44:	6802      	ldr	r2, [r0, #0]
 8018d46:	1be3      	subs	r3, r4, r7
 8018d48:	429a      	cmp	r2, r3
 8018d4a:	dd41      	ble.n	8018dd0 <fn_08018CC8+0x108>
 8018d4c:	3301      	adds	r3, #1
 8018d4e:	009b      	lsls	r3, r3, #2
 8018d50:	58c3      	ldr	r3, [r0, r3]
 8018d52:	18c3      	adds	r3, r0, r3
 8018d54:	4699      	mov	r9, r3
 8018d56:	e007      	b.n	8018d68 <fn_08018CC8+0xa0>
 8018d58:	42bc      	cmp	r4, r7
 8018d5a:	da39      	bge.n	8018dd0 <fn_08018CC8+0x108>
 8018d5c:	464a      	mov	r2, r9
 8018d5e:	4653      	mov	r3, sl
 8018d60:	46cc      	mov	ip, r9
 8018d62:	58d3      	ldr	r3, [r2, r3]
 8018d64:	449c      	add	ip, r3
 8018d66:	46e1      	mov	r9, ip
 8018d68:	002a      	movs	r2, r5
 8018d6a:	2102      	movs	r1, #2
 8018d6c:	2010      	movs	r0, #16
 8018d6e:	f004 fc85 	bl	801d67c <fn_0801D67C>
 8018d72:	4649      	mov	r1, r9
 8018d74:	7b4d      	ldrb	r5, [r1, #13]
 8018d76:	7b0b      	ldrb	r3, [r1, #12]
 8018d78:	022d      	lsls	r5, r5, #8
 8018d7a:	431d      	orrs	r5, r3
 8018d7c:	042d      	lsls	r5, r5, #16
 8018d7e:	142d      	asrs	r5, r5, #16
 8018d80:	80c5      	strh	r5, [r0, #6]
 8018d82:	7bcb      	ldrb	r3, [r1, #15]
 8018d84:	7b8a      	ldrb	r2, [r1, #14]
 8018d86:	021b      	lsls	r3, r3, #8
 8018d88:	4313      	orrs	r3, r2
 8018d8a:	8103      	strh	r3, [r0, #8]
 8018d8c:	6001      	str	r1, [r0, #0]
 8018d8e:	0007      	movs	r7, r0
 8018d90:	4819      	ldr	r0, [pc, #100]	@ (8018df8 <fn_08018CC8+0x130>)
 8018d92:	4699      	mov	r9, r3
 8018d94:	f004 fb74 	bl	801d480 <fn_0801D480>
 8018d98:	f004 fbe6 	bl	801d568 <fn_0801D568>
 8018d9c:	4653      	mov	r3, sl
 8018d9e:	58c3      	ldr	r3, [r0, r3]
 8018da0:	18c0      	adds	r0, r0, r3
 8018da2:	60f8      	str	r0, [r7, #12]
 8018da4:	2d01      	cmp	r5, #1
 8018da6:	dd1a      	ble.n	8018dde <fn_08018CC8+0x116>
 8018da8:	2302      	movs	r3, #2
 8018daa:	001a      	movs	r2, r3
 8018dac:	005b      	lsls	r3, r3, #1
 8018dae:	429d      	cmp	r5, r3
 8018db0:	dafb      	bge.n	8018daa <fn_08018CC8+0xe2>
 8018db2:	3a01      	subs	r2, #1
 8018db4:	4b11      	ldr	r3, [pc, #68]	@ (8018dfc <fn_08018CC8+0x134>)
 8018db6:	80ba      	strh	r2, [r7, #4]
 8018db8:	681a      	ldr	r2, [r3, #0]
 8018dba:	464b      	mov	r3, r9
 8018dbc:	4640      	mov	r0, r8
 8018dbe:	041b      	lsls	r3, r3, #16
 8018dc0:	5013      	str	r3, [r2, r0]
 8018dc2:	4b0f      	ldr	r3, [pc, #60]	@ (8018e00 <fn_08018CC8+0x138>)
 8018dc4:	681b      	ldr	r3, [r3, #0]
 8018dc6:	0062      	lsls	r2, r4, #1
 8018dc8:	52d4      	strh	r4, [r2, r3]
 8018dca:	6833      	ldr	r3, [r6, #0]
 8018dcc:	501f      	str	r7, [r3, r0]
 8018dce:	e795      	b.n	8018cfc <fn_08018CC8+0x34>
 8018dd0:	0021      	movs	r1, r4
 8018dd2:	480c      	ldr	r0, [pc, #48]	@ (8018e04 <fn_08018CC8+0x13c>)
 8018dd4:	f7e7 fbe8 	bl	80005a8 <fn_080005A8>
 8018dd8:	6835      	ldr	r5, [r6, #0]
 8018dda:	4445      	add	r5, r8
 8018ddc:	e7c4      	b.n	8018d68 <fn_08018CC8+0xa0>
 8018dde:	2200      	movs	r2, #0
 8018de0:	e7e8      	b.n	8018db4 <fn_08018CC8+0xec>
 8018de2:	46c0      	nop			@ (mov r8, r8)
 8018de4:	030064c4 	.word	0x030064c4	@ data_030064C4
 8018de8:	00001114 	.word	0x00001114
 8018dec:	0300658c 	.word	0x0300658c	@ data_0300658C
 8018df0:	0814a230 	.word	0x0814a230
 8018df4:	0814a224 	.word	0x0814a224
 8018df8:	0814a264 	.word	0x0814a264
 8018dfc:	030065c4 	.word	0x030065c4	@ data_030065C4
 8018e00:	030065a4 	.word	0x030065a4	@ data_030065A4
 8018e04:	0814a23c 	.word	0x0814a23c
