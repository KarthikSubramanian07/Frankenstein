fn_0800E58C:
 800e58c:	4b18      	ldr	r3, [pc, #96]	@ (800e5f0 <fn_0800E58C+0x64>)
 800e58e:	681a      	ldr	r2, [r3, #0]
 800e590:	4b18      	ldr	r3, [pc, #96]	@ (800e5f4 <fn_0800E58C+0x68>)
 800e592:	b510      	push	{r4, lr}
 800e594:	0004      	movs	r4, r0
 800e596:	58d0      	ldr	r0, [r2, r3]
 800e598:	235b      	movs	r3, #91	@ 0x5b
 800e59a:	5cc3      	ldrb	r3, [r0, r3]
 800e59c:	68c2      	ldr	r2, [r0, #12]
 800e59e:	041b      	lsls	r3, r3, #16
 800e5a0:	1899      	adds	r1, r3, r2
 800e5a2:	468c      	mov	ip, r1
 800e5a4:	b084      	sub	sp, #16
 800e5a6:	9103      	str	r1, [sp, #12]
 800e5a8:	8a21      	ldrh	r1, [r4, #16]
 800e5aa:	0409      	lsls	r1, r1, #16
 800e5ac:	458c      	cmp	ip, r1
 800e5ae:	dd05      	ble.n	800e5bc <fn_0800E58C+0x30>
 800e5b0:	1ad2      	subs	r2, r2, r3
 800e5b2:	9202      	str	r2, [sp, #8]
 800e5b4:	8a61      	ldrh	r1, [r4, #18]
 800e5b6:	0409      	lsls	r1, r1, #16
 800e5b8:	428a      	cmp	r2, r1
 800e5ba:	db04      	blt.n	800e5c6 <fn_0800E58C+0x3a>
 800e5bc:	2001      	movs	r0, #1
 800e5be:	b004      	add	sp, #16
 800e5c0:	bc10      	pop	{r4}
 800e5c2:	bc02      	pop	{r1}
 800e5c4:	4708      	bx	r1
 800e5c6:	6902      	ldr	r2, [r0, #16]
 800e5c8:	1898      	adds	r0, r3, r2
 800e5ca:	9000      	str	r0, [sp, #0]
 800e5cc:	89e1      	ldrh	r1, [r4, #14]
 800e5ce:	0409      	lsls	r1, r1, #16
 800e5d0:	4288      	cmp	r0, r1
 800e5d2:	ddf3      	ble.n	800e5bc <fn_0800E58C+0x30>
 800e5d4:	1ad2      	subs	r2, r2, r3
 800e5d6:	9201      	str	r2, [sp, #4]
 800e5d8:	89a3      	ldrh	r3, [r4, #12]
 800e5da:	041b      	lsls	r3, r3, #16
 800e5dc:	429a      	cmp	r2, r3
 800e5de:	daed      	bge.n	800e5bc <fn_0800E58C+0x30>
 800e5e0:	0021      	movs	r1, r4
 800e5e2:	4668      	mov	r0, sp
 800e5e4:	f001 fc4a 	bl	800fe7c <fn_0800FE7C>
 800e5e8:	3001      	adds	r0, #1
 800e5ea:	1e43      	subs	r3, r0, #1
 800e5ec:	4198      	sbcs	r0, r3
 800e5ee:	e7e6      	b.n	800e5be <fn_0800E58C+0x32>
 800e5f0:	030064c4 	.word	0x030064c4
 800e5f4:	0000088c 	.word	0x0000088c
