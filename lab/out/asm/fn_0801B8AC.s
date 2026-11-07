fn_0801B8AC:
 801b8ac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801b8ae:	000c      	movs	r4, r1
 801b8b0:	218c      	movs	r1, #140	@ 0x8c
 801b8b2:	22ce      	movs	r2, #206	@ 0xce
 801b8b4:	4d52      	ldr	r5, [pc, #328]	@ (801ba00 <fn_0801B8AC+0x154>)
 801b8b6:	682b      	ldr	r3, [r5, #0]
 801b8b8:	0049      	lsls	r1, r1, #1
 801b8ba:	5859      	ldr	r1, [r3, r1]
 801b8bc:	0052      	lsls	r2, r2, #1
 801b8be:	0006      	movs	r6, r0
 801b8c0:	589a      	ldr	r2, [r3, r2]
 801b8c2:	2900      	cmp	r1, #0
 801b8c4:	d005      	beq.n	801b8d2 <fn_0801B8AC+0x26>
 801b8c6:	200c      	movs	r0, #12
 801b8c8:	1189      	asrs	r1, r1, #6
 801b8ca:	1a41      	subs	r1, r0, r1
 801b8cc:	428a      	cmp	r2, r1
 801b8ce:	da00      	bge.n	801b8d2 <fn_0801B8AC+0x26>
 801b8d0:	e07e      	b.n	801b9d0 <fn_0801B8AC+0x124>
 801b8d2:	2a00      	cmp	r2, #0
 801b8d4:	d05b      	beq.n	801b98e <fn_0801B8AC+0xe2>
 801b8d6:	3207      	adds	r2, #7
 801b8d8:	10d0      	asrs	r0, r2, #3
 801b8da:	2a3f      	cmp	r2, #63	@ 0x3f
 801b8dc:	dd00      	ble.n	801b8e0 <fn_0801B8AC+0x34>
 801b8de:	e070      	b.n	801b9c2 <fn_0801B8AC+0x116>
 801b8e0:	4a48      	ldr	r2, [pc, #288]	@ (801ba04 <fn_0801B8AC+0x158>)
 801b8e2:	5c9a      	ldrb	r2, [r3, r2]
 801b8e4:	2a00      	cmp	r2, #0
 801b8e6:	d16a      	bne.n	801b9be <fn_0801B8AC+0x112>
 801b8e8:	3001      	adds	r0, #1
 801b8ea:	4a47      	ldr	r2, [pc, #284]	@ (801ba08 <fn_0801B8AC+0x15c>)
 801b8ec:	5899      	ldr	r1, [r3, r2]
 801b8ee:	4281      	cmp	r1, r0
 801b8f0:	d002      	beq.n	801b8f8 <fn_0801B8AC+0x4c>
 801b8f2:	5098      	str	r0, [r3, r2]
 801b8f4:	f000 fcf4 	bl	801c2e0 <fn_0801C2E0>
 801b8f8:	2e00      	cmp	r6, #0
 801b8fa:	d045      	beq.n	801b988 <fn_0801B8AC+0xdc>
 801b8fc:	6828      	ldr	r0, [r5, #0]
 801b8fe:	4b43      	ldr	r3, [pc, #268]	@ (801ba0c <fn_0801B8AC+0x160>)
 801b900:	2c00      	cmp	r4, #0
 801b902:	d14f      	bne.n	801b9a4 <fn_0801B8AC+0xf8>
 801b904:	58c3      	ldr	r3, [r0, r3]
 801b906:	2b02      	cmp	r3, #2
 801b908:	d04e      	beq.n	801b9a8 <fn_0801B8AC+0xfc>
 801b90a:	2b00      	cmp	r3, #0
 801b90c:	d000      	beq.n	801b910 <fn_0801B8AC+0x64>
 801b90e:	e073      	b.n	801b9f8 <fn_0801B8AC+0x14c>
 801b910:	4b3f      	ldr	r3, [pc, #252]	@ (801ba10 <fn_0801B8AC+0x164>)
 801b912:	0021      	movs	r1, r4
 801b914:	18c0      	adds	r0, r0, r3
 801b916:	f7ff faeb 	bl	801aef0 <fn_0801AEF0>
 801b91a:	4e3e      	ldr	r6, [pc, #248]	@ (801ba14 <fn_0801B8AC+0x168>)
 801b91c:	4f3e      	ldr	r7, [pc, #248]	@ (801ba18 <fn_0801B8AC+0x16c>)
 801b91e:	6828      	ldr	r0, [r5, #0]
 801b920:	0021      	movs	r1, r4
 801b922:	1980      	adds	r0, r0, r6
 801b924:	f7ff fae4 	bl	801aef0 <fn_0801AEF0>
 801b928:	0033      	movs	r3, r6
 801b92a:	6828      	ldr	r0, [r5, #0]
 801b92c:	3380      	adds	r3, #128	@ 0x80
 801b92e:	0021      	movs	r1, r4
 801b930:	18c0      	adds	r0, r0, r3
 801b932:	3620      	adds	r6, #32
 801b934:	f7ff fadc 	bl	801aef0 <fn_0801AEF0>
 801b938:	42be      	cmp	r6, r7
 801b93a:	d1f0      	bne.n	801b91e <fn_0801B8AC+0x72>
 801b93c:	4b37      	ldr	r3, [pc, #220]	@ (801ba1c <fn_0801B8AC+0x170>)
 801b93e:	6828      	ldr	r0, [r5, #0]
 801b940:	0021      	movs	r1, r4
 801b942:	18c0      	adds	r0, r0, r3
 801b944:	f7ff fad4 	bl	801aef0 <fn_0801AEF0>
 801b948:	4b35      	ldr	r3, [pc, #212]	@ (801ba20 <fn_0801B8AC+0x174>)
 801b94a:	6828      	ldr	r0, [r5, #0]
 801b94c:	0021      	movs	r1, r4
 801b94e:	18c0      	adds	r0, r0, r3
 801b950:	f7ff face 	bl	801aef0 <fn_0801AEF0>
 801b954:	6828      	ldr	r0, [r5, #0]
 801b956:	4b33      	ldr	r3, [pc, #204]	@ (801ba24 <fn_0801B8AC+0x178>)
 801b958:	0021      	movs	r1, r4
 801b95a:	18c0      	adds	r0, r0, r3
 801b95c:	f7ff fc10 	bl	801b180 <fn_0801B180>
 801b960:	4e31      	ldr	r6, [pc, #196]	@ (801ba28 <fn_0801B8AC+0x17c>)
 801b962:	4f2c      	ldr	r7, [pc, #176]	@ (801ba14 <fn_0801B8AC+0x168>)
 801b964:	6828      	ldr	r0, [r5, #0]
 801b966:	0021      	movs	r1, r4
 801b968:	1980      	adds	r0, r0, r6
 801b96a:	361c      	adds	r6, #28
 801b96c:	f7ff fc08 	bl	801b180 <fn_0801B180>
 801b970:	42be      	cmp	r6, r7
 801b972:	d1f7      	bne.n	801b964 <fn_0801B8AC+0xb8>
 801b974:	4e2d      	ldr	r6, [pc, #180]	@ (801ba2c <fn_0801B8AC+0x180>)
 801b976:	4f2b      	ldr	r7, [pc, #172]	@ (801ba24 <fn_0801B8AC+0x178>)
 801b978:	6828      	ldr	r0, [r5, #0]
 801b97a:	0021      	movs	r1, r4
 801b97c:	1980      	adds	r0, r0, r6
 801b97e:	361c      	adds	r6, #28
 801b980:	f7ff fbfe 	bl	801b180 <fn_0801B180>
 801b984:	42be      	cmp	r6, r7
 801b986:	d1f7      	bne.n	801b978 <fn_0801B8AC+0xcc>
 801b988:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801b98a:	bc01      	pop	{r0}
 801b98c:	4700      	bx	r0
 801b98e:	22d0      	movs	r2, #208	@ 0xd0
 801b990:	0052      	lsls	r2, r2, #1
 801b992:	589a      	ldr	r2, [r3, r2]
 801b994:	2a00      	cmp	r2, #0
 801b996:	d01d      	beq.n	801b9d4 <fn_0801B8AC+0x128>
 801b998:	3207      	adds	r2, #7
 801b99a:	10d0      	asrs	r0, r2, #3
 801b99c:	2a1f      	cmp	r2, #31
 801b99e:	dc28      	bgt.n	801b9f2 <fn_0801B8AC+0x146>
 801b9a0:	3009      	adds	r0, #9
 801b9a2:	e7a2      	b.n	801b8ea <fn_0801B8AC+0x3e>
 801b9a4:	2202      	movs	r2, #2
 801b9a6:	50c2      	str	r2, [r0, r3]
 801b9a8:	f7ff fc80 	bl	801b2ac <fn_0801B2AC>
 801b9ac:	0034      	movs	r4, r6
 801b9ae:	6828      	ldr	r0, [r5, #0]
 801b9b0:	4a16      	ldr	r2, [pc, #88]	@ (801ba0c <fn_0801B8AC+0x160>)
 801b9b2:	5883      	ldr	r3, [r0, r2]
 801b9b4:	2b00      	cmp	r3, #0
 801b9b6:	d0ab      	beq.n	801b910 <fn_0801B8AC+0x64>
 801b9b8:	3b01      	subs	r3, #1
 801b9ba:	5083      	str	r3, [r0, r2]
 801b9bc:	e7a8      	b.n	801b910 <fn_0801B8AC+0x64>
 801b9be:	1040      	asrs	r0, r0, #1
 801b9c0:	e792      	b.n	801b8e8 <fn_0801B8AC+0x3c>
 801b9c2:	4a10      	ldr	r2, [pc, #64]	@ (801ba04 <fn_0801B8AC+0x158>)
 801b9c4:	5c9a      	ldrb	r2, [r3, r2]
 801b9c6:	2007      	movs	r0, #7
 801b9c8:	2a00      	cmp	r2, #0
 801b9ca:	d100      	bne.n	801b9ce <fn_0801B8AC+0x122>
 801b9cc:	e78c      	b.n	801b8e8 <fn_0801B8AC+0x3c>
 801b9ce:	e7f6      	b.n	801b9be <fn_0801B8AC+0x112>
 801b9d0:	000a      	movs	r2, r1
 801b9d2:	e77e      	b.n	801b8d2 <fn_0801B8AC+0x26>
 801b9d4:	2290      	movs	r2, #144	@ 0x90
 801b9d6:	0052      	lsls	r2, r2, #1
 801b9d8:	589a      	ldr	r2, [r3, r2]
 801b9da:	200d      	movs	r0, #13
 801b9dc:	2a80      	cmp	r2, #128	@ 0x80
 801b9de:	dd00      	ble.n	801b9e2 <fn_0801B8AC+0x136>
 801b9e0:	e783      	b.n	801b8ea <fn_0801B8AC+0x3e>
 801b9e2:	2108      	movs	r1, #8
 801b9e4:	0008      	movs	r0, r1
 801b9e6:	4010      	ands	r0, r2
 801b9e8:	4211      	tst	r1, r2
 801b9ea:	d100      	bne.n	801b9ee <fn_0801B8AC+0x142>
 801b9ec:	e77d      	b.n	801b8ea <fn_0801B8AC+0x3e>
 801b9ee:	200d      	movs	r0, #13
 801b9f0:	e77b      	b.n	801b8ea <fn_0801B8AC+0x3e>
 801b9f2:	2003      	movs	r0, #3
 801b9f4:	3009      	adds	r0, #9
 801b9f6:	e778      	b.n	801b8ea <fn_0801B8AC+0x3e>
 801b9f8:	f7ff fc80 	bl	801b2fc <fn_0801B2FC>
 801b9fc:	e7d7      	b.n	801b9ae <fn_0801B8AC+0x102>
 801b9fe:	46c0      	nop			@ (mov r8, r8)
 801ba00:	030064c4 	.word	0x030064c4
 801ba04:	00000792 	.word	0x00000792
 801ba08:	00005a28 	.word	0x00005a28
 801ba0c:	00005644 	.word	0x00005644
 801ba10:	00005788 	.word	0x00005788
 801ba14:	000058e0 	.word	0x000058e0
 801ba18:	00005960 	.word	0x00005960
 801ba1c:	000057a8 	.word	0x000057a8
 801ba20:	000059e0 	.word	0x000059e0
 801ba24:	00005870 	.word	0x00005870
 801ba28:	0000588c 	.word	0x0000588c
 801ba2c:	000057c8 	.word	0x000057c8
