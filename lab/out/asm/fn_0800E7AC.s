fn_0800E7AC:
 800e7ac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800e7ae:	0004      	movs	r4, r0
 800e7b0:	4d52      	ldr	r5, [pc, #328]	@ (800e8fc <fn_0800E7AC+0x150>)
 800e7b2:	4b53      	ldr	r3, [pc, #332]	@ (800e900 <fn_0800E7AC+0x154>)
 800e7b4:	682a      	ldr	r2, [r5, #0]
 800e7b6:	58d0      	ldr	r0, [r2, r3]
 800e7b8:	8a63      	ldrh	r3, [r4, #18]
 800e7ba:	6882      	ldr	r2, [r0, #8]
 800e7bc:	041b      	lsls	r3, r3, #16
 800e7be:	429a      	cmp	r2, r3
 800e7c0:	da0e      	bge.n	800e7e0 <fn_0800E7AC+0x34>
 800e7c2:	8a23      	ldrh	r3, [r4, #16]
 800e7c4:	68c2      	ldr	r2, [r0, #12]
 800e7c6:	041b      	lsls	r3, r3, #16
 800e7c8:	429a      	cmp	r2, r3
 800e7ca:	dd09      	ble.n	800e7e0 <fn_0800E7AC+0x34>
 800e7cc:	89a3      	ldrh	r3, [r4, #12]
 800e7ce:	6842      	ldr	r2, [r0, #4]
 800e7d0:	041b      	lsls	r3, r3, #16
 800e7d2:	429a      	cmp	r2, r3
 800e7d4:	da04      	bge.n	800e7e0 <fn_0800E7AC+0x34>
 800e7d6:	89e3      	ldrh	r3, [r4, #14]
 800e7d8:	6802      	ldr	r2, [r0, #0]
 800e7da:	041b      	lsls	r3, r3, #16
 800e7dc:	429a      	cmp	r2, r3
 800e7de:	dc03      	bgt.n	800e7e8 <fn_0800E7AC+0x3c>
 800e7e0:	2001      	movs	r0, #1
 800e7e2:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800e7e4:	bc02      	pop	{r1}
 800e7e6:	4708      	bx	r1
 800e7e8:	0021      	movs	r1, r4
 800e7ea:	f001 fb47 	bl	800fe7c <fn_0800FE7C>
 800e7ee:	3001      	adds	r0, #1
 800e7f0:	d1f6      	bne.n	800e7e0 <fn_0800E7AC+0x34>
 800e7f2:	8ae1      	ldrh	r1, [r4, #22]
 800e7f4:	4a43      	ldr	r2, [pc, #268]	@ (800e904 <fn_0800E7AC+0x158>)
 800e7f6:	682b      	ldr	r3, [r5, #0]
 800e7f8:	4291      	cmp	r1, r2
 800e7fa:	d058      	beq.n	800e8ae <fn_0800E7AC+0x102>
 800e7fc:	4a42      	ldr	r2, [pc, #264]	@ (800e908 <fn_0800E7AC+0x15c>)
 800e7fe:	5898      	ldr	r0, [r3, r2]
 800e800:	6cc2      	ldr	r2, [r0, #76]	@ 0x4c
 800e802:	03d2      	lsls	r2, r2, #15
 800e804:	d410      	bmi.n	800e828 <fn_0800E7AC+0x7c>
 800e806:	2101      	movs	r1, #1
 800e808:	8b22      	ldrh	r2, [r4, #24]
 800e80a:	4211      	tst	r1, r2
 800e80c:	d005      	beq.n	800e81a <fn_0800E7AC+0x6e>
 800e80e:	4a3f      	ldr	r2, [pc, #252]	@ (800e90c <fn_0800E7AC+0x160>)
 800e810:	589b      	ldr	r3, [r3, r2]
 800e812:	2b00      	cmp	r3, #0
 800e814:	d144      	bne.n	800e8a0 <fn_0800E7AC+0xf4>
 800e816:	2000      	movs	r0, #0
 800e818:	e7e3      	b.n	800e7e2 <fn_0800E7AC+0x36>
 800e81a:	f003 fd0b 	bl	8012234 <fn_08012234>
 800e81e:	2800      	cmp	r0, #0
 800e820:	d102      	bne.n	800e828 <fn_0800E7AC+0x7c>
 800e822:	8b23      	ldrh	r3, [r4, #24]
 800e824:	079b      	lsls	r3, r3, #30
 800e826:	d4f6      	bmi.n	800e816 <fn_0800E7AC+0x6a>
 800e828:	0020      	movs	r0, r4
 800e82a:	f001 fc01 	bl	8010030 <fn_08010030>
 800e82e:	682b      	ldr	r3, [r5, #0]
 800e830:	4a37      	ldr	r2, [pc, #220]	@ (800e910 <fn_0800E7AC+0x164>)
 800e832:	5899      	ldr	r1, [r3, r2]
 800e834:	4a37      	ldr	r2, [pc, #220]	@ (800e914 <fn_0800E7AC+0x168>)
 800e836:	5898      	ldr	r0, [r3, r2]
 800e838:	4281      	cmp	r1, r0
 800e83a:	da04      	bge.n	800e846 <fn_0800E7AC+0x9a>
 800e83c:	5099      	str	r1, [r3, r2]
 800e83e:	4a36      	ldr	r2, [pc, #216]	@ (800e918 <fn_0800E7AC+0x16c>)
 800e840:	509c      	str	r4, [r3, r2]
 800e842:	3204      	adds	r2, #4
 800e844:	509c      	str	r4, [r3, r2]
 800e846:	2293      	movs	r2, #147	@ 0x93
 800e848:	0112      	lsls	r2, r2, #4
 800e84a:	5899      	ldr	r1, [r3, r2]
 800e84c:	3a80      	subs	r2, #128	@ 0x80
 800e84e:	5898      	ldr	r0, [r3, r2]
 800e850:	4281      	cmp	r1, r0
 800e852:	dd04      	ble.n	800e85e <fn_0800E7AC+0xb2>
 800e854:	5099      	str	r1, [r3, r2]
 800e856:	4a31      	ldr	r2, [pc, #196]	@ (800e91c <fn_0800E7AC+0x170>)
 800e858:	509c      	str	r4, [r3, r2]
 800e85a:	3a04      	subs	r2, #4
 800e85c:	509c      	str	r4, [r3, r2]
 800e85e:	4a30      	ldr	r2, [pc, #192]	@ (800e920 <fn_0800E7AC+0x174>)
 800e860:	5899      	ldr	r1, [r3, r2]
 800e862:	4a30      	ldr	r2, [pc, #192]	@ (800e924 <fn_0800E7AC+0x178>)
 800e864:	5898      	ldr	r0, [r3, r2]
 800e866:	4281      	cmp	r1, r0
 800e868:	da00      	bge.n	800e86c <fn_0800E7AC+0xc0>
 800e86a:	5099      	str	r1, [r3, r2]
 800e86c:	4a2e      	ldr	r2, [pc, #184]	@ (800e928 <fn_0800E7AC+0x17c>)
 800e86e:	8be1      	ldrh	r1, [r4, #30]
 800e870:	589a      	ldr	r2, [r3, r2]
 800e872:	0089      	lsls	r1, r1, #2
 800e874:	1852      	adds	r2, r2, r1
 800e876:	78d2      	ldrb	r2, [r2, #3]
 800e878:	0651      	lsls	r1, r2, #25
 800e87a:	d4b1      	bmi.n	800e7e0 <fn_0800E7AC+0x34>
 800e87c:	201a      	movs	r0, #26
 800e87e:	5e21      	ldrsh	r1, [r4, r0]
 800e880:	09d2      	lsrs	r2, r2, #7
 800e882:	0212      	lsls	r2, r2, #8
 800e884:	4291      	cmp	r1, r2
 800e886:	d0ab      	beq.n	800e7e0 <fn_0800E7AC+0x34>
 800e888:	4928      	ldr	r1, [pc, #160]	@ (800e92c <fn_0800E7AC+0x180>)
 800e88a:	585a      	ldr	r2, [r3, r1]
 800e88c:	2a03      	cmp	r2, #3
 800e88e:	dca7      	bgt.n	800e7e0 <fn_0800E7AC+0x34>
 800e890:	1c50      	adds	r0, r2, #1
 800e892:	5058      	str	r0, [r3, r1]
 800e894:	4926      	ldr	r1, [pc, #152]	@ (800e930 <fn_0800E7AC+0x184>)
 800e896:	1852      	adds	r2, r2, r1
 800e898:	0092      	lsls	r2, r2, #2
 800e89a:	189b      	adds	r3, r3, r2
 800e89c:	605c      	str	r4, [r3, #4]
 800e89e:	e79f      	b.n	800e7e0 <fn_0800E7AC+0x34>
 800e8a0:	0020      	movs	r0, r4
 800e8a2:	f7ff fe73 	bl	800e58c <fn_0800E58C>
 800e8a6:	2301      	movs	r3, #1
 800e8a8:	4383      	bics	r3, r0
 800e8aa:	0018      	movs	r0, r3
 800e8ac:	e799      	b.n	800e7e2 <fn_0800E7AC+0x36>
 800e8ae:	228c      	movs	r2, #140	@ 0x8c
 800e8b0:	0112      	lsls	r2, r2, #4
 800e8b2:	509c      	str	r4, [r3, r2]
 800e8b4:	4a15      	ldr	r2, [pc, #84]	@ (800e90c <fn_0800E7AC+0x160>)
 800e8b6:	589b      	ldr	r3, [r3, r2]
 800e8b8:	2b00      	cmp	r3, #0
 800e8ba:	d0ac      	beq.n	800e816 <fn_0800E7AC+0x6a>
 800e8bc:	0020      	movs	r0, r4
 800e8be:	f7ff fe65 	bl	800e58c <fn_0800E58C>
 800e8c2:	2800      	cmp	r0, #0
 800e8c4:	d1a7      	bne.n	800e816 <fn_0800E7AC+0x6a>
 800e8c6:	682e      	ldr	r6, [r5, #0]
 800e8c8:	4b0f      	ldr	r3, [pc, #60]	@ (800e908 <fn_0800E7AC+0x15c>)
 800e8ca:	58f5      	ldr	r5, [r6, r3]
 800e8cc:	3304      	adds	r3, #4
 800e8ce:	58f0      	ldr	r0, [r6, r3]
 800e8d0:	8961      	ldrh	r1, [r4, #10]
 800e8d2:	68eb      	ldr	r3, [r5, #12]
 800e8d4:	0409      	lsls	r1, r1, #16
 800e8d6:	1ac0      	subs	r0, r0, r3
 800e8d8:	f016 fed8 	bl	802568c <fn_0802568C>
 800e8dc:	4b15      	ldr	r3, [pc, #84]	@ (800e934 <fn_0800E7AC+0x188>)
 800e8de:	0007      	movs	r7, r0
 800e8e0:	8921      	ldrh	r1, [r4, #8]
 800e8e2:	58f0      	ldr	r0, [r6, r3]
 800e8e4:	692b      	ldr	r3, [r5, #16]
 800e8e6:	0409      	lsls	r1, r1, #16
 800e8e8:	1ac0      	subs	r0, r0, r3
 800e8ea:	f016 fecf 	bl	802568c <fn_0802568C>
 800e8ee:	2301      	movs	r3, #1
 800e8f0:	4287      	cmp	r7, r0
 800e8f2:	dc00      	bgt.n	800e8f6 <fn_0800E7AC+0x14a>
 800e8f4:	2300      	movs	r3, #0
 800e8f6:	0618      	lsls	r0, r3, #24
 800e8f8:	0e00      	lsrs	r0, r0, #24
 800e8fa:	e772      	b.n	800e7e2 <fn_0800E7AC+0x36>
 800e8fc:	030064c4 	.word	0x030064c4
 800e900:	000008a8 	.word	0x000008a8
 800e904:	0000ffff 	.word	0x0000ffff
 800e908:	0000088c 	.word	0x0000088c
 800e90c:	000008c8 	.word	0x000008c8
 800e910:	0000092c 	.word	0x0000092c
 800e914:	000008b4 	.word	0x000008b4
 800e918:	000008bc 	.word	0x000008bc
 800e91c:	000008c4 	.word	0x000008c4
 800e920:	00000938 	.word	0x00000938
 800e924:	000008b8 	.word	0x000008b8
 800e928:	00000e04 	.word	0x00000e04
 800e92c:	000008dc 	.word	0x000008dc
 800e930:	00000232 	.word	0x00000232
 800e934:	00000894 	.word	0x00000894
