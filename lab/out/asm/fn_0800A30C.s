fn_0800A30C:
 800a30c:	b570      	push	{r4, r5, r6, lr}
 800a30e:	0004      	movs	r4, r0
 800a310:	f7fc fbf6 	bl	8006b00 <fn_08006B00>
 800a314:	68e5      	ldr	r5, [r4, #12]
 800a316:	0006      	movs	r6, r0
 800a318:	f7fc fbf2 	bl	8006b00 <fn_08006B00>
 800a31c:	1a30      	subs	r0, r6, r0
 800a31e:	02c0      	lsls	r0, r0, #11
 800a320:	6924      	ldr	r4, [r4, #16]
 800a322:	1945      	adds	r5, r0, r5
 800a324:	f7fc fbec 	bl	8006b00 <fn_08006B00>
 800a328:	0442      	lsls	r2, r0, #17
 800a32a:	2321      	movs	r3, #33	@ 0x21
 800a32c:	3280      	adds	r2, #128	@ 0x80
 800a32e:	0021      	movs	r1, r4
 800a330:	0028      	movs	r0, r5
 800a332:	f006 fd5b 	bl	8010dec <fn_08010DEC>
 800a336:	0004      	movs	r4, r0
 800a338:	f7fc fbe2 	bl	8006b00 <fn_08006B00>
 800a33c:	0240      	lsls	r0, r0, #9
 800a33e:	6460      	str	r0, [r4, #68]	@ 0x44
 800a340:	490a      	ldr	r1, [pc, #40]	@ (800a36c <fn_0800A30C+0x60>)
 800a342:	0020      	movs	r0, r4
 800a344:	f006 ff62 	bl	801120c <fn_0801120C>
 800a348:	f7fc fbda 	bl	8006b00 <fn_08006B00>
 800a34c:	2307      	movs	r3, #7
 800a34e:	2256      	movs	r2, #86	@ 0x56
 800a350:	4003      	ands	r3, r0
 800a352:	5aa0      	ldrh	r0, [r4, r2]
 800a354:	1ac0      	subs	r0, r0, r3
 800a356:	1c03      	adds	r3, r0, #0
 800a358:	0400      	lsls	r0, r0, #16
 800a35a:	1400      	asrs	r0, r0, #16
 800a35c:	2800      	cmp	r0, #0
 800a35e:	dc00      	bgt.n	800a362 <fn_0800A30C+0x56>
 800a360:	2301      	movs	r3, #1
 800a362:	2256      	movs	r2, #86	@ 0x56
 800a364:	52a3      	strh	r3, [r4, r2]
 800a366:	bc70      	pop	{r4, r5, r6}
 800a368:	bc01      	pop	{r0}
 800a36a:	4700      	bx	r0
 800a36c:	0000031f 	.word	0x0000031f
