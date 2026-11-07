fn_0800A81C:
 800a81c:	21d6      	movs	r1, #214	@ 0xd6
 800a81e:	b5f0      	push	{r4, r5, r6, r7, lr}
 800a820:	4e4e      	ldr	r6, [pc, #312]	@ (800a95c <fn_0800A81C+0x140>)
 800a822:	6a03      	ldr	r3, [r0, #32]
 800a824:	0004      	movs	r4, r0
 800a826:	6942      	ldr	r2, [r0, #20]
 800a828:	6905      	ldr	r5, [r0, #16]
 800a82a:	6830      	ldr	r0, [r6, #0]
 800a82c:	0109      	lsls	r1, r1, #4
 800a82e:	469c      	mov	ip, r3
 800a830:	5843      	ldr	r3, [r0, r1]
 800a832:	b083      	sub	sp, #12
 800a834:	3301      	adds	r3, #1
 800a836:	2a00      	cmp	r2, #0
 800a838:	db35      	blt.n	800a8a6 <fn_0800A81C+0x8a>
 800a83a:	69a7      	ldr	r7, [r4, #24]
 800a83c:	5043      	str	r3, [r0, r1]
 800a83e:	2a01      	cmp	r2, #1
 800a840:	d149      	bne.n	800a8d6 <fn_0800A81C+0xba>
 800a842:	686a      	ldr	r2, [r5, #4]
 800a844:	42ba      	cmp	r2, r7
 800a846:	dd00      	ble.n	800a84a <fn_0800A81C+0x2e>
 800a848:	003a      	movs	r2, r7
 800a84a:	682b      	ldr	r3, [r5, #0]
 800a84c:	001f      	movs	r7, r3
 800a84e:	4463      	add	r3, ip
 800a850:	429a      	cmp	r2, r3
 800a852:	db63      	blt.n	800a91c <fn_0800A81C+0x100>
 800a854:	2100      	movs	r1, #0
 800a856:	0028      	movs	r0, r5
 800a858:	602b      	str	r3, [r5, #0]
 800a85a:	f005 fa65 	bl	800fd28 <fn_0800FD28>
 800a85e:	2800      	cmp	r0, #0
 800a860:	d146      	bne.n	800a8f0 <fn_0800A81C+0xd4>
 800a862:	2700      	movs	r7, #0
 800a864:	6925      	ldr	r5, [r4, #16]
 800a866:	6963      	ldr	r3, [r4, #20]
 800a868:	69e2      	ldr	r2, [r4, #28]
 800a86a:	6a21      	ldr	r1, [r4, #32]
 800a86c:	9301      	str	r3, [sp, #4]
 800a86e:	2301      	movs	r3, #1
 800a870:	0028      	movs	r0, r5
 800a872:	9300      	str	r3, [sp, #0]
 800a874:	2300      	movs	r3, #0
 800a876:	f7ff ff45 	bl	800a704 <fn_0800A704>
 800a87a:	6832      	ldr	r2, [r6, #0]
 800a87c:	4b38      	ldr	r3, [pc, #224]	@ (800a960 <fn_0800A81C+0x144>)
 800a87e:	58d3      	ldr	r3, [r2, r3]
 800a880:	075b      	lsls	r3, r3, #29
 800a882:	d046      	beq.n	800a912 <fn_0800A81C+0xf6>
 800a884:	2f02      	cmp	r7, #2
 800a886:	d10a      	bne.n	800a89e <fn_0800A81C+0x82>
 800a888:	2200      	movs	r2, #0
 800a88a:	6923      	ldr	r3, [r4, #16]
 800a88c:	0020      	movs	r0, r4
 800a88e:	611a      	str	r2, [r3, #16]
 800a890:	615a      	str	r2, [r3, #20]
 800a892:	f00d fe53 	bl	801853c <fn_0801853C>
 800a896:	2113      	movs	r1, #19
 800a898:	6920      	ldr	r0, [r4, #16]
 800a89a:	f00a fe07 	bl	80154ac <fn_080154AC>
 800a89e:	b003      	add	sp, #12
 800a8a0:	bcf0      	pop	{r4, r5, r6, r7}
 800a8a2:	bc01      	pop	{r0}
 800a8a4:	4700      	bx	r0
 800a8a6:	69e7      	ldr	r7, [r4, #28]
 800a8a8:	5043      	str	r3, [r0, r1]
 800a8aa:	3201      	adds	r2, #1
 800a8ac:	d115      	bne.n	800a8da <fn_0800A81C+0xbe>
 800a8ae:	682b      	ldr	r3, [r5, #0]
 800a8b0:	42bb      	cmp	r3, r7
 800a8b2:	da00      	bge.n	800a8b6 <fn_0800A81C+0x9a>
 800a8b4:	003b      	movs	r3, r7
 800a8b6:	4661      	mov	r1, ip
 800a8b8:	686a      	ldr	r2, [r5, #4]
 800a8ba:	0017      	movs	r7, r2
 800a8bc:	1a52      	subs	r2, r2, r1
 800a8be:	4293      	cmp	r3, r2
 800a8c0:	dc36      	bgt.n	800a930 <fn_0800A81C+0x114>
 800a8c2:	2100      	movs	r1, #0
 800a8c4:	0028      	movs	r0, r5
 800a8c6:	606a      	str	r2, [r5, #4]
 800a8c8:	f005 fa2e 	bl	800fd28 <fn_0800FD28>
 800a8cc:	2800      	cmp	r0, #0
 800a8ce:	d11e      	bne.n	800a90e <fn_0800A81C+0xf2>
 800a8d0:	2700      	movs	r7, #0
 800a8d2:	6925      	ldr	r5, [r4, #16]
 800a8d4:	e002      	b.n	800a8dc <fn_0800A81C+0xc0>
 800a8d6:	2700      	movs	r7, #0
 800a8d8:	e7c5      	b.n	800a866 <fn_0800A81C+0x4a>
 800a8da:	2700      	movs	r7, #0
 800a8dc:	6963      	ldr	r3, [r4, #20]
 800a8de:	69a2      	ldr	r2, [r4, #24]
 800a8e0:	6a21      	ldr	r1, [r4, #32]
 800a8e2:	9301      	str	r3, [sp, #4]
 800a8e4:	2300      	movs	r3, #0
 800a8e6:	0028      	movs	r0, r5
 800a8e8:	9300      	str	r3, [sp, #0]
 800a8ea:	f7ff ff0b 	bl	800a704 <fn_0800A704>
 800a8ee:	e7c4      	b.n	800a87a <fn_0800A81C+0x5e>
 800a8f0:	602f      	str	r7, [r5, #0]
 800a8f2:	2100      	movs	r1, #0
 800a8f4:	0028      	movs	r0, r5
 800a8f6:	f005 fa17 	bl	800fd28 <fn_0800FD28>
 800a8fa:	6832      	ldr	r2, [r6, #0]
 800a8fc:	4b18      	ldr	r3, [pc, #96]	@ (800a960 <fn_0800A81C+0x144>)
 800a8fe:	58d3      	ldr	r3, [r2, r3]
 800a900:	075b      	lsls	r3, r3, #29
 800a902:	d1cc      	bne.n	800a89e <fn_0800A81C+0x82>
 800a904:	2116      	movs	r1, #22
 800a906:	6920      	ldr	r0, [r4, #16]
 800a908:	f00a fdd0 	bl	80154ac <fn_080154AC>
 800a90c:	e7c7      	b.n	800a89e <fn_0800A81C+0x82>
 800a90e:	606f      	str	r7, [r5, #4]
 800a910:	e7ef      	b.n	800a8f2 <fn_0800A81C+0xd6>
 800a912:	2116      	movs	r1, #22
 800a914:	6920      	ldr	r0, [r4, #16]
 800a916:	f00a fdc9 	bl	80154ac <fn_080154AC>
 800a91a:	e7b3      	b.n	800a884 <fn_0800A81C+0x68>
 800a91c:	2100      	movs	r1, #0
 800a91e:	0028      	movs	r0, r5
 800a920:	602a      	str	r2, [r5, #0]
 800a922:	f005 fa01 	bl	800fd28 <fn_0800FD28>
 800a926:	2800      	cmp	r0, #0
 800a928:	d10c      	bne.n	800a944 <fn_0800A81C+0x128>
 800a92a:	2702      	movs	r7, #2
 800a92c:	6925      	ldr	r5, [r4, #16]
 800a92e:	e79a      	b.n	800a866 <fn_0800A81C+0x4a>
 800a930:	2100      	movs	r1, #0
 800a932:	0028      	movs	r0, r5
 800a934:	606b      	str	r3, [r5, #4]
 800a936:	f005 f9f7 	bl	800fd28 <fn_0800FD28>
 800a93a:	2800      	cmp	r0, #0
 800a93c:	d108      	bne.n	800a950 <fn_0800A81C+0x134>
 800a93e:	2702      	movs	r7, #2
 800a940:	6925      	ldr	r5, [r4, #16]
 800a942:	e7cb      	b.n	800a8dc <fn_0800A81C+0xc0>
 800a944:	2100      	movs	r1, #0
 800a946:	0028      	movs	r0, r5
 800a948:	602f      	str	r7, [r5, #0]
 800a94a:	f005 f9ed 	bl	800fd28 <fn_0800FD28>
 800a94e:	e7ec      	b.n	800a92a <fn_0800A81C+0x10e>
 800a950:	2100      	movs	r1, #0
 800a952:	0028      	movs	r0, r5
 800a954:	606f      	str	r7, [r5, #4]
 800a956:	f005 f9e7 	bl	800fd28 <fn_0800FD28>
 800a95a:	e7f0      	b.n	800a93e <fn_0800A81C+0x122>
 800a95c:	030064c4 	.word	0x030064c4
 800a960:	000010ec 	.word	0x000010ec
