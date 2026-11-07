fn_08019048:
 8019048:	b510      	push	{r4, lr}
 801904a:	7803      	ldrb	r3, [r0, #0]
 801904c:	2b2d      	cmp	r3, #45	@ 0x2d
 801904e:	d004      	beq.n	801905a <fn_08019048+0x12>
 8019050:	f7ff fd2c 	bl	8018aac <fn_08018AAC>
 8019054:	bc10      	pop	{r4}
 8019056:	bc02      	pop	{r1}
 8019058:	4708      	bx	r1
 801905a:	2000      	movs	r0, #0
 801905c:	e7fa      	b.n	8019054 <fn_08019048+0xc>
 801905e:	46c0      	nop			@ (mov r8, r8)
