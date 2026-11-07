fn_0801D2E4:
 801d2e4:	b5f0      	push	{r4, r5, r6, r7, lr}
 801d2e6:	4e2b      	ldr	r6, [pc, #172]	@ (801d394 <fn_0801D2E4+0xb0>)
 801d2e8:	4a2b      	ldr	r2, [pc, #172]	@ (801d398 <fn_0801D2E4+0xb4>)
 801d2ea:	6833      	ldr	r3, [r6, #0]
 801d2ec:	b085      	sub	sp, #20
 801d2ee:	5098      	str	r0, [r3, r2]
 801d2f0:	2200      	movs	r2, #0
 801d2f2:	492a      	ldr	r1, [pc, #168]	@ (801d39c <fn_0801D2E4+0xb8>)
 801d2f4:	505a      	str	r2, [r3, r1]
 801d2f6:	492a      	ldr	r1, [pc, #168]	@ (801d3a0 <fn_0801D2E4+0xbc>)
 801d2f8:	505a      	str	r2, [r3, r1]
 801d2fa:	492a      	ldr	r1, [pc, #168]	@ (801d3a4 <fn_0801D2E4+0xc0>)
 801d2fc:	505a      	str	r2, [r3, r1]
 801d2fe:	0001      	movs	r1, r0
 801d300:	4a29      	ldr	r2, [pc, #164]	@ (801d3a8 <fn_0801D2E4+0xc4>)
 801d302:	3124      	adds	r1, #36	@ 0x24
 801d304:	5099      	str	r1, [r3, r2]
 801d306:	6902      	ldr	r2, [r0, #16]
 801d308:	2a00      	cmp	r2, #0
 801d30a:	d101      	bne.n	801d310 <fn_0801D2E4+0x2c>
 801d30c:	3201      	adds	r2, #1
 801d30e:	6102      	str	r2, [r0, #16]
 801d310:	6942      	ldr	r2, [r0, #20]
 801d312:	2a00      	cmp	r2, #0
 801d314:	d101      	bne.n	801d31a <fn_0801D2E4+0x36>
 801d316:	3201      	adds	r2, #1
 801d318:	6142      	str	r2, [r0, #20]
 801d31a:	2294      	movs	r2, #148	@ 0x94
 801d31c:	5c9b      	ldrb	r3, [r3, r2]
 801d31e:	2b03      	cmp	r3, #3
 801d320:	d002      	beq.n	801d328 <fn_0801D2E4+0x44>
 801d322:	6803      	ldr	r3, [r0, #0]
 801d324:	2b02      	cmp	r3, #2
 801d326:	dc31      	bgt.n	801d38c <fn_0801D2E4+0xa8>
 801d328:	2400      	movs	r4, #0
 801d32a:	4f20      	ldr	r7, [pc, #128]	@ (801d3ac <fn_0801D2E4+0xc8>)
 801d32c:	0023      	movs	r3, r4
 801d32e:	003a      	movs	r2, r7
 801d330:	2109      	movs	r1, #9
 801d332:	a801      	add	r0, sp, #4
 801d334:	f7e8 f890 	bl	8005458 <fn_08005458>
 801d338:	a801      	add	r0, sp, #4
 801d33a:	f000 f8f9 	bl	801d530 <fn_0801D530>
 801d33e:	f000 f96b 	bl	801d618 <fn_0801D618>
 801d342:	4b1b      	ldr	r3, [pc, #108]	@ (801d3b0 <fn_0801D2E4+0xcc>)
 801d344:	6835      	ldr	r5, [r6, #0]
 801d346:	18e3      	adds	r3, r4, r3
 801d348:	009b      	lsls	r3, r3, #2
 801d34a:	3401      	adds	r4, #1
 801d34c:	50e8      	str	r0, [r5, r3]
 801d34e:	2c0a      	cmp	r4, #10
 801d350:	d1ec      	bne.n	801d32c <fn_0801D2E4+0x48>
 801d352:	2300      	movs	r3, #0
 801d354:	4a17      	ldr	r2, [pc, #92]	@ (801d3b4 <fn_0801D2E4+0xd0>)
 801d356:	54ab      	strb	r3, [r5, r2]
 801d358:	4a10      	ldr	r2, [pc, #64]	@ (801d39c <fn_0801D2E4+0xb8>)
 801d35a:	50ab      	str	r3, [r5, r2]
 801d35c:	2201      	movs	r2, #1
 801d35e:	4b16      	ldr	r3, [pc, #88]	@ (801d3b8 <fn_0801D2E4+0xd4>)
 801d360:	50ea      	str	r2, [r5, r3]
 801d362:	2301      	movs	r3, #1
 801d364:	4a15      	ldr	r2, [pc, #84]	@ (801d3bc <fn_0801D2E4+0xd8>)
 801d366:	425b      	negs	r3, r3
 801d368:	50ab      	str	r3, [r5, r2]
 801d36a:	4a15      	ldr	r2, [pc, #84]	@ (801d3c0 <fn_0801D2E4+0xdc>)
 801d36c:	50ab      	str	r3, [r5, r2]
 801d36e:	4a15      	ldr	r2, [pc, #84]	@ (801d3c4 <fn_0801D2E4+0xe0>)
 801d370:	50ab      	str	r3, [r5, r2]
 801d372:	4a15      	ldr	r2, [pc, #84]	@ (801d3c8 <fn_0801D2E4+0xe4>)
 801d374:	50ab      	str	r3, [r5, r2]
 801d376:	4a15      	ldr	r2, [pc, #84]	@ (801d3cc <fn_0801D2E4+0xe8>)
 801d378:	50ab      	str	r3, [r5, r2]
 801d37a:	4a15      	ldr	r2, [pc, #84]	@ (801d3d0 <fn_0801D2E4+0xec>)
 801d37c:	50ab      	str	r3, [r5, r2]
 801d37e:	2223      	movs	r2, #35	@ 0x23
 801d380:	4b14      	ldr	r3, [pc, #80]	@ (801d3d4 <fn_0801D2E4+0xf0>)
 801d382:	50ea      	str	r2, [r5, r3]
 801d384:	b005      	add	sp, #20
 801d386:	bcf0      	pop	{r4, r5, r6, r7}
 801d388:	bc01      	pop	{r0}
 801d38a:	4700      	bx	r0
 801d38c:	3b03      	subs	r3, #3
 801d38e:	6003      	str	r3, [r0, #0]
 801d390:	e7ca      	b.n	801d328 <fn_0801D2E4+0x44>
 801d392:	46c0      	nop			@ (mov r8, r8)
 801d394:	030064c4 	.word	0x030064c4
 801d398:	00005a40 	.word	0x00005a40
 801d39c:	00005a38 	.word	0x00005a38
 801d3a0:	00005a4c 	.word	0x00005a4c
 801d3a4:	00005a48 	.word	0x00005a48
 801d3a8:	00005a44 	.word	0x00005a44
 801d3ac:	0814aa44 	.word	0x0814aa44
 801d3b0:	00001698 	.word	0x00001698
 801d3b4:	00005a3c 	.word	0x00005a3c
 801d3b8:	00005a88 	.word	0x00005a88
 801d3bc:	00005a8c 	.word	0x00005a8c
 801d3c0:	00005a94 	.word	0x00005a94
 801d3c4:	00005a90 	.word	0x00005a90
 801d3c8:	00005a54 	.word	0x00005a54
 801d3cc:	00005a58 	.word	0x00005a58
 801d3d0:	00005a50 	.word	0x00005a50
 801d3d4:	00005a5c 	.word	0x00005a5c
