fn_080036FC:
 80036fc:	b5f0      	push	{r4, r5, r6, r7, lr}
 80036fe:	20c0      	movs	r0, #192	@ 0xc0
 8003700:	46c6      	mov	lr, r8
 8003702:	2101      	movs	r1, #1
 8003704:	2200      	movs	r2, #0
 8003706:	b500      	push	{lr}
 8003708:	0080      	lsls	r0, r0, #2
 800370a:	f019 ffb7 	bl	801d67c <fn_0801D67C>
 800370e:	23e0      	movs	r3, #224	@ 0xe0
 8003710:	4680      	mov	r8, r0
 8003712:	4c2c      	ldr	r4, [pc, #176]	@ (80037c4 <fn_080036FC+0xc8>)
 8003714:	492c      	ldr	r1, [pc, #176]	@ (80037c8 <fn_080036FC+0xcc>)
 8003716:	051b      	lsls	r3, r3, #20
 8003718:	4444      	add	r4, r8
 800371a:	001a      	movs	r2, r3
 800371c:	7812      	ldrb	r2, [r2, #0]
 800371e:	3301      	adds	r3, #1
 8003720:	54e2      	strb	r2, [r4, r3]
 8003722:	428b      	cmp	r3, r1
 8003724:	d1f9      	bne.n	800371a <fn_080036FC+0x1e>
 8003726:	2396      	movs	r3, #150	@ 0x96
 8003728:	4f28      	ldr	r7, [pc, #160]	@ (80037cc <fn_080036FC+0xd0>)
 800372a:	683e      	ldr	r6, [r7, #0]
 800372c:	009b      	lsls	r3, r3, #2
 800372e:	5cf3      	ldrb	r3, [r6, r3]
 8003730:	005d      	lsls	r5, r3, #1
 8003732:	18ed      	adds	r5, r5, r3
 8003734:	2301      	movs	r3, #1
 8003736:	016d      	lsls	r5, r5, #5
 8003738:	4445      	add	r5, r8
 800373a:	602b      	str	r3, [r5, #0]
 800373c:	33d5      	adds	r3, #213	@ 0xd5
 800373e:	56f3      	ldrsb	r3, [r6, r3]
 8003740:	712b      	strb	r3, [r5, #4]
 8003742:	23d8      	movs	r3, #216	@ 0xd8
 8003744:	58f3      	ldr	r3, [r6, r3]
 8003746:	60ab      	str	r3, [r5, #8]
 8003748:	23dc      	movs	r3, #220	@ 0xdc
 800374a:	58f3      	ldr	r3, [r6, r3]
 800374c:	60eb      	str	r3, [r5, #12]
 800374e:	238c      	movs	r3, #140	@ 0x8c
 8003750:	009b      	lsls	r3, r3, #2
 8003752:	58f3      	ldr	r3, [r6, r3]
 8003754:	612b      	str	r3, [r5, #16]
 8003756:	4b1e      	ldr	r3, [pc, #120]	@ (80037d0 <fn_080036FC+0xd4>)
 8003758:	58f3      	ldr	r3, [r6, r3]
 800375a:	616b      	str	r3, [r5, #20]
 800375c:	2384      	movs	r3, #132	@ 0x84
 800375e:	0031      	movs	r1, r6
 8003760:	0028      	movs	r0, r5
 8003762:	58f3      	ldr	r3, [r6, r3]
 8003764:	3139      	adds	r1, #57	@ 0x39
 8003766:	61ab      	str	r3, [r5, #24]
 8003768:	2224      	movs	r2, #36	@ 0x24
 800376a:	31ff      	adds	r1, #255	@ 0xff
 800376c:	301c      	adds	r0, #28
 800376e:	f01c ffeb 	bl	8020748 <fn_08020748>
 8003772:	0031      	movs	r1, r6
 8003774:	0028      	movs	r0, r5
 8003776:	315d      	adds	r1, #93	@ 0x5d
 8003778:	2210      	movs	r2, #16
 800377a:	31ff      	adds	r1, #255	@ 0xff
 800377c:	3040      	adds	r0, #64	@ 0x40
 800377e:	f01c ffe3 	bl	8020748 <fn_08020748>
 8003782:	0031      	movs	r1, r6
 8003784:	0028      	movs	r0, r5
 8003786:	316d      	adds	r1, #109	@ 0x6d
 8003788:	2210      	movs	r2, #16
 800378a:	3050      	adds	r0, #80	@ 0x50
 800378c:	31ff      	adds	r1, #255	@ 0xff
 800378e:	f01c ffdb 	bl	8020748 <fn_08020748>
 8003792:	23e0      	movs	r3, #224	@ 0xe0
 8003794:	480c      	ldr	r0, [pc, #48]	@ (80037c8 <fn_080036FC+0xcc>)
 8003796:	051b      	lsls	r3, r3, #20
 8003798:	001a      	movs	r2, r3
 800379a:	3301      	adds	r3, #1
 800379c:	5ce1      	ldrb	r1, [r4, r3]
 800379e:	7011      	strb	r1, [r2, #0]
 80037a0:	4283      	cmp	r3, r0
 80037a2:	d1f9      	bne.n	8003798 <fn_080036FC+0x9c>
 80037a4:	4640      	mov	r0, r8
 80037a6:	f019 ff1f 	bl	801d5e8 <fn_0801D5E8>
 80037aa:	22cc      	movs	r2, #204	@ 0xcc
 80037ac:	6839      	ldr	r1, [r7, #0]
 80037ae:	4b09      	ldr	r3, [pc, #36]	@ (80037d4 <fn_080036FC+0xd8>)
 80037b0:	0052      	lsls	r2, r2, #1
 80037b2:	508b      	str	r3, [r1, r2]
 80037b4:	f7ff ff2e 	bl	8003614 <fn_08003614>
 80037b8:	bc80      	pop	{r7}
 80037ba:	46b8      	mov	r8, r7
 80037bc:	bcf0      	pop	{r4, r5, r6, r7}
 80037be:	bc01      	pop	{r0}
 80037c0:	4700      	bx	r0
 80037c2:	46c0      	nop			@ (mov r8, r8)
 80037c4:	f1ffffff 	.word	0xf1ffffff
 80037c8:	0e000300 	.word	0x0e000300
 80037cc:	030064c4 	.word	0x030064c4
 80037d0:	0000076c 	.word	0x0000076c
 80037d4:	08149338 	.word	0x08149338
