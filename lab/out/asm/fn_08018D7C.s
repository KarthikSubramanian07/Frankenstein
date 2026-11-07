fn_08018D7C:
 8018d7c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8018d7e:	46de      	mov	lr, fp
 8018d80:	4657      	mov	r7, sl
 8018d82:	464e      	mov	r6, r9
 8018d84:	4645      	mov	r5, r8
 8018d86:	b5e0      	push	{r5, r6, r7, lr}
 8018d88:	7803      	ldrb	r3, [r0, #0]
 8018d8a:	2b2d      	cmp	r3, #45	@ 0x2d
 8018d8c:	d019      	beq.n	8018dc2 <fn_08018D7C+0x46>
 8018d8e:	f7ff fee7 	bl	8018b60 <fn_08018B60>
 8018d92:	4b41      	ldr	r3, [pc, #260]	@ (8018e98 <fn_08018D7C+0x11c>)
 8018d94:	681a      	ldr	r2, [r3, #0]
 8018d96:	4b41      	ldr	r3, [pc, #260]	@ (8018e9c <fn_08018D7C+0x120>)
 8018d98:	58d3      	ldr	r3, [r2, r3]
 8018d9a:	0004      	movs	r4, r0
 8018d9c:	4298      	cmp	r0, r3
 8018d9e:	da07      	bge.n	8018db0 <fn_08018D7C+0x34>
 8018da0:	4e3f      	ldr	r6, [pc, #252]	@ (8018ea0 <fn_08018D7C+0x124>)
 8018da2:	6835      	ldr	r5, [r6, #0]
 8018da4:	0083      	lsls	r3, r0, #2
 8018da6:	18ed      	adds	r5, r5, r3
 8018da8:	4698      	mov	r8, r3
 8018daa:	682b      	ldr	r3, [r5, #0]
 8018dac:	2b00      	cmp	r3, #0
 8018dae:	d00a      	beq.n	8018dc6 <fn_08018D7C+0x4a>
 8018db0:	0020      	movs	r0, r4
 8018db2:	bcf0      	pop	{r4, r5, r6, r7}
 8018db4:	46bb      	mov	fp, r7
 8018db6:	46b2      	mov	sl, r6
 8018db8:	46a9      	mov	r9, r5
 8018dba:	46a0      	mov	r8, r4
 8018dbc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8018dbe:	bc02      	pop	{r1}
 8018dc0:	4708      	bx	r1
 8018dc2:	2400      	movs	r4, #0
 8018dc4:	e7f4      	b.n	8018db0 <fn_08018D7C+0x34>
 8018dc6:	4837      	ldr	r0, [pc, #220]	@ (8018ea4 <fn_08018D7C+0x128>)
 8018dc8:	f004 fbb2 	bl	801d530 <fn_0801D530>
 8018dcc:	f004 fc24 	bl	801d618 <fn_0801D618>
 8018dd0:	6803      	ldr	r3, [r0, #0]
 8018dd2:	001f      	movs	r7, r3
 8018dd4:	4b34      	ldr	r3, [pc, #208]	@ (8018ea8 <fn_08018D7C+0x12c>)
 8018dd6:	4681      	mov	r9, r0
 8018dd8:	0018      	movs	r0, r3
 8018dda:	469b      	mov	fp, r3
 8018ddc:	f004 fb82 	bl	801d4e4 <fn_0801D4E4>
 8018de0:	4643      	mov	r3, r8
 8018de2:	3304      	adds	r3, #4
 8018de4:	469a      	mov	sl, r3
 8018de6:	3001      	adds	r0, #1
 8018de8:	d010      	beq.n	8018e0c <fn_08018D7C+0x90>
 8018dea:	42bc      	cmp	r4, r7
 8018dec:	db10      	blt.n	8018e10 <fn_08018D7C+0x94>
 8018dee:	4658      	mov	r0, fp
 8018df0:	f004 fb9e 	bl	801d530 <fn_0801D530>
 8018df4:	f004 fc10 	bl	801d618 <fn_0801D618>
 8018df8:	6802      	ldr	r2, [r0, #0]
 8018dfa:	1be3      	subs	r3, r4, r7
 8018dfc:	429a      	cmp	r2, r3
 8018dfe:	dd41      	ble.n	8018e84 <fn_08018D7C+0x108>
 8018e00:	3301      	adds	r3, #1
 8018e02:	009b      	lsls	r3, r3, #2
 8018e04:	58c3      	ldr	r3, [r0, r3]
 8018e06:	18c3      	adds	r3, r0, r3
 8018e08:	4699      	mov	r9, r3
 8018e0a:	e007      	b.n	8018e1c <fn_08018D7C+0xa0>
 8018e0c:	42bc      	cmp	r4, r7
 8018e0e:	da39      	bge.n	8018e84 <fn_08018D7C+0x108>
 8018e10:	464a      	mov	r2, r9
 8018e12:	4653      	mov	r3, sl
 8018e14:	46cc      	mov	ip, r9
 8018e16:	58d3      	ldr	r3, [r2, r3]
 8018e18:	449c      	add	ip, r3
 8018e1a:	46e1      	mov	r9, ip
 8018e1c:	002a      	movs	r2, r5
 8018e1e:	2102      	movs	r1, #2
 8018e20:	2010      	movs	r0, #16
 8018e22:	f004 fc83 	bl	801d72c <fn_0801D72C>
 8018e26:	4649      	mov	r1, r9
 8018e28:	7b4d      	ldrb	r5, [r1, #13]
 8018e2a:	7b0b      	ldrb	r3, [r1, #12]
 8018e2c:	022d      	lsls	r5, r5, #8
 8018e2e:	431d      	orrs	r5, r3
 8018e30:	042d      	lsls	r5, r5, #16
 8018e32:	142d      	asrs	r5, r5, #16
 8018e34:	80c5      	strh	r5, [r0, #6]
 8018e36:	7bcb      	ldrb	r3, [r1, #15]
 8018e38:	7b8a      	ldrb	r2, [r1, #14]
 8018e3a:	021b      	lsls	r3, r3, #8
 8018e3c:	4313      	orrs	r3, r2
 8018e3e:	8103      	strh	r3, [r0, #8]
 8018e40:	6001      	str	r1, [r0, #0]
 8018e42:	0007      	movs	r7, r0
 8018e44:	4819      	ldr	r0, [pc, #100]	@ (8018eac <fn_08018D7C+0x130>)
 8018e46:	4699      	mov	r9, r3
 8018e48:	f004 fb72 	bl	801d530 <fn_0801D530>
 8018e4c:	f004 fbe4 	bl	801d618 <fn_0801D618>
 8018e50:	4653      	mov	r3, sl
 8018e52:	58c3      	ldr	r3, [r0, r3]
 8018e54:	18c0      	adds	r0, r0, r3
 8018e56:	60f8      	str	r0, [r7, #12]
 8018e58:	2d01      	cmp	r5, #1
 8018e5a:	dd1a      	ble.n	8018e92 <fn_08018D7C+0x116>
 8018e5c:	2302      	movs	r3, #2
 8018e5e:	001a      	movs	r2, r3
 8018e60:	005b      	lsls	r3, r3, #1
 8018e62:	429d      	cmp	r5, r3
 8018e64:	dafb      	bge.n	8018e5e <fn_08018D7C+0xe2>
 8018e66:	3a01      	subs	r2, #1
 8018e68:	4b11      	ldr	r3, [pc, #68]	@ (8018eb0 <fn_08018D7C+0x134>)
 8018e6a:	80ba      	strh	r2, [r7, #4]
 8018e6c:	681a      	ldr	r2, [r3, #0]
 8018e6e:	464b      	mov	r3, r9
 8018e70:	4640      	mov	r0, r8
 8018e72:	041b      	lsls	r3, r3, #16
 8018e74:	5013      	str	r3, [r2, r0]
 8018e76:	4b0f      	ldr	r3, [pc, #60]	@ (8018eb4 <fn_08018D7C+0x138>)
 8018e78:	681b      	ldr	r3, [r3, #0]
 8018e7a:	0062      	lsls	r2, r4, #1
 8018e7c:	52d4      	strh	r4, [r2, r3]
 8018e7e:	6833      	ldr	r3, [r6, #0]
 8018e80:	501f      	str	r7, [r3, r0]
 8018e82:	e795      	b.n	8018db0 <fn_08018D7C+0x34>
 8018e84:	0021      	movs	r1, r4
 8018e86:	480c      	ldr	r0, [pc, #48]	@ (8018eb8 <fn_08018D7C+0x13c>)
 8018e88:	f7e7 fb8e 	bl	80005a8 <fn_080005A8>
 8018e8c:	6835      	ldr	r5, [r6, #0]
 8018e8e:	4445      	add	r5, r8
 8018e90:	e7c4      	b.n	8018e1c <fn_08018D7C+0xa0>
 8018e92:	2200      	movs	r2, #0
 8018e94:	e7e8      	b.n	8018e68 <fn_08018D7C+0xec>
 8018e96:	46c0      	nop			@ (mov r8, r8)
 8018e98:	030064c4 	.word	0x030064c4
 8018e9c:	00001114 	.word	0x00001114
 8018ea0:	0300658c 	.word	0x0300658c
 8018ea4:	0814a304 	.word	0x0814a304
 8018ea8:	0814a2f8 	.word	0x0814a2f8
 8018eac:	0814a338 	.word	0x0814a338
 8018eb0:	030065c4 	.word	0x030065c4
 8018eb4:	030065a4 	.word	0x030065a4
 8018eb8:	0814a310 	.word	0x0814a310
