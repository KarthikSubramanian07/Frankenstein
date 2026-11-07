fn_08004E4C:
 8004e4c:	2300      	movs	r3, #0
 8004e4e:	b570      	push	{r4, r5, r6, lr}
 8004e50:	4c04      	ldr	r4, [pc, #16]	@ (8004e64 <fn_08004E4C+0x18>)
 8004e52:	8825      	ldrh	r5, [r4, #0]
 8004e54:	8023      	strh	r3, [r4, #0]
 8004e56:	f014 fe9d 	bl	8019b94 <fn_08019B94>
 8004e5a:	8025      	strh	r5, [r4, #0]
 8004e5c:	bc70      	pop	{r4, r5, r6}
 8004e5e:	bc01      	pop	{r0}
 8004e60:	4700      	bx	r0
 8004e62:	46c0      	nop			@ (mov r8, r8)
 8004e64:	04000208 	.word	0x04000208
