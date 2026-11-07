fn_08019C64:
 8019c64:	4b03      	ldr	r3, [pc, #12]	@ (8019c74 <fn_08019C64+0x10>)
 8019c66:	681a      	ldr	r2, [r3, #0]
 8019c68:	1e43      	subs	r3, r0, #1
 8019c6a:	4198      	sbcs	r0, r3
 8019c6c:	23ab      	movs	r3, #171	@ 0xab
 8019c6e:	00db      	lsls	r3, r3, #3
 8019c70:	54d0      	strb	r0, [r2, r3]
 8019c72:	4770      	bx	lr
 8019c74:	030064c4 	.word	0x030064c4
