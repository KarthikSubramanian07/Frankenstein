fn_080138C4:
 80138c4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80138c6:	46de      	mov	lr, fp
 80138c8:	464e      	mov	r6, r9
 80138ca:	4645      	mov	r5, r8
 80138cc:	4657      	mov	r7, sl
 80138ce:	b5e0      	push	{r5, r6, r7, lr}
 80138d0:	0007      	movs	r7, r0
 80138d2:	b083      	sub	sp, #12
 80138d4:	2104      	movs	r1, #4
 80138d6:	6800      	ldr	r0, [r0, #0]
 80138d8:	f006 fd50 	bl	801a37c <fn_0801A37C>
 80138dc:	219b      	movs	r1, #155	@ 0x9b
 80138de:	6838      	ldr	r0, [r7, #0]
 80138e0:	f7fd fc94 	bl	801120c <fn_0801120C>
 80138e4:	4b3e      	ldr	r3, [pc, #248]	@ (80139e0 <fn_080138C4+0x11c>)
 80138e6:	469b      	mov	fp, r3
 80138e8:	6819      	ldr	r1, [r3, #0]
 80138ea:	2353      	movs	r3, #83	@ 0x53
 80138ec:	5cfa      	ldrb	r2, [r7, r3]
 80138ee:	4b3d      	ldr	r3, [pc, #244]	@ (80139e4 <fn_080138C4+0x120>)
 80138f0:	58c9      	ldr	r1, [r1, r3]
 80138f2:	0053      	lsls	r3, r2, #1
 80138f4:	189b      	adds	r3, r3, r2
 80138f6:	00db      	lsls	r3, r3, #3
 80138f8:	585b      	ldr	r3, [r3, r1]
 80138fa:	009b      	lsls	r3, r3, #2
 80138fc:	18fb      	adds	r3, r7, r3
 80138fe:	6fda      	ldr	r2, [r3, #124]	@ 0x7c
 8013900:	3a02      	subs	r2, #2
 8013902:	67da      	str	r2, [r3, #124]	@ 0x7c
 8013904:	2100      	movs	r1, #0
 8013906:	0038      	movs	r0, r7
 8013908:	f7fe ffe4 	bl	80128d4 <fn_080128D4>
 801390c:	465b      	mov	r3, fp
 801390e:	681b      	ldr	r3, [r3, #0]
 8013910:	2280      	movs	r2, #128	@ 0x80
 8013912:	4698      	mov	r8, r3
 8013914:	683c      	ldr	r4, [r7, #0]
 8013916:	6a25      	ldr	r5, [r4, #32]
 8013918:	04d2      	lsls	r2, r2, #19
 801391a:	0029      	movs	r1, r5
 801391c:	0020      	movs	r0, r4
 801391e:	f7fc f8cb 	bl	800fab8 <fn_0800FAB8>
 8013922:	4643      	mov	r3, r8
 8013924:	4e30      	ldr	r6, [pc, #192]	@ (80139e8 <fn_080138C4+0x124>)
 8013926:	5198      	str	r0, [r3, r6]
 8013928:	465b      	mov	r3, fp
 801392a:	681b      	ldr	r3, [r3, #0]
 801392c:	4699      	mov	r9, r3
 801392e:	4b2f      	ldr	r3, [pc, #188]	@ (80139ec <fn_080138C4+0x128>)
 8013930:	4698      	mov	r8, r3
 8013932:	464b      	mov	r3, r9
 8013934:	4642      	mov	r2, r8
 8013936:	589b      	ldr	r3, [r3, r2]
 8013938:	2b00      	cmp	r3, #0
 801393a:	d037      	beq.n	80139ac <fn_080138C4+0xe8>
 801393c:	2614      	movs	r6, #20
 801393e:	f7f3 f8df 	bl	8006b00 <fn_08006B00>
 8013942:	683b      	ldr	r3, [r7, #0]
 8013944:	4681      	mov	r9, r0
 8013946:	6a1d      	ldr	r5, [r3, #32]
 8013948:	f7f3 f8da 	bl	8006b00 <fn_08006B00>
 801394c:	0004      	movs	r4, r0
 801394e:	f7f3 f8d7 	bl	8006b00 <fn_08006B00>
 8013952:	1a24      	subs	r4, r4, r0
 8013954:	f7f3 f8d4 	bl	8006b00 <fn_08006B00>
 8013958:	683b      	ldr	r3, [r7, #0]
 801395a:	4698      	mov	r8, r3
 801395c:	465b      	mov	r3, fp
 801395e:	4a22      	ldr	r2, [pc, #136]	@ (80139e8 <fn_080138C4+0x124>)
 8013960:	681b      	ldr	r3, [r3, #0]
 8013962:	589b      	ldr	r3, [r3, r2]
 8013964:	04e4      	lsls	r4, r4, #19
 8013966:	469a      	mov	sl, r3
 8013968:	1964      	adds	r4, r4, r5
 801396a:	0005      	movs	r5, r0
 801396c:	f7f3 f8c8 	bl	8006b00 <fn_08006B00>
 8013970:	2103      	movs	r1, #3
 8013972:	1a2d      	subs	r5, r5, r0
 8013974:	4648      	mov	r0, r9
 8013976:	f011 fe0f 	bl	8025598 <fn_08025598>
 801397a:	2280      	movs	r2, #128	@ 0x80
 801397c:	3101      	adds	r1, #1
 801397e:	008b      	lsls	r3, r1, #2
 8013980:	016d      	lsls	r5, r5, #5
 8013982:	185b      	adds	r3, r3, r1
 8013984:	4455      	add	r5, sl
 8013986:	9300      	str	r3, [sp, #0]
 8013988:	0021      	movs	r1, r4
 801398a:	002b      	movs	r3, r5
 801398c:	4640      	mov	r0, r8
 801398e:	0512      	lsls	r2, r2, #20
 8013990:	3e01      	subs	r6, #1
 8013992:	f7fc f8eb 	bl	800fb6c <fn_0800FB6C>
 8013996:	2e00      	cmp	r6, #0
 8013998:	d1d1      	bne.n	801393e <fn_080138C4+0x7a>
 801399a:	b003      	add	sp, #12
 801399c:	bcf0      	pop	{r4, r5, r6, r7}
 801399e:	46bb      	mov	fp, r7
 80139a0:	46b2      	mov	sl, r6
 80139a2:	46a9      	mov	r9, r5
 80139a4:	46a0      	mov	r8, r4
 80139a6:	bcf0      	pop	{r4, r5, r6, r7}
 80139a8:	bc01      	pop	{r0}
 80139aa:	4700      	bx	r0
 80139ac:	2280      	movs	r2, #128	@ 0x80
 80139ae:	04d2      	lsls	r2, r2, #19
 80139b0:	18a9      	adds	r1, r5, r2
 80139b2:	0020      	movs	r0, r4
 80139b4:	f7fc f880 	bl	800fab8 <fn_0800FAB8>
 80139b8:	464b      	mov	r3, r9
 80139ba:	5198      	str	r0, [r3, r6]
 80139bc:	465b      	mov	r3, fp
 80139be:	4642      	mov	r2, r8
 80139c0:	681b      	ldr	r3, [r3, #0]
 80139c2:	4699      	mov	r9, r3
 80139c4:	589b      	ldr	r3, [r3, r2]
 80139c6:	2b00      	cmp	r3, #0
 80139c8:	d1b8      	bne.n	801393c <fn_080138C4+0x78>
 80139ca:	23fc      	movs	r3, #252	@ 0xfc
 80139cc:	2280      	movs	r2, #128	@ 0x80
 80139ce:	061b      	lsls	r3, r3, #24
 80139d0:	18e9      	adds	r1, r5, r3
 80139d2:	0020      	movs	r0, r4
 80139d4:	04d2      	lsls	r2, r2, #19
 80139d6:	f7fc f86f 	bl	800fab8 <fn_0800FAB8>
 80139da:	464b      	mov	r3, r9
 80139dc:	5198      	str	r0, [r3, r6]
 80139de:	e7ad      	b.n	801393c <fn_080138C4+0x78>
 80139e0:	030064c4 	.word	0x030064c4
 80139e4:	00000754 	.word	0x00000754
 80139e8:	00000de4 	.word	0x00000de4
 80139ec:	000008f4 	.word	0x000008f4
