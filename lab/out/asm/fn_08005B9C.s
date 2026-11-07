fn_08005B9C:
 8005b9c:	b510      	push	{r4, lr}
 8005b9e:	f7fd ff0b 	bl	80039b8 <fn_080039B8>
 8005ba2:	2200      	movs	r2, #0
 8005ba4:	4b04      	ldr	r3, [pc, #16]	@ (8005bb8 <fn_08005B9C+0x1c>)
 8005ba6:	4905      	ldr	r1, [pc, #20]	@ (8005bbc <fn_08005B9C+0x20>)
 8005ba8:	681b      	ldr	r3, [r3, #0]
 8005baa:	545a      	strb	r2, [r3, r1]
 8005bac:	4904      	ldr	r1, [pc, #16]	@ (8005bc0 <fn_08005B9C+0x24>)
 8005bae:	525a      	strh	r2, [r3, r1]
 8005bb0:	bc10      	pop	{r4}
 8005bb2:	bc01      	pop	{r0}
 8005bb4:	4700      	bx	r0
 8005bb6:	46c0      	nop			@ (mov r8, r8)
 8005bb8:	030064c4 	.word	0x030064c4
 8005bbc:	00000792 	.word	0x00000792
 8005bc0:	0000078c 	.word	0x0000078c
