fn_08000EC8:
 8000ec8:	2200      	movs	r2, #0
 8000eca:	b510      	push	{r4, lr}
 8000ecc:	4c06      	ldr	r4, [pc, #24]	@ (8000ee8 <fn_08000EC8+0x20>)
 8000ece:	6823      	ldr	r3, [r4, #0]
 8000ed0:	4806      	ldr	r0, [pc, #24]	@ (8000eec <fn_08000EC8+0x24>)
 8000ed2:	701a      	strb	r2, [r3, #0]
 8000ed4:	f01a fc26 	bl	801b724 <fn_0801B724>
 8000ed8:	235c      	movs	r3, #92	@ 0x5c
 8000eda:	2101      	movs	r1, #1
 8000edc:	6822      	ldr	r2, [r4, #0]
 8000ede:	54d1      	strb	r1, [r2, r3]
 8000ee0:	bc10      	pop	{r4}
 8000ee2:	bc01      	pop	{r0}
 8000ee4:	4700      	bx	r0
 8000ee6:	46c0      	nop			@ (mov r8, r8)
 8000ee8:	030064c4 	.word	0x030064c4	@ data_030064C4
 8000eec:	08025678 	.word	0x08025678	@ data_08025678
