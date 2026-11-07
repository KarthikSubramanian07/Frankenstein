fn_08004D4C:
 8004d4c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8004d4e:	46c6      	mov	lr, r8
 8004d50:	000c      	movs	r4, r1
 8004d52:	4690      	mov	r8, r2
 8004d54:	b500      	push	{lr}
 8004d56:	2907      	cmp	r1, #7
 8004d58:	d81e      	bhi.n	8004d98 <fn_08004D4C+0x4c>
 8004d5a:	236c      	movs	r3, #108	@ 0x6c
 8004d5c:	4283      	cmp	r3, r0
 8004d5e:	41ad      	sbcs	r5, r5
 8004d60:	426d      	negs	r5, r5
 8004d62:	4283      	cmp	r3, r0
 8004d64:	d318      	bcc.n	8004d98 <fn_08004D4C+0x4c>
 8004d66:	4b0e      	ldr	r3, [pc, #56]	@ (8004da0 <fn_08004D4C+0x54>)
 8004d68:	30fd      	adds	r0, #253	@ 0xfd
 8004d6a:	681a      	ldr	r2, [r3, #0]
 8004d6c:	30ff      	adds	r0, #255	@ 0xff
 8004d6e:	0040      	lsls	r0, r0, #1
 8004d70:	5e80      	ldrsh	r0, [r0, r2]
 8004d72:	2800      	cmp	r0, #0
 8004d74:	db10      	blt.n	8004d98 <fn_08004D4C+0x4c>
 8004d76:	f018 fbf7 	bl	801d568 <fn_0801D568>
 8004d7a:	4e0a      	ldr	r6, [pc, #40]	@ (8004da4 <fn_08004D4C+0x58>)
 8004d7c:	0001      	movs	r1, r0
 8004d7e:	8837      	ldrh	r7, [r6, #0]
 8004d80:	0020      	movs	r0, r4
 8004d82:	4642      	mov	r2, r8
 8004d84:	8035      	strh	r5, [r6, #0]
 8004d86:	f014 fe99 	bl	8019abc <fn_08019ABC>
 8004d8a:	0020      	movs	r0, r4
 8004d8c:	8037      	strh	r7, [r6, #0]
 8004d8e:	bc80      	pop	{r7}
 8004d90:	46b8      	mov	r8, r7
 8004d92:	bcf0      	pop	{r4, r5, r6, r7}
 8004d94:	bc02      	pop	{r1}
 8004d96:	4708      	bx	r1
 8004d98:	2001      	movs	r0, #1
 8004d9a:	4240      	negs	r0, r0
 8004d9c:	e7f7      	b.n	8004d8e <fn_08004D4C+0x42>
 8004d9e:	46c0      	nop			@ (mov r8, r8)
 8004da0:	030064c4 	.word	0x030064c4
 8004da4:	04000208 	.word	0x04000208
