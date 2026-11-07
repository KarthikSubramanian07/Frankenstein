fn_0801B7FC:
 801b7fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801b7fe:	000c      	movs	r4, r1
 801b800:	218c      	movs	r1, #140	@ 0x8c
 801b802:	22ce      	movs	r2, #206	@ 0xce
 801b804:	4d52      	ldr	r5, [pc, #328]	@ (801b950 <fn_0801B7FC+0x154>)
 801b806:	682b      	ldr	r3, [r5, #0]
 801b808:	0049      	lsls	r1, r1, #1
 801b80a:	5859      	ldr	r1, [r3, r1]
 801b80c:	0052      	lsls	r2, r2, #1
 801b80e:	0006      	movs	r6, r0
 801b810:	589a      	ldr	r2, [r3, r2]
 801b812:	2900      	cmp	r1, #0
 801b814:	d005      	beq.n	801b822 <fn_0801B7FC+0x26>
 801b816:	200c      	movs	r0, #12
 801b818:	1189      	asrs	r1, r1, #6
 801b81a:	1a41      	subs	r1, r0, r1
 801b81c:	428a      	cmp	r2, r1
 801b81e:	da00      	bge.n	801b822 <fn_0801B7FC+0x26>
 801b820:	e07e      	b.n	801b920 <fn_0801B7FC+0x124>
 801b822:	2a00      	cmp	r2, #0
 801b824:	d05b      	beq.n	801b8de <fn_0801B7FC+0xe2>
 801b826:	3207      	adds	r2, #7
 801b828:	10d0      	asrs	r0, r2, #3
 801b82a:	2a3f      	cmp	r2, #63	@ 0x3f
 801b82c:	dd00      	ble.n	801b830 <fn_0801B7FC+0x34>
 801b82e:	e070      	b.n	801b912 <fn_0801B7FC+0x116>
 801b830:	4a48      	ldr	r2, [pc, #288]	@ (801b954 <fn_0801B7FC+0x158>)
 801b832:	5c9a      	ldrb	r2, [r3, r2]
 801b834:	2a00      	cmp	r2, #0
 801b836:	d16a      	bne.n	801b90e <fn_0801B7FC+0x112>
 801b838:	3001      	adds	r0, #1
 801b83a:	4a47      	ldr	r2, [pc, #284]	@ (801b958 <fn_0801B7FC+0x15c>)
 801b83c:	5899      	ldr	r1, [r3, r2]
 801b83e:	4281      	cmp	r1, r0
 801b840:	d002      	beq.n	801b848 <fn_0801B7FC+0x4c>
 801b842:	5098      	str	r0, [r3, r2]
 801b844:	f000 fcf4 	bl	801c230 <fn_0801C230>
 801b848:	2e00      	cmp	r6, #0
 801b84a:	d045      	beq.n	801b8d8 <fn_0801B7FC+0xdc>
 801b84c:	6828      	ldr	r0, [r5, #0]
 801b84e:	4b43      	ldr	r3, [pc, #268]	@ (801b95c <fn_0801B7FC+0x160>)
 801b850:	2c00      	cmp	r4, #0
 801b852:	d14f      	bne.n	801b8f4 <fn_0801B7FC+0xf8>
 801b854:	58c3      	ldr	r3, [r0, r3]
 801b856:	2b02      	cmp	r3, #2
 801b858:	d04e      	beq.n	801b8f8 <fn_0801B7FC+0xfc>
 801b85a:	2b00      	cmp	r3, #0
 801b85c:	d000      	beq.n	801b860 <fn_0801B7FC+0x64>
 801b85e:	e073      	b.n	801b948 <fn_0801B7FC+0x14c>
 801b860:	4b3f      	ldr	r3, [pc, #252]	@ (801b960 <fn_0801B7FC+0x164>)
 801b862:	0021      	movs	r1, r4
 801b864:	18c0      	adds	r0, r0, r3
 801b866:	f7ff fae9 	bl	801ae3c <fn_0801AE3C>
 801b86a:	4e3e      	ldr	r6, [pc, #248]	@ (801b964 <fn_0801B7FC+0x168>)
 801b86c:	4f3e      	ldr	r7, [pc, #248]	@ (801b968 <fn_0801B7FC+0x16c>)
 801b86e:	6828      	ldr	r0, [r5, #0]
 801b870:	0021      	movs	r1, r4
 801b872:	1980      	adds	r0, r0, r6
 801b874:	f7ff fae2 	bl	801ae3c <fn_0801AE3C>
 801b878:	0033      	movs	r3, r6
 801b87a:	6828      	ldr	r0, [r5, #0]
 801b87c:	3380      	adds	r3, #128	@ 0x80
 801b87e:	0021      	movs	r1, r4
 801b880:	18c0      	adds	r0, r0, r3
 801b882:	3620      	adds	r6, #32
 801b884:	f7ff fada 	bl	801ae3c <fn_0801AE3C>
 801b888:	42be      	cmp	r6, r7
 801b88a:	d1f0      	bne.n	801b86e <fn_0801B7FC+0x72>
 801b88c:	4b37      	ldr	r3, [pc, #220]	@ (801b96c <fn_0801B7FC+0x170>)
 801b88e:	6828      	ldr	r0, [r5, #0]
 801b890:	0021      	movs	r1, r4
 801b892:	18c0      	adds	r0, r0, r3
 801b894:	f7ff fad2 	bl	801ae3c <fn_0801AE3C>
 801b898:	4b35      	ldr	r3, [pc, #212]	@ (801b970 <fn_0801B7FC+0x174>)
 801b89a:	6828      	ldr	r0, [r5, #0]
 801b89c:	0021      	movs	r1, r4
 801b89e:	18c0      	adds	r0, r0, r3
 801b8a0:	f7ff facc 	bl	801ae3c <fn_0801AE3C>
 801b8a4:	6828      	ldr	r0, [r5, #0]
 801b8a6:	4b33      	ldr	r3, [pc, #204]	@ (801b974 <fn_0801B7FC+0x178>)
 801b8a8:	0021      	movs	r1, r4
 801b8aa:	18c0      	adds	r0, r0, r3
 801b8ac:	f7ff fc0e 	bl	801b0cc <fn_0801B0CC>
 801b8b0:	4e31      	ldr	r6, [pc, #196]	@ (801b978 <fn_0801B7FC+0x17c>)
 801b8b2:	4f2c      	ldr	r7, [pc, #176]	@ (801b964 <fn_0801B7FC+0x168>)
 801b8b4:	6828      	ldr	r0, [r5, #0]
 801b8b6:	0021      	movs	r1, r4
 801b8b8:	1980      	adds	r0, r0, r6
 801b8ba:	361c      	adds	r6, #28
 801b8bc:	f7ff fc06 	bl	801b0cc <fn_0801B0CC>
 801b8c0:	42be      	cmp	r6, r7
 801b8c2:	d1f7      	bne.n	801b8b4 <fn_0801B7FC+0xb8>
 801b8c4:	4e2d      	ldr	r6, [pc, #180]	@ (801b97c <fn_0801B7FC+0x180>)
 801b8c6:	4f2b      	ldr	r7, [pc, #172]	@ (801b974 <fn_0801B7FC+0x178>)
 801b8c8:	6828      	ldr	r0, [r5, #0]
 801b8ca:	0021      	movs	r1, r4
 801b8cc:	1980      	adds	r0, r0, r6
 801b8ce:	361c      	adds	r6, #28
 801b8d0:	f7ff fbfc 	bl	801b0cc <fn_0801B0CC>
 801b8d4:	42be      	cmp	r6, r7
 801b8d6:	d1f7      	bne.n	801b8c8 <fn_0801B7FC+0xcc>
 801b8d8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801b8da:	bc01      	pop	{r0}
 801b8dc:	4700      	bx	r0
 801b8de:	22d0      	movs	r2, #208	@ 0xd0
 801b8e0:	0052      	lsls	r2, r2, #1
 801b8e2:	589a      	ldr	r2, [r3, r2]
 801b8e4:	2a00      	cmp	r2, #0
 801b8e6:	d01d      	beq.n	801b924 <fn_0801B7FC+0x128>
 801b8e8:	3207      	adds	r2, #7
 801b8ea:	10d0      	asrs	r0, r2, #3
 801b8ec:	2a1f      	cmp	r2, #31
 801b8ee:	dc28      	bgt.n	801b942 <fn_0801B7FC+0x146>
 801b8f0:	3009      	adds	r0, #9
 801b8f2:	e7a2      	b.n	801b83a <fn_0801B7FC+0x3e>
 801b8f4:	2202      	movs	r2, #2
 801b8f6:	50c2      	str	r2, [r0, r3]
 801b8f8:	f7ff fc7e 	bl	801b1f8 <fn_0801B1F8>
 801b8fc:	0034      	movs	r4, r6
 801b8fe:	6828      	ldr	r0, [r5, #0]
 801b900:	4a16      	ldr	r2, [pc, #88]	@ (801b95c <fn_0801B7FC+0x160>)
 801b902:	5883      	ldr	r3, [r0, r2]
 801b904:	2b00      	cmp	r3, #0
 801b906:	d0ab      	beq.n	801b860 <fn_0801B7FC+0x64>
 801b908:	3b01      	subs	r3, #1
 801b90a:	5083      	str	r3, [r0, r2]
 801b90c:	e7a8      	b.n	801b860 <fn_0801B7FC+0x64>
 801b90e:	1040      	asrs	r0, r0, #1
 801b910:	e792      	b.n	801b838 <fn_0801B7FC+0x3c>
 801b912:	4a10      	ldr	r2, [pc, #64]	@ (801b954 <fn_0801B7FC+0x158>)
 801b914:	5c9a      	ldrb	r2, [r3, r2]
 801b916:	2007      	movs	r0, #7
 801b918:	2a00      	cmp	r2, #0
 801b91a:	d100      	bne.n	801b91e <fn_0801B7FC+0x122>
 801b91c:	e78c      	b.n	801b838 <fn_0801B7FC+0x3c>
 801b91e:	e7f6      	b.n	801b90e <fn_0801B7FC+0x112>
 801b920:	000a      	movs	r2, r1
 801b922:	e77e      	b.n	801b822 <fn_0801B7FC+0x26>
 801b924:	2290      	movs	r2, #144	@ 0x90
 801b926:	0052      	lsls	r2, r2, #1
 801b928:	589a      	ldr	r2, [r3, r2]
 801b92a:	200d      	movs	r0, #13
 801b92c:	2a80      	cmp	r2, #128	@ 0x80
 801b92e:	dd00      	ble.n	801b932 <fn_0801B7FC+0x136>
 801b930:	e783      	b.n	801b83a <fn_0801B7FC+0x3e>
 801b932:	2108      	movs	r1, #8
 801b934:	0008      	movs	r0, r1
 801b936:	4010      	ands	r0, r2
 801b938:	4211      	tst	r1, r2
 801b93a:	d100      	bne.n	801b93e <fn_0801B7FC+0x142>
 801b93c:	e77d      	b.n	801b83a <fn_0801B7FC+0x3e>
 801b93e:	200d      	movs	r0, #13
 801b940:	e77b      	b.n	801b83a <fn_0801B7FC+0x3e>
 801b942:	2003      	movs	r0, #3
 801b944:	3009      	adds	r0, #9
 801b946:	e778      	b.n	801b83a <fn_0801B7FC+0x3e>
 801b948:	f7ff fc7e 	bl	801b248 <fn_0801B248>
 801b94c:	e7d7      	b.n	801b8fe <fn_0801B7FC+0x102>
 801b94e:	46c0      	nop			@ (mov r8, r8)
 801b950:	030064c4 	.word	0x030064c4
 801b954:	00000792 	.word	0x00000792
 801b958:	00005a28 	.word	0x00005a28
 801b95c:	00005644 	.word	0x00005644
 801b960:	00005788 	.word	0x00005788
 801b964:	000058e0 	.word	0x000058e0
 801b968:	00005960 	.word	0x00005960
 801b96c:	000057a8 	.word	0x000057a8
 801b970:	000059e0 	.word	0x000059e0
 801b974:	00005870 	.word	0x00005870
 801b978:	0000588c 	.word	0x0000588c
 801b97c:	000057c8 	.word	0x000057c8
