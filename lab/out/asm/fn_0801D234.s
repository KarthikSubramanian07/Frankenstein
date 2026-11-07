fn_0801D234:
 801d234:	b5f0      	push	{r4, r5, r6, r7, lr}
 801d236:	4e2b      	ldr	r6, [pc, #172]	@ (801d2e4 <fn_0801D234+0xb0>)
 801d238:	4a2b      	ldr	r2, [pc, #172]	@ (801d2e8 <fn_0801D234+0xb4>)
 801d23a:	6833      	ldr	r3, [r6, #0]
 801d23c:	b085      	sub	sp, #20
 801d23e:	5098      	str	r0, [r3, r2]
 801d240:	2200      	movs	r2, #0
 801d242:	492a      	ldr	r1, [pc, #168]	@ (801d2ec <fn_0801D234+0xb8>)
 801d244:	505a      	str	r2, [r3, r1]
 801d246:	492a      	ldr	r1, [pc, #168]	@ (801d2f0 <fn_0801D234+0xbc>)
 801d248:	505a      	str	r2, [r3, r1]
 801d24a:	492a      	ldr	r1, [pc, #168]	@ (801d2f4 <fn_0801D234+0xc0>)
 801d24c:	505a      	str	r2, [r3, r1]
 801d24e:	0001      	movs	r1, r0
 801d250:	4a29      	ldr	r2, [pc, #164]	@ (801d2f8 <fn_0801D234+0xc4>)
 801d252:	3124      	adds	r1, #36	@ 0x24
 801d254:	5099      	str	r1, [r3, r2]
 801d256:	6902      	ldr	r2, [r0, #16]
 801d258:	2a00      	cmp	r2, #0
 801d25a:	d101      	bne.n	801d260 <fn_0801D234+0x2c>
 801d25c:	3201      	adds	r2, #1
 801d25e:	6102      	str	r2, [r0, #16]
 801d260:	6942      	ldr	r2, [r0, #20]
 801d262:	2a00      	cmp	r2, #0
 801d264:	d101      	bne.n	801d26a <fn_0801D234+0x36>
 801d266:	3201      	adds	r2, #1
 801d268:	6142      	str	r2, [r0, #20]
 801d26a:	2294      	movs	r2, #148	@ 0x94
 801d26c:	5c9b      	ldrb	r3, [r3, r2]
 801d26e:	2b03      	cmp	r3, #3
 801d270:	d002      	beq.n	801d278 <fn_0801D234+0x44>
 801d272:	6803      	ldr	r3, [r0, #0]
 801d274:	2b02      	cmp	r3, #2
 801d276:	dc31      	bgt.n	801d2dc <fn_0801D234+0xa8>
 801d278:	2400      	movs	r4, #0
 801d27a:	4f20      	ldr	r7, [pc, #128]	@ (801d2fc <fn_0801D234+0xc8>)
 801d27c:	0023      	movs	r3, r4
 801d27e:	003a      	movs	r2, r7
 801d280:	2109      	movs	r1, #9
 801d282:	a801      	add	r0, sp, #4
 801d284:	f7e8 f8e8 	bl	8005458 <fn_08005458>
 801d288:	a801      	add	r0, sp, #4
 801d28a:	f000 f8f9 	bl	801d480 <fn_0801D480>
 801d28e:	f000 f96b 	bl	801d568 <fn_0801D568>
 801d292:	4b1b      	ldr	r3, [pc, #108]	@ (801d300 <fn_0801D234+0xcc>)
 801d294:	6835      	ldr	r5, [r6, #0]
 801d296:	18e3      	adds	r3, r4, r3
 801d298:	009b      	lsls	r3, r3, #2
 801d29a:	3401      	adds	r4, #1
 801d29c:	50e8      	str	r0, [r5, r3]
 801d29e:	2c0a      	cmp	r4, #10
 801d2a0:	d1ec      	bne.n	801d27c <fn_0801D234+0x48>
 801d2a2:	2300      	movs	r3, #0
 801d2a4:	4a17      	ldr	r2, [pc, #92]	@ (801d304 <fn_0801D234+0xd0>)
 801d2a6:	54ab      	strb	r3, [r5, r2]
 801d2a8:	4a10      	ldr	r2, [pc, #64]	@ (801d2ec <fn_0801D234+0xb8>)
 801d2aa:	50ab      	str	r3, [r5, r2]
 801d2ac:	2201      	movs	r2, #1
 801d2ae:	4b16      	ldr	r3, [pc, #88]	@ (801d308 <fn_0801D234+0xd4>)
 801d2b0:	50ea      	str	r2, [r5, r3]
 801d2b2:	2301      	movs	r3, #1
 801d2b4:	4a15      	ldr	r2, [pc, #84]	@ (801d30c <fn_0801D234+0xd8>)
 801d2b6:	425b      	negs	r3, r3
 801d2b8:	50ab      	str	r3, [r5, r2]
 801d2ba:	4a15      	ldr	r2, [pc, #84]	@ (801d310 <fn_0801D234+0xdc>)
 801d2bc:	50ab      	str	r3, [r5, r2]
 801d2be:	4a15      	ldr	r2, [pc, #84]	@ (801d314 <fn_0801D234+0xe0>)
 801d2c0:	50ab      	str	r3, [r5, r2]
 801d2c2:	4a15      	ldr	r2, [pc, #84]	@ (801d318 <fn_0801D234+0xe4>)
 801d2c4:	50ab      	str	r3, [r5, r2]
 801d2c6:	4a15      	ldr	r2, [pc, #84]	@ (801d31c <fn_0801D234+0xe8>)
 801d2c8:	50ab      	str	r3, [r5, r2]
 801d2ca:	4a15      	ldr	r2, [pc, #84]	@ (801d320 <fn_0801D234+0xec>)
 801d2cc:	50ab      	str	r3, [r5, r2]
 801d2ce:	2223      	movs	r2, #35	@ 0x23
 801d2d0:	4b14      	ldr	r3, [pc, #80]	@ (801d324 <fn_0801D234+0xf0>)
 801d2d2:	50ea      	str	r2, [r5, r3]
 801d2d4:	b005      	add	sp, #20
 801d2d6:	bcf0      	pop	{r4, r5, r6, r7}
 801d2d8:	bc01      	pop	{r0}
 801d2da:	4700      	bx	r0
 801d2dc:	3b03      	subs	r3, #3
 801d2de:	6003      	str	r3, [r0, #0]
 801d2e0:	e7ca      	b.n	801d278 <fn_0801D234+0x44>
 801d2e2:	46c0      	nop			@ (mov r8, r8)
 801d2e4:	030064c4 	.word	0x030064c4
 801d2e8:	00005a40 	.word	0x00005a40
 801d2ec:	00005a38 	.word	0x00005a38
 801d2f0:	00005a4c 	.word	0x00005a4c
 801d2f4:	00005a48 	.word	0x00005a48
 801d2f8:	00005a44 	.word	0x00005a44
 801d2fc:	0814a970 	.word	0x0814a970
 801d300:	00001698 	.word	0x00001698
 801d304:	00005a3c 	.word	0x00005a3c
 801d308:	00005a88 	.word	0x00005a88
 801d30c:	00005a8c 	.word	0x00005a8c
 801d310:	00005a94 	.word	0x00005a94
 801d314:	00005a90 	.word	0x00005a90
 801d318:	00005a54 	.word	0x00005a54
 801d31c:	00005a58 	.word	0x00005a58
 801d320:	00005a50 	.word	0x00005a50
 801d324:	00005a5c 	.word	0x00005a5c
