fn_0800607C:
 800607c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800607e:	46de      	mov	lr, fp
 8006080:	4657      	mov	r7, sl
 8006082:	4645      	mov	r5, r8
 8006084:	464e      	mov	r6, r9
 8006086:	b5e0      	push	{r5, r6, r7, lr}
 8006088:	482b      	ldr	r0, [pc, #172]	@ (8006138 <fn_0800607C+0xbc>)
 800608a:	b083      	sub	sp, #12
 800608c:	f017 f9f8 	bl	801d480 <fn_0801D480>
 8006090:	2200      	movs	r2, #0
 8006092:	0003      	movs	r3, r0
 8006094:	2108      	movs	r1, #8
 8006096:	2048      	movs	r0, #72	@ 0x48
 8006098:	f016 f84a 	bl	801c130 <fn_0801C130>
 800609c:	4b27      	ldr	r3, [pc, #156]	@ (800613c <fn_0800607C+0xc0>)
 800609e:	9301      	str	r3, [sp, #4]
 80060a0:	231b      	movs	r3, #27
 80060a2:	469a      	mov	sl, r3
 80060a4:	4b26      	ldr	r3, [pc, #152]	@ (8006140 <fn_0800607C+0xc4>)
 80060a6:	469b      	mov	fp, r3
 80060a8:	4b26      	ldr	r3, [pc, #152]	@ (8006144 <fn_0800607C+0xc8>)
 80060aa:	2703      	movs	r7, #3
 80060ac:	4698      	mov	r8, r3
 80060ae:	4650      	mov	r0, sl
 80060b0:	f7ff ffb4 	bl	800601c <fn_0800601C>
 80060b4:	465b      	mov	r3, fp
 80060b6:	9a01      	ldr	r2, [sp, #4]
 80060b8:	681b      	ldr	r3, [r3, #0]
 80060ba:	189c      	adds	r4, r3, r2
 80060bc:	5c9b      	ldrb	r3, [r3, r2]
 80060be:	4656      	mov	r6, sl
 80060c0:	1e1a      	subs	r2, r3, #0
 80060c2:	d025      	beq.n	8006110 <fn_0800607C+0x94>
 80060c4:	2540      	movs	r5, #64	@ 0x40
 80060c6:	3401      	adds	r4, #1
 80060c8:	e004      	b.n	80060d4 <fn_0800607C+0x58>
 80060ca:	3504      	adds	r5, #4
 80060cc:	7823      	ldrb	r3, [r4, #0]
 80060ce:	3401      	adds	r4, #1
 80060d0:	1e1a      	subs	r2, r3, #0
 80060d2:	d01d      	beq.n	8006110 <fn_0800607C+0x94>
 80060d4:	2b0a      	cmp	r3, #10
 80060d6:	d02c      	beq.n	8006132 <fn_0800607C+0xb6>
 80060d8:	4641      	mov	r1, r8
 80060da:	5cc9      	ldrb	r1, [r1, r3]
 80060dc:	4039      	ands	r1, r7
 80060de:	2902      	cmp	r1, #2
 80060e0:	d101      	bne.n	80060e6 <fn_0800607C+0x6a>
 80060e2:	3b20      	subs	r3, #32
 80060e4:	001a      	movs	r2, r3
 80060e6:	0013      	movs	r3, r2
 80060e8:	3b21      	subs	r3, #33	@ 0x21
 80060ea:	2b3e      	cmp	r3, #62	@ 0x3e
 80060ec:	d8ed      	bhi.n	80060ca <fn_0800607C+0x4e>
 80060ee:	465b      	mov	r3, fp
 80060f0:	3277      	adds	r2, #119	@ 0x77
 80060f2:	681b      	ldr	r3, [r3, #0]
 80060f4:	0092      	lsls	r2, r2, #2
 80060f6:	189b      	adds	r3, r3, r2
 80060f8:	685a      	ldr	r2, [r3, #4]
 80060fa:	2100      	movs	r1, #0
 80060fc:	5e53      	ldrsh	r3, [r2, r1]
 80060fe:	0028      	movs	r0, r5
 8006100:	0031      	movs	r1, r6
 8006102:	18ed      	adds	r5, r5, r3
 8006104:	f01f fa10 	bl	8025528 <fn_08025528>
 8006108:	7823      	ldrb	r3, [r4, #0]
 800610a:	3401      	adds	r4, #1
 800610c:	1e1a      	subs	r2, r3, #0
 800610e:	d1e1      	bne.n	80060d4 <fn_0800607C+0x58>
 8006110:	230d      	movs	r3, #13
 8006112:	449a      	add	sl, r3
 8006114:	9b01      	ldr	r3, [sp, #4]
 8006116:	3308      	adds	r3, #8
 8006118:	9301      	str	r3, [sp, #4]
 800611a:	4653      	mov	r3, sl
 800611c:	2b83      	cmp	r3, #131	@ 0x83
 800611e:	d1c6      	bne.n	80060ae <fn_0800607C+0x32>
 8006120:	b003      	add	sp, #12
 8006122:	bcf0      	pop	{r4, r5, r6, r7}
 8006124:	46bb      	mov	fp, r7
 8006126:	46b2      	mov	sl, r6
 8006128:	46a9      	mov	r9, r5
 800612a:	46a0      	mov	r8, r4
 800612c:	bcf0      	pop	{r4, r5, r6, r7}
 800612e:	bc01      	pop	{r0}
 8006130:	4700      	bx	r0
 8006132:	2540      	movs	r5, #64	@ 0x40
 8006134:	360c      	adds	r6, #12
 8006136:	e7c9      	b.n	80060cc <fn_0800607C+0x50>
 8006138:	08149ecc 	.word	0x08149ecc
 800613c:	00000794 	.word	0x00000794
 8006140:	030064c4 	.word	0x030064c4
 8006144:	0814b3b9 	.word	0x0814b3b9
