fn_080144A0:
 80144a0:	68c2      	ldr	r2, [r0, #12]
 80144a2:	4b05      	ldr	r3, [pc, #20]	@ (80144b8 <fn_080144A0+0x18>)
 80144a4:	6819      	ldr	r1, [r3, #0]
 80144a6:	0053      	lsls	r3, r2, #1
 80144a8:	189b      	adds	r3, r3, r2
 80144aa:	4a04      	ldr	r2, [pc, #16]	@ (80144bc <fn_080144A0+0x1c>)
 80144ac:	5889      	ldr	r1, [r1, r2]
 80144ae:	009b      	lsls	r3, r3, #2
 80144b0:	5aca      	ldrh	r2, [r1, r3]
 80144b2:	3201      	adds	r2, #1
 80144b4:	52ca      	strh	r2, [r1, r3]
 80144b6:	4770      	bx	lr
 80144b8:	030064c4 	.word	0x030064c4
 80144bc:	00000e14 	.word	0x00000e14
