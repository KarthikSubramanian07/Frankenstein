fn_08014760:
 8014760:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014762:	46ce      	mov	lr, r9
 8014764:	4647      	mov	r7, r8
 8014766:	b580      	push	{r7, lr}
 8014768:	221e      	movs	r2, #30
 801476a:	5e83      	ldrsh	r3, [r0, r2]
 801476c:	0004      	movs	r4, r0
 801476e:	4699      	mov	r9, r3
 8014770:	2b00      	cmp	r3, #0
 8014772:	dd3a      	ble.n	80147ea <fn_08014760+0x8a>
 8014774:	22e0      	movs	r2, #224	@ 0xe0
 8014776:	4b21      	ldr	r3, [pc, #132]	@ (80147fc <fn_08014760+0x9c>)
 8014778:	681b      	ldr	r3, [r3, #0]
 801477a:	0112      	lsls	r2, r2, #4
 801477c:	589a      	ldr	r2, [r3, r2]
 801477e:	4690      	mov	r8, r2
 8014780:	6982      	ldr	r2, [r0, #24]
 8014782:	4694      	mov	ip, r2
 8014784:	22df      	movs	r2, #223	@ 0xdf
 8014786:	2083      	movs	r0, #131	@ 0x83
 8014788:	0112      	lsls	r2, r2, #4
 801478a:	589e      	ldr	r6, [r3, r2]
 801478c:	4a1c      	ldr	r2, [pc, #112]	@ (8014800 <fn_08014760+0xa0>)
 801478e:	2100      	movs	r1, #0
 8014790:	589d      	ldr	r5, [r3, r2]
 8014792:	0600      	lsls	r0, r0, #24
 8014794:	e008      	b.n	80147a8 <fn_08014760+0x48>
 8014796:	2f00      	cmp	r7, #0
 8014798:	d003      	beq.n	80147a2 <fn_08014760+0x42>
 801479a:	683b      	ldr	r3, [r7, #0]
 801479c:	4298      	cmp	r0, r3
 801479e:	da00      	bge.n	80147a2 <fn_08014760+0x42>
 80147a0:	0018      	movs	r0, r3
 80147a2:	3101      	adds	r1, #1
 80147a4:	4589      	cmp	r9, r1
 80147a6:	dd22      	ble.n	80147ee <fn_08014760+0x8e>
 80147a8:	4662      	mov	r2, ip
 80147aa:	004b      	lsls	r3, r1, #1
 80147ac:	5ad2      	ldrh	r2, [r2, r3]
 80147ae:	0152      	lsls	r2, r2, #5
 80147b0:	4442      	add	r2, r8
 80147b2:	8a97      	ldrh	r7, [r2, #20]
 80147b4:	007b      	lsls	r3, r7, #1
 80147b6:	19db      	adds	r3, r3, r7
 80147b8:	009b      	lsls	r3, r3, #2
 80147ba:	18eb      	adds	r3, r5, r3
 80147bc:	895f      	ldrh	r7, [r3, #10]
 80147be:	00bb      	lsls	r3, r7, #2
 80147c0:	19db      	adds	r3, r3, r7
 80147c2:	00db      	lsls	r3, r3, #3
 80147c4:	18f7      	adds	r7, r6, r3
 80147c6:	42bc      	cmp	r4, r7
 80147c8:	d1e5      	bne.n	8014796 <fn_08014760+0x36>
 80147ca:	8ad7      	ldrh	r7, [r2, #22]
 80147cc:	4a0d      	ldr	r2, [pc, #52]	@ (8014804 <fn_08014760+0xa4>)
 80147ce:	4297      	cmp	r7, r2
 80147d0:	d0e7      	beq.n	80147a2 <fn_08014760+0x42>
 80147d2:	007a      	lsls	r2, r7, #1
 80147d4:	19d2      	adds	r2, r2, r7
 80147d6:	0092      	lsls	r2, r2, #2
 80147d8:	18aa      	adds	r2, r5, r2
 80147da:	8957      	ldrh	r7, [r2, #10]
 80147dc:	00ba      	lsls	r2, r7, #2
 80147de:	19d2      	adds	r2, r2, r7
 80147e0:	00d2      	lsls	r2, r2, #3
 80147e2:	4293      	cmp	r3, r2
 80147e4:	d0dd      	beq.n	80147a2 <fn_08014760+0x42>
 80147e6:	18b7      	adds	r7, r6, r2
 80147e8:	e7d5      	b.n	8014796 <fn_08014760+0x36>
 80147ea:	2083      	movs	r0, #131	@ 0x83
 80147ec:	0600      	lsls	r0, r0, #24
 80147ee:	bcc0      	pop	{r6, r7}
 80147f0:	46b9      	mov	r9, r7
 80147f2:	46b0      	mov	r8, r6
 80147f4:	bcf0      	pop	{r4, r5, r6, r7}
 80147f6:	bc02      	pop	{r1}
 80147f8:	4708      	bx	r1
 80147fa:	46c0      	nop			@ (mov r8, r8)
 80147fc:	030064c4 	.word	0x030064c4
 8014800:	00000e0c 	.word	0x00000e0c
 8014804:	0000ffff 	.word	0x0000ffff
