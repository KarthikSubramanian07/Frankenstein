fn_08004E14:
 8004e14:	2300      	movs	r3, #0
 8004e16:	b570      	push	{r4, r5, r6, lr}
 8004e18:	4c04      	ldr	r4, [pc, #16]	@ (8004e2c <fn_08004E14+0x18>)
 8004e1a:	8825      	ldrh	r5, [r4, #0]
 8004e1c:	2001      	movs	r0, #1
 8004e1e:	8023      	strh	r3, [r4, #0]
 8004e20:	f014 fec6 	bl	8019bb0 <fn_08019BB0>
 8004e24:	8025      	strh	r5, [r4, #0]
 8004e26:	bc70      	pop	{r4, r5, r6}
 8004e28:	bc01      	pop	{r0}
 8004e2a:	4700      	bx	r0
 8004e2c:	04000208 	.word	0x04000208
