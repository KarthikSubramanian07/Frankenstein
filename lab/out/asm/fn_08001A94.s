fn_08001A94:
 8001a94:	b570      	push	{r4, r5, r6, lr}
 8001a96:	0005      	movs	r5, r0
 8001a98:	201d      	movs	r0, #29
 8001a9a:	f018 ff9b 	bl	801a9d4 <fn_0801A9D4>
 8001a9e:	4b05      	ldr	r3, [pc, #20]	@ (8001ab4 <fn_08001A94+0x20>)
 8001aa0:	681c      	ldr	r4, [r3, #0]
 8001aa2:	4b05      	ldr	r3, [pc, #20]	@ (8001ab8 <fn_08001A94+0x24>)
 8001aa4:	0028      	movs	r0, r5
 8001aa6:	67a3      	str	r3, [r4, #120]	@ 0x78
 8001aa8:	f01b fcea 	bl	801d480 <fn_0801D480>
 8001aac:	67e0      	str	r0, [r4, #124]	@ 0x7c
 8001aae:	bc70      	pop	{r4, r5, r6}
 8001ab0:	bc01      	pop	{r0}
 8001ab2:	4700      	bx	r0
 8001ab4:	030064c4 	.word	0x030064c4	@ data_030064C4
 8001ab8:	0000041a 	.word	0x0000041a
