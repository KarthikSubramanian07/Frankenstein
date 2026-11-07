fn_0800A704:
 800a704:	b5f0      	push	{r4, r5, r6, r7, lr}
 800a706:	0004      	movs	r4, r0
 800a708:	20d6      	movs	r0, #214	@ 0xd6
 800a70a:	46c6      	mov	lr, r8
 800a70c:	001d      	movs	r5, r3
 800a70e:	4b42      	ldr	r3, [pc, #264]	@ (800a818 <fn_0800A704+0x114>)
 800a710:	4694      	mov	ip, r2
 800a712:	681a      	ldr	r2, [r3, #0]
 800a714:	0100      	lsls	r0, r0, #4
 800a716:	5813      	ldr	r3, [r2, r0]
 800a718:	b500      	push	{lr}
 800a71a:	3301      	adds	r3, #1
 800a71c:	5013      	str	r3, [r2, r0]
 800a71e:	9b06      	ldr	r3, [sp, #24]
 800a720:	2b00      	cmp	r3, #0
 800a722:	d018      	beq.n	800a756 <fn_0800A704+0x52>
 800a724:	2b01      	cmp	r3, #1
 800a726:	d005      	beq.n	800a734 <fn_0800A704+0x30>
 800a728:	2000      	movs	r0, #0
 800a72a:	bc80      	pop	{r7}
 800a72c:	46b8      	mov	r8, r7
 800a72e:	bcf0      	pop	{r4, r5, r6, r7}
 800a730:	bc02      	pop	{r1}
 800a732:	4708      	bx	r1
 800a734:	9b07      	ldr	r3, [sp, #28]
 800a736:	3301      	adds	r3, #1
 800a738:	d036      	beq.n	800a7a8 <fn_0800A704+0xa4>
 800a73a:	9b07      	ldr	r3, [sp, #28]
 800a73c:	2b01      	cmp	r3, #1
 800a73e:	d1f3      	bne.n	800a728 <fn_0800A704+0x24>
 800a740:	6863      	ldr	r3, [r4, #4]
 800a742:	18c9      	adds	r1, r1, r3
 800a744:	001e      	movs	r6, r3
 800a746:	4561      	cmp	r1, ip
 800a748:	dc57      	bgt.n	800a7fa <fn_0800A704+0xf6>
 800a74a:	6061      	str	r1, [r4, #4]
 800a74c:	0020      	movs	r0, r4
 800a74e:	0029      	movs	r1, r5
 800a750:	f005 faea 	bl	800fd28 <fn_0800FD28>
 800a754:	e7e8      	b.n	800a728 <fn_0800A704+0x24>
 800a756:	9b07      	ldr	r3, [sp, #28]
 800a758:	3301      	adds	r3, #1
 800a75a:	d019      	beq.n	800a790 <fn_0800A704+0x8c>
 800a75c:	9b07      	ldr	r3, [sp, #28]
 800a75e:	2b01      	cmp	r3, #1
 800a760:	d1e2      	bne.n	800a728 <fn_0800A704+0x24>
 800a762:	6863      	ldr	r3, [r4, #4]
 800a764:	4563      	cmp	r3, ip
 800a766:	dd00      	ble.n	800a76a <fn_0800A704+0x66>
 800a768:	4663      	mov	r3, ip
 800a76a:	6822      	ldr	r2, [r4, #0]
 800a76c:	1889      	adds	r1, r1, r2
 800a76e:	0016      	movs	r6, r2
 800a770:	4299      	cmp	r1, r3
 800a772:	dc32      	bgt.n	800a7da <fn_0800A704+0xd6>
 800a774:	6021      	str	r1, [r4, #0]
 800a776:	0020      	movs	r0, r4
 800a778:	0029      	movs	r1, r5
 800a77a:	f005 fad5 	bl	800fd28 <fn_0800FD28>
 800a77e:	2800      	cmp	r0, #0
 800a780:	d0d2      	beq.n	800a728 <fn_0800A704+0x24>
 800a782:	0029      	movs	r1, r5
 800a784:	0020      	movs	r0, r4
 800a786:	6026      	str	r6, [r4, #0]
 800a788:	f005 face 	bl	800fd28 <fn_0800FD28>
 800a78c:	2001      	movs	r0, #1
 800a78e:	e7cc      	b.n	800a72a <fn_0800A704+0x26>
 800a790:	6823      	ldr	r3, [r4, #0]
 800a792:	001e      	movs	r6, r3
 800a794:	1a59      	subs	r1, r3, r1
 800a796:	4663      	mov	r3, ip
 800a798:	4561      	cmp	r1, ip
 800a79a:	db1e      	blt.n	800a7da <fn_0800A704+0xd6>
 800a79c:	6021      	str	r1, [r4, #0]
 800a79e:	0020      	movs	r0, r4
 800a7a0:	0029      	movs	r1, r5
 800a7a2:	f005 fac1 	bl	800fd28 <fn_0800FD28>
 800a7a6:	e7bf      	b.n	800a728 <fn_0800A704+0x24>
 800a7a8:	6823      	ldr	r3, [r4, #0]
 800a7aa:	4563      	cmp	r3, ip
 800a7ac:	da00      	bge.n	800a7b0 <fn_0800A704+0xac>
 800a7ae:	4663      	mov	r3, ip
 800a7b0:	6862      	ldr	r2, [r4, #4]
 800a7b2:	0016      	movs	r6, r2
 800a7b4:	1a51      	subs	r1, r2, r1
 800a7b6:	4299      	cmp	r1, r3
 800a7b8:	db20      	blt.n	800a7fc <fn_0800A704+0xf8>
 800a7ba:	6061      	str	r1, [r4, #4]
 800a7bc:	0020      	movs	r0, r4
 800a7be:	0029      	movs	r1, r5
 800a7c0:	f005 fab2 	bl	800fd28 <fn_0800FD28>
 800a7c4:	2800      	cmp	r0, #0
 800a7c6:	d0af      	beq.n	800a728 <fn_0800A704+0x24>
 800a7c8:	2d00      	cmp	r5, #0
 800a7ca:	d1df      	bne.n	800a78c <fn_0800A704+0x88>
 800a7cc:	2100      	movs	r1, #0
 800a7ce:	0020      	movs	r0, r4
 800a7d0:	6066      	str	r6, [r4, #4]
 800a7d2:	f005 faa9 	bl	800fd28 <fn_0800FD28>
 800a7d6:	2001      	movs	r0, #1
 800a7d8:	e7a7      	b.n	800a72a <fn_0800A704+0x26>
 800a7da:	0029      	movs	r1, r5
 800a7dc:	0020      	movs	r0, r4
 800a7de:	6023      	str	r3, [r4, #0]
 800a7e0:	f005 faa2 	bl	800fd28 <fn_0800FD28>
 800a7e4:	2800      	cmp	r0, #0
 800a7e6:	d101      	bne.n	800a7ec <fn_0800A704+0xe8>
 800a7e8:	2002      	movs	r0, #2
 800a7ea:	e79e      	b.n	800a72a <fn_0800A704+0x26>
 800a7ec:	0029      	movs	r1, r5
 800a7ee:	0020      	movs	r0, r4
 800a7f0:	6026      	str	r6, [r4, #0]
 800a7f2:	f005 fa99 	bl	800fd28 <fn_0800FD28>
 800a7f6:	2002      	movs	r0, #2
 800a7f8:	e797      	b.n	800a72a <fn_0800A704+0x26>
 800a7fa:	4663      	mov	r3, ip
 800a7fc:	0029      	movs	r1, r5
 800a7fe:	0020      	movs	r0, r4
 800a800:	6063      	str	r3, [r4, #4]
 800a802:	f005 fa91 	bl	800fd28 <fn_0800FD28>
 800a806:	2800      	cmp	r0, #0
 800a808:	d0ee      	beq.n	800a7e8 <fn_0800A704+0xe4>
 800a80a:	0029      	movs	r1, r5
 800a80c:	0020      	movs	r0, r4
 800a80e:	6066      	str	r6, [r4, #4]
 800a810:	f005 fa8a 	bl	800fd28 <fn_0800FD28>
 800a814:	2002      	movs	r0, #2
 800a816:	e788      	b.n	800a72a <fn_0800A704+0x26>
 800a818:	030064c4 	.word	0x030064c4	@ data_030064C4
