fn_08009CC4:
 8009cc4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8009cc6:	6d06      	ldr	r6, [r0, #80]	@ 0x50
 8009cc8:	0004      	movs	r4, r0
 8009cca:	2e00      	cmp	r6, #0
 8009ccc:	d053      	beq.n	8009d76 <fn_08009CC4+0xb2>
 8009cce:	2380      	movs	r3, #128	@ 0x80
 8009cd0:	6cc2      	ldr	r2, [r0, #76]	@ 0x4c
 8009cd2:	045b      	lsls	r3, r3, #17
 8009cd4:	4313      	orrs	r3, r2
 8009cd6:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8009cd8:	4b2f      	ldr	r3, [pc, #188]	@ (8009d98 <fn_08009CC4+0xd4>)
 8009cda:	681a      	ldr	r2, [r3, #0]
 8009cdc:	235a      	movs	r3, #90	@ 0x5a
 8009cde:	5cc1      	ldrb	r1, [r0, r3]
 8009ce0:	23ea      	movs	r3, #234	@ 0xea
 8009ce2:	00db      	lsls	r3, r3, #3
 8009ce4:	58d3      	ldr	r3, [r2, r3]
 8009ce6:	225c      	movs	r2, #92	@ 0x5c
 8009ce8:	434a      	muls	r2, r1
 8009cea:	189b      	adds	r3, r3, r2
 8009cec:	6999      	ldr	r1, [r3, #24]
 8009cee:	f010 faeb 	bl	801a2c8 <fn_0801A2C8>
 8009cf2:	6d22      	ldr	r2, [r4, #80]	@ 0x50
 8009cf4:	2a00      	cmp	r2, #0
 8009cf6:	d041      	beq.n	8009d7c <fn_08009CC4+0xb8>
 8009cf8:	2520      	movs	r5, #32
 8009cfa:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 8009cfc:	320c      	adds	r2, #12
 8009cfe:	43ab      	bics	r3, r5
 8009d00:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8009d02:	68e0      	ldr	r0, [r4, #12]
 8009d04:	ca0c      	ldmia	r2, {r2, r3}
 8009d06:	6921      	ldr	r1, [r4, #16]
 8009d08:	f01b fc2a 	bl	8025560 <fn_08025560>
 8009d0c:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8009d0e:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 8009d10:	6220      	str	r0, [r4, #32]
 8009d12:	035b      	lsls	r3, r3, #13
 8009d14:	d434      	bmi.n	8009d80 <fn_08009CC4+0xbc>
 8009d16:	2380      	movs	r3, #128	@ 0x80
 8009d18:	0cc5      	lsrs	r5, r0, #19
 8009d1a:	20a0      	movs	r0, #160	@ 0xa0
 8009d1c:	011b      	lsls	r3, r3, #4
 8009d1e:	4f1f      	ldr	r7, [pc, #124]	@ (8009d9c <fn_08009CC4+0xd8>)
 8009d20:	18eb      	adds	r3, r5, r3
 8009d22:	009b      	lsls	r3, r3, #2
 8009d24:	58f9      	ldr	r1, [r7, r3]
 8009d26:	0340      	lsls	r0, r0, #13
 8009d28:	f01b fc58 	bl	80255dc <fn_080255DC>
 8009d2c:	63e0      	str	r0, [r4, #60]	@ 0x3c
 8009d2e:	20a0      	movs	r0, #160	@ 0xa0
 8009d30:	00ad      	lsls	r5, r5, #2
 8009d32:	59e9      	ldr	r1, [r5, r7]
 8009d34:	0340      	lsls	r0, r0, #13
 8009d36:	f01b fc51 	bl	80255dc <fn_080255DC>
 8009d3a:	6923      	ldr	r3, [r4, #16]
 8009d3c:	6931      	ldr	r1, [r6, #16]
 8009d3e:	6420      	str	r0, [r4, #64]	@ 0x40
 8009d40:	1ac9      	subs	r1, r1, r3
 8009d42:	68f0      	ldr	r0, [r6, #12]
 8009d44:	68e3      	ldr	r3, [r4, #12]
 8009d46:	1ac0      	subs	r0, r0, r3
 8009d48:	f006 f858 	bl	800fdfc <fn_0800FDFC>
 8009d4c:	4b14      	ldr	r3, [pc, #80]	@ (8009da0 <fn_08009CC4+0xdc>)
 8009d4e:	2101      	movs	r1, #1
 8009d50:	4298      	cmp	r0, r3
 8009d52:	dd04      	ble.n	8009d5e <fn_08009CC4+0x9a>
 8009d54:	21a0      	movs	r1, #160	@ 0xa0
 8009d56:	0349      	lsls	r1, r1, #13
 8009d58:	f01b fc1a 	bl	8025590 <fn_08025590>
 8009d5c:	0001      	movs	r1, r0
 8009d5e:	6bb3      	ldr	r3, [r6, #56]	@ 0x38
 8009d60:	6972      	ldr	r2, [r6, #20]
 8009d62:	6960      	ldr	r0, [r4, #20]
 8009d64:	105b      	asrs	r3, r3, #1
 8009d66:	189b      	adds	r3, r3, r2
 8009d68:	1a18      	subs	r0, r3, r0
 8009d6a:	f01b fc11 	bl	8025590 <fn_08025590>
 8009d6e:	6460      	str	r0, [r4, #68]	@ 0x44
 8009d70:	0020      	movs	r0, r4
 8009d72:	f007 f801 	bl	8010d78 <fn_08010D78>
 8009d76:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8009d78:	bc01      	pop	{r0}
 8009d7a:	4700      	bx	r0
 8009d7c:	6a20      	ldr	r0, [r4, #32]
 8009d7e:	e7ca      	b.n	8009d16 <fn_08009CC4+0x52>
 8009d80:	f7fc febe 	bl	8006b00 <fn_08006B00>
 8009d84:	0005      	movs	r5, r0
 8009d86:	f7fc febb 	bl	8006b00 <fn_08006B00>
 8009d8a:	6a23      	ldr	r3, [r4, #32]
 8009d8c:	1a28      	subs	r0, r5, r0
 8009d8e:	0540      	lsls	r0, r0, #21
 8009d90:	18c0      	adds	r0, r0, r3
 8009d92:	6220      	str	r0, [r4, #32]
 8009d94:	e7bf      	b.n	8009d16 <fn_08009CC4+0x52>
 8009d96:	46c0      	nop			@ (mov r8, r8)
 8009d98:	030064c4 	.word	0x030064c4
 8009d9c:	081397cc 	.word	0x081397cc
 8009da0:	0013ffff 	.word	0x0013ffff
