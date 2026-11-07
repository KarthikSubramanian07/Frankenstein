fn_080046C8:
 80046c8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80046ca:	464f      	mov	r7, r9
 80046cc:	4646      	mov	r6, r8
 80046ce:	46d6      	mov	lr, sl
 80046d0:	b5c0      	push	{r6, r7, lr}
 80046d2:	6b47      	ldr	r7, [r0, #52]	@ 0x34
 80046d4:	0006      	movs	r6, r0
 80046d6:	b082      	sub	sp, #8
 80046d8:	2f00      	cmp	r7, #0
 80046da:	dd34      	ble.n	8004746 <fn_080046C8+0x7e>
 80046dc:	6843      	ldr	r3, [r0, #4]
 80046de:	469a      	mov	sl, r3
 80046e0:	4b29      	ldr	r3, [pc, #164]	@ (8004788 <fn_080046C8+0xc0>)
 80046e2:	4699      	mov	r9, r3
 80046e4:	2303      	movs	r3, #3
 80046e6:	0004      	movs	r4, r0
 80046e8:	4698      	mov	r8, r3
 80046ea:	6805      	ldr	r5, [r0, #0]
 80046ec:	e016      	b.n	800471c <fn_080046C8+0x54>
 80046ee:	2b09      	cmp	r3, #9
 80046f0:	d031      	beq.n	8004756 <fn_080046C8+0x8e>
 80046f2:	2b20      	cmp	r3, #32
 80046f4:	d00b      	beq.n	800470e <fn_080046C8+0x46>
 80046f6:	22ff      	movs	r2, #255	@ 0xff
 80046f8:	205f      	movs	r0, #95	@ 0x5f
 80046fa:	4011      	ands	r1, r2
 80046fc:	68f2      	ldr	r2, [r6, #12]
 80046fe:	4298      	cmp	r0, r3
 8004700:	d305      	bcc.n	800470e <fn_080046C8+0x46>
 8004702:	17cb      	asrs	r3, r1, #31
 8004704:	0fd0      	lsrs	r0, r2, #31
 8004706:	4291      	cmp	r1, r2
 8004708:	4143      	adcs	r3, r0
 800470a:	061b      	lsls	r3, r3, #24
 800470c:	d12a      	bne.n	8004764 <fn_080046C8+0x9c>
 800470e:	3504      	adds	r5, #4
 8004710:	2def      	cmp	r5, #239	@ 0xef
 8004712:	dc18      	bgt.n	8004746 <fn_080046C8+0x7e>
 8004714:	3401      	adds	r4, #1
 8004716:	1ba3      	subs	r3, r4, r6
 8004718:	42bb      	cmp	r3, r7
 800471a:	da14      	bge.n	8004746 <fn_080046C8+0x7e>
 800471c:	464a      	mov	r2, r9
 800471e:	4640      	mov	r0, r8
 8004720:	7d23      	ldrb	r3, [r4, #20]
 8004722:	5cd2      	ldrb	r2, [r2, r3]
 8004724:	0019      	movs	r1, r3
 8004726:	4002      	ands	r2, r0
 8004728:	2a02      	cmp	r2, #2
 800472a:	d103      	bne.n	8004734 <fn_080046C8+0x6c>
 800472c:	3b20      	subs	r3, #32
 800472e:	0019      	movs	r1, r3
 8004730:	061b      	lsls	r3, r3, #24
 8004732:	0e1b      	lsrs	r3, r3, #24
 8004734:	2b0a      	cmp	r3, #10
 8004736:	d1da      	bne.n	80046ee <fn_080046C8+0x26>
 8004738:	3b02      	subs	r3, #2
 800473a:	3401      	adds	r4, #1
 800473c:	449a      	add	sl, r3
 800473e:	2500      	movs	r5, #0
 8004740:	1ba3      	subs	r3, r4, r6
 8004742:	42bb      	cmp	r3, r7
 8004744:	dbea      	blt.n	800471c <fn_080046C8+0x54>
 8004746:	b002      	add	sp, #8
 8004748:	bce0      	pop	{r5, r6, r7}
 800474a:	46ba      	mov	sl, r7
 800474c:	46b1      	mov	r9, r6
 800474e:	46a8      	mov	r8, r5
 8004750:	bcf0      	pop	{r4, r5, r6, r7}
 8004752:	bc01      	pop	{r0}
 8004754:	4700      	bx	r0
 8004756:	0028      	movs	r0, r5
 8004758:	2150      	movs	r1, #80	@ 0x50
 800475a:	f020 fec5 	bl	80254e8 <fn_080254E8>
 800475e:	1a6d      	subs	r5, r5, r1
 8004760:	3550      	adds	r5, #80	@ 0x50
 8004762:	e7d7      	b.n	8004714 <fn_080046C8+0x4c>
 8004764:	68b3      	ldr	r3, [r6, #8]
 8004766:	1a89      	subs	r1, r1, r2
 8004768:	0089      	lsls	r1, r1, #2
 800476a:	58ca      	ldr	r2, [r1, r3]
 800476c:	2100      	movs	r1, #0
 800476e:	5e53      	ldrsh	r3, [r2, r1]
 8004770:	195b      	adds	r3, r3, r5
 8004772:	9301      	str	r3, [sp, #4]
 8004774:	2bf0      	cmp	r3, #240	@ 0xf0
 8004776:	dce6      	bgt.n	8004746 <fn_080046C8+0x7e>
 8004778:	0028      	movs	r0, r5
 800477a:	4651      	mov	r1, sl
 800477c:	f020 fed4 	bl	8025528 <fn_08025528>
 8004780:	6b77      	ldr	r7, [r6, #52]	@ 0x34
 8004782:	9d01      	ldr	r5, [sp, #4]
 8004784:	e7c6      	b.n	8004714 <fn_080046C8+0x4c>
 8004786:	46c0      	nop			@ (mov r8, r8)
 8004788:	0814b3b9 	.word	0x0814b3b9
