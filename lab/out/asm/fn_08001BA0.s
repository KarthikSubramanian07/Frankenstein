fn_08001BA0:
 8001ba0:	22d4      	movs	r2, #212	@ 0xd4
 8001ba2:	2100      	movs	r1, #0
 8001ba4:	4b04      	ldr	r3, [pc, #16]	@ (8001bb8 <fn_08001BA0+0x18>)
 8001ba6:	681b      	ldr	r3, [r3, #0]
 8001ba8:	5499      	strb	r1, [r3, r2]
 8001baa:	3ad5      	subs	r2, #213	@ 0xd5
 8001bac:	675a      	str	r2, [r3, #116]	@ 0x74
 8001bae:	3101      	adds	r1, #1
 8001bb0:	3282      	adds	r2, #130	@ 0x82
 8001bb2:	5499      	strb	r1, [r3, r2]
 8001bb4:	4770      	bx	lr
 8001bb6:	46c0      	nop			@ (mov r8, r8)
 8001bb8:	030064c4 	.word	0x030064c4
