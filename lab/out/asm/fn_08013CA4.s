fn_08013CA4:
 8013ca4:	b570      	push	{r4, r5, r6, lr}
 8013ca6:	f005 facd 	bl	8019244 <fn_08019244>
 8013caa:	2103      	movs	r1, #3
 8013cac:	2002      	movs	r0, #2
 8013cae:	f009 fdf9 	bl	801d8a4 <fn_0801D8A4>
 8013cb2:	4d08      	ldr	r5, [pc, #32]	@ (8013cd4 <fn_08013CA4+0x30>)
 8013cb4:	4c08      	ldr	r4, [pc, #32]	@ (8013cd8 <fn_08013CA4+0x34>)
 8013cb6:	682b      	ldr	r3, [r5, #0]
 8013cb8:	5918      	ldr	r0, [r3, r4]
 8013cba:	f009 fc95 	bl	801d5e8 <fn_0801D5E8>
 8013cbe:	2188      	movs	r1, #136	@ 0x88
 8013cc0:	2200      	movs	r2, #0
 8013cc2:	682b      	ldr	r3, [r5, #0]
 8013cc4:	0109      	lsls	r1, r1, #4
 8013cc6:	511a      	str	r2, [r3, r4]
 8013cc8:	505a      	str	r2, [r3, r1]
 8013cca:	4904      	ldr	r1, [pc, #16]	@ (8013cdc <fn_08013CA4+0x38>)
 8013ccc:	505a      	str	r2, [r3, r1]
 8013cce:	bc70      	pop	{r4, r5, r6}
 8013cd0:	bc01      	pop	{r0}
 8013cd2:	4700      	bx	r0
 8013cd4:	030064c4 	.word	0x030064c4
 8013cd8:	00000878 	.word	0x00000878
 8013cdc:	0000087c 	.word	0x0000087c
