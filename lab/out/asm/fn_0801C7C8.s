fn_0801C7C8:
 801c7c8:	4b29      	ldr	r3, [pc, #164]	@ (801c870 <fn_0801C7C8+0xa8>)
 801c7ca:	681a      	ldr	r2, [r3, #0]
 801c7cc:	4b29      	ldr	r3, [pc, #164]	@ (801c874 <fn_0801C7C8+0xac>)
 801c7ce:	58d1      	ldr	r1, [r2, r3]
 801c7d0:	2394      	movs	r3, #148	@ 0x94
 801c7d2:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c7d4:	5cd3      	ldrb	r3, [r2, r3]
 801c7d6:	68c8      	ldr	r0, [r1, #12]
 801c7d8:	b087      	sub	sp, #28
 801c7da:	2b02      	cmp	r3, #2
 801c7dc:	d03f      	beq.n	801c85e <fn_0801C7C8+0x96>
 801c7de:	ad03      	add	r5, sp, #12
 801c7e0:	680b      	ldr	r3, [r1, #0]
 801c7e2:	4a25      	ldr	r2, [pc, #148]	@ (801c878 <fn_0801C7C8+0xb0>)
 801c7e4:	9000      	str	r0, [sp, #0]
 801c7e6:	2109      	movs	r1, #9
 801c7e8:	0028      	movs	r0, r5
 801c7ea:	f7e8 fe35 	bl	8005458 <fn_08005458>
 801c7ee:	4c23      	ldr	r4, [pc, #140]	@ (801c87c <fn_0801C7C8+0xb4>)
 801c7f0:	0020      	movs	r0, r4
 801c7f2:	f000 fe9d 	bl	801d530 <fn_0801D530>
 801c7f6:	f7fc fd6d 	bl	80192d4 <fn_080192D4>
 801c7fa:	0006      	movs	r6, r0
 801c7fc:	0020      	movs	r0, r4
 801c7fe:	24a0      	movs	r4, #160	@ 0xa0
 801c800:	f000 fe96 	bl	801d530 <fn_0801D530>
 801c804:	0064      	lsls	r4, r4, #1
 801c806:	1ba1      	subs	r1, r4, r6
 801c808:	0fca      	lsrs	r2, r1, #31
 801c80a:	1852      	adds	r2, r2, r1
 801c80c:	0003      	movs	r3, r0
 801c80e:	2102      	movs	r1, #2
 801c810:	1050      	asrs	r0, r2, #1
 801c812:	2200      	movs	r2, #0
 801c814:	f7ff fce4 	bl	801c1e0 <fn_0801C1E0>
 801c818:	0028      	movs	r0, r5
 801c81a:	f000 fe89 	bl	801d530 <fn_0801D530>
 801c81e:	f7fc fd61 	bl	80192e4 <fn_080192E4>
 801c822:	0006      	movs	r6, r0
 801c824:	0028      	movs	r0, r5
 801c826:	f000 fe83 	bl	801d530 <fn_0801D530>
 801c82a:	f7fc fd53 	bl	80192d4 <fn_080192D4>
 801c82e:	0007      	movs	r7, r0
 801c830:	0028      	movs	r0, r5
 801c832:	f000 fe7d 	bl	801d530 <fn_0801D530>
 801c836:	2103      	movs	r1, #3
 801c838:	00b2      	lsls	r2, r6, #2
 801c83a:	1992      	adds	r2, r2, r6
 801c83c:	0003      	movs	r3, r0
 801c83e:	17d0      	asrs	r0, r2, #31
 801c840:	1be4      	subs	r4, r4, r7
 801c842:	4001      	ands	r1, r0
 801c844:	1889      	adds	r1, r1, r2
 801c846:	0fe2      	lsrs	r2, r4, #31
 801c848:	1912      	adds	r2, r2, r4
 801c84a:	1089      	asrs	r1, r1, #2
 801c84c:	1050      	asrs	r0, r2, #1
 801c84e:	3102      	adds	r1, #2
 801c850:	2200      	movs	r2, #0
 801c852:	f7ff fcc5 	bl	801c1e0 <fn_0801C1E0>
 801c856:	b007      	add	sp, #28
 801c858:	bcf0      	pop	{r4, r5, r6, r7}
 801c85a:	bc01      	pop	{r0}
 801c85c:	4700      	bx	r0
 801c85e:	ad03      	add	r5, sp, #12
 801c860:	0003      	movs	r3, r0
 801c862:	2109      	movs	r1, #9
 801c864:	0028      	movs	r0, r5
 801c866:	4a06      	ldr	r2, [pc, #24]	@ (801c880 <fn_0801C7C8+0xb8>)
 801c868:	f7e8 fdf6 	bl	8005458 <fn_08005458>
 801c86c:	e7bf      	b.n	801c7ee <fn_0801C7C8+0x26>
 801c86e:	46c0      	nop			@ (mov r8, r8)
 801c870:	030064c4 	.word	0x030064c4
 801c874:	00005a40 	.word	0x00005a40
 801c878:	0814aa00 	.word	0x0814aa00
 801c87c:	081478f4 	.word	0x081478f4
 801c880:	0814a9f4 	.word	0x0814a9f4
