fn_080051BC:
 80051bc:	b5f0      	push	{r4, r5, r6, r7, lr}
 80051be:	4645      	mov	r5, r8
 80051c0:	46de      	mov	lr, fp
 80051c2:	4657      	mov	r7, sl
 80051c4:	464e      	mov	r6, r9
 80051c6:	b5e0      	push	{r5, r6, r7, lr}
 80051c8:	780b      	ldrb	r3, [r1, #0]
 80051ca:	0005      	movs	r5, r0
 80051cc:	000c      	movs	r4, r1
 80051ce:	b085      	sub	sp, #20
 80051d0:	2b00      	cmp	r3, #0
 80051d2:	d04f      	beq.n	8005274 <fn_080051BC+0xb8>
 80051d4:	4690      	mov	r8, r2
 80051d6:	2b25      	cmp	r3, #37	@ 0x25
 80051d8:	d01f      	beq.n	800521a <fn_080051BC+0x5e>
 80051da:	0026      	movs	r6, r4
 80051dc:	7873      	ldrb	r3, [r6, #1]
 80051de:	3601      	adds	r6, #1
 80051e0:	2b00      	cmp	r3, #0
 80051e2:	d001      	beq.n	80051e8 <fn_080051BC+0x2c>
 80051e4:	2b25      	cmp	r3, #37	@ 0x25
 80051e6:	d1f9      	bne.n	80051dc <fn_080051BC+0x20>
 80051e8:	42b4      	cmp	r4, r6
 80051ea:	d014      	beq.n	8005216 <fn_080051BC+0x5a>
 80051ec:	682b      	ldr	r3, [r5, #0]
 80051ee:	1b32      	subs	r2, r6, r4
 80051f0:	2b00      	cmp	r3, #0
 80051f2:	d100      	bne.n	80051f6 <fn_080051BC+0x3a>
 80051f4:	e0e0      	b.n	80053b8 <fn_080051BC+0x1fc>
 80051f6:	3a01      	subs	r2, #1
 80051f8:	18a2      	adds	r2, r4, r2
 80051fa:	e001      	b.n	8005200 <fn_080051BC+0x44>
 80051fc:	682b      	ldr	r3, [r5, #0]
 80051fe:	3401      	adds	r4, #1
 8005200:	6869      	ldr	r1, [r5, #4]
 8005202:	4299      	cmp	r1, r3
 8005204:	d905      	bls.n	8005212 <fn_080051BC+0x56>
 8005206:	1c59      	adds	r1, r3, #1
 8005208:	6029      	str	r1, [r5, #0]
 800520a:	7821      	ldrb	r1, [r4, #0]
 800520c:	7019      	strb	r1, [r3, #0]
 800520e:	4294      	cmp	r4, r2
 8005210:	d1f4      	bne.n	80051fc <fn_080051BC+0x40>
 8005212:	0034      	movs	r4, r6
 8005214:	7833      	ldrb	r3, [r6, #0]
 8005216:	2b00      	cmp	r3, #0
 8005218:	d02c      	beq.n	8005274 <fn_080051BC+0xb8>
 800521a:	7862      	ldrb	r2, [r4, #1]
 800521c:	1c66      	adds	r6, r4, #1
 800521e:	2a2e      	cmp	r2, #46	@ 0x2e
 8005220:	d059      	beq.n	80052d6 <fn_080051BC+0x11a>
 8005222:	2301      	movs	r3, #1
 8005224:	425b      	negs	r3, r3
 8005226:	0027      	movs	r7, r4
 8005228:	4699      	mov	r9, r3
 800522a:	2a73      	cmp	r2, #115	@ 0x73
 800522c:	d02b      	beq.n	8005286 <fn_080051BC+0xca>
 800522e:	2a64      	cmp	r2, #100	@ 0x64
 8005230:	d100      	bne.n	8005234 <fn_080051BC+0x78>
 8005232:	e076      	b.n	8005322 <fn_080051BC+0x166>
 8005234:	682b      	ldr	r3, [r5, #0]
 8005236:	2a25      	cmp	r2, #37	@ 0x25
 8005238:	d068      	beq.n	800530c <fn_080051BC+0x150>
 800523a:	2a00      	cmp	r2, #0
 800523c:	d001      	beq.n	8005242 <fn_080051BC+0x86>
 800523e:	0037      	movs	r7, r6
 8005240:	3601      	adds	r6, #1
 8005242:	1b32      	subs	r2, r6, r4
 8005244:	2b00      	cmp	r3, #0
 8005246:	d100      	bne.n	800524a <fn_080051BC+0x8e>
 8005248:	e0bd      	b.n	80053c6 <fn_080051BC+0x20a>
 800524a:	2a00      	cmp	r2, #0
 800524c:	d00d      	beq.n	800526a <fn_080051BC+0xae>
 800524e:	3a01      	subs	r2, #1
 8005250:	18a2      	adds	r2, r4, r2
 8005252:	e007      	b.n	8005264 <fn_080051BC+0xa8>
 8005254:	1c59      	adds	r1, r3, #1
 8005256:	6029      	str	r1, [r5, #0]
 8005258:	7821      	ldrb	r1, [r4, #0]
 800525a:	7019      	strb	r1, [r3, #0]
 800525c:	4294      	cmp	r4, r2
 800525e:	d004      	beq.n	800526a <fn_080051BC+0xae>
 8005260:	682b      	ldr	r3, [r5, #0]
 8005262:	3401      	adds	r4, #1
 8005264:	6869      	ldr	r1, [r5, #4]
 8005266:	4299      	cmp	r1, r3
 8005268:	d8f4      	bhi.n	8005254 <fn_080051BC+0x98>
 800526a:	0034      	movs	r4, r6
 800526c:	003e      	movs	r6, r7
 800526e:	7873      	ldrb	r3, [r6, #1]
 8005270:	2b00      	cmp	r3, #0
 8005272:	d1b0      	bne.n	80051d6 <fn_080051BC+0x1a>
 8005274:	b005      	add	sp, #20
 8005276:	bcf0      	pop	{r4, r5, r6, r7}
 8005278:	46bb      	mov	fp, r7
 800527a:	46b2      	mov	sl, r6
 800527c:	46a9      	mov	r9, r5
 800527e:	46a0      	mov	r8, r4
 8005280:	bcf0      	pop	{r4, r5, r6, r7}
 8005282:	bc01      	pop	{r0}
 8005284:	4700      	bx	r0
 8005286:	4643      	mov	r3, r8
 8005288:	cb02      	ldmia	r3!, {r1}
 800528a:	4698      	mov	r8, r3
 800528c:	2900      	cmp	r1, #0
 800528e:	d100      	bne.n	8005292 <fn_080051BC+0xd6>
 8005290:	e09e      	b.n	80053d0 <fn_080051BC+0x214>
 8005292:	464a      	mov	r2, r9
 8005294:	2300      	movs	r3, #0
 8005296:	6828      	ldr	r0, [r5, #0]
 8005298:	1c74      	adds	r4, r6, #1
 800529a:	2a00      	cmp	r2, #0
 800529c:	d104      	bne.n	80052a8 <fn_080051BC+0xec>
 800529e:	e0aa      	b.n	80053f6 <fn_080051BC+0x23a>
 80052a0:	1c53      	adds	r3, r2, #1
 80052a2:	4599      	cmp	r9, r3
 80052a4:	d100      	bne.n	80052a8 <fn_080051BC+0xec>
 80052a6:	e080      	b.n	80053aa <fn_080051BC+0x1ee>
 80052a8:	5ccf      	ldrb	r7, [r1, r3]
 80052aa:	001a      	movs	r2, r3
 80052ac:	2f00      	cmp	r7, #0
 80052ae:	d1f7      	bne.n	80052a0 <fn_080051BC+0xe4>
 80052b0:	2800      	cmp	r0, #0
 80052b2:	d07d      	beq.n	80053b0 <fn_080051BC+0x1f4>
 80052b4:	2b00      	cmp	r3, #0
 80052b6:	d0da      	beq.n	800526e <fn_080051BC+0xb2>
 80052b8:	3a01      	subs	r2, #1
 80052ba:	188a      	adds	r2, r1, r2
 80052bc:	e007      	b.n	80052ce <fn_080051BC+0x112>
 80052be:	1c43      	adds	r3, r0, #1
 80052c0:	602b      	str	r3, [r5, #0]
 80052c2:	780b      	ldrb	r3, [r1, #0]
 80052c4:	7003      	strb	r3, [r0, #0]
 80052c6:	4291      	cmp	r1, r2
 80052c8:	d0d1      	beq.n	800526e <fn_080051BC+0xb2>
 80052ca:	6828      	ldr	r0, [r5, #0]
 80052cc:	3101      	adds	r1, #1
 80052ce:	686b      	ldr	r3, [r5, #4]
 80052d0:	4283      	cmp	r3, r0
 80052d2:	d8f4      	bhi.n	80052be <fn_080051BC+0x102>
 80052d4:	e7cb      	b.n	800526e <fn_080051BC+0xb2>
 80052d6:	78a2      	ldrb	r2, [r4, #2]
 80052d8:	0011      	movs	r1, r2
 80052da:	3930      	subs	r1, #48	@ 0x30
 80052dc:	060b      	lsls	r3, r1, #24
 80052de:	1ca0      	adds	r0, r4, #2
 80052e0:	0e1b      	lsrs	r3, r3, #24
 80052e2:	2b09      	cmp	r3, #9
 80052e4:	d876      	bhi.n	80053d4 <fn_080051BC+0x218>
 80052e6:	2300      	movs	r3, #0
 80052e8:	4699      	mov	r9, r3
 80052ea:	0007      	movs	r7, r0
 80052ec:	464b      	mov	r3, r9
 80052ee:	787a      	ldrb	r2, [r7, #1]
 80052f0:	009b      	lsls	r3, r3, #2
 80052f2:	444b      	add	r3, r9
 80052f4:	4689      	mov	r9, r1
 80052f6:	0011      	movs	r1, r2
 80052f8:	005b      	lsls	r3, r3, #1
 80052fa:	3930      	subs	r1, #48	@ 0x30
 80052fc:	4499      	add	r9, r3
 80052fe:	060b      	lsls	r3, r1, #24
 8005300:	3001      	adds	r0, #1
 8005302:	0e1b      	lsrs	r3, r3, #24
 8005304:	2b09      	cmp	r3, #9
 8005306:	d9f0      	bls.n	80052ea <fn_080051BC+0x12e>
 8005308:	0006      	movs	r6, r0
 800530a:	e78e      	b.n	800522a <fn_080051BC+0x6e>
 800530c:	1c74      	adds	r4, r6, #1
 800530e:	2b00      	cmp	r3, #0
 8005310:	d065      	beq.n	80053de <fn_080051BC+0x222>
 8005312:	686a      	ldr	r2, [r5, #4]
 8005314:	429a      	cmp	r2, r3
 8005316:	d9aa      	bls.n	800526e <fn_080051BC+0xb2>
 8005318:	1c5a      	adds	r2, r3, #1
 800531a:	602a      	str	r2, [r5, #0]
 800531c:	7832      	ldrb	r2, [r6, #0]
 800531e:	701a      	strb	r2, [r3, #0]
 8005320:	e7a5      	b.n	800526e <fn_080051BC+0xb2>
 8005322:	4643      	mov	r3, r8
 8005324:	cb04      	ldmia	r3!, {r2}
 8005326:	4693      	mov	fp, r2
 8005328:	4698      	mov	r8, r3
 800532a:	17d3      	asrs	r3, r2, #31
 800532c:	18d7      	adds	r7, r2, r3
 800532e:	405f      	eors	r7, r3
 8005330:	ac04      	add	r4, sp, #16
 8005332:	0038      	movs	r0, r7
 8005334:	210a      	movs	r1, #10
 8005336:	f020 f987 	bl	8025648 <fn_08025648>
 800533a:	3c01      	subs	r4, #1
 800533c:	3130      	adds	r1, #48	@ 0x30
 800533e:	0038      	movs	r0, r7
 8005340:	7021      	strb	r1, [r4, #0]
 8005342:	210a      	movs	r1, #10
 8005344:	f020 f9be 	bl	80256c4 <fn_080256C4>
 8005348:	003b      	movs	r3, r7
 800534a:	0007      	movs	r7, r0
 800534c:	2b09      	cmp	r3, #9
 800534e:	d8f0      	bhi.n	8005332 <fn_080051BC+0x176>
 8005350:	ab04      	add	r3, sp, #16
 8005352:	1b1a      	subs	r2, r3, r4
 8005354:	466b      	mov	r3, sp
 8005356:	2130      	movs	r1, #48	@ 0x30
 8005358:	3305      	adds	r3, #5
 800535a:	4591      	cmp	r9, r2
 800535c:	dc06      	bgt.n	800536c <fn_080051BC+0x1b0>
 800535e:	e007      	b.n	8005370 <fn_080051BC+0x1b4>
 8005360:	3c01      	subs	r4, #1
 8005362:	aa04      	add	r2, sp, #16
 8005364:	7021      	strb	r1, [r4, #0]
 8005366:	1b12      	subs	r2, r2, r4
 8005368:	4591      	cmp	r9, r2
 800536a:	dd01      	ble.n	8005370 <fn_080051BC+0x1b4>
 800536c:	429c      	cmp	r4, r3
 800536e:	d8f7      	bhi.n	8005360 <fn_080051BC+0x1a4>
 8005370:	465b      	mov	r3, fp
 8005372:	2b00      	cmp	r3, #0
 8005374:	da04      	bge.n	8005380 <fn_080051BC+0x1c4>
 8005376:	232d      	movs	r3, #45	@ 0x2d
 8005378:	3c01      	subs	r4, #1
 800537a:	7023      	strb	r3, [r4, #0]
 800537c:	ab04      	add	r3, sp, #16
 800537e:	1b1a      	subs	r2, r3, r4
 8005380:	682b      	ldr	r3, [r5, #0]
 8005382:	2b00      	cmp	r3, #0
 8005384:	d031      	beq.n	80053ea <fn_080051BC+0x22e>
 8005386:	2a00      	cmp	r2, #0
 8005388:	d00d      	beq.n	80053a6 <fn_080051BC+0x1ea>
 800538a:	3a01      	subs	r2, #1
 800538c:	18a2      	adds	r2, r4, r2
 800538e:	e007      	b.n	80053a0 <fn_080051BC+0x1e4>
 8005390:	1c59      	adds	r1, r3, #1
 8005392:	6029      	str	r1, [r5, #0]
 8005394:	7821      	ldrb	r1, [r4, #0]
 8005396:	7019      	strb	r1, [r3, #0]
 8005398:	4294      	cmp	r4, r2
 800539a:	d004      	beq.n	80053a6 <fn_080051BC+0x1ea>
 800539c:	682b      	ldr	r3, [r5, #0]
 800539e:	3401      	adds	r4, #1
 80053a0:	6869      	ldr	r1, [r5, #4]
 80053a2:	4299      	cmp	r1, r3
 80053a4:	d8f4      	bhi.n	8005390 <fn_080051BC+0x1d4>
 80053a6:	1c74      	adds	r4, r6, #1
 80053a8:	e761      	b.n	800526e <fn_080051BC+0xb2>
 80053aa:	464a      	mov	r2, r9
 80053ac:	2800      	cmp	r0, #0
 80053ae:	d183      	bne.n	80052b8 <fn_080051BC+0xfc>
 80053b0:	2001      	movs	r0, #1
 80053b2:	f01c f8cf 	bl	8021554 <fn_08021554>
 80053b6:	e75a      	b.n	800526e <fn_080051BC+0xb2>
 80053b8:	0021      	movs	r1, r4
 80053ba:	2001      	movs	r0, #1
 80053bc:	f01c f8ca 	bl	8021554 <fn_08021554>
 80053c0:	0034      	movs	r4, r6
 80053c2:	7833      	ldrb	r3, [r6, #0]
 80053c4:	e727      	b.n	8005216 <fn_080051BC+0x5a>
 80053c6:	0021      	movs	r1, r4
 80053c8:	2001      	movs	r0, #1
 80053ca:	f01c f8c3 	bl	8021554 <fn_08021554>
 80053ce:	e74c      	b.n	800526a <fn_080051BC+0xae>
 80053d0:	490b      	ldr	r1, [pc, #44]	@ (8005400 <fn_080051BC+0x244>)
 80053d2:	e75e      	b.n	8005292 <fn_080051BC+0xd6>
 80053d4:	2300      	movs	r3, #0
 80053d6:	0037      	movs	r7, r6
 80053d8:	4699      	mov	r9, r3
 80053da:	0006      	movs	r6, r0
 80053dc:	e725      	b.n	800522a <fn_080051BC+0x6e>
 80053de:	2201      	movs	r2, #1
 80053e0:	0031      	movs	r1, r6
 80053e2:	2001      	movs	r0, #1
 80053e4:	f01c f8b6 	bl	8021554 <fn_08021554>
 80053e8:	e741      	b.n	800526e <fn_080051BC+0xb2>
 80053ea:	0021      	movs	r1, r4
 80053ec:	2001      	movs	r0, #1
 80053ee:	f01c f8b1 	bl	8021554 <fn_08021554>
 80053f2:	1c74      	adds	r4, r6, #1
 80053f4:	e73b      	b.n	800526e <fn_080051BC+0xb2>
 80053f6:	2800      	cmp	r0, #0
 80053f8:	d000      	beq.n	80053fc <fn_080051BC+0x240>
 80053fa:	e738      	b.n	800526e <fn_080051BC+0xb2>
 80053fc:	2200      	movs	r2, #0
 80053fe:	e7d7      	b.n	80053b0 <fn_080051BC+0x1f4>
 8005400:	08149cb8 	.word	0x08149cb8
