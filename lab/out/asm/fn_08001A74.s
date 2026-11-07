fn_08001A74:
 8001a74:	b570      	push	{r4, r5, r6, lr}
 8001a76:	0005      	movs	r5, r0
 8001a78:	2042      	movs	r0, #66	@ 0x42
 8001a7a:	f019 f805 	bl	801aa88 <fn_0801AA88>
 8001a7e:	4b04      	ldr	r3, [pc, #16]	@ (8001a90 <fn_08001A74+0x1c>)
 8001a80:	0028      	movs	r0, r5
 8001a82:	681c      	ldr	r4, [r3, #0]
 8001a84:	f01b fd54 	bl	801d530 <fn_0801D530>
 8001a88:	67e0      	str	r0, [r4, #124]	@ 0x7c
 8001a8a:	bc70      	pop	{r4, r5, r6}
 8001a8c:	bc01      	pop	{r0}
 8001a8e:	4700      	bx	r0
 8001a90:	030064c4 	.word	0x030064c4
