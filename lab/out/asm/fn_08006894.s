fn_08006894:
 8006894:	b5f0      	push	{r4, r5, r6, r7, lr}
 8006896:	464e      	mov	r6, r9
 8006898:	46de      	mov	lr, fp
 800689a:	4657      	mov	r7, sl
 800689c:	4645      	mov	r5, r8
 800689e:	b5e0      	push	{r5, r6, r7, lr}
 80068a0:	4689      	mov	r9, r1
 80068a2:	0007      	movs	r7, r0
 80068a4:	0015      	movs	r5, r2
 80068a6:	469b      	mov	fp, r3
 80068a8:	0016      	movs	r6, r2
 80068aa:	b083      	sub	sp, #12
 80068ac:	2ac8      	cmp	r2, #200	@ 0xc8
 80068ae:	dd00      	ble.n	80068b2 <fn_08006894+0x1e>
 80068b0:	26c8      	movs	r6, #200	@ 0xc8
 80068b2:	2d17      	cmp	r5, #23
 80068b4:	dd4b      	ble.n	800694e <fn_08006894+0xba>
 80068b6:	0031      	movs	r1, r6
 80068b8:	20c8      	movs	r0, #200	@ 0xc8
 80068ba:	f01e fec1 	bl	8025640 <fn_08025640>
 80068be:	2308      	movs	r3, #8
 80068c0:	0005      	movs	r5, r0
 80068c2:	1a1b      	subs	r3, r3, r0
 80068c4:	482d      	ldr	r0, [pc, #180]	@ (800697c <fn_08006894+0xe8>)
 80068c6:	9301      	str	r3, [sp, #4]
 80068c8:	f016 fe32 	bl	801d530 <fn_0801D530>
 80068cc:	4680      	mov	r8, r0
 80068ce:	482c      	ldr	r0, [pc, #176]	@ (8006980 <fn_08006894+0xec>)
 80068d0:	f016 fe2e 	bl	801d530 <fn_0801D530>
 80068d4:	2200      	movs	r2, #0
 80068d6:	0003      	movs	r3, r0
 80068d8:	4649      	mov	r1, r9
 80068da:	0038      	movs	r0, r7
 80068dc:	3708      	adds	r7, #8
 80068de:	f015 fc7f 	bl	801c1e0 <fn_0801C1E0>
 80068e2:	46ba      	mov	sl, r7
 80068e4:	002b      	movs	r3, r5
 80068e6:	2400      	movs	r4, #0
 80068e8:	4645      	mov	r5, r8
 80068ea:	4698      	mov	r8, r3
 80068ec:	0038      	movs	r0, r7
 80068ee:	002b      	movs	r3, r5
 80068f0:	2200      	movs	r2, #0
 80068f2:	4649      	mov	r1, r9
 80068f4:	3401      	adds	r4, #1
 80068f6:	f015 fc73 	bl	801c1e0 <fn_0801C1E0>
 80068fa:	4447      	add	r7, r8
 80068fc:	42a6      	cmp	r6, r4
 80068fe:	dcf5      	bgt.n	80068ec <fn_08006894+0x58>
 8006900:	4645      	mov	r5, r8
 8006902:	4653      	mov	r3, sl
 8006904:	3e01      	subs	r6, #1
 8006906:	436e      	muls	r6, r5
 8006908:	18ef      	adds	r7, r5, r3
 800690a:	19f7      	adds	r7, r6, r7
 800690c:	9b01      	ldr	r3, [sp, #4]
 800690e:	481d      	ldr	r0, [pc, #116]	@ (8006984 <fn_08006894+0xf0>)
 8006910:	18fc      	adds	r4, r7, r3
 8006912:	f016 fe0d 	bl	801d530 <fn_0801D530>
 8006916:	4649      	mov	r1, r9
 8006918:	0003      	movs	r3, r0
 800691a:	2200      	movs	r2, #0
 800691c:	0020      	movs	r0, r4
 800691e:	f015 fc5f 	bl	801c1e0 <fn_0801C1E0>
 8006922:	465b      	mov	r3, fp
 8006924:	436b      	muls	r3, r5
 8006926:	4818      	ldr	r0, [pc, #96]	@ (8006988 <fn_08006894+0xf4>)
 8006928:	001d      	movs	r5, r3
 800692a:	f016 fe01 	bl	801d530 <fn_0801D530>
 800692e:	4455      	add	r5, sl
 8006930:	0003      	movs	r3, r0
 8006932:	2200      	movs	r2, #0
 8006934:	4649      	mov	r1, r9
 8006936:	0028      	movs	r0, r5
 8006938:	f015 fc52 	bl	801c1e0 <fn_0801C1E0>
 800693c:	b003      	add	sp, #12
 800693e:	bcf0      	pop	{r4, r5, r6, r7}
 8006940:	46bb      	mov	fp, r7
 8006942:	46b2      	mov	sl, r6
 8006944:	46a9      	mov	r9, r5
 8006946:	46a0      	mov	r8, r4
 8006948:	bcf0      	pop	{r4, r5, r6, r7}
 800694a:	bc01      	pop	{r0}
 800694c:	4700      	bx	r0
 800694e:	480b      	ldr	r0, [pc, #44]	@ (800697c <fn_08006894+0xe8>)
 8006950:	f016 fdee 	bl	801d530 <fn_0801D530>
 8006954:	4680      	mov	r8, r0
 8006956:	480a      	ldr	r0, [pc, #40]	@ (8006980 <fn_08006894+0xec>)
 8006958:	f016 fdea 	bl	801d530 <fn_0801D530>
 800695c:	2200      	movs	r2, #0
 800695e:	0003      	movs	r3, r0
 8006960:	4649      	mov	r1, r9
 8006962:	0038      	movs	r0, r7
 8006964:	f015 fc3c 	bl	801c1e0 <fn_0801C1E0>
 8006968:	2300      	movs	r3, #0
 800696a:	3708      	adds	r7, #8
 800696c:	46ba      	mov	sl, r7
 800696e:	9301      	str	r3, [sp, #4]
 8006970:	2d00      	cmp	r5, #0
 8006972:	dd01      	ble.n	8006978 <fn_08006894+0xe4>
 8006974:	2508      	movs	r5, #8
 8006976:	e7b5      	b.n	80068e4 <fn_08006894+0x50>
 8006978:	2508      	movs	r5, #8
 800697a:	e7c7      	b.n	800690c <fn_08006894+0x78>
 800697c:	08149f38 	.word	0x08149f38
 8006980:	08149f44 	.word	0x08149f44
 8006984:	08149f50 	.word	0x08149f50
 8006988:	08149f5c 	.word	0x08149f5c
