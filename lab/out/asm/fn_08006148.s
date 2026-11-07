fn_08006148:
 8006148:	b5f0      	push	{r4, r5, r6, r7, lr}
 800614a:	46de      	mov	lr, fp
 800614c:	4657      	mov	r7, sl
 800614e:	4645      	mov	r5, r8
 8006150:	464e      	mov	r6, r9
 8006152:	b5e0      	push	{r5, r6, r7, lr}
 8006154:	482b      	ldr	r0, [pc, #172]	@ (8006204 <fn_08006148+0xbc>)
 8006156:	b083      	sub	sp, #12
 8006158:	f017 f992 	bl	801d480 <fn_0801D480>
 800615c:	2200      	movs	r2, #0
 800615e:	0003      	movs	r3, r0
 8006160:	2108      	movs	r1, #8
 8006162:	2048      	movs	r0, #72	@ 0x48
 8006164:	f015 ffe4 	bl	801c130 <fn_0801C130>
 8006168:	4b27      	ldr	r3, [pc, #156]	@ (8006208 <fn_08006148+0xc0>)
 800616a:	9301      	str	r3, [sp, #4]
 800616c:	231b      	movs	r3, #27
 800616e:	469a      	mov	sl, r3
 8006170:	4b26      	ldr	r3, [pc, #152]	@ (800620c <fn_08006148+0xc4>)
 8006172:	469b      	mov	fp, r3
 8006174:	4b26      	ldr	r3, [pc, #152]	@ (8006210 <fn_08006148+0xc8>)
 8006176:	2703      	movs	r7, #3
 8006178:	4698      	mov	r8, r3
 800617a:	4650      	mov	r0, sl
 800617c:	f7ff ff4e 	bl	800601c <fn_0800601C>
 8006180:	465b      	mov	r3, fp
 8006182:	9a01      	ldr	r2, [sp, #4]
 8006184:	681b      	ldr	r3, [r3, #0]
 8006186:	189c      	adds	r4, r3, r2
 8006188:	5c9b      	ldrb	r3, [r3, r2]
 800618a:	4656      	mov	r6, sl
 800618c:	1e1a      	subs	r2, r3, #0
 800618e:	d025      	beq.n	80061dc <fn_08006148+0x94>
 8006190:	2540      	movs	r5, #64	@ 0x40
 8006192:	3401      	adds	r4, #1
 8006194:	e004      	b.n	80061a0 <fn_08006148+0x58>
 8006196:	3504      	adds	r5, #4
 8006198:	7823      	ldrb	r3, [r4, #0]
 800619a:	3401      	adds	r4, #1
 800619c:	1e1a      	subs	r2, r3, #0
 800619e:	d01d      	beq.n	80061dc <fn_08006148+0x94>
 80061a0:	2b0a      	cmp	r3, #10
 80061a2:	d02c      	beq.n	80061fe <fn_08006148+0xb6>
 80061a4:	4641      	mov	r1, r8
 80061a6:	5cc9      	ldrb	r1, [r1, r3]
 80061a8:	4039      	ands	r1, r7
 80061aa:	2902      	cmp	r1, #2
 80061ac:	d101      	bne.n	80061b2 <fn_08006148+0x6a>
 80061ae:	3b20      	subs	r3, #32
 80061b0:	001a      	movs	r2, r3
 80061b2:	0013      	movs	r3, r2
 80061b4:	3b21      	subs	r3, #33	@ 0x21
 80061b6:	2b3e      	cmp	r3, #62	@ 0x3e
 80061b8:	d8ed      	bhi.n	8006196 <fn_08006148+0x4e>
 80061ba:	465b      	mov	r3, fp
 80061bc:	3277      	adds	r2, #119	@ 0x77
 80061be:	681b      	ldr	r3, [r3, #0]
 80061c0:	0092      	lsls	r2, r2, #2
 80061c2:	189b      	adds	r3, r3, r2
 80061c4:	685a      	ldr	r2, [r3, #4]
 80061c6:	2100      	movs	r1, #0
 80061c8:	5e53      	ldrsh	r3, [r2, r1]
 80061ca:	0028      	movs	r0, r5
 80061cc:	0031      	movs	r1, r6
 80061ce:	18ed      	adds	r5, r5, r3
 80061d0:	f01f f9aa 	bl	8025528 <fn_08025528>
 80061d4:	7823      	ldrb	r3, [r4, #0]
 80061d6:	3401      	adds	r4, #1
 80061d8:	1e1a      	subs	r2, r3, #0
 80061da:	d1e1      	bne.n	80061a0 <fn_08006148+0x58>
 80061dc:	230d      	movs	r3, #13
 80061de:	449a      	add	sl, r3
 80061e0:	9b01      	ldr	r3, [sp, #4]
 80061e2:	3308      	adds	r3, #8
 80061e4:	9301      	str	r3, [sp, #4]
 80061e6:	4653      	mov	r3, sl
 80061e8:	2b83      	cmp	r3, #131	@ 0x83
 80061ea:	d1c6      	bne.n	800617a <fn_08006148+0x32>
 80061ec:	b003      	add	sp, #12
 80061ee:	bcf0      	pop	{r4, r5, r6, r7}
 80061f0:	46bb      	mov	fp, r7
 80061f2:	46b2      	mov	sl, r6
 80061f4:	46a9      	mov	r9, r5
 80061f6:	46a0      	mov	r8, r4
 80061f8:	bcf0      	pop	{r4, r5, r6, r7}
 80061fa:	bc01      	pop	{r0}
 80061fc:	4700      	bx	r0
 80061fe:	2540      	movs	r5, #64	@ 0x40
 8006200:	360c      	adds	r6, #12
 8006202:	e7c9      	b.n	8006198 <fn_08006148+0x50>
 8006204:	08149ed4 	.word	0x08149ed4
 8006208:	00000794 	.word	0x00000794
 800620c:	030064c4 	.word	0x030064c4
 8006210:	0814b3b9 	.word	0x0814b3b9
