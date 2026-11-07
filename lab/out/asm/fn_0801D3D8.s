fn_0801D3D8:
 801d3d8:	b570      	push	{r4, r5, r6, lr}
 801d3da:	0005      	movs	r5, r0
 801d3dc:	000e      	movs	r6, r1
 801d3de:	f003 fa61 	bl	80208a4 <fn_080208A4>
 801d3e2:	3801      	subs	r0, #1
 801d3e4:	182c      	adds	r4, r5, r0
 801d3e6:	42a5      	cmp	r5, r4
 801d3e8:	d00c      	beq.n	801d404 <fn_0801D3D8+0x2c>
 801d3ea:	1e62      	subs	r2, r4, #1
 801d3ec:	e007      	b.n	801d3fe <fn_0801D3D8+0x26>
 801d3ee:	2b5c      	cmp	r3, #92	@ 0x5c
 801d3f0:	d008      	beq.n	801d404 <fn_0801D3D8+0x2c>
 801d3f2:	2b2f      	cmp	r3, #47	@ 0x2f
 801d3f4:	d006      	beq.n	801d404 <fn_0801D3D8+0x2c>
 801d3f6:	3c01      	subs	r4, #1
 801d3f8:	3a01      	subs	r2, #1
 801d3fa:	42a5      	cmp	r5, r4
 801d3fc:	d002      	beq.n	801d404 <fn_0801D3D8+0x2c>
 801d3fe:	7813      	ldrb	r3, [r2, #0]
 801d400:	2b3a      	cmp	r3, #58	@ 0x3a
 801d402:	d1f4      	bne.n	801d3ee <fn_0801D3D8+0x16>
 801d404:	2208      	movs	r2, #8
 801d406:	2100      	movs	r1, #0
 801d408:	0030      	movs	r0, r6
 801d40a:	f003 fb19 	bl	8020a40 <fn_08020A40>
 801d40e:	7822      	ldrb	r2, [r4, #0]
 801d410:	2a00      	cmp	r2, #0
 801d412:	d059      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d414:	2a2e      	cmp	r2, #46	@ 0x2e
 801d416:	d057      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d418:	2103      	movs	r1, #3
 801d41a:	4b31      	ldr	r3, [pc, #196]	@ (801d4e0 <fn_0801D3D8+0x108>)
 801d41c:	5c98      	ldrb	r0, [r3, r2]
 801d41e:	4001      	ands	r1, r0
 801d420:	2902      	cmp	r1, #2
 801d422:	d100      	bne.n	801d426 <fn_0801D3D8+0x4e>
 801d424:	3a20      	subs	r2, #32
 801d426:	7032      	strb	r2, [r6, #0]
 801d428:	7862      	ldrb	r2, [r4, #1]
 801d42a:	2a00      	cmp	r2, #0
 801d42c:	d04c      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d42e:	2a2e      	cmp	r2, #46	@ 0x2e
 801d430:	d04a      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d432:	2103      	movs	r1, #3
 801d434:	5c98      	ldrb	r0, [r3, r2]
 801d436:	4001      	ands	r1, r0
 801d438:	2902      	cmp	r1, #2
 801d43a:	d100      	bne.n	801d43e <fn_0801D3D8+0x66>
 801d43c:	3a20      	subs	r2, #32
 801d43e:	7072      	strb	r2, [r6, #1]
 801d440:	78a2      	ldrb	r2, [r4, #2]
 801d442:	2a00      	cmp	r2, #0
 801d444:	d040      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d446:	2a2e      	cmp	r2, #46	@ 0x2e
 801d448:	d03e      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d44a:	2103      	movs	r1, #3
 801d44c:	5c98      	ldrb	r0, [r3, r2]
 801d44e:	4001      	ands	r1, r0
 801d450:	2902      	cmp	r1, #2
 801d452:	d100      	bne.n	801d456 <fn_0801D3D8+0x7e>
 801d454:	3a20      	subs	r2, #32
 801d456:	70b2      	strb	r2, [r6, #2]
 801d458:	78e2      	ldrb	r2, [r4, #3]
 801d45a:	2a00      	cmp	r2, #0
 801d45c:	d034      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d45e:	2a2e      	cmp	r2, #46	@ 0x2e
 801d460:	d032      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d462:	2103      	movs	r1, #3
 801d464:	5c98      	ldrb	r0, [r3, r2]
 801d466:	4001      	ands	r1, r0
 801d468:	2902      	cmp	r1, #2
 801d46a:	d100      	bne.n	801d46e <fn_0801D3D8+0x96>
 801d46c:	3a20      	subs	r2, #32
 801d46e:	70f2      	strb	r2, [r6, #3]
 801d470:	7922      	ldrb	r2, [r4, #4]
 801d472:	2a00      	cmp	r2, #0
 801d474:	d028      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d476:	2a2e      	cmp	r2, #46	@ 0x2e
 801d478:	d026      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d47a:	2103      	movs	r1, #3
 801d47c:	5c98      	ldrb	r0, [r3, r2]
 801d47e:	4001      	ands	r1, r0
 801d480:	2902      	cmp	r1, #2
 801d482:	d024      	beq.n	801d4ce <fn_0801D3D8+0xf6>
 801d484:	7132      	strb	r2, [r6, #4]
 801d486:	7962      	ldrb	r2, [r4, #5]
 801d488:	2a00      	cmp	r2, #0
 801d48a:	d01d      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d48c:	2a2e      	cmp	r2, #46	@ 0x2e
 801d48e:	d01b      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d490:	2103      	movs	r1, #3
 801d492:	5c98      	ldrb	r0, [r3, r2]
 801d494:	4001      	ands	r1, r0
 801d496:	2902      	cmp	r1, #2
 801d498:	d01b      	beq.n	801d4d2 <fn_0801D3D8+0xfa>
 801d49a:	7172      	strb	r2, [r6, #5]
 801d49c:	79a2      	ldrb	r2, [r4, #6]
 801d49e:	2a00      	cmp	r2, #0
 801d4a0:	d012      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d4a2:	2a2e      	cmp	r2, #46	@ 0x2e
 801d4a4:	d010      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d4a6:	2103      	movs	r1, #3
 801d4a8:	5c98      	ldrb	r0, [r3, r2]
 801d4aa:	4001      	ands	r1, r0
 801d4ac:	2902      	cmp	r1, #2
 801d4ae:	d012      	beq.n	801d4d6 <fn_0801D3D8+0xfe>
 801d4b0:	71b2      	strb	r2, [r6, #6]
 801d4b2:	79e2      	ldrb	r2, [r4, #7]
 801d4b4:	2a00      	cmp	r2, #0
 801d4b6:	d007      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d4b8:	2a2e      	cmp	r2, #46	@ 0x2e
 801d4ba:	d005      	beq.n	801d4c8 <fn_0801D3D8+0xf0>
 801d4bc:	5c99      	ldrb	r1, [r3, r2]
 801d4be:	2303      	movs	r3, #3
 801d4c0:	400b      	ands	r3, r1
 801d4c2:	2b02      	cmp	r3, #2
 801d4c4:	d009      	beq.n	801d4da <fn_0801D3D8+0x102>
 801d4c6:	71f2      	strb	r2, [r6, #7]
 801d4c8:	bc70      	pop	{r4, r5, r6}
 801d4ca:	bc01      	pop	{r0}
 801d4cc:	4700      	bx	r0
 801d4ce:	3a20      	subs	r2, #32
 801d4d0:	e7d8      	b.n	801d484 <fn_0801D3D8+0xac>
 801d4d2:	3a20      	subs	r2, #32
 801d4d4:	e7e1      	b.n	801d49a <fn_0801D3D8+0xc2>
 801d4d6:	3a20      	subs	r2, #32
 801d4d8:	e7ea      	b.n	801d4b0 <fn_0801D3D8+0xd8>
 801d4da:	3a20      	subs	r2, #32
 801d4dc:	e7f3      	b.n	801d4c6 <fn_0801D3D8+0xee>
 801d4de:	46c0      	nop			@ (mov r8, r8)
 801d4e0:	0814b48d 	.word	0x0814b48d
