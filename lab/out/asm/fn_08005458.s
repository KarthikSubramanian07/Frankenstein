fn_08005458:
 8005458:	b40c      	push	{r2, r3}
 800545a:	b510      	push	{r4, lr}
 800545c:	b084      	sub	sp, #16
 800545e:	aa06      	add	r2, sp, #24
 8005460:	1e4b      	subs	r3, r1, #1
 8005462:	ca02      	ldmia	r2!, {r1}
 8005464:	18c3      	adds	r3, r0, r3
 8005466:	0004      	movs	r4, r0
 8005468:	9002      	str	r0, [sp, #8]
 800546a:	a802      	add	r0, sp, #8
 800546c:	9303      	str	r3, [sp, #12]
 800546e:	9201      	str	r2, [sp, #4]
 8005470:	f7ff fea4 	bl	80051bc <fn_080051BC>
 8005474:	2300      	movs	r3, #0
 8005476:	9802      	ldr	r0, [sp, #8]
 8005478:	7003      	strb	r3, [r0, #0]
 800547a:	1b00      	subs	r0, r0, r4
 800547c:	b004      	add	sp, #16
 800547e:	bc10      	pop	{r4}
 8005480:	bc08      	pop	{r3}
 8005482:	b002      	add	sp, #8
 8005484:	4718      	bx	r3
 8005486:	46c0      	nop			@ (mov r8, r8)
