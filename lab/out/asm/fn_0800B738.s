fn_0800B738:
 800b738:	b5f0      	push	{r4, r5, r6, r7, lr}
 800b73a:	46de      	mov	lr, fp
 800b73c:	464e      	mov	r6, r9
 800b73e:	4645      	mov	r5, r8
 800b740:	4657      	mov	r7, sl
 800b742:	2300      	movs	r3, #0
 800b744:	b5e0      	push	{r5, r6, r7, lr}
 800b746:	b083      	sub	sp, #12
 800b748:	9301      	str	r3, [sp, #4]
 800b74a:	4b55      	ldr	r3, [pc, #340]	@ (800b8a0 <fn_0800B738+0x168>)
 800b74c:	001d      	movs	r5, r3
 800b74e:	23df      	movs	r3, #223	@ 0xdf
 800b750:	2401      	movs	r4, #1
 800b752:	011b      	lsls	r3, r3, #4
 800b754:	469b      	mov	fp, r3
 800b756:	4681      	mov	r9, r0
 800b758:	4264      	negs	r4, r4
 800b75a:	0021      	movs	r1, r4
 800b75c:	4648      	mov	r0, r9
 800b75e:	f009 fc91 	bl	8015084 <fn_08015084>
 800b762:	1e04      	subs	r4, r0, #0
 800b764:	da00      	bge.n	800b768 <fn_0800B738+0x30>
 800b766:	e08c      	b.n	800b882 <fn_0800B738+0x14a>
 800b768:	4659      	mov	r1, fp
 800b76a:	682a      	ldr	r2, [r5, #0]
 800b76c:	5852      	ldr	r2, [r2, r1]
 800b76e:	4692      	mov	sl, r2
 800b770:	00a3      	lsls	r3, r4, #2
 800b772:	191b      	adds	r3, r3, r4
 800b774:	00db      	lsls	r3, r3, #3
 800b776:	449a      	add	sl, r3
 800b778:	4651      	mov	r1, sl
 800b77a:	2000      	movs	r0, #0
 800b77c:	f009 fe20 	bl	80153c0 <fn_080153C0>
 800b780:	2800      	cmp	r0, #0
 800b782:	d1ea      	bne.n	800b75a <fn_0800B738+0x22>
 800b784:	4653      	mov	r3, sl
 800b786:	26e0      	movs	r6, #224	@ 0xe0
 800b788:	699b      	ldr	r3, [r3, #24]
 800b78a:	682a      	ldr	r2, [r5, #0]
 800b78c:	881b      	ldrh	r3, [r3, #0]
 800b78e:	0136      	lsls	r6, r6, #4
 800b790:	5990      	ldr	r0, [r2, r6]
 800b792:	015b      	lsls	r3, r3, #5
 800b794:	4651      	mov	r1, sl
 800b796:	18c0      	adds	r0, r0, r3
 800b798:	f008 ff02 	bl	80145a0 <fn_080145A0>
 800b79c:	4680      	mov	r8, r0
 800b79e:	2800      	cmp	r0, #0
 800b7a0:	d0db      	beq.n	800b75a <fn_0800B738+0x22>
 800b7a2:	0001      	movs	r1, r0
 800b7a4:	2000      	movs	r0, #0
 800b7a6:	f009 fe0b 	bl	80153c0 <fn_080153C0>
 800b7aa:	2800      	cmp	r0, #0
 800b7ac:	d1d5      	bne.n	800b75a <fn_0800B738+0x22>
 800b7ae:	4643      	mov	r3, r8
 800b7b0:	221e      	movs	r2, #30
 800b7b2:	5e9b      	ldrsh	r3, [r3, r2]
 800b7b4:	469c      	mov	ip, r3
 800b7b6:	2b00      	cmp	r3, #0
 800b7b8:	ddcf      	ble.n	800b75a <fn_0800B738+0x22>
 800b7ba:	4643      	mov	r3, r8
 800b7bc:	2100      	movs	r1, #0
 800b7be:	6828      	ldr	r0, [r5, #0]
 800b7c0:	699b      	ldr	r3, [r3, #24]
 800b7c2:	5986      	ldr	r6, [r0, r6]
 800b7c4:	9300      	str	r3, [sp, #0]
 800b7c6:	9a00      	ldr	r2, [sp, #0]
 800b7c8:	004b      	lsls	r3, r1, #1
 800b7ca:	5ad3      	ldrh	r3, [r2, r3]
 800b7cc:	015b      	lsls	r3, r3, #5
 800b7ce:	18f3      	adds	r3, r6, r3
 800b7d0:	8adf      	ldrh	r7, [r3, #22]
 800b7d2:	4b34      	ldr	r3, [pc, #208]	@ (800b8a4 <fn_0800B738+0x16c>)
 800b7d4:	429f      	cmp	r7, r3
 800b7d6:	d05e      	beq.n	800b896 <fn_0800B738+0x15e>
 800b7d8:	4b33      	ldr	r3, [pc, #204]	@ (800b8a8 <fn_0800B738+0x170>)
 800b7da:	58c2      	ldr	r2, [r0, r3]
 800b7dc:	007b      	lsls	r3, r7, #1
 800b7de:	19db      	adds	r3, r3, r7
 800b7e0:	009b      	lsls	r3, r3, #2
 800b7e2:	18d2      	adds	r2, r2, r3
 800b7e4:	8952      	ldrh	r2, [r2, #10]
 800b7e6:	0093      	lsls	r3, r2, #2
 800b7e8:	189b      	adds	r3, r3, r2
 800b7ea:	465a      	mov	r2, fp
 800b7ec:	5887      	ldr	r7, [r0, r2]
 800b7ee:	00db      	lsls	r3, r3, #3
 800b7f0:	18ff      	adds	r7, r7, r3
 800b7f2:	45ba      	cmp	sl, r7
 800b7f4:	d04f      	beq.n	800b896 <fn_0800B738+0x15e>
 800b7f6:	2200      	movs	r2, #0
 800b7f8:	2103      	movs	r1, #3
 800b7fa:	202c      	movs	r0, #44	@ 0x2c
 800b7fc:	f011 ff3e 	bl	801d67c <fn_0801D67C>
 800b800:	0006      	movs	r6, r0
 800b802:	222c      	movs	r2, #44	@ 0x2c
 800b804:	2100      	movs	r1, #0
 800b806:	f015 f8c3 	bl	8020990 <fn_08020990>
 800b80a:	0030      	movs	r0, r6
 800b80c:	f00c fe86 	bl	801851c <fn_0801851C>
 800b810:	4643      	mov	r3, r8
 800b812:	4642      	mov	r2, r8
 800b814:	611e      	str	r6, [r3, #16]
 800b816:	6132      	str	r2, [r6, #16]
 800b818:	2280      	movs	r2, #128	@ 0x80
 800b81a:	4b24      	ldr	r3, [pc, #144]	@ (800b8ac <fn_0800B738+0x174>)
 800b81c:	60b3      	str	r3, [r6, #8]
 800b81e:	9300      	str	r3, [sp, #0]
 800b820:	230f      	movs	r3, #15
 800b822:	0212      	lsls	r2, r2, #8
 800b824:	62b2      	str	r2, [r6, #40]	@ 0x28
 800b826:	4690      	mov	r8, r2
 800b828:	2200      	movs	r2, #0
 800b82a:	81b3      	strh	r3, [r6, #12]
 800b82c:	3b0e      	subs	r3, #14
 800b82e:	6173      	str	r3, [r6, #20]
 800b830:	3323      	adds	r3, #35	@ 0x23
 800b832:	5cfb      	ldrb	r3, [r7, r3]
 800b834:	8433      	strh	r3, [r6, #32]
 800b836:	683b      	ldr	r3, [r7, #0]
 800b838:	61b2      	str	r2, [r6, #24]
 800b83a:	6273      	str	r3, [r6, #36]	@ 0x24
 800b83c:	2103      	movs	r1, #3
 800b83e:	202c      	movs	r0, #44	@ 0x2c
 800b840:	f011 ff1c 	bl	801d67c <fn_0801D67C>
 800b844:	0006      	movs	r6, r0
 800b846:	222c      	movs	r2, #44	@ 0x2c
 800b848:	2100      	movs	r1, #0
 800b84a:	f015 f8a1 	bl	8020990 <fn_08020990>
 800b84e:	0030      	movs	r0, r6
 800b850:	f00c fe64 	bl	801851c <fn_0801851C>
 800b854:	4651      	mov	r1, sl
 800b856:	9b00      	ldr	r3, [sp, #0]
 800b858:	610e      	str	r6, [r1, #16]
 800b85a:	60b3      	str	r3, [r6, #8]
 800b85c:	2300      	movs	r3, #0
 800b85e:	81b3      	strh	r3, [r6, #12]
 800b860:	2301      	movs	r3, #1
 800b862:	425b      	negs	r3, r3
 800b864:	6173      	str	r3, [r6, #20]
 800b866:	4643      	mov	r3, r8
 800b868:	62b3      	str	r3, [r6, #40]	@ 0x28
 800b86a:	683b      	ldr	r3, [r7, #0]
 800b86c:	6273      	str	r3, [r6, #36]	@ 0x24
 800b86e:	2301      	movs	r3, #1
 800b870:	6131      	str	r1, [r6, #16]
 800b872:	4648      	mov	r0, r9
 800b874:	0021      	movs	r1, r4
 800b876:	9301      	str	r3, [sp, #4]
 800b878:	f009 fc04 	bl	8015084 <fn_08015084>
 800b87c:	1e04      	subs	r4, r0, #0
 800b87e:	db00      	blt.n	800b882 <fn_0800B738+0x14a>
 800b880:	e772      	b.n	800b768 <fn_0800B738+0x30>
 800b882:	9801      	ldr	r0, [sp, #4]
 800b884:	b003      	add	sp, #12
 800b886:	bcf0      	pop	{r4, r5, r6, r7}
 800b888:	46bb      	mov	fp, r7
 800b88a:	46b2      	mov	sl, r6
 800b88c:	46a9      	mov	r9, r5
 800b88e:	46a0      	mov	r8, r4
 800b890:	bcf0      	pop	{r4, r5, r6, r7}
 800b892:	bc02      	pop	{r1}
 800b894:	4708      	bx	r1
 800b896:	3101      	adds	r1, #1
 800b898:	4561      	cmp	r1, ip
 800b89a:	db94      	blt.n	800b7c6 <fn_0800B738+0x8e>
 800b89c:	e75d      	b.n	800b75a <fn_0800B738+0x22>
 800b89e:	46c0      	nop			@ (mov r8, r8)
 800b8a0:	030064c4 	.word	0x030064c4
 800b8a4:	0000ffff 	.word	0x0000ffff
 800b8a8:	00000e0c 	.word	0x00000e0c
 800b8ac:	0800a579 	.word	0x0800a579
