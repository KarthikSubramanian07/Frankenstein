fn_030015CC:
 30015cc:	e2503000 	subs	r3, r0, #0
 30015d0:	0a00000b 	beq	3001604 <fn_030015CC+0x38>
 30015d4:	e241c001 	sub	ip, r1, #1
 30015d8:	e111000c 	tst	r1, ip
 30015dc:	0a00000a 	beq	300160c <fn_030015CC+0x40>
 30015e0:	e92d4010 	push	{r4, lr}
 30015e4:	e59f3028 	ldr	r3, [pc, #40]	@ 3001614 <fn_030015CC+0x48>
 30015e8:	e1a04001 	mov	r4, r1
 30015ec:	e1a0e00f 	mov	lr, pc
 30015f0:	e12fff13 	bx	r3
 30015f4:	e2510000 	subs	r0, r1, #0
 30015f8:	b0800004 	addlt	r0, r0, r4
 30015fc:	e8bd4010 	pop	{r4, lr}
 3001600:	e12fff1e 	bx	lr
 3001604:	e1a00003 	mov	r0, r3
 3001608:	e12fff1e 	bx	lr
 300160c:	e003000c 	and	r0, r3, ip
 3001610:	e12fff1e 	bx	lr
 3001614:	0801fce0 	.word	0x0801fce0	@ fn_0801FCE0
