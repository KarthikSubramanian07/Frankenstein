fn_0801D480:
 801d480:	b570      	push	{r4, r5, r6, lr}
 801d482:	4d15      	ldr	r5, [pc, #84]	@ (801d4d8 <fn_0801D480+0x58>)
 801d484:	b082      	sub	sp, #8
 801d486:	0001      	movs	r1, r0
 801d488:	0004      	movs	r4, r0
 801d48a:	2208      	movs	r2, #8
 801d48c:	4668      	mov	r0, sp
 801d48e:	68ae      	ldr	r6, [r5, #8]
 801d490:	f003 ff8e 	bl	80213b0 <fn_080213B0>
 801d494:	686b      	ldr	r3, [r5, #4]
 801d496:	1e58      	subs	r0, r3, #1
 801d498:	d413      	bmi.n	801d4c2 <fn_0801D480+0x42>
 801d49a:	9a01      	ldr	r2, [sp, #4]
 801d49c:	011b      	lsls	r3, r3, #4
 801d49e:	3b08      	subs	r3, #8
 801d4a0:	1976      	adds	r6, r6, r5
 801d4a2:	4694      	mov	ip, r2
 801d4a4:	9900      	ldr	r1, [sp, #0]
 801d4a6:	199b      	adds	r3, r3, r6
 801d4a8:	e002      	b.n	801d4b0 <fn_0801D480+0x30>
 801d4aa:	3b10      	subs	r3, #16
 801d4ac:	3801      	subs	r0, #1
 801d4ae:	d308      	bcc.n	801d4c2 <fn_0801D480+0x42>
 801d4b0:	681a      	ldr	r2, [r3, #0]
 801d4b2:	428a      	cmp	r2, r1
 801d4b4:	d1f9      	bne.n	801d4aa <fn_0801D480+0x2a>
 801d4b6:	685a      	ldr	r2, [r3, #4]
 801d4b8:	4562      	cmp	r2, ip
 801d4ba:	d008      	beq.n	801d4ce <fn_0801D480+0x4e>
 801d4bc:	3b10      	subs	r3, #16
 801d4be:	3801      	subs	r0, #1
 801d4c0:	d2f6      	bcs.n	801d4b0 <fn_0801D480+0x30>
 801d4c2:	4806      	ldr	r0, [pc, #24]	@ (801d4dc <fn_0801D480+0x5c>)
 801d4c4:	0021      	movs	r1, r4
 801d4c6:	f7e3 f86f 	bl	80005a8 <fn_080005A8>
 801d4ca:	2001      	movs	r0, #1
 801d4cc:	4240      	negs	r0, r0
 801d4ce:	b002      	add	sp, #8
 801d4d0:	bc70      	pop	{r4, r5, r6}
 801d4d2:	bc02      	pop	{r1}
 801d4d4:	4708      	bx	r1
 801d4d6:	46c0      	nop			@ (mov r8, r8)
 801d4d8:	08156b80 	.word	0x08156b80
 801d4dc:	0814a990 	.word	0x0814a990
