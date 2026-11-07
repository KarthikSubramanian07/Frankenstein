fn_0801D0E8:
 801d0e8:	b510      	push	{r4, lr}
 801d0ea:	4c40      	ldr	r4, [pc, #256]	@ (801d1ec <fn_0801D0E8+0x104>)
 801d0ec:	4940      	ldr	r1, [pc, #256]	@ (801d1f0 <fn_0801D0E8+0x108>)
 801d0ee:	6823      	ldr	r3, [r4, #0]
 801d0f0:	585a      	ldr	r2, [r3, r1]
 801d0f2:	3201      	adds	r2, #1
 801d0f4:	505a      	str	r2, [r3, r1]
 801d0f6:	2a01      	cmp	r2, #1
 801d0f8:	d05c      	beq.n	801d1b4 <fn_0801D0E8+0xcc>
 801d0fa:	4a3e      	ldr	r2, [pc, #248]	@ (801d1f4 <fn_0801D0E8+0x10c>)
 801d0fc:	5c9a      	ldrb	r2, [r3, r2]
 801d0fe:	2a00      	cmp	r2, #0
 801d100:	d01a      	beq.n	801d138 <fn_0801D0E8+0x50>
 801d102:	001a      	movs	r2, r3
 801d104:	2001      	movs	r0, #1
 801d106:	32e0      	adds	r2, #224	@ 0xe0
 801d108:	7b52      	ldrb	r2, [r2, #13]
 801d10a:	4210      	tst	r0, r2
 801d10c:	d138      	bne.n	801d180 <fn_0801D0E8+0x98>
 801d10e:	0019      	movs	r1, r3
 801d110:	2000      	movs	r0, #0
 801d112:	317d      	adds	r1, #125	@ 0x7d
 801d114:	31ff      	adds	r1, #255	@ 0xff
 801d116:	6008      	str	r0, [r1, #0]
 801d118:	2102      	movs	r1, #2
 801d11a:	0008      	movs	r0, r1
 801d11c:	4010      	ands	r0, r2
 801d11e:	4211      	tst	r1, r2
 801d120:	d03d      	beq.n	801d19e <fn_0801D0E8+0xb6>
 801d122:	001a      	movs	r2, r3
 801d124:	3281      	adds	r2, #129	@ 0x81
 801d126:	32ff      	adds	r2, #255	@ 0xff
 801d128:	6811      	ldr	r1, [r2, #0]
 801d12a:	2900      	cmp	r1, #0
 801d12c:	d102      	bne.n	801d134 <fn_0801D0E8+0x4c>
 801d12e:	2001      	movs	r0, #1
 801d130:	4931      	ldr	r1, [pc, #196]	@ (801d1f8 <fn_0801D0E8+0x110>)
 801d132:	5058      	str	r0, [r3, r1]
 801d134:	2101      	movs	r1, #1
 801d136:	6011      	str	r1, [r2, #0]
 801d138:	4a30      	ldr	r2, [pc, #192]	@ (801d1fc <fn_0801D0E8+0x114>)
 801d13a:	569a      	ldrsb	r2, [r3, r2]
 801d13c:	2a00      	cmp	r2, #0
 801d13e:	d036      	beq.n	801d1ae <fn_0801D0E8+0xc6>
 801d140:	2a01      	cmp	r2, #1
 801d142:	d00a      	beq.n	801d15a <fn_0801D0E8+0x72>
 801d144:	3201      	adds	r2, #1
 801d146:	d105      	bne.n	801d154 <fn_0801D0E8+0x6c>
 801d148:	492d      	ldr	r1, [pc, #180]	@ (801d200 <fn_0801D0E8+0x118>)
 801d14a:	585a      	ldr	r2, [r3, r1]
 801d14c:	3a01      	subs	r2, #1
 801d14e:	505a      	str	r2, [r3, r1]
 801d150:	2a00      	cmp	r2, #0
 801d152:	d043      	beq.n	801d1dc <fn_0801D0E8+0xf4>
 801d154:	bc10      	pop	{r4}
 801d156:	bc01      	pop	{r0}
 801d158:	4700      	bx	r0
 801d15a:	4929      	ldr	r1, [pc, #164]	@ (801d200 <fn_0801D0E8+0x118>)
 801d15c:	585a      	ldr	r2, [r3, r1]
 801d15e:	3a01      	subs	r2, #1
 801d160:	505a      	str	r2, [r3, r1]
 801d162:	2a00      	cmp	r2, #0
 801d164:	d030      	beq.n	801d1c8 <fn_0801D0E8+0xe0>
 801d166:	4924      	ldr	r1, [pc, #144]	@ (801d1f8 <fn_0801D0E8+0x110>)
 801d168:	5859      	ldr	r1, [r3, r1]
 801d16a:	2900      	cmp	r1, #0
 801d16c:	d12c      	bne.n	801d1c8 <fn_0801D0E8+0xe0>
 801d16e:	201f      	movs	r0, #31
 801d170:	2413      	movs	r4, #19
 801d172:	4010      	ands	r0, r2
 801d174:	2200      	movs	r2, #0
 801d176:	4284      	cmp	r4, r0
 801d178:	414a      	adcs	r2, r1
 801d17a:	4922      	ldr	r1, [pc, #136]	@ (801d204 <fn_0801D0E8+0x11c>)
 801d17c:	545a      	strb	r2, [r3, r1]
 801d17e:	e7e9      	b.n	801d154 <fn_0801D0E8+0x6c>
 801d180:	0019      	movs	r1, r3
 801d182:	317d      	adds	r1, #125	@ 0x7d
 801d184:	31ff      	adds	r1, #255	@ 0xff
 801d186:	680c      	ldr	r4, [r1, #0]
 801d188:	2c00      	cmp	r4, #0
 801d18a:	d101      	bne.n	801d190 <fn_0801D0E8+0xa8>
 801d18c:	4c1a      	ldr	r4, [pc, #104]	@ (801d1f8 <fn_0801D0E8+0x110>)
 801d18e:	5118      	str	r0, [r3, r4]
 801d190:	2001      	movs	r0, #1
 801d192:	6008      	str	r0, [r1, #0]
 801d194:	2102      	movs	r1, #2
 801d196:	0008      	movs	r0, r1
 801d198:	4010      	ands	r0, r2
 801d19a:	4211      	tst	r1, r2
 801d19c:	d1c1      	bne.n	801d122 <fn_0801D0E8+0x3a>
 801d19e:	001a      	movs	r2, r3
 801d1a0:	3281      	adds	r2, #129	@ 0x81
 801d1a2:	32ff      	adds	r2, #255	@ 0xff
 801d1a4:	6010      	str	r0, [r2, #0]
 801d1a6:	4a15      	ldr	r2, [pc, #84]	@ (801d1fc <fn_0801D0E8+0x114>)
 801d1a8:	569a      	ldrsb	r2, [r3, r2]
 801d1aa:	2a00      	cmp	r2, #0
 801d1ac:	d1c8      	bne.n	801d140 <fn_0801D0E8+0x58>
 801d1ae:	f7ff fd33 	bl	801cc18 <fn_0801CC18>
 801d1b2:	e7cf      	b.n	801d154 <fn_0801D0E8+0x6c>
 801d1b4:	3293      	adds	r2, #147	@ 0x93
 801d1b6:	5c9b      	ldrb	r3, [r3, r2]
 801d1b8:	2101      	movs	r1, #1
 801d1ba:	2b02      	cmp	r3, #2
 801d1bc:	d011      	beq.n	801d1e2 <fn_0801D0E8+0xfa>
 801d1be:	201c      	movs	r0, #28
 801d1c0:	f7fd fc9e 	bl	801ab00 <fn_0801AB00>
 801d1c4:	6823      	ldr	r3, [r4, #0]
 801d1c6:	e798      	b.n	801d0fa <fn_0801D0E8+0x12>
 801d1c8:	21ff      	movs	r1, #255	@ 0xff
 801d1ca:	4a0c      	ldr	r2, [pc, #48]	@ (801d1fc <fn_0801D0E8+0x114>)
 801d1cc:	5499      	strb	r1, [r3, r2]
 801d1ce:	2100      	movs	r1, #0
 801d1d0:	4a09      	ldr	r2, [pc, #36]	@ (801d1f8 <fn_0801D0E8+0x110>)
 801d1d2:	5099      	str	r1, [r3, r2]
 801d1d4:	4a0a      	ldr	r2, [pc, #40]	@ (801d200 <fn_0801D0E8+0x118>)
 801d1d6:	310a      	adds	r1, #10
 801d1d8:	5099      	str	r1, [r3, r2]
 801d1da:	e7bb      	b.n	801d154 <fn_0801D0E8+0x6c>
 801d1dc:	f7e6 f9c2 	bl	8003564 <fn_08003564>
 801d1e0:	e7b8      	b.n	801d154 <fn_0801D0E8+0x6c>
 801d1e2:	2043      	movs	r0, #67	@ 0x43
 801d1e4:	f7fd fc8c 	bl	801ab00 <fn_0801AB00>
 801d1e8:	6823      	ldr	r3, [r4, #0]
 801d1ea:	e786      	b.n	801d0fa <fn_0801D0E8+0x12>
 801d1ec:	030064c4 	.word	0x030064c4
 801d1f0:	00005a4c 	.word	0x00005a4c
 801d1f4:	0000025d 	.word	0x0000025d
 801d1f8:	00005a38 	.word	0x00005a38
 801d1fc:	00005a3c 	.word	0x00005a3c
 801d200:	00005a48 	.word	0x00005a48
 801d204:	00005a98 	.word	0x00005a98
