fn_03001590:
 3001590:	e59f302c 	ldr	r3, [pc, #44]	@ 30015c4 <fn_03001590+0x34>
 3001594:	e59330c0 	ldr	r3, [r3, #192]	@ 0xc0
 3001598:	e7933100 	ldr	r3, [r3, r0, lsl #2]
 300159c:	e3530000 	cmp	r3, #0
 30015a0:	0a000001 	beq	30015ac <fn_03001590+0x1c>
 30015a4:	e1a00003 	mov	r0, r3
 30015a8:	e12fff1e 	bx	lr
 30015ac:	e92d4010 	push	{r4, lr}
 30015b0:	e59f3010 	ldr	r3, [pc, #16]	@ 30015c8 <fn_03001590+0x38>
 30015b4:	e1a0e00f 	mov	lr, pc
 30015b8:	e12fff13 	bx	r3
 30015bc:	e8bd4010 	pop	{r4, lr}
 30015c0:	e12fff1e 	bx	lr
 30015c4:	030064cc 	.word	0x030064cc
 30015c8:	08018b95 	.word	0x08018b95
