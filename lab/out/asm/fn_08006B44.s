fn_08006B44:
 8006b44:	21fb      	movs	r1, #251	@ 0xfb
 8006b46:	2200      	movs	r2, #0
 8006b48:	4b03      	ldr	r3, [pc, #12]	@ (8006b58 <fn_08006B44+0x14>)
 8006b4a:	681b      	ldr	r3, [r3, #0]
 8006b4c:	00c9      	lsls	r1, r1, #3
 8006b4e:	505a      	str	r2, [r3, r1]
 8006b50:	4902      	ldr	r1, [pc, #8]	@ (8006b5c <fn_08006B44+0x18>)
 8006b52:	505a      	str	r2, [r3, r1]
 8006b54:	4770      	bx	lr
 8006b56:	46c0      	nop			@ (mov r8, r8)
 8006b58:	030064c4 	.word	0x030064c4
 8006b5c:	000007d4 	.word	0x000007d4
