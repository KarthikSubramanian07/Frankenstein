fn_0801D038:
 801d038:	b510      	push	{r4, lr}
 801d03a:	4c40      	ldr	r4, [pc, #256]	@ (801d13c <fn_0801D038+0x104>)
 801d03c:	4940      	ldr	r1, [pc, #256]	@ (801d140 <fn_0801D038+0x108>)
 801d03e:	6823      	ldr	r3, [r4, #0]
 801d040:	585a      	ldr	r2, [r3, r1]
 801d042:	3201      	adds	r2, #1
 801d044:	505a      	str	r2, [r3, r1]
 801d046:	2a01      	cmp	r2, #1
 801d048:	d05c      	beq.n	801d104 <fn_0801D038+0xcc>
 801d04a:	4a3e      	ldr	r2, [pc, #248]	@ (801d144 <fn_0801D038+0x10c>)
 801d04c:	5c9a      	ldrb	r2, [r3, r2]
 801d04e:	2a00      	cmp	r2, #0
 801d050:	d01a      	beq.n	801d088 <fn_0801D038+0x50>
 801d052:	001a      	movs	r2, r3
 801d054:	2001      	movs	r0, #1
 801d056:	32e0      	adds	r2, #224	@ 0xe0
 801d058:	7b52      	ldrb	r2, [r2, #13]
 801d05a:	4210      	tst	r0, r2
 801d05c:	d138      	bne.n	801d0d0 <fn_0801D038+0x98>
 801d05e:	0019      	movs	r1, r3
 801d060:	2000      	movs	r0, #0
 801d062:	317d      	adds	r1, #125	@ 0x7d
 801d064:	31ff      	adds	r1, #255	@ 0xff
 801d066:	6008      	str	r0, [r1, #0]
 801d068:	2102      	movs	r1, #2
 801d06a:	0008      	movs	r0, r1
 801d06c:	4010      	ands	r0, r2
 801d06e:	4211      	tst	r1, r2
 801d070:	d03d      	beq.n	801d0ee <fn_0801D038+0xb6>
 801d072:	001a      	movs	r2, r3
 801d074:	3281      	adds	r2, #129	@ 0x81
 801d076:	32ff      	adds	r2, #255	@ 0xff
 801d078:	6811      	ldr	r1, [r2, #0]
 801d07a:	2900      	cmp	r1, #0
 801d07c:	d102      	bne.n	801d084 <fn_0801D038+0x4c>
 801d07e:	2001      	movs	r0, #1
 801d080:	4931      	ldr	r1, [pc, #196]	@ (801d148 <fn_0801D038+0x110>)
 801d082:	5058      	str	r0, [r3, r1]
 801d084:	2101      	movs	r1, #1
 801d086:	6011      	str	r1, [r2, #0]
 801d088:	4a30      	ldr	r2, [pc, #192]	@ (801d14c <fn_0801D038+0x114>)
 801d08a:	569a      	ldrsb	r2, [r3, r2]
 801d08c:	2a00      	cmp	r2, #0
 801d08e:	d036      	beq.n	801d0fe <fn_0801D038+0xc6>
 801d090:	2a01      	cmp	r2, #1
 801d092:	d00a      	beq.n	801d0aa <fn_0801D038+0x72>
 801d094:	3201      	adds	r2, #1
 801d096:	d105      	bne.n	801d0a4 <fn_0801D038+0x6c>
 801d098:	492d      	ldr	r1, [pc, #180]	@ (801d150 <fn_0801D038+0x118>)
 801d09a:	585a      	ldr	r2, [r3, r1]
 801d09c:	3a01      	subs	r2, #1
 801d09e:	505a      	str	r2, [r3, r1]
 801d0a0:	2a00      	cmp	r2, #0
 801d0a2:	d043      	beq.n	801d12c <fn_0801D038+0xf4>
 801d0a4:	bc10      	pop	{r4}
 801d0a6:	bc01      	pop	{r0}
 801d0a8:	4700      	bx	r0
 801d0aa:	4929      	ldr	r1, [pc, #164]	@ (801d150 <fn_0801D038+0x118>)
 801d0ac:	585a      	ldr	r2, [r3, r1]
 801d0ae:	3a01      	subs	r2, #1
 801d0b0:	505a      	str	r2, [r3, r1]
 801d0b2:	2a00      	cmp	r2, #0
 801d0b4:	d030      	beq.n	801d118 <fn_0801D038+0xe0>
 801d0b6:	4924      	ldr	r1, [pc, #144]	@ (801d148 <fn_0801D038+0x110>)
 801d0b8:	5859      	ldr	r1, [r3, r1]
 801d0ba:	2900      	cmp	r1, #0
 801d0bc:	d12c      	bne.n	801d118 <fn_0801D038+0xe0>
 801d0be:	201f      	movs	r0, #31
 801d0c0:	2413      	movs	r4, #19
 801d0c2:	4010      	ands	r0, r2
 801d0c4:	2200      	movs	r2, #0
 801d0c6:	4284      	cmp	r4, r0
 801d0c8:	414a      	adcs	r2, r1
 801d0ca:	4922      	ldr	r1, [pc, #136]	@ (801d154 <fn_0801D038+0x11c>)
 801d0cc:	545a      	strb	r2, [r3, r1]
 801d0ce:	e7e9      	b.n	801d0a4 <fn_0801D038+0x6c>
 801d0d0:	0019      	movs	r1, r3
 801d0d2:	317d      	adds	r1, #125	@ 0x7d
 801d0d4:	31ff      	adds	r1, #255	@ 0xff
 801d0d6:	680c      	ldr	r4, [r1, #0]
 801d0d8:	2c00      	cmp	r4, #0
 801d0da:	d101      	bne.n	801d0e0 <fn_0801D038+0xa8>
 801d0dc:	4c1a      	ldr	r4, [pc, #104]	@ (801d148 <fn_0801D038+0x110>)
 801d0de:	5118      	str	r0, [r3, r4]
 801d0e0:	2001      	movs	r0, #1
 801d0e2:	6008      	str	r0, [r1, #0]
 801d0e4:	2102      	movs	r1, #2
 801d0e6:	0008      	movs	r0, r1
 801d0e8:	4010      	ands	r0, r2
 801d0ea:	4211      	tst	r1, r2
 801d0ec:	d1c1      	bne.n	801d072 <fn_0801D038+0x3a>
 801d0ee:	001a      	movs	r2, r3
 801d0f0:	3281      	adds	r2, #129	@ 0x81
 801d0f2:	32ff      	adds	r2, #255	@ 0xff
 801d0f4:	6010      	str	r0, [r2, #0]
 801d0f6:	4a15      	ldr	r2, [pc, #84]	@ (801d14c <fn_0801D038+0x114>)
 801d0f8:	569a      	ldrsb	r2, [r3, r2]
 801d0fa:	2a00      	cmp	r2, #0
 801d0fc:	d1c8      	bne.n	801d090 <fn_0801D038+0x58>
 801d0fe:	f7ff fd33 	bl	801cb68 <fn_0801CB68>
 801d102:	e7cf      	b.n	801d0a4 <fn_0801D038+0x6c>
 801d104:	3293      	adds	r2, #147	@ 0x93
 801d106:	5c9b      	ldrb	r3, [r3, r2]
 801d108:	2101      	movs	r1, #1
 801d10a:	2b02      	cmp	r3, #2
 801d10c:	d011      	beq.n	801d132 <fn_0801D038+0xfa>
 801d10e:	201c      	movs	r0, #28
 801d110:	f7fd fc9c 	bl	801aa4c <fn_0801AA4C>
 801d114:	6823      	ldr	r3, [r4, #0]
 801d116:	e798      	b.n	801d04a <fn_0801D038+0x12>
 801d118:	21ff      	movs	r1, #255	@ 0xff
 801d11a:	4a0c      	ldr	r2, [pc, #48]	@ (801d14c <fn_0801D038+0x114>)
 801d11c:	5499      	strb	r1, [r3, r2]
 801d11e:	2100      	movs	r1, #0
 801d120:	4a09      	ldr	r2, [pc, #36]	@ (801d148 <fn_0801D038+0x110>)
 801d122:	5099      	str	r1, [r3, r2]
 801d124:	4a0a      	ldr	r2, [pc, #40]	@ (801d150 <fn_0801D038+0x118>)
 801d126:	310a      	adds	r1, #10
 801d128:	5099      	str	r1, [r3, r2]
 801d12a:	e7bb      	b.n	801d0a4 <fn_0801D038+0x6c>
 801d12c:	f7e6 fa1a 	bl	8003564 <fn_08003564>
 801d130:	e7b8      	b.n	801d0a4 <fn_0801D038+0x6c>
 801d132:	2043      	movs	r0, #67	@ 0x43
 801d134:	f7fd fc8a 	bl	801aa4c <fn_0801AA4C>
 801d138:	6823      	ldr	r3, [r4, #0]
 801d13a:	e786      	b.n	801d04a <fn_0801D038+0x12>
 801d13c:	030064c4 	.word	0x030064c4	@ data_030064C4
 801d140:	00005a4c 	.word	0x00005a4c
 801d144:	0000025d 	.word	0x0000025d
 801d148:	00005a38 	.word	0x00005a38
 801d14c:	00005a3c 	.word	0x00005a3c
 801d150:	00005a48 	.word	0x00005a48
 801d154:	00005a98 	.word	0x00005a98
