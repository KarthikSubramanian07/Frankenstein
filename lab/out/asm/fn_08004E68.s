fn_08004E68:
 8004e68:	2300      	movs	r3, #0
 8004e6a:	b570      	push	{r4, r5, r6, lr}
 8004e6c:	4c04      	ldr	r4, [pc, #16]	@ (8004e80 <fn_08004E68+0x18>)
 8004e6e:	8825      	ldrh	r5, [r4, #0]
 8004e70:	8023      	strh	r3, [r4, #0]
 8004e72:	f014 fea7 	bl	8019bc4 <fn_08019BC4>
 8004e76:	8025      	strh	r5, [r4, #0]
 8004e78:	bc70      	pop	{r4, r5, r6}
 8004e7a:	bc01      	pop	{r0}
 8004e7c:	4700      	bx	r0
 8004e7e:	46c0      	nop			@ (mov r8, r8)
 8004e80:	04000208 	.word	0x04000208
