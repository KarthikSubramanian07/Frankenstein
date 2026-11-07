fn_0801D4E4:
 801d4e4:	b530      	push	{r4, r5, lr}
 801d4e6:	4c11      	ldr	r4, [pc, #68]	@ (801d52c <fn_0801D4E4+0x48>)
 801d4e8:	b083      	sub	sp, #12
 801d4ea:	0001      	movs	r1, r0
 801d4ec:	2208      	movs	r2, #8
 801d4ee:	4668      	mov	r0, sp
 801d4f0:	68a5      	ldr	r5, [r4, #8]
 801d4f2:	f003 ffb5 	bl	8021460 <fn_08021460>
 801d4f6:	6863      	ldr	r3, [r4, #4]
 801d4f8:	1e58      	subs	r0, r3, #1
 801d4fa:	d414      	bmi.n	801d526 <fn_0801D4E4+0x42>
 801d4fc:	9a01      	ldr	r2, [sp, #4]
 801d4fe:	011b      	lsls	r3, r3, #4
 801d500:	3b08      	subs	r3, #8
 801d502:	192d      	adds	r5, r5, r4
 801d504:	4694      	mov	ip, r2
 801d506:	9900      	ldr	r1, [sp, #0]
 801d508:	195b      	adds	r3, r3, r5
 801d50a:	e002      	b.n	801d512 <fn_0801D4E4+0x2e>
 801d50c:	3b10      	subs	r3, #16
 801d50e:	3801      	subs	r0, #1
 801d510:	d305      	bcc.n	801d51e <fn_0801D4E4+0x3a>
 801d512:	681a      	ldr	r2, [r3, #0]
 801d514:	428a      	cmp	r2, r1
 801d516:	d1f9      	bne.n	801d50c <fn_0801D4E4+0x28>
 801d518:	685a      	ldr	r2, [r3, #4]
 801d51a:	4562      	cmp	r2, ip
 801d51c:	d1f6      	bne.n	801d50c <fn_0801D4E4+0x28>
 801d51e:	b003      	add	sp, #12
 801d520:	bc30      	pop	{r4, r5}
 801d522:	bc02      	pop	{r1}
 801d524:	4708      	bx	r1
 801d526:	2001      	movs	r0, #1
 801d528:	4240      	negs	r0, r0
 801d52a:	e7f8      	b.n	801d51e <fn_0801D4E4+0x3a>
 801d52c:	08156c40 	.word	0x08156c40
