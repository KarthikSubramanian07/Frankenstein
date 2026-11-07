fn_0801C9AC:
 801c9ac:	21ff      	movs	r1, #255	@ 0xff
 801c9ae:	4b05      	ldr	r3, [pc, #20]	@ (801c9c4 <fn_0801C9AC+0x18>)
 801c9b0:	4a05      	ldr	r2, [pc, #20]	@ (801c9c8 <fn_0801C9AC+0x1c>)
 801c9b2:	681b      	ldr	r3, [r3, #0]
 801c9b4:	5499      	strb	r1, [r3, r2]
 801c9b6:	2100      	movs	r1, #0
 801c9b8:	4a04      	ldr	r2, [pc, #16]	@ (801c9cc <fn_0801C9AC+0x20>)
 801c9ba:	5099      	str	r1, [r3, r2]
 801c9bc:	4a04      	ldr	r2, [pc, #16]	@ (801c9d0 <fn_0801C9AC+0x24>)
 801c9be:	310a      	adds	r1, #10
 801c9c0:	5099      	str	r1, [r3, r2]
 801c9c2:	4770      	bx	lr
 801c9c4:	030064c4 	.word	0x030064c4
 801c9c8:	00005a3c 	.word	0x00005a3c
 801c9cc:	00005a38 	.word	0x00005a38
 801c9d0:	00005a48 	.word	0x00005a48
