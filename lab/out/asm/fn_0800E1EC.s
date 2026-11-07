fn_0800E1EC:
 800e1ec:	b5f0      	push	{r4, r5, r6, r7, lr}
 800e1ee:	46de      	mov	lr, fp
 800e1f0:	4657      	mov	r7, sl
 800e1f2:	464e      	mov	r6, r9
 800e1f4:	4645      	mov	r5, r8
 800e1f6:	2380      	movs	r3, #128	@ 0x80
 800e1f8:	b5e0      	push	{r5, r6, r7, lr}
 800e1fa:	b083      	sub	sp, #12
 800e1fc:	9001      	str	r0, [sp, #4]
 800e1fe:	025b      	lsls	r3, r3, #9
 800e200:	4299      	cmp	r1, r3
 800e202:	dd5c      	ble.n	800e2be <fn_0800E1EC+0xd2>
 800e204:	9300      	str	r3, [sp, #0]
 800e206:	2301      	movs	r3, #1
 800e208:	425b      	negs	r3, r3
 800e20a:	469b      	mov	fp, r3
 800e20c:	4b2e      	ldr	r3, [pc, #184]	@ (800e2c8 <fn_0800E1EC+0xdc>)
 800e20e:	4699      	mov	r9, r3
 800e210:	2326      	movs	r3, #38	@ 0x26
 800e212:	4659      	mov	r1, fp
 800e214:	9801      	ldr	r0, [sp, #4]
 800e216:	469a      	mov	sl, r3
 800e218:	f006 ff34 	bl	8015084 <fn_08015084>
 800e21c:	4683      	mov	fp, r0
 800e21e:	2800      	cmp	r0, #0
 800e220:	db43      	blt.n	800e2aa <fn_0800E1EC+0xbe>
 800e222:	464b      	mov	r3, r9
 800e224:	21df      	movs	r1, #223	@ 0xdf
 800e226:	681a      	ldr	r2, [r3, #0]
 800e228:	465b      	mov	r3, fp
 800e22a:	0109      	lsls	r1, r1, #4
 800e22c:	009b      	lsls	r3, r3, #2
 800e22e:	5855      	ldr	r5, [r2, r1]
 800e230:	445b      	add	r3, fp
 800e232:	00db      	lsls	r3, r3, #3
 800e234:	18ed      	adds	r5, r5, r3
 800e236:	4653      	mov	r3, sl
 800e238:	5cee      	ldrb	r6, [r5, r3]
 800e23a:	211e      	movs	r1, #30
 800e23c:	5e6b      	ldrsh	r3, [r5, r1]
 800e23e:	2700      	movs	r7, #0
 800e240:	2b00      	cmp	r3, #0
 800e242:	dd22      	ble.n	800e28a <fn_0800E1EC+0x9e>
 800e244:	23e0      	movs	r3, #224	@ 0xe0
 800e246:	011b      	lsls	r3, r3, #4
 800e248:	2400      	movs	r4, #0
 800e24a:	4698      	mov	r8, r3
 800e24c:	e001      	b.n	800e252 <fn_0800E1EC+0x66>
 800e24e:	464b      	mov	r3, r9
 800e250:	681a      	ldr	r2, [r3, #0]
 800e252:	69ab      	ldr	r3, [r5, #24]
 800e254:	0061      	lsls	r1, r4, #1
 800e256:	5acb      	ldrh	r3, [r1, r3]
 800e258:	4641      	mov	r1, r8
 800e25a:	5850      	ldr	r0, [r2, r1]
 800e25c:	015b      	lsls	r3, r3, #5
 800e25e:	0029      	movs	r1, r5
 800e260:	18c0      	adds	r0, r0, r3
 800e262:	f006 f99d 	bl	80145a0 <fn_080145A0>
 800e266:	2800      	cmp	r0, #0
 800e268:	d007      	beq.n	800e27a <fn_0800E1EC+0x8e>
 800e26a:	4653      	mov	r3, sl
 800e26c:	5cc3      	ldrb	r3, [r0, r3]
 800e26e:	429f      	cmp	r7, r3
 800e270:	da00      	bge.n	800e274 <fn_0800E1EC+0x88>
 800e272:	001f      	movs	r7, r3
 800e274:	429e      	cmp	r6, r3
 800e276:	dd00      	ble.n	800e27a <fn_0800E1EC+0x8e>
 800e278:	001e      	movs	r6, r3
 800e27a:	221e      	movs	r2, #30
 800e27c:	5eab      	ldrsh	r3, [r5, r2]
 800e27e:	3401      	adds	r4, #1
 800e280:	42a3      	cmp	r3, r4
 800e282:	dce4      	bgt.n	800e24e <fn_0800E1EC+0x62>
 800e284:	9b00      	ldr	r3, [sp, #0]
 800e286:	437b      	muls	r3, r7
 800e288:	001f      	movs	r7, r3
 800e28a:	2380      	movs	r3, #128	@ 0x80
 800e28c:	9a00      	ldr	r2, [sp, #0]
 800e28e:	025b      	lsls	r3, r3, #9
 800e290:	1a9b      	subs	r3, r3, r2
 800e292:	435e      	muls	r6, r3
 800e294:	4653      	mov	r3, sl
 800e296:	19f6      	adds	r6, r6, r7
 800e298:	1436      	asrs	r6, r6, #16
 800e29a:	4659      	mov	r1, fp
 800e29c:	54ee      	strb	r6, [r5, r3]
 800e29e:	9801      	ldr	r0, [sp, #4]
 800e2a0:	f006 fef0 	bl	8015084 <fn_08015084>
 800e2a4:	4683      	mov	fp, r0
 800e2a6:	2800      	cmp	r0, #0
 800e2a8:	dabb      	bge.n	800e222 <fn_0800E1EC+0x36>
 800e2aa:	2001      	movs	r0, #1
 800e2ac:	b003      	add	sp, #12
 800e2ae:	bcf0      	pop	{r4, r5, r6, r7}
 800e2b0:	46bb      	mov	fp, r7
 800e2b2:	46b2      	mov	sl, r6
 800e2b4:	46a9      	mov	r9, r5
 800e2b6:	46a0      	mov	r8, r4
 800e2b8:	bcf0      	pop	{r4, r5, r6, r7}
 800e2ba:	bc02      	pop	{r1}
 800e2bc:	4708      	bx	r1
 800e2be:	43cb      	mvns	r3, r1
 800e2c0:	17db      	asrs	r3, r3, #31
 800e2c2:	4019      	ands	r1, r3
 800e2c4:	9100      	str	r1, [sp, #0]
 800e2c6:	e79e      	b.n	800e206 <fn_0800E1EC+0x1a>
 800e2c8:	030064c4 	.word	0x030064c4	@ data_030064C4
