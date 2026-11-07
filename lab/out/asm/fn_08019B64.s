fn_08019B64:
 8019b64:	4684      	mov	ip, r0
 8019b66:	b510      	push	{r4, lr}
 8019b68:	4c08      	ldr	r4, [pc, #32]	@ (8019b8c <fn_08019B64+0x28>)
 8019b6a:	0013      	movs	r3, r2
 8019b6c:	6820      	ldr	r0, [r4, #0]
 8019b6e:	4a08      	ldr	r2, [pc, #32]	@ (8019b90 <fn_08019B64+0x2c>)
 8019b70:	5880      	ldr	r0, [r0, r2]
 8019b72:	000a      	movs	r2, r1
 8019b74:	4661      	mov	r1, ip
 8019b76:	f004 fb03 	bl	801e180 <fn_0801E180>
 8019b7a:	23ab      	movs	r3, #171	@ 0xab
 8019b7c:	2100      	movs	r1, #0
 8019b7e:	6822      	ldr	r2, [r4, #0]
 8019b80:	00db      	lsls	r3, r3, #3
 8019b82:	54d1      	strb	r1, [r2, r3]
 8019b84:	bc10      	pop	{r4}
 8019b86:	bc01      	pop	{r0}
 8019b88:	4700      	bx	r0
 8019b8a:	46c0      	nop			@ (mov r8, r8)
 8019b8c:	030064c4 	.word	0x030064c4
 8019b90:	000004d4 	.word	0x000004d4
