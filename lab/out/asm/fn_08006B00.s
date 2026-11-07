fn_08006B00:
 8006b00:	21fb      	movs	r1, #251	@ 0xfb
 8006b02:	4b05      	ldr	r3, [pc, #20]	@ (8006b18 <fn_08006B00+0x18>)
 8006b04:	6818      	ldr	r0, [r3, #0]
 8006b06:	23ff      	movs	r3, #255	@ 0xff
 8006b08:	00c9      	lsls	r1, r1, #3
 8006b0a:	5842      	ldr	r2, [r0, r1]
 8006b0c:	3201      	adds	r2, #1
 8006b0e:	4013      	ands	r3, r2
 8006b10:	4a02      	ldr	r2, [pc, #8]	@ (8006b1c <fn_08006B00+0x1c>)
 8006b12:	5043      	str	r3, [r0, r1]
 8006b14:	5cd0      	ldrb	r0, [r2, r3]
 8006b16:	4770      	bx	lr
 8006b18:	030064c4 	.word	0x030064c4
 8006b1c:	0802638c 	.word	0x0802638c
