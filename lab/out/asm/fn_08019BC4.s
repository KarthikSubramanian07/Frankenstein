fn_08019BC4:
 8019bc4:	0043      	lsls	r3, r0, #1
 8019bc6:	181b      	adds	r3, r3, r0
 8019bc8:	015b      	lsls	r3, r3, #5
 8019bca:	b510      	push	{r4, lr}
 8019bcc:	210f      	movs	r1, #15
 8019bce:	1a18      	subs	r0, r3, r0
 8019bd0:	f00b fcde 	bl	8025590 <fn_08025590>
 8019bd4:	4b04      	ldr	r3, [pc, #16]	@ (8019be8 <fn_08019BC4+0x24>)
 8019bd6:	681a      	ldr	r2, [r3, #0]
 8019bd8:	4b04      	ldr	r3, [pc, #16]	@ (8019bec <fn_08019BC4+0x28>)
 8019bda:	0001      	movs	r1, r0
 8019bdc:	58d0      	ldr	r0, [r2, r3]
 8019bde:	f004 fdeb 	bl	801e7b8 <fn_0801E7B8>
 8019be2:	bc10      	pop	{r4}
 8019be4:	bc01      	pop	{r0}
 8019be6:	4700      	bx	r0
 8019be8:	030064c4 	.word	0x030064c4
 8019bec:	000004d4 	.word	0x000004d4
