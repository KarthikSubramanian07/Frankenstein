fn_080190FC:
 80190fc:	b510      	push	{r4, lr}
 80190fe:	7803      	ldrb	r3, [r0, #0]
 8019100:	2b2d      	cmp	r3, #45	@ 0x2d
 8019102:	d004      	beq.n	801910e <fn_080190FC+0x12>
 8019104:	f7ff fd2c 	bl	8018b60 <fn_08018B60>
 8019108:	bc10      	pop	{r4}
 801910a:	bc02      	pop	{r1}
 801910c:	4708      	bx	r1
 801910e:	2000      	movs	r0, #0
 8019110:	e7fa      	b.n	8019108 <fn_080190FC+0xc>
 8019112:	46c0      	nop			@ (mov r8, r8)
