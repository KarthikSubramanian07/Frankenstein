fn_08002C24:
 8002c24:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002c26:	46d6      	mov	lr, sl
 8002c28:	464f      	mov	r7, r9
 8002c2a:	4646      	mov	r6, r8
 8002c2c:	2398      	movs	r3, #152	@ 0x98
 8002c2e:	4d7b      	ldr	r5, [pc, #492]	@ (8002e1c <fn_08002C24+0x1f8>)
 8002c30:	b5c0      	push	{r6, r7, lr}
 8002c32:	682c      	ldr	r4, [r5, #0]
 8002c34:	58e3      	ldr	r3, [r4, r3]
 8002c36:	b084      	sub	sp, #16
 8002c38:	2b02      	cmp	r3, #2
 8002c3a:	d100      	bne.n	8002c3e <fn_08002C24+0x1a>
 8002c3c:	e0c7      	b.n	8002dce <fn_08002C24+0x1aa>
 8002c3e:	2b00      	cmp	r3, #0
 8002c40:	d017      	beq.n	8002c72 <fn_08002C24+0x4e>
 8002c42:	23d8      	movs	r3, #216	@ 0xd8
 8002c44:	58e3      	ldr	r3, [r4, r3]
 8002c46:	2b03      	cmp	r3, #3
 8002c48:	d067      	beq.n	8002d1a <fn_08002C24+0xf6>
 8002c4a:	dd00      	ble.n	8002c4e <fn_08002C24+0x2a>
 8002c4c:	e0b2      	b.n	8002db4 <fn_08002C24+0x190>
 8002c4e:	2b01      	cmp	r3, #1
 8002c50:	d100      	bne.n	8002c54 <fn_08002C24+0x30>
 8002c52:	e0a5      	b.n	8002da0 <fn_08002C24+0x17c>
 8002c54:	2b02      	cmp	r3, #2
 8002c56:	d104      	bne.n	8002c62 <fn_08002C24+0x3e>
 8002c58:	4871      	ldr	r0, [pc, #452]	@ (8002e20 <fn_08002C24+0x1fc>)
 8002c5a:	f01a fc11 	bl	801d480 <fn_0801D480>
 8002c5e:	f019 fab1 	bl	801c1c4 <fn_0801C1C4>
 8002c62:	b004      	add	sp, #16
 8002c64:	bce0      	pop	{r5, r6, r7}
 8002c66:	46ba      	mov	sl, r7
 8002c68:	46b1      	mov	r9, r6
 8002c6a:	46a8      	mov	r8, r5
 8002c6c:	bcf0      	pop	{r4, r5, r6, r7}
 8002c6e:	bc01      	pop	{r0}
 8002c70:	4700      	bx	r0
 8002c72:	33a4      	adds	r3, #164	@ 0xa4
 8002c74:	58e0      	ldr	r0, [r4, r3]
 8002c76:	f019 f95d 	bl	801bf34 <fn_0801BF34>
 8002c7a:	23a0      	movs	r3, #160	@ 0xa0
 8002c7c:	682e      	ldr	r6, [r5, #0]
 8002c7e:	58f4      	ldr	r4, [r6, r3]
 8002c80:	3b04      	subs	r3, #4
 8002c82:	58f0      	ldr	r0, [r6, r3]
 8002c84:	380a      	subs	r0, #10
 8002c86:	f022 fc61 	bl	802554c <fn_0802554C>
 8002c8a:	23bc      	movs	r3, #188	@ 0xbc
 8002c8c:	58f2      	ldr	r2, [r6, r3]
 8002c8e:	2a00      	cmp	r2, #0
 8002c90:	d03c      	beq.n	8002d0c <fn_08002C24+0xe8>
 8002c92:	4964      	ldr	r1, [pc, #400]	@ (8002e24 <fn_08002C24+0x200>)
 8002c94:	f022 fcae 	bl	80255f4 <fn_080255F4>
 8002c98:	f022 fc82 	bl	80255a0 <fn_080255A0>
 8002c9c:	2800      	cmp	r0, #0
 8002c9e:	dde0      	ble.n	8002c62 <fn_08002C24+0x3e>
 8002ca0:	230a      	movs	r3, #10
 8002ca2:	4699      	mov	r9, r3
 8002ca4:	4b60      	ldr	r3, [pc, #384]	@ (8002e28 <fn_08002C24+0x204>)
 8002ca6:	1826      	adds	r6, r4, r0
 8002ca8:	4698      	mov	r8, r3
 8002caa:	200a      	movs	r0, #10
 8002cac:	e016      	b.n	8002cdc <fn_08002C24+0xb8>
 8002cae:	682a      	ldr	r2, [r5, #0]
 8002cb0:	3377      	adds	r3, #119	@ 0x77
 8002cb2:	009b      	lsls	r3, r3, #2
 8002cb4:	18d3      	adds	r3, r2, r3
 8002cb6:	685a      	ldr	r2, [r3, #4]
 8002cb8:	2300      	movs	r3, #0
 8002cba:	5ed7      	ldrsh	r7, [r2, r3]
 8002cbc:	183f      	adds	r7, r7, r0
 8002cbe:	2ff0      	cmp	r7, #240	@ 0xf0
 8002cc0:	dc0a      	bgt.n	8002cd8 <fn_08002C24+0xb4>
 8002cc2:	2302      	movs	r3, #2
 8002cc4:	5ed1      	ldrsh	r1, [r2, r3]
 8002cc6:	468a      	mov	sl, r1
 8002cc8:	4649      	mov	r1, r9
 8002cca:	4653      	mov	r3, sl
 8002ccc:	185b      	adds	r3, r3, r1
 8002cce:	2ba0      	cmp	r3, #160	@ 0xa0
 8002cd0:	dc02      	bgt.n	8002cd8 <fn_08002C24+0xb4>
 8002cd2:	f022 fc29 	bl	8025528 <fn_08025528>
 8002cd6:	0038      	movs	r0, r7
 8002cd8:	42b4      	cmp	r4, r6
 8002cda:	d0c2      	beq.n	8002c62 <fn_08002C24+0x3e>
 8002cdc:	7823      	ldrb	r3, [r4, #0]
 8002cde:	2b00      	cmp	r3, #0
 8002ce0:	d0bf      	beq.n	8002c62 <fn_08002C24+0x3e>
 8002ce2:	3401      	adds	r4, #1
 8002ce4:	2b0a      	cmp	r3, #10
 8002ce6:	d00c      	beq.n	8002d02 <fn_08002C24+0xde>
 8002ce8:	4642      	mov	r2, r8
 8002cea:	2103      	movs	r1, #3
 8002cec:	5cd2      	ldrb	r2, [r2, r3]
 8002cee:	400a      	ands	r2, r1
 8002cf0:	2a02      	cmp	r2, #2
 8002cf2:	d100      	bne.n	8002cf6 <fn_08002C24+0xd2>
 8002cf4:	3b20      	subs	r3, #32
 8002cf6:	001a      	movs	r2, r3
 8002cf8:	3a21      	subs	r2, #33	@ 0x21
 8002cfa:	2a3f      	cmp	r2, #63	@ 0x3f
 8002cfc:	d9d7      	bls.n	8002cae <fn_08002C24+0x8a>
 8002cfe:	3004      	adds	r0, #4
 8002d00:	e7ea      	b.n	8002cd8 <fn_08002C24+0xb4>
 8002d02:	464b      	mov	r3, r9
 8002d04:	330b      	adds	r3, #11
 8002d06:	4699      	mov	r9, r3
 8002d08:	200a      	movs	r0, #10
 8002d0a:	e7e5      	b.n	8002cd8 <fn_08002C24+0xb4>
 8002d0c:	4f47      	ldr	r7, [pc, #284]	@ (8002e2c <fn_08002C24+0x208>)
 8002d0e:	59f1      	ldr	r1, [r6, r7]
 8002d10:	50f1      	str	r1, [r6, r3]
 8002d12:	2900      	cmp	r1, #0
 8002d14:	d05e      	beq.n	8002dd4 <fn_08002C24+0x1b0>
 8002d16:	51f2      	str	r2, [r6, r7]
 8002d18:	e7bb      	b.n	8002c92 <fn_08002C24+0x6e>
 8002d1a:	4845      	ldr	r0, [pc, #276]	@ (8002e30 <fn_08002C24+0x20c>)
 8002d1c:	f01a fbb0 	bl	801d480 <fn_0801D480>
 8002d20:	f01a fc22 	bl	801d568 <fn_0801D568>
 8002d24:	239c      	movs	r3, #156	@ 0x9c
 8002d26:	58e2      	ldr	r2, [r4, r3]
 8002d28:	3ae6      	subs	r2, #230	@ 0xe6
 8002d2a:	0fd3      	lsrs	r3, r2, #31
 8002d2c:	189b      	adds	r3, r3, r2
 8002d2e:	22a0      	movs	r2, #160	@ 0xa0
 8002d30:	105b      	asrs	r3, r3, #1
 8002d32:	425b      	negs	r3, r3
 8002d34:	3341      	adds	r3, #65	@ 0x41
 8002d36:	33ff      	adds	r3, #255	@ 0xff
 8002d38:	0006      	movs	r6, r0
 8002d3a:	0052      	lsls	r2, r2, #1
 8002d3c:	4293      	cmp	r3, r2
 8002d3e:	dd42      	ble.n	8002dc6 <fn_08002C24+0x1a2>
 8002d40:	0013      	movs	r3, r2
 8002d42:	21a0      	movs	r1, #160	@ 0xa0
 8002d44:	0118      	lsls	r0, r3, #4
 8002d46:	1ac0      	subs	r0, r0, r3
 8002d48:	0049      	lsls	r1, r1, #1
 8002d4a:	0100      	lsls	r0, r0, #4
 8002d4c:	f022 fc20 	bl	8025590 <fn_08025590>
 8002d50:	21f0      	movs	r1, #240	@ 0xf0
 8002d52:	0002      	movs	r2, r0
 8002d54:	0049      	lsls	r1, r1, #1
 8002d56:	0030      	movs	r0, r6
 8002d58:	f019 f9fa 	bl	801c150 <fn_0801C150>
 8002d5c:	239c      	movs	r3, #156	@ 0x9c
 8002d5e:	682c      	ldr	r4, [r5, #0]
 8002d60:	58e0      	ldr	r0, [r4, r3]
 8002d62:	4b34      	ldr	r3, [pc, #208]	@ (8002e34 <fn_08002C24+0x210>)
 8002d64:	4298      	cmp	r0, r3
 8002d66:	dc00      	bgt.n	8002d6a <fn_08002C24+0x146>
 8002d68:	e77b      	b.n	8002c62 <fn_08002C24+0x3e>
 8002d6a:	4b33      	ldr	r3, [pc, #204]	@ (8002e38 <fn_08002C24+0x214>)
 8002d6c:	4298      	cmp	r0, r3
 8002d6e:	dd46      	ble.n	8002dfe <fn_08002C24+0x1da>
 8002d70:	4b32      	ldr	r3, [pc, #200]	@ (8002e3c <fn_08002C24+0x218>)
 8002d72:	2606      	movs	r6, #6
 8002d74:	4298      	cmp	r0, r3
 8002d76:	dd2f      	ble.n	8002dd8 <fn_08002C24+0x1b4>
 8002d78:	27c0      	movs	r7, #192	@ 0xc0
 8002d7a:	59e3      	ldr	r3, [r4, r7]
 8002d7c:	42b3      	cmp	r3, r6
 8002d7e:	db31      	blt.n	8002de4 <fn_08002C24+0x1c0>
 8002d80:	0033      	movs	r3, r6
 8002d82:	210a      	movs	r1, #10
 8002d84:	4a2e      	ldr	r2, [pc, #184]	@ (8002e40 <fn_08002C24+0x21c>)
 8002d86:	a801      	add	r0, sp, #4
 8002d88:	f002 fb66 	bl	8005458 <fn_08005458>
 8002d8c:	a801      	add	r0, sp, #4
 8002d8e:	f01a fb77 	bl	801d480 <fn_0801D480>
 8002d92:	2200      	movs	r2, #0
 8002d94:	0003      	movs	r3, r0
 8002d96:	2144      	movs	r1, #68	@ 0x44
 8002d98:	206c      	movs	r0, #108	@ 0x6c
 8002d9a:	f019 f9c9 	bl	801c130 <fn_0801C130>
 8002d9e:	e760      	b.n	8002c62 <fn_08002C24+0x3e>
 8002da0:	2394      	movs	r3, #148	@ 0x94
 8002da2:	5ce3      	ldrb	r3, [r4, r3]
 8002da4:	2b03      	cmp	r3, #3
 8002da6:	d024      	beq.n	8002df2 <fn_08002C24+0x1ce>
 8002da8:	4826      	ldr	r0, [pc, #152]	@ (8002e44 <fn_08002C24+0x220>)
 8002daa:	f01a fb69 	bl	801d480 <fn_0801D480>
 8002dae:	f019 fa09 	bl	801c1c4 <fn_0801C1C4>
 8002db2:	e756      	b.n	8002c62 <fn_08002C24+0x3e>
 8002db4:	2b04      	cmp	r3, #4
 8002db6:	d000      	beq.n	8002dba <fn_08002C24+0x196>
 8002db8:	e753      	b.n	8002c62 <fn_08002C24+0x3e>
 8002dba:	4823      	ldr	r0, [pc, #140]	@ (8002e48 <fn_08002C24+0x224>)
 8002dbc:	f01a fb60 	bl	801d480 <fn_0801D480>
 8002dc0:	f019 fa00 	bl	801c1c4 <fn_0801C1C4>
 8002dc4:	e74d      	b.n	8002c62 <fn_08002C24+0x3e>
 8002dc6:	43da      	mvns	r2, r3
 8002dc8:	17d2      	asrs	r2, r2, #31
 8002dca:	4013      	ands	r3, r2
 8002dcc:	e7b9      	b.n	8002d42 <fn_08002C24+0x11e>
 8002dce:	f7ff fe7d 	bl	8002acc <fn_08002ACC>
 8002dd2:	e746      	b.n	8002c62 <fn_08002C24+0x3e>
 8002dd4:	491d      	ldr	r1, [pc, #116]	@ (8002e4c <fn_08002C24+0x228>)
 8002dd6:	e75d      	b.n	8002c94 <fn_08002C24+0x70>
 8002dd8:	2105      	movs	r1, #5
 8002dda:	f022 fbd9 	bl	8025590 <fn_08025590>
 8002dde:	38ec      	subs	r0, #236	@ 0xec
 8002de0:	0006      	movs	r6, r0
 8002de2:	e7c9      	b.n	8002d78 <fn_08002C24+0x154>
 8002de4:	2101      	movs	r1, #1
 8002de6:	2000      	movs	r0, #0
 8002de8:	f017 fa6e 	bl	801a2c8 <fn_0801A2C8>
 8002dec:	682b      	ldr	r3, [r5, #0]
 8002dee:	51de      	str	r6, [r3, r7]
 8002df0:	e7c6      	b.n	8002d80 <fn_08002C24+0x15c>
 8002df2:	4817      	ldr	r0, [pc, #92]	@ (8002e50 <fn_08002C24+0x22c>)
 8002df4:	f01a fb44 	bl	801d480 <fn_0801D480>
 8002df8:	f019 f9e4 	bl	801c1c4 <fn_0801C1C4>
 8002dfc:	e731      	b.n	8002c62 <fn_08002C24+0x3e>
 8002dfe:	4815      	ldr	r0, [pc, #84]	@ (8002e54 <fn_08002C24+0x230>)
 8002e00:	f01a fb3e 	bl	801d480 <fn_0801D480>
 8002e04:	2200      	movs	r2, #0
 8002e06:	0003      	movs	r3, r0
 8002e08:	2144      	movs	r1, #68	@ 0x44
 8002e0a:	206c      	movs	r0, #108	@ 0x6c
 8002e0c:	f019 f990 	bl	801c130 <fn_0801C130>
 8002e10:	23c0      	movs	r3, #192	@ 0xc0
 8002e12:	2100      	movs	r1, #0
 8002e14:	682a      	ldr	r2, [r5, #0]
 8002e16:	50d1      	str	r1, [r2, r3]
 8002e18:	e723      	b.n	8002c62 <fn_08002C24+0x3e>
 8002e1a:	46c0      	nop			@ (mov r8, r8)
 8002e1c:	030064c4 	.word	0x030064c4	@ data_030064C4
 8002e20:	081492f0 	.word	0x081492f0
 8002e24:	3c23d70a 	.word	0x3c23d70a
 8002e28:	0814b3b9 	.word	0x0814b3b9	@ data_0814B3B8+0x1
 8002e2c:	00005a38 	.word	0x00005a38
 8002e30:	081492fc 	.word	0x081492fc
 8002e34:	00000469 	.word	0x00000469
 8002e38:	0000049b 	.word	0x0000049b
 8002e3c:	000004be 	.word	0x000004be
 8002e40:	08149310 	.word	0x08149310
 8002e44:	081492e8 	.word	0x081492e8
 8002e48:	08149318 	.word	0x08149318
 8002e4c:	40400000 	.word	0x40400000
 8002e50:	081492e0 	.word	0x081492e0
 8002e54:	08149308 	.word	0x08149308
