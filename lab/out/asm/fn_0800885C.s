fn_0800885C:
 800885c:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
 800885e:	b570      	push	{r4, r5, r6, lr}
 8008860:	2200      	movs	r2, #0
 8008862:	689d      	ldr	r5, [r3, #8]
 8008864:	235d      	movs	r3, #93	@ 0x5d
 8008866:	0004      	movs	r4, r0
 8008868:	54c2      	strb	r2, [r0, r3]
 800886a:	2d00      	cmp	r5, #0
 800886c:	d02c      	beq.n	80088c8 <fn_0800885C+0x6c>
 800886e:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 8008870:	075b      	lsls	r3, r3, #29
 8008872:	d529      	bpl.n	80088c8 <fn_0800885C+0x6c>
 8008874:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8008876:	6505      	str	r5, [r0, #80]	@ 0x50
 8008878:	069b      	lsls	r3, r3, #26
 800887a:	d511      	bpl.n	80088a0 <fn_0800885C+0x44>
 800887c:	6901      	ldr	r1, [r0, #16]
 800887e:	692b      	ldr	r3, [r5, #16]
 8008880:	68c0      	ldr	r0, [r0, #12]
 8008882:	1ac9      	subs	r1, r1, r3
 8008884:	68eb      	ldr	r3, [r5, #12]
 8008886:	1ac0      	subs	r0, r0, r3
 8008888:	f007 fab8 	bl	800fdfc <fn_0800FDFC>
 800888c:	23c0      	movs	r3, #192	@ 0xc0
 800888e:	049b      	lsls	r3, r3, #18
 8008890:	4298      	cmp	r0, r3
 8008892:	dc16      	bgt.n	80088c2 <fn_0800885C+0x66>
 8008894:	0029      	movs	r1, r5
 8008896:	0020      	movs	r0, r4
 8008898:	f00b fd52 	bl	8014340 <fn_08014340>
 800889c:	2800      	cmp	r0, #0
 800889e:	d013      	beq.n	80088c8 <fn_0800885C+0x6c>
 80088a0:	235a      	movs	r3, #90	@ 0x5a
 80088a2:	225c      	movs	r2, #92	@ 0x5c
 80088a4:	5ce0      	ldrb	r0, [r4, r3]
 80088a6:	23ea      	movs	r3, #234	@ 0xea
 80088a8:	4342      	muls	r2, r0
 80088aa:	4d23      	ldr	r5, [pc, #140]	@ (8008938 <fn_0800885C+0xdc>)
 80088ac:	6829      	ldr	r1, [r5, #0]
 80088ae:	00db      	lsls	r3, r3, #3
 80088b0:	58cb      	ldr	r3, [r1, r3]
 80088b2:	189b      	adds	r3, r3, r2
 80088b4:	6919      	ldr	r1, [r3, #16]
 80088b6:	2900      	cmp	r1, #0
 80088b8:	d10d      	bne.n	80088d6 <fn_0800885C+0x7a>
 80088ba:	0020      	movs	r0, r4
 80088bc:	8999      	ldrh	r1, [r3, #12]
 80088be:	f008 fca5 	bl	801120c <fn_0801120C>
 80088c2:	bc70      	pop	{r4, r5, r6}
 80088c4:	bc01      	pop	{r0}
 80088c6:	4700      	bx	r0
 80088c8:	2100      	movs	r1, #0
 80088ca:	0020      	movs	r0, r4
 80088cc:	f7ff f88a 	bl	80079e4 <fn_080079E4>
 80088d0:	2800      	cmp	r0, #0
 80088d2:	d1e5      	bne.n	80088a0 <fn_0800885C+0x44>
 80088d4:	e7f5      	b.n	80088c2 <fn_0800885C+0x66>
 80088d6:	2926      	cmp	r1, #38	@ 0x26
 80088d8:	dd1e      	ble.n	8008918 <fn_0800885C+0xbc>
 80088da:	000b      	movs	r3, r1
 80088dc:	3b27      	subs	r3, #39	@ 0x27
 80088de:	2b01      	cmp	r3, #1
 80088e0:	d809      	bhi.n	80088f6 <fn_0800885C+0x9a>
 80088e2:	f7fe f90d 	bl	8006b00 <fn_08006B00>
 80088e6:	2101      	movs	r1, #1
 80088e8:	0fc3      	lsrs	r3, r0, #31
 80088ea:	18c0      	adds	r0, r0, r3
 80088ec:	4001      	ands	r1, r0
 80088ee:	1ac9      	subs	r1, r1, r3
 80088f0:	235a      	movs	r3, #90	@ 0x5a
 80088f2:	5ce0      	ldrb	r0, [r4, r3]
 80088f4:	3127      	adds	r1, #39	@ 0x27
 80088f6:	23fd      	movs	r3, #253	@ 0xfd
 80088f8:	3813      	subs	r0, #19
 80088fa:	4218      	tst	r0, r3
 80088fc:	d11a      	bne.n	8008934 <fn_0800885C+0xd8>
 80088fe:	2000      	movs	r0, #0
 8008900:	f011 fd3c 	bl	801a37c <fn_0801A37C>
 8008904:	235a      	movs	r3, #90	@ 0x5a
 8008906:	225c      	movs	r2, #92	@ 0x5c
 8008908:	5ce3      	ldrb	r3, [r4, r3]
 800890a:	435a      	muls	r2, r3
 800890c:	23ea      	movs	r3, #234	@ 0xea
 800890e:	6829      	ldr	r1, [r5, #0]
 8008910:	00db      	lsls	r3, r3, #3
 8008912:	58cb      	ldr	r3, [r1, r3]
 8008914:	189b      	adds	r3, r3, r2
 8008916:	e7d0      	b.n	80088ba <fn_0800885C+0x5e>
 8008918:	2923      	cmp	r1, #35	@ 0x23
 800891a:	ddec      	ble.n	80088f6 <fn_0800885C+0x9a>
 800891c:	f7fe f8f0 	bl	8006b00 <fn_08006B00>
 8008920:	2103      	movs	r1, #3
 8008922:	f01c fe39 	bl	8025598 <fn_08025598>
 8008926:	235a      	movs	r3, #90	@ 0x5a
 8008928:	5ce0      	ldrb	r0, [r4, r3]
 800892a:	23fd      	movs	r3, #253	@ 0xfd
 800892c:	3813      	subs	r0, #19
 800892e:	3124      	adds	r1, #36	@ 0x24
 8008930:	4218      	tst	r0, r3
 8008932:	d0e4      	beq.n	80088fe <fn_0800885C+0xa2>
 8008934:	0020      	movs	r0, r4
 8008936:	e7e3      	b.n	8008900 <fn_0800885C+0xa4>
 8008938:	030064c4 	.word	0x030064c4
