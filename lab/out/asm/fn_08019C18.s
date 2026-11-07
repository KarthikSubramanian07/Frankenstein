fn_08019C18:
 8019c18:	4684      	mov	ip, r0
 8019c1a:	b510      	push	{r4, lr}
 8019c1c:	4c08      	ldr	r4, [pc, #32]	@ (8019c40 <fn_08019C18+0x28>)
 8019c1e:	0013      	movs	r3, r2
 8019c20:	6820      	ldr	r0, [r4, #0]
 8019c22:	4a08      	ldr	r2, [pc, #32]	@ (8019c44 <fn_08019C18+0x2c>)
 8019c24:	5880      	ldr	r0, [r0, r2]
 8019c26:	000a      	movs	r2, r1
 8019c28:	4661      	mov	r1, ip
 8019c2a:	f004 fb01 	bl	801e230 <fn_0801E230>
 8019c2e:	23ab      	movs	r3, #171	@ 0xab
 8019c30:	2100      	movs	r1, #0
 8019c32:	6822      	ldr	r2, [r4, #0]
 8019c34:	00db      	lsls	r3, r3, #3
 8019c36:	54d1      	strb	r1, [r2, r3]
 8019c38:	bc10      	pop	{r4}
 8019c3a:	bc01      	pop	{r0}
 8019c3c:	4700      	bx	r0
 8019c3e:	46c0      	nop			@ (mov r8, r8)
 8019c40:	030064c4 	.word	0x030064c4
 8019c44:	000004d4 	.word	0x000004d4
