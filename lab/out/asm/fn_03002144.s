fn_03002144:
 3002144:	e1a02000 	mov	r2, r0
 3002148:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 300214c:	e590302c 	ldr	r3, [r0, #44]	@ 0x2c
 3002150:	e590101c 	ldr	r1, [r0, #28]
 3002154:	e590b014 	ldr	fp, [r0, #20]
 3002158:	e592e018 	ldr	lr, [r2, #24]
 300215c:	e24dd054 	sub	sp, sp, #84	@ 0x54
 3002160:	e58d3048 	str	r3, [sp, #72]	@ 0x48
 3002164:	e58de00c 	str	lr, [sp, #12]
 3002168:	e3530000 	cmp	r3, #0
 300216c:	e1d2e0f0 	ldrsh	lr, [r2]
 3002170:	e5923024 	ldr	r3, [r2, #36]	@ 0x24
 3002174:	e0c52b91 	smull	r2, r5, r1, fp
 3002178:	e1a02822 	lsr	r2, r2, #16
 300217c:	e5904020 	ldr	r4, [r0, #32]
 3002180:	e1822805 	orr	r2, r2, r5, lsl #16
 3002184:	e59f54c8 	ldr	r5, [pc, #1224]	@ 3002654 <fn_03002144+0x510>
 3002188:	e2622501 	rsb	r2, r2, #4194304	@ 0x400000
 300218c:	e58d0010 	str	r0, [sp, #16]
 3002190:	e590c010 	ldr	ip, [r0, #16]
 3002194:	e58d2008 	str	r2, [sp, #8]
 3002198:	e1d000f2 	ldrsh	r0, [r0, #2]
 300219c:	e58d403c 	str	r4, [sp, #60]	@ 0x3c
 30021a0:	e58d1040 	str	r1, [sp, #64]	@ 0x40
 30021a4:	e585b0e8 	str	fp, [r5, #232]	@ 0xe8
 30021a8:	e5852104 	str	r2, [r5, #260]	@ 0x104
 30021ac:	0a000051 	beq	30022f8 <fn_03002144+0x1b4>
 30021b0:	e5d5210c 	ldrb	r2, [r5, #268]	@ 0x10c
 30021b4:	e3520000 	cmp	r2, #0
 30021b8:	059f8498 	ldreq	r8, [pc, #1176]	@ 3002658 <fn_03002144+0x514>
 30021bc:	1a00004f 	bne	3002300 <fn_03002144+0x1bc>
 30021c0:	e150000e 	cmp	r0, lr
 30021c4:	e58de030 	str	lr, [sp, #48]	@ 0x30
 30021c8:	ba000047 	blt	30022ec <fn_03002144+0x1a8>
 30021cc:	e1a0a00c 	mov	sl, ip
 30021d0:	e1a0284c 	asr	r2, ip, #16
 30021d4:	e1a0c003 	mov	ip, r3
 30021d8:	e59db040 	ldr	fp, [sp, #64]	@ 0x40
 30021dc:	e58d8014 	str	r8, [sp, #20]
 30021e0:	e2822002 	add	r2, r2, #2
 30021e4:	e79c4102 	ldr	r4, [ip, r2, lsl #2]
 30021e8:	e7dc1004 	ldrb	r1, [ip, r4]
 30021ec:	e35100ff 	cmp	r1, #255	@ 0xff
 30021f0:	e08c4004 	add	r4, ip, r4
 30021f4:	0a00002d 	beq	30022b0 <fn_03002144+0x16c>
 30021f8:	e59530ec 	ldr	r3, [r5, #236]	@ 0xec
 30021fc:	e1a0e08e 	lsl	lr, lr, #1
 3002200:	e19380fe 	ldrsh	r8, [r3, lr]
 3002204:	e59530f0 	ldr	r3, [r5, #240]	@ 0xf0
 3002208:	e19360fe 	ldrsh	r6, [r3, lr]
 300220c:	e58da004 	str	sl, [sp, #4]
 3002210:	e58dc008 	str	ip, [sp, #8]
 3002214:	e59da014 	ldr	sl, [sp, #20]
 3002218:	e2487001 	sub	r7, r8, #1
 300221c:	e2869001 	add	r9, r6, #1
 3002220:	e59520e8 	ldr	r2, [r5, #232]	@ 0xe8
 3002224:	e5953104 	ldr	r3, [r5, #260]	@ 0x104
 3002228:	e0233192 	mla	r3, r2, r1, r3
 300222c:	e5d40001 	ldrb	r0, [r4, #1]
 3002230:	e0223290 	mla	r2, r0, r2, r3
 3002234:	e2833cff 	add	r3, r3, #65280	@ 0xff00
 3002238:	e2422001 	sub	r2, r2, #1
 300223c:	e28330ff 	add	r3, r3, #255	@ 0xff
 3002240:	e1a03843 	asr	r3, r3, #16
 3002244:	e1580842 	cmp	r8, r2, asr #16
 3002248:	e1a02842 	asr	r2, r2, #16
 300224c:	d1a02007 	movle	r2, r7
 3002250:	e1560003 	cmp	r6, r3
 3002254:	a1a03009 	movge	r3, r9
 3002258:	e352007f 	cmp	r2, #127	@ 0x7f
 300225c:	c3a0c000 	movgt	ip, #0
 3002260:	d3a0c001 	movle	ip, #1
 3002264:	e1520003 	cmp	r2, r3
 3002268:	b3a0c000 	movlt	ip, #0
 300226c:	e35c0000 	cmp	ip, #0
 3002270:	e284e003 	add	lr, r4, #3
 3002274:	e04b1801 	sub	r1, fp, r1, lsl #16
 3002278:	0a000007 	beq	300229c <fn_03002144+0x158>
 300227c:	e28d0030 	add	r0, sp, #48	@ 0x30
 3002280:	e58de044 	str	lr, [sp, #68]	@ 0x44
 3002284:	e58d1040 	str	r1, [sp, #64]	@ 0x40
 3002288:	e58d2038 	str	r2, [sp, #56]	@ 0x38
 300228c:	e58d3034 	str	r3, [sp, #52]	@ 0x34
 3002290:	e1a0e00f 	mov	lr, pc
 3002294:	e12fff1a 	bx	sl
 3002298:	e5d40001 	ldrb	r0, [r4, #1]
 300229c:	e2800004 	add	r0, r0, #4
 30022a0:	e7f41000 	ldrb	r1, [r4, r0]!
 30022a4:	e35100ff 	cmp	r1, #255	@ 0xff
 30022a8:	1affffdc 	bne	3002220 <fn_03002144+0xdc>
 30022ac:	e99d1400 	ldmib	sp, {sl, ip}
 30022b0:	e59d200c 	ldr	r2, [sp, #12]
 30022b4:	e1dc30f0 	ldrsh	r3, [ip]
 30022b8:	e08aa002 	add	sl, sl, r2
 30022bc:	e153084a 	cmp	r3, sl, asr #16
 30022c0:	e1a0284a 	asr	r2, sl, #16
 30022c4:	da000008 	ble	30022ec <fn_03002144+0x1a8>
 30022c8:	e35a0000 	cmp	sl, #0
 30022cc:	ba000006 	blt	30022ec <fn_03002144+0x1a8>
 30022d0:	e59d3010 	ldr	r3, [sp, #16]
 30022d4:	e59de030 	ldr	lr, [sp, #48]	@ 0x30
 30022d8:	e1d330f2 	ldrsh	r3, [r3, #2]
 30022dc:	e28ee001 	add	lr, lr, #1
 30022e0:	e15e0003 	cmp	lr, r3
 30022e4:	e58de030 	str	lr, [sp, #48]	@ 0x30
 30022e8:	daffffbc 	ble	30021e0 <fn_03002144+0x9c>
 30022ec:	e28dd054 	add	sp, sp, #84	@ 0x54
 30022f0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 30022f4:	e12fff1e 	bx	lr
 30022f8:	e59f835c 	ldr	r8, [pc, #860]	@ 300265c <fn_03002144+0x518>
 30022fc:	eaffffaf 	b	30021c0 <fn_03002144+0x7c>
 3002300:	e150000e 	cmp	r0, lr
 3002304:	bafffff8 	blt	30022ec <fn_03002144+0x1a8>
 3002308:	e1d320f0 	ldrsh	r2, [r3]
 300230c:	e1a0700c 	mov	r7, ip
 3002310:	e1a0c003 	mov	ip, r3
 3002314:	e1a03005 	mov	r3, r5
 3002318:	e58d2014 	str	r2, [sp, #20]
 300231c:	e59d200c 	ldr	r2, [sp, #12]
 3002320:	e3c22001 	bic	r2, r2, #1
 3002324:	e58d2018 	str	r2, [sp, #24]
 3002328:	e59d200c 	ldr	r2, [sp, #12]
 300232c:	e59d4014 	ldr	r4, [sp, #20]
 3002330:	e08710c2 	add	r1, r7, r2, asr #1
 3002334:	e1540847 	cmp	r4, r7, asr #16
 3002338:	e1a01841 	asr	r1, r1, #16
 300233c:	e1a02847 	asr	r2, r7, #16
 3002340:	8a000044 	bhi	3002458 <fn_03002144+0x314>
 3002344:	e1540001 	cmp	r4, r1
 3002348:	9a00003c 	bls	3002440 <fn_03002144+0x2fc>
 300234c:	e2811002 	add	r1, r1, #2
 3002350:	e79c5101 	ldr	r5, [ip, r1, lsl #2]
 3002354:	e58de030 	str	lr, [sp, #48]	@ 0x30
 3002358:	e59d9040 	ldr	r9, [sp, #64]	@ 0x40
 300235c:	e08c5005 	add	r5, ip, r5
 3002360:	e3a02001 	mov	r2, #1
 3002364:	e5cd204c 	strb	r2, [sp, #76]	@ 0x4c
 3002368:	e5d50000 	ldrb	r0, [r5]
 300236c:	e35000ff 	cmp	r0, #255	@ 0xff
 3002370:	0a00002f 	beq	3002434 <fn_03002144+0x2f0>
 3002374:	e28310ec 	add	r1, r3, #236	@ 0xec
 3002378:	e8910012 	ldm	r1, {r1, r4}
 300237c:	e1a0208e 	lsl	r2, lr, #1
 3002380:	e191a0f2 	ldrsh	sl, [r1, r2]
 3002384:	e19480f2 	ldrsh	r8, [r4, r2]
 3002388:	e24a2001 	sub	r2, sl, #1
 300238c:	e58d2004 	str	r2, [sp, #4]
 3002390:	e58de01c 	str	lr, [sp, #28]
 3002394:	e58dc024 	str	ip, [sp, #36]	@ 0x24
 3002398:	e58d3028 	str	r3, [sp, #40]	@ 0x28
 300239c:	e59d6008 	ldr	r6, [sp, #8]
 30023a0:	e58d7020 	str	r7, [sp, #32]
 30023a4:	e2887001 	add	r7, r8, #1
 30023a8:	e023609b 	mla	r3, fp, r0, r6
 30023ac:	e5d54001 	ldrb	r4, [r5, #1]
 30023b0:	e022349b 	mla	r2, fp, r4, r3
 30023b4:	e2833cff 	add	r3, r3, #65280	@ 0xff00
 30023b8:	e2422001 	sub	r2, r2, #1
 30023bc:	e28330ff 	add	r3, r3, #255	@ 0xff
 30023c0:	e1a03843 	asr	r3, r3, #16
 30023c4:	e15a0842 	cmp	sl, r2, asr #16
 30023c8:	e1a02842 	asr	r2, r2, #16
 30023cc:	d59d2004 	ldrle	r2, [sp, #4]
 30023d0:	e1580003 	cmp	r8, r3
 30023d4:	a1a03007 	movge	r3, r7
 30023d8:	e352007f 	cmp	r2, #127	@ 0x7f
 30023dc:	c3a0c000 	movgt	ip, #0
 30023e0:	d3a0c001 	movle	ip, #1
 30023e4:	e1520003 	cmp	r2, r3
 30023e8:	b3a0c000 	movlt	ip, #0
 30023ec:	e35c0000 	cmp	ip, #0
 30023f0:	e0490800 	sub	r0, r9, r0, lsl #16
 30023f4:	e285e003 	add	lr, r5, #3
 30023f8:	0a000005 	beq	3002414 <fn_03002144+0x2d0>
 30023fc:	e58d0040 	str	r0, [sp, #64]	@ 0x40
 3002400:	e28d0030 	add	r0, sp, #48	@ 0x30
 3002404:	e58de044 	str	lr, [sp, #68]	@ 0x44
 3002408:	e58d2038 	str	r2, [sp, #56]	@ 0x38
 300240c:	e58d3034 	str	r3, [sp, #52]	@ 0x34
 3002410:	ebfffa72 	bl	3000de0 <fn_03000DE0>
 3002414:	e2844004 	add	r4, r4, #4
 3002418:	e7f50004 	ldrb	r0, [r5, r4]!
 300241c:	e35000ff 	cmp	r0, #255	@ 0xff
 3002420:	1affffe0 	bne	30023a8 <fn_03002144+0x264>
 3002424:	e28d7020 	add	r7, sp, #32
 3002428:	e59de01c 	ldr	lr, [sp, #28]
 300242c:	e8971080 	ldm	r7, {r7, ip}
 3002430:	e59d3028 	ldr	r3, [sp, #40]	@ 0x28
 3002434:	e58d9040 	str	r9, [sp, #64]	@ 0x40
 3002438:	e59d2010 	ldr	r2, [sp, #16]
 300243c:	e1d200f2 	ldrsh	r0, [r2, #2]
 3002440:	e59d2018 	ldr	r2, [sp, #24]
 3002444:	e28ee001 	add	lr, lr, #1
 3002448:	e15e0000 	cmp	lr, r0
 300244c:	e0877002 	add	r7, r7, r2
 3002450:	daffffb4 	ble	3002328 <fn_03002144+0x1e4>
 3002454:	eaffffa4 	b	30022ec <fn_03002144+0x1a8>
 3002458:	e2822002 	add	r2, r2, #2
 300245c:	e79c8102 	ldr	r8, [ip, r2, lsl #2]
 3002460:	e28340ec 	add	r4, r3, #236	@ 0xec
 3002464:	e59d2014 	ldr	r2, [sp, #20]
 3002468:	e8940030 	ldm	r4, {r4, r5}
 300246c:	e1520001 	cmp	r2, r1
 3002470:	e1a0208e 	lsl	r2, lr, #1
 3002474:	e194a0f2 	ldrsh	sl, [r4, r2]
 3002478:	e19560f2 	ldrsh	r6, [r5, r2]
 300247c:	e59d9040 	ldr	r9, [sp, #64]	@ 0x40
 3002480:	e7dc2008 	ldrb	r2, [ip, r8]
 3002484:	e08c4008 	add	r4, ip, r8
 3002488:	8a000035 	bhi	3002564 <fn_03002144+0x420>
 300248c:	e3a05000 	mov	r5, #0
 3002490:	e35200ff 	cmp	r2, #255	@ 0xff
 3002494:	e58de030 	str	lr, [sp, #48]	@ 0x30
 3002498:	e5cd504c 	strb	r5, [sp, #76]	@ 0x4c
 300249c:	0affffe7 	beq	3002440 <fn_03002144+0x2fc>
 30024a0:	e24a1001 	sub	r1, sl, #1
 30024a4:	e58d5024 	str	r5, [sp, #36]	@ 0x24
 30024a8:	e58d1004 	str	r1, [sp, #4]
 30024ac:	e58de01c 	str	lr, [sp, #28]
 30024b0:	e58d7020 	str	r7, [sp, #32]
 30024b4:	e59d5008 	ldr	r5, [sp, #8]
 30024b8:	e58dc028 	str	ip, [sp, #40]	@ 0x28
 30024bc:	e58d302c 	str	r3, [sp, #44]	@ 0x2c
 30024c0:	e2868001 	add	r8, r6, #1
 30024c4:	e023529b 	mla	r3, fp, r2, r5
 30024c8:	e5d47001 	ldrb	r7, [r4, #1]
 30024cc:	e0490802 	sub	r0, r9, r2, lsl #16
 30024d0:	e022379b 	mla	r2, fp, r7, r3
 30024d4:	e2833cff 	add	r3, r3, #65280	@ 0xff00
 30024d8:	e2422001 	sub	r2, r2, #1
 30024dc:	e28330ff 	add	r3, r3, #255	@ 0xff
 30024e0:	e1a03843 	asr	r3, r3, #16
 30024e4:	e15a0842 	cmp	sl, r2, asr #16
 30024e8:	e1a02842 	asr	r2, r2, #16
 30024ec:	d59d2004 	ldrle	r2, [sp, #4]
 30024f0:	e1530006 	cmp	r3, r6
 30024f4:	d1a03008 	movle	r3, r8
 30024f8:	e352007f 	cmp	r2, #127	@ 0x7f
 30024fc:	c3a0c000 	movgt	ip, #0
 3002500:	d3a0c001 	movle	ip, #1
 3002504:	e1520003 	cmp	r2, r3
 3002508:	b3a0c000 	movlt	ip, #0
 300250c:	e35c0000 	cmp	ip, #0
 3002510:	e284e003 	add	lr, r4, #3
 3002514:	0a000005 	beq	3002530 <fn_03002144+0x3ec>
 3002518:	e58d0040 	str	r0, [sp, #64]	@ 0x40
 300251c:	e28d0030 	add	r0, sp, #48	@ 0x30
 3002520:	e58de044 	str	lr, [sp, #68]	@ 0x44
 3002524:	e58d2038 	str	r2, [sp, #56]	@ 0x38
 3002528:	e58d3034 	str	r3, [sp, #52]	@ 0x34
 300252c:	ebfffa2b 	bl	3000de0 <fn_03000DE0>
 3002530:	e2877004 	add	r7, r7, #4
 3002534:	e7f42007 	ldrb	r2, [r4, r7]!
 3002538:	e35200ff 	cmp	r2, #255	@ 0xff
 300253c:	1affffe0 	bne	30024c4 <fn_03002144+0x380>
 3002540:	e28d5024 	add	r5, sp, #36	@ 0x24
 3002544:	e8951020 	ldm	r5, {r5, ip}
 3002548:	e3550000 	cmp	r5, #0
 300254c:	e59de01c 	ldr	lr, [sp, #28]
 3002550:	e59d7020 	ldr	r7, [sp, #32]
 3002554:	e59d302c 	ldr	r3, [sp, #44]	@ 0x2c
 3002558:	e58d9040 	str	r9, [sp, #64]	@ 0x40
 300255c:	0affffb5 	beq	3002438 <fn_03002144+0x2f4>
 3002560:	eaffff7e 	b	3002360 <fn_03002144+0x21c>
 3002564:	e2811002 	add	r1, r1, #2
 3002568:	e79c5101 	ldr	r5, [ip, r1, lsl #2]
 300256c:	e1580005 	cmp	r8, r5
 3002570:	e58de030 	str	lr, [sp, #48]	@ 0x30
 3002574:	1a000030 	bne	300263c <fn_03002144+0x4f8>
 3002578:	e35200ff 	cmp	r2, #255	@ 0xff
 300257c:	0a00002c 	beq	3002634 <fn_03002144+0x4f0>
 3002580:	e58d701c 	str	r7, [sp, #28]
 3002584:	e58de004 	str	lr, [sp, #4]
 3002588:	e59d7008 	ldr	r7, [sp, #8]
 300258c:	e58dc020 	str	ip, [sp, #32]
 3002590:	e58d3024 	str	r3, [sp, #36]	@ 0x24
 3002594:	e24a5001 	sub	r5, sl, #1
 3002598:	e2868001 	add	r8, r6, #1
 300259c:	e023729b 	mla	r3, fp, r2, r7
 30025a0:	e5d40001 	ldrb	r0, [r4, #1]
 30025a4:	e0491802 	sub	r1, r9, r2, lsl #16
 30025a8:	e022309b 	mla	r2, fp, r0, r3
 30025ac:	e2833cff 	add	r3, r3, #65280	@ 0xff00
 30025b0:	e2422001 	sub	r2, r2, #1
 30025b4:	e28330ff 	add	r3, r3, #255	@ 0xff
 30025b8:	e1a03843 	asr	r3, r3, #16
 30025bc:	e15a0842 	cmp	sl, r2, asr #16
 30025c0:	e1a02842 	asr	r2, r2, #16
 30025c4:	d1a02005 	movle	r2, r5
 30025c8:	e1530006 	cmp	r3, r6
 30025cc:	d1a03008 	movle	r3, r8
 30025d0:	e352007f 	cmp	r2, #127	@ 0x7f
 30025d4:	c3a0c000 	movgt	ip, #0
 30025d8:	d3a0c001 	movle	ip, #1
 30025dc:	e1520003 	cmp	r2, r3
 30025e0:	b3a0c000 	movlt	ip, #0
 30025e4:	e35c0000 	cmp	ip, #0
 30025e8:	e284e003 	add	lr, r4, #3
 30025ec:	0a000006 	beq	300260c <fn_03002144+0x4c8>
 30025f0:	e28d0030 	add	r0, sp, #48	@ 0x30
 30025f4:	e58de044 	str	lr, [sp, #68]	@ 0x44
 30025f8:	e58d1040 	str	r1, [sp, #64]	@ 0x40
 30025fc:	e58d2038 	str	r2, [sp, #56]	@ 0x38
 3002600:	e58d3034 	str	r3, [sp, #52]	@ 0x34
 3002604:	ebfffc71 	bl	30017d0 <fn_030017D0>
 3002608:	e5d40001 	ldrb	r0, [r4, #1]
 300260c:	e2800004 	add	r0, r0, #4
 3002610:	e7f42000 	ldrb	r2, [r4, r0]!
 3002614:	e35200ff 	cmp	r2, #255	@ 0xff
 3002618:	1affffdf 	bne	300259c <fn_03002144+0x458>
 300261c:	e59d2010 	ldr	r2, [sp, #16]
 3002620:	e28d701c 	add	r7, sp, #28
 3002624:	e59de004 	ldr	lr, [sp, #4]
 3002628:	e8971080 	ldm	r7, {r7, ip}
 300262c:	e59d3024 	ldr	r3, [sp, #36]	@ 0x24
 3002630:	e1d200f2 	ldrsh	r0, [r2, #2]
 3002634:	e58d9040 	str	r9, [sp, #64]	@ 0x40
 3002638:	eaffff80 	b	3002440 <fn_03002144+0x2fc>
 300263c:	e3a01000 	mov	r1, #0
 3002640:	e35200ff 	cmp	r2, #255	@ 0xff
 3002644:	e5cd104c 	strb	r1, [sp, #76]	@ 0x4c
 3002648:	e08c5005 	add	r5, ip, r5
 300264c:	1affff93 	bne	30024a0 <fn_03002144+0x35c>
 3002650:	eaffff42 	b	3002360 <fn_03002144+0x21c>
 3002654:	030064cc 	.word	0x030064cc	@ data_030064CC
 3002658:	030017d0 	.word	0x030017d0	@ fn_030017D0
 300265c:	03000e7c 	.word	0x03000e7c	@ fn_03000E7C
