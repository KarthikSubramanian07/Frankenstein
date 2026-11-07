fn_0800E2CC:
 800e2cc:	4b17      	ldr	r3, [pc, #92]	@ (800e32c <fn_0800E2CC+0x60>)
 800e2ce:	b570      	push	{r4, r5, r6, lr}
 800e2d0:	681c      	ldr	r4, [r3, #0]
 800e2d2:	4b17      	ldr	r3, [pc, #92]	@ (800e330 <fn_0800E2CC+0x64>)
 800e2d4:	58e1      	ldr	r1, [r4, r3]
 800e2d6:	4281      	cmp	r1, r0
 800e2d8:	d023      	beq.n	800e322 <fn_0800E2CC+0x56>
 800e2da:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 800e2dc:	075b      	lsls	r3, r3, #29
 800e2de:	d520      	bpl.n	800e322 <fn_0800E2CC+0x56>
 800e2e0:	235b      	movs	r3, #91	@ 0x5b
 800e2e2:	2589      	movs	r5, #137	@ 0x89
 800e2e4:	5cc2      	ldrb	r2, [r0, r3]
 800e2e6:	5ccb      	ldrb	r3, [r1, r3]
 800e2e8:	012d      	lsls	r5, r5, #4
 800e2ea:	5965      	ldr	r5, [r4, r5]
 800e2ec:	189b      	adds	r3, r3, r2
 800e2ee:	68c2      	ldr	r2, [r0, #12]
 800e2f0:	1b52      	subs	r2, r2, r5
 800e2f2:	17d5      	asrs	r5, r2, #31
 800e2f4:	1952      	adds	r2, r2, r5
 800e2f6:	041b      	lsls	r3, r3, #16
 800e2f8:	406a      	eors	r2, r5
 800e2fa:	4293      	cmp	r3, r2
 800e2fc:	dd11      	ble.n	800e322 <fn_0800E2CC+0x56>
 800e2fe:	4d0d      	ldr	r5, [pc, #52]	@ (800e334 <fn_0800E2CC+0x68>)
 800e300:	6902      	ldr	r2, [r0, #16]
 800e302:	5965      	ldr	r5, [r4, r5]
 800e304:	1b52      	subs	r2, r2, r5
 800e306:	17d5      	asrs	r5, r2, #31
 800e308:	1952      	adds	r2, r2, r5
 800e30a:	406a      	eors	r2, r5
 800e30c:	4293      	cmp	r3, r2
 800e30e:	dd08      	ble.n	800e322 <fn_0800E2CC+0x56>
 800e310:	4b09      	ldr	r3, [pc, #36]	@ (800e338 <fn_0800E2CC+0x6c>)
 800e312:	5ce4      	ldrb	r4, [r4, r3]
 800e314:	2c00      	cmp	r4, #0
 800e316:	d005      	beq.n	800e324 <fn_0800E2CC+0x58>
 800e318:	000a      	movs	r2, r1
 800e31a:	4b08      	ldr	r3, [pc, #32]	@ (800e33c <fn_0800E2CC+0x70>)
 800e31c:	f7ff fb4e 	bl	800d9bc <fn_0800D9BC>
 800e320:	e000      	b.n	800e324 <fn_0800E2CC+0x58>
 800e322:	2401      	movs	r4, #1
 800e324:	0020      	movs	r0, r4
 800e326:	bc70      	pop	{r4, r5, r6}
 800e328:	bc02      	pop	{r1}
 800e32a:	4708      	bx	r1
 800e32c:	030064c4 	.word	0x030064c4	@ data_030064C4
 800e330:	0000088c 	.word	0x0000088c
 800e334:	00000894 	.word	0x00000894
 800e338:	00000928 	.word	0x00000928
 800e33c:	00002710 	.word	0x00002710
