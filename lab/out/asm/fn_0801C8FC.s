fn_0801C8FC:
 801c8fc:	21ff      	movs	r1, #255	@ 0xff
 801c8fe:	4b05      	ldr	r3, [pc, #20]	@ (801c914 <fn_0801C8FC+0x18>)
 801c900:	4a05      	ldr	r2, [pc, #20]	@ (801c918 <fn_0801C8FC+0x1c>)
 801c902:	681b      	ldr	r3, [r3, #0]
 801c904:	5499      	strb	r1, [r3, r2]
 801c906:	2100      	movs	r1, #0
 801c908:	4a04      	ldr	r2, [pc, #16]	@ (801c91c <fn_0801C8FC+0x20>)
 801c90a:	5099      	str	r1, [r3, r2]
 801c90c:	4a04      	ldr	r2, [pc, #16]	@ (801c920 <fn_0801C8FC+0x24>)
 801c90e:	310a      	adds	r1, #10
 801c910:	5099      	str	r1, [r3, r2]
 801c912:	4770      	bx	lr
 801c914:	030064c4 	.word	0x030064c4
 801c918:	00005a3c 	.word	0x00005a3c
 801c91c:	00005a38 	.word	0x00005a38
 801c920:	00005a48 	.word	0x00005a48
