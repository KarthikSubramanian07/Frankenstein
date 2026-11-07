fn_08008FA4:
 8008fa4:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8008fa6:	b570      	push	{r4, r5, r6, lr}
 8008fa8:	0004      	movs	r4, r0
 8008faa:	2a00      	cmp	r2, #0
 8008fac:	d02a      	beq.n	8009004 <fn_08008FA4+0x60>
 8008fae:	2120      	movs	r1, #32
 8008fb0:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8008fb2:	320c      	adds	r2, #12
 8008fb4:	438b      	bics	r3, r1
 8008fb6:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8008fb8:	6901      	ldr	r1, [r0, #16]
 8008fba:	ca0c      	ldmia	r2, {r2, r3}
 8008fbc:	68c0      	ldr	r0, [r0, #12]
 8008fbe:	f01c facf 	bl	8025560 <fn_08025560>
 8008fc2:	6d25      	ldr	r5, [r4, #80]	@ 0x50
 8008fc4:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 8008fc6:	6220      	str	r0, [r4, #32]
 8008fc8:	035b      	lsls	r3, r3, #13
 8008fca:	d41e      	bmi.n	800900a <fn_08008FA4+0x66>
 8008fcc:	6923      	ldr	r3, [r4, #16]
 8008fce:	6929      	ldr	r1, [r5, #16]
 8008fd0:	68e8      	ldr	r0, [r5, #12]
 8008fd2:	1ac9      	subs	r1, r1, r3
 8008fd4:	68e3      	ldr	r3, [r4, #12]
 8008fd6:	1ac0      	subs	r0, r0, r3
 8008fd8:	f006 ff10 	bl	800fdfc <fn_0800FDFC>
 8008fdc:	4b20      	ldr	r3, [pc, #128]	@ (8009060 <fn_08008FA4+0xbc>)
 8008fde:	681a      	ldr	r2, [r3, #0]
 8008fe0:	235a      	movs	r3, #90	@ 0x5a
 8008fe2:	5ce9      	ldrb	r1, [r5, r3]
 8008fe4:	23ea      	movs	r3, #234	@ 0xea
 8008fe6:	00db      	lsls	r3, r3, #3
 8008fe8:	58d3      	ldr	r3, [r2, r3]
 8008fea:	225c      	movs	r2, #92	@ 0x5c
 8008fec:	434a      	muls	r2, r1
 8008fee:	189b      	adds	r3, r3, r2
 8008ff0:	6c1b      	ldr	r3, [r3, #64]	@ 0x40
 8008ff2:	4a1c      	ldr	r2, [pc, #112]	@ (8009064 <fn_08008FA4+0xc0>)
 8008ff4:	189b      	adds	r3, r3, r2
 8008ff6:	4283      	cmp	r3, r0
 8008ff8:	da15      	bge.n	8009026 <fn_08008FA4+0x82>
 8008ffa:	221f      	movs	r2, #31
 8008ffc:	0029      	movs	r1, r5
 8008ffe:	0020      	movs	r0, r4
 8009000:	f009 f80c 	bl	801201c <fn_0801201C>
 8009004:	bc70      	pop	{r4, r5, r6}
 8009006:	bc01      	pop	{r0}
 8009008:	4700      	bx	r0
 800900a:	f7fd fd79 	bl	8006b00 <fn_08006B00>
 800900e:	0005      	movs	r5, r0
 8009010:	f7fd fd76 	bl	8006b00 <fn_08006B00>
 8009014:	6a23      	ldr	r3, [r4, #32]
 8009016:	1a2d      	subs	r5, r5, r0
 8009018:	056d      	lsls	r5, r5, #21
 800901a:	195b      	adds	r3, r3, r5
 800901c:	6d25      	ldr	r5, [r4, #80]	@ 0x50
 800901e:	6223      	str	r3, [r4, #32]
 8009020:	2d00      	cmp	r5, #0
 8009022:	d0ea      	beq.n	8008ffa <fn_08008FA4+0x56>
 8009024:	e7d2      	b.n	8008fcc <fn_08008FA4+0x28>
 8009026:	0029      	movs	r1, r5
 8009028:	0020      	movs	r0, r4
 800902a:	f00b f92f 	bl	801428c <fn_0801428C>
 800902e:	2800      	cmp	r0, #0
 8009030:	d101      	bne.n	8009036 <fn_08008FA4+0x92>
 8009032:	6d25      	ldr	r5, [r4, #80]	@ 0x50
 8009034:	e7e1      	b.n	8008ffa <fn_08008FA4+0x56>
 8009036:	2137      	movs	r1, #55	@ 0x37
 8009038:	0020      	movs	r0, r4
 800903a:	f011 f945 	bl	801a2c8 <fn_0801A2C8>
 800903e:	f7fd fd5f 	bl	8006b00 <fn_08006B00>
 8009042:	2207      	movs	r2, #7
 8009044:	17c3      	asrs	r3, r0, #31
 8009046:	0f5b      	lsrs	r3, r3, #29
 8009048:	18c0      	adds	r0, r0, r3
 800904a:	4002      	ands	r2, r0
 800904c:	1ad2      	subs	r2, r2, r3
 800904e:	3201      	adds	r2, #1
 8009050:	0053      	lsls	r3, r2, #1
 8009052:	189b      	adds	r3, r3, r2
 8009054:	0021      	movs	r1, r4
 8009056:	0022      	movs	r2, r4
 8009058:	6d20      	ldr	r0, [r4, #80]	@ 0x50
 800905a:	f004 fcaf 	bl	800d9bc <fn_0800D9BC>
 800905e:	e7d1      	b.n	8009004 <fn_08008FA4+0x60>
 8009060:	030064c4 	.word	0x030064c4
 8009064:	002bffff 	.word	0x002bffff
