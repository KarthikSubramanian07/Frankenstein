fn_0801D434:
 801d434:	b530      	push	{r4, r5, lr}
 801d436:	4c11      	ldr	r4, [pc, #68]	@ (801d47c <fn_0801D434+0x48>)
 801d438:	b083      	sub	sp, #12
 801d43a:	0001      	movs	r1, r0
 801d43c:	2208      	movs	r2, #8
 801d43e:	4668      	mov	r0, sp
 801d440:	68a5      	ldr	r5, [r4, #8]
 801d442:	f003 ffb5 	bl	80213b0 <fn_080213B0>
 801d446:	6863      	ldr	r3, [r4, #4]
 801d448:	1e58      	subs	r0, r3, #1
 801d44a:	d414      	bmi.n	801d476 <fn_0801D434+0x42>
 801d44c:	9a01      	ldr	r2, [sp, #4]
 801d44e:	011b      	lsls	r3, r3, #4
 801d450:	3b08      	subs	r3, #8
 801d452:	192d      	adds	r5, r5, r4
 801d454:	4694      	mov	ip, r2
 801d456:	9900      	ldr	r1, [sp, #0]
 801d458:	195b      	adds	r3, r3, r5
 801d45a:	e002      	b.n	801d462 <fn_0801D434+0x2e>
 801d45c:	3b10      	subs	r3, #16
 801d45e:	3801      	subs	r0, #1
 801d460:	d305      	bcc.n	801d46e <fn_0801D434+0x3a>
 801d462:	681a      	ldr	r2, [r3, #0]
 801d464:	428a      	cmp	r2, r1
 801d466:	d1f9      	bne.n	801d45c <fn_0801D434+0x28>
 801d468:	685a      	ldr	r2, [r3, #4]
 801d46a:	4562      	cmp	r2, ip
 801d46c:	d1f6      	bne.n	801d45c <fn_0801D434+0x28>
 801d46e:	b003      	add	sp, #12
 801d470:	bc30      	pop	{r4, r5}
 801d472:	bc02      	pop	{r1}
 801d474:	4708      	bx	r1
 801d476:	2001      	movs	r0, #1
 801d478:	4240      	negs	r0, r0
 801d47a:	e7f8      	b.n	801d46e <fn_0801D434+0x3a>
 801d47c:	08156b80 	.word	0x08156b80
