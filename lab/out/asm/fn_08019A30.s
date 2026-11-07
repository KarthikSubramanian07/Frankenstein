fn_08019A30:
 8019a30:	b570      	push	{r4, r5, r6, lr}
 8019a32:	4817      	ldr	r0, [pc, #92]	@ (8019a90 <fn_08019A30+0x60>)
 8019a34:	f003 fd56 	bl	801d4e4 <fn_0801D4E4>
 8019a38:	0004      	movs	r4, r0
 8019a3a:	f005 fbbf 	bl	801f1bc <fn_0801F1BC>
 8019a3e:	4d15      	ldr	r5, [pc, #84]	@ (8019a94 <fn_08019A30+0x64>)
 8019a40:	2200      	movs	r2, #0
 8019a42:	2101      	movs	r1, #1
 8019a44:	682e      	ldr	r6, [r5, #0]
 8019a46:	f003 fe71 	bl	801d72c <fn_0801D72C>
 8019a4a:	4b13      	ldr	r3, [pc, #76]	@ (8019a98 <fn_08019A30+0x68>)
 8019a4c:	682a      	ldr	r2, [r5, #0]
 8019a4e:	50f0      	str	r0, [r6, r3]
 8019a50:	58d5      	ldr	r5, [r2, r3]
 8019a52:	2c00      	cmp	r4, #0
 8019a54:	db10      	blt.n	8019a78 <fn_08019A30+0x48>
 8019a56:	0020      	movs	r0, r4
 8019a58:	f003 fdde 	bl	801d618 <fn_0801D618>
 8019a5c:	0006      	movs	r6, r0
 8019a5e:	0020      	movs	r0, r4
 8019a60:	f003 fdc0 	bl	801d5e4 <fn_0801D5E4>
 8019a64:	0031      	movs	r1, r6
 8019a66:	0002      	movs	r2, r0
 8019a68:	0028      	movs	r0, r5
 8019a6a:	f005 fbab 	bl	801f1c4 <fn_0801F1C4>
 8019a6e:	2800      	cmp	r0, #0
 8019a70:	d00a      	beq.n	8019a88 <fn_08019A30+0x58>
 8019a72:	bc70      	pop	{r4, r5, r6}
 8019a74:	bc01      	pop	{r0}
 8019a76:	4700      	bx	r0
 8019a78:	2600      	movs	r6, #0
 8019a7a:	2200      	movs	r2, #0
 8019a7c:	0031      	movs	r1, r6
 8019a7e:	0028      	movs	r0, r5
 8019a80:	f005 fba0 	bl	801f1c4 <fn_0801F1C4>
 8019a84:	2800      	cmp	r0, #0
 8019a86:	d1f4      	bne.n	8019a72 <fn_08019A30+0x42>
 8019a88:	4804      	ldr	r0, [pc, #16]	@ (8019a9c <fn_08019A30+0x6c>)
 8019a8a:	f7eb fccb 	bl	8005424 <fn_08005424>
 8019a8e:	e7f0      	b.n	8019a72 <fn_08019A30+0x42>
 8019a90:	0814a4d8 	.word	0x0814a4d8
 8019a94:	030064c4 	.word	0x030064c4
 8019a98:	000004d4 	.word	0x000004d4
 8019a9c:	0814a4e0 	.word	0x0814a4e0
