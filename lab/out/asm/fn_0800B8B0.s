fn_0800B8B0:
 800b8b0:	b5f0      	push	{r4, r5, r6, r7, lr}
 800b8b2:	46de      	mov	lr, fp
 800b8b4:	4645      	mov	r5, r8
 800b8b6:	4657      	mov	r7, sl
 800b8b8:	464e      	mov	r6, r9
 800b8ba:	b5e0      	push	{r5, r6, r7, lr}
 800b8bc:	468b      	mov	fp, r1
 800b8be:	0005      	movs	r5, r0
 800b8c0:	b083      	sub	sp, #12
 800b8c2:	2900      	cmp	r1, #0
 800b8c4:	d068      	beq.n	800b998 <fn_0800B8B0+0xe8>
 800b8c6:	2300      	movs	r3, #0
 800b8c8:	2401      	movs	r4, #1
 800b8ca:	469a      	mov	sl, r3
 800b8cc:	4f75      	ldr	r7, [pc, #468]	@ (800baa4 <fn_0800B8B0+0x1f4>)
 800b8ce:	4264      	negs	r4, r4
 800b8d0:	2901      	cmp	r1, #1
 800b8d2:	d100      	bne.n	800b8d6 <fn_0800B8B0+0x26>
 800b8d4:	e0a5      	b.n	800ba22 <fn_0800B8B0+0x172>
 800b8d6:	23df      	movs	r3, #223	@ 0xdf
 800b8d8:	011b      	lsls	r3, r3, #4
 800b8da:	4698      	mov	r8, r3
 800b8dc:	4b72      	ldr	r3, [pc, #456]	@ (800baa8 <fn_0800B8B0+0x1f8>)
 800b8de:	9301      	str	r3, [sp, #4]
 800b8e0:	0021      	movs	r1, r4
 800b8e2:	0028      	movs	r0, r5
 800b8e4:	f009 fbce 	bl	8015084 <fn_08015084>
 800b8e8:	1e04      	subs	r4, r0, #0
 800b8ea:	db4b      	blt.n	800b984 <fn_0800B8B0+0xd4>
 800b8ec:	4641      	mov	r1, r8
 800b8ee:	683a      	ldr	r2, [r7, #0]
 800b8f0:	0083      	lsls	r3, r0, #2
 800b8f2:	5856      	ldr	r6, [r2, r1]
 800b8f4:	181b      	adds	r3, r3, r0
 800b8f6:	00db      	lsls	r3, r3, #3
 800b8f8:	18f6      	adds	r6, r6, r3
 800b8fa:	6933      	ldr	r3, [r6, #16]
 800b8fc:	2b00      	cmp	r3, #0
 800b8fe:	d1ef      	bne.n	800b8e0 <fn_0800B8B0+0x30>
 800b900:	6973      	ldr	r3, [r6, #20]
 800b902:	2b00      	cmp	r3, #0
 800b904:	d1ec      	bne.n	800b8e0 <fn_0800B8B0+0x30>
 800b906:	2200      	movs	r2, #0
 800b908:	2103      	movs	r1, #3
 800b90a:	2024      	movs	r0, #36	@ 0x24
 800b90c:	f011 feb6 	bl	801d67c <fn_0801D67C>
 800b910:	4681      	mov	r9, r0
 800b912:	2224      	movs	r2, #36	@ 0x24
 800b914:	2100      	movs	r1, #0
 800b916:	f015 f83b 	bl	8020990 <fn_08020990>
 800b91a:	4648      	mov	r0, r9
 800b91c:	f00c fdfe 	bl	801851c <fn_0801851C>
 800b920:	464b      	mov	r3, r9
 800b922:	9a01      	ldr	r2, [sp, #4]
 800b924:	6133      	str	r3, [r6, #16]
 800b926:	6173      	str	r3, [r6, #20]
 800b928:	609a      	str	r2, [r3, #8]
 800b92a:	464a      	mov	r2, r9
 800b92c:	465b      	mov	r3, fp
 800b92e:	7313      	strb	r3, [r2, #12]
 800b930:	2b02      	cmp	r3, #2
 800b932:	d11f      	bne.n	800b974 <fn_0800B8B0+0xc4>
 800b934:	2380      	movs	r3, #128	@ 0x80
 800b936:	02db      	lsls	r3, r3, #11
 800b938:	6116      	str	r6, [r2, #16]
 800b93a:	6213      	str	r3, [r2, #32]
 800b93c:	683a      	ldr	r2, [r7, #0]
 800b93e:	8aa8      	ldrh	r0, [r5, #20]
 800b940:	4b5a      	ldr	r3, [pc, #360]	@ (800baac <fn_0800B8B0+0x1fc>)
 800b942:	58d1      	ldr	r1, [r2, r3]
 800b944:	0043      	lsls	r3, r0, #1
 800b946:	181b      	adds	r3, r3, r0
 800b948:	009b      	lsls	r3, r3, #2
 800b94a:	18cb      	adds	r3, r1, r3
 800b94c:	8959      	ldrh	r1, [r3, #10]
 800b94e:	4643      	mov	r3, r8
 800b950:	58d2      	ldr	r2, [r2, r3]
 800b952:	008b      	lsls	r3, r1, #2
 800b954:	185b      	adds	r3, r3, r1
 800b956:	00db      	lsls	r3, r3, #3
 800b958:	589a      	ldr	r2, [r3, r2]
 800b95a:	464b      	mov	r3, r9
 800b95c:	4648      	mov	r0, r9
 800b95e:	619a      	str	r2, [r3, #24]
 800b960:	ce0a      	ldmia	r6!, {r1, r3}
 800b962:	18d3      	adds	r3, r2, r3
 800b964:	1a5b      	subs	r3, r3, r1
 800b966:	61c3      	str	r3, [r0, #28]
 800b968:	2301      	movs	r3, #1
 800b96a:	428a      	cmp	r2, r1
 800b96c:	dc00      	bgt.n	800b970 <fn_0800B8B0+0xc0>
 800b96e:	425b      	negs	r3, r3
 800b970:	464a      	mov	r2, r9
 800b972:	6153      	str	r3, [r2, #20]
 800b974:	2301      	movs	r3, #1
 800b976:	0021      	movs	r1, r4
 800b978:	0028      	movs	r0, r5
 800b97a:	469a      	mov	sl, r3
 800b97c:	f009 fb82 	bl	8015084 <fn_08015084>
 800b980:	1e04      	subs	r4, r0, #0
 800b982:	dab3      	bge.n	800b8ec <fn_0800B8B0+0x3c>
 800b984:	4650      	mov	r0, sl
 800b986:	b003      	add	sp, #12
 800b988:	bcf0      	pop	{r4, r5, r6, r7}
 800b98a:	46bb      	mov	fp, r7
 800b98c:	46b2      	mov	sl, r6
 800b98e:	46a9      	mov	r9, r5
 800b990:	46a0      	mov	r8, r4
 800b992:	bcf0      	pop	{r4, r5, r6, r7}
 800b994:	bc02      	pop	{r1}
 800b996:	4708      	bx	r1
 800b998:	4b43      	ldr	r3, [pc, #268]	@ (800baa8 <fn_0800B8B0+0x1f8>)
 800b99a:	2401      	movs	r4, #1
 800b99c:	468a      	mov	sl, r1
 800b99e:	469b      	mov	fp, r3
 800b9a0:	4f40      	ldr	r7, [pc, #256]	@ (800baa4 <fn_0800B8B0+0x1f4>)
 800b9a2:	4264      	negs	r4, r4
 800b9a4:	0021      	movs	r1, r4
 800b9a6:	0028      	movs	r0, r5
 800b9a8:	f009 fb6c 	bl	8015084 <fn_08015084>
 800b9ac:	1e04      	subs	r4, r0, #0
 800b9ae:	dbe9      	blt.n	800b984 <fn_0800B8B0+0xd4>
 800b9b0:	21df      	movs	r1, #223	@ 0xdf
 800b9b2:	683a      	ldr	r2, [r7, #0]
 800b9b4:	00a3      	lsls	r3, r4, #2
 800b9b6:	0109      	lsls	r1, r1, #4
 800b9b8:	5856      	ldr	r6, [r2, r1]
 800b9ba:	191b      	adds	r3, r3, r4
 800b9bc:	00db      	lsls	r3, r3, #3
 800b9be:	18f6      	adds	r6, r6, r3
 800b9c0:	6933      	ldr	r3, [r6, #16]
 800b9c2:	2b00      	cmp	r3, #0
 800b9c4:	d1ee      	bne.n	800b9a4 <fn_0800B8B0+0xf4>
 800b9c6:	6973      	ldr	r3, [r6, #20]
 800b9c8:	4699      	mov	r9, r3
 800b9ca:	2b00      	cmp	r3, #0
 800b9cc:	d1ea      	bne.n	800b9a4 <fn_0800B8B0+0xf4>
 800b9ce:	2200      	movs	r2, #0
 800b9d0:	2103      	movs	r1, #3
 800b9d2:	2024      	movs	r0, #36	@ 0x24
 800b9d4:	f011 fe52 	bl	801d67c <fn_0801D67C>
 800b9d8:	4680      	mov	r8, r0
 800b9da:	2224      	movs	r2, #36	@ 0x24
 800b9dc:	2100      	movs	r1, #0
 800b9de:	f014 ffd7 	bl	8020990 <fn_08020990>
 800b9e2:	4640      	mov	r0, r8
 800b9e4:	f00c fd9a 	bl	801851c <fn_0801851C>
 800b9e8:	4643      	mov	r3, r8
 800b9ea:	465a      	mov	r2, fp
 800b9ec:	6133      	str	r3, [r6, #16]
 800b9ee:	6173      	str	r3, [r6, #20]
 800b9f0:	609a      	str	r2, [r3, #8]
 800b9f2:	464a      	mov	r2, r9
 800b9f4:	731a      	strb	r2, [r3, #12]
 800b9f6:	4642      	mov	r2, r8
 800b9f8:	2301      	movs	r3, #1
 800b9fa:	6153      	str	r3, [r2, #20]
 800b9fc:	2380      	movs	r3, #128	@ 0x80
 800b9fe:	02db      	lsls	r3, r3, #11
 800ba00:	6213      	str	r3, [r2, #32]
 800ba02:	0030      	movs	r0, r6
 800ba04:	6116      	str	r6, [r2, #16]
 800ba06:	6831      	ldr	r1, [r6, #0]
 800ba08:	f008 fea4 	bl	8014754 <fn_08014754>
 800ba0c:	4643      	mov	r3, r8
 800ba0e:	6198      	str	r0, [r3, #24]
 800ba10:	6873      	ldr	r3, [r6, #4]
 800ba12:	18c0      	adds	r0, r0, r3
 800ba14:	6833      	ldr	r3, [r6, #0]
 800ba16:	1ac0      	subs	r0, r0, r3
 800ba18:	4643      	mov	r3, r8
 800ba1a:	61d8      	str	r0, [r3, #28]
 800ba1c:	2301      	movs	r3, #1
 800ba1e:	469a      	mov	sl, r3
 800ba20:	e7c0      	b.n	800b9a4 <fn_0800B8B0+0xf4>
 800ba22:	4b21      	ldr	r3, [pc, #132]	@ (800baa8 <fn_0800B8B0+0x1f8>)
 800ba24:	4699      	mov	r9, r3
 800ba26:	0021      	movs	r1, r4
 800ba28:	0028      	movs	r0, r5
 800ba2a:	f009 fb2b 	bl	8015084 <fn_08015084>
 800ba2e:	1e04      	subs	r4, r0, #0
 800ba30:	dba8      	blt.n	800b984 <fn_0800B8B0+0xd4>
 800ba32:	21df      	movs	r1, #223	@ 0xdf
 800ba34:	683a      	ldr	r2, [r7, #0]
 800ba36:	0083      	lsls	r3, r0, #2
 800ba38:	0109      	lsls	r1, r1, #4
 800ba3a:	5856      	ldr	r6, [r2, r1]
 800ba3c:	181b      	adds	r3, r3, r0
 800ba3e:	00db      	lsls	r3, r3, #3
 800ba40:	18f6      	adds	r6, r6, r3
 800ba42:	6933      	ldr	r3, [r6, #16]
 800ba44:	2b00      	cmp	r3, #0
 800ba46:	d1ee      	bne.n	800ba26 <fn_0800B8B0+0x176>
 800ba48:	6973      	ldr	r3, [r6, #20]
 800ba4a:	2b00      	cmp	r3, #0
 800ba4c:	d1eb      	bne.n	800ba26 <fn_0800B8B0+0x176>
 800ba4e:	2200      	movs	r2, #0
 800ba50:	2103      	movs	r1, #3
 800ba52:	2024      	movs	r0, #36	@ 0x24
 800ba54:	f011 fe12 	bl	801d67c <fn_0801D67C>
 800ba58:	4680      	mov	r8, r0
 800ba5a:	2224      	movs	r2, #36	@ 0x24
 800ba5c:	2100      	movs	r1, #0
 800ba5e:	f014 ff97 	bl	8020990 <fn_08020990>
 800ba62:	4640      	mov	r0, r8
 800ba64:	f00c fd5a 	bl	801851c <fn_0801851C>
 800ba68:	4643      	mov	r3, r8
 800ba6a:	464a      	mov	r2, r9
 800ba6c:	6133      	str	r3, [r6, #16]
 800ba6e:	6173      	str	r3, [r6, #20]
 800ba70:	609a      	str	r2, [r3, #8]
 800ba72:	4642      	mov	r2, r8
 800ba74:	2301      	movs	r3, #1
 800ba76:	7313      	strb	r3, [r2, #12]
 800ba78:	3b02      	subs	r3, #2
 800ba7a:	6153      	str	r3, [r2, #20]
 800ba7c:	2380      	movs	r3, #128	@ 0x80
 800ba7e:	02db      	lsls	r3, r3, #11
 800ba80:	6213      	str	r3, [r2, #32]
 800ba82:	0030      	movs	r0, r6
 800ba84:	6116      	str	r6, [r2, #16]
 800ba86:	6831      	ldr	r1, [r6, #0]
 800ba88:	f008 fef4 	bl	8014874 <fn_08014874>
 800ba8c:	4643      	mov	r3, r8
 800ba8e:	6198      	str	r0, [r3, #24]
 800ba90:	6873      	ldr	r3, [r6, #4]
 800ba92:	18c0      	adds	r0, r0, r3
 800ba94:	6833      	ldr	r3, [r6, #0]
 800ba96:	1ac0      	subs	r0, r0, r3
 800ba98:	4643      	mov	r3, r8
 800ba9a:	61d8      	str	r0, [r3, #28]
 800ba9c:	2301      	movs	r3, #1
 800ba9e:	469a      	mov	sl, r3
 800baa0:	e7c1      	b.n	800ba26 <fn_0800B8B0+0x176>
 800baa2:	46c0      	nop			@ (mov r8, r8)
 800baa4:	030064c4 	.word	0x030064c4	@ data_030064C4
 800baa8:	0800a81d 	.word	0x0800a81d	@ fn_0800A81C
 800baac:	00000e0c 	.word	0x00000e0c
