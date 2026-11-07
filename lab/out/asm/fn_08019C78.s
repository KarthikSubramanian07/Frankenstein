fn_08019C78:
 8019c78:	0043      	lsls	r3, r0, #1
 8019c7a:	181b      	adds	r3, r3, r0
 8019c7c:	015b      	lsls	r3, r3, #5
 8019c7e:	b510      	push	{r4, lr}
 8019c80:	210f      	movs	r1, #15
 8019c82:	1a18      	subs	r0, r3, r0
 8019c84:	f00b fcdc 	bl	8025640 <fn_08025640>
 8019c88:	4b04      	ldr	r3, [pc, #16]	@ (8019c9c <fn_08019C78+0x24>)
 8019c8a:	681a      	ldr	r2, [r3, #0]
 8019c8c:	4b04      	ldr	r3, [pc, #16]	@ (8019ca0 <fn_08019C78+0x28>)
 8019c8e:	0001      	movs	r1, r0
 8019c90:	58d0      	ldr	r0, [r2, r3]
 8019c92:	f004 fde9 	bl	801e868 <fn_0801E868>
 8019c96:	bc10      	pop	{r4}
 8019c98:	bc01      	pop	{r0}
 8019c9a:	4700      	bx	r0
 8019c9c:	030064c4 	.word	0x030064c4
 8019ca0:	000004d4 	.word	0x000004d4
