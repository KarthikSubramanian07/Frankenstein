fn_0300275C:
 300275c:	e0422000 	sub	r2, r2, r0
 3002760:	e0433001 	sub	r3, r3, r1
 3002764:	e1920003 	orrs	r0, r2, r3
 3002768:	012fff1e 	bxeq	lr
 300276c:	e022cfc2 	eor	ip, r2, r2, asr #31
 3002770:	e0231fc3 	eor	r1, r3, r3, asr #31
 3002774:	e04ccfc2 	sub	ip, ip, r2, asr #31
 3002778:	e0411fc3 	sub	r1, r1, r3, asr #31
 300277c:	e15c0001 	cmp	ip, r1
 3002780:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 3002784:	ca000017 	bgt	30027e8 <fn_0300275C+0x8c>
 3002788:	e59f00b8 	ldr	r0, [pc, #184]	@ 3002848 <fn_0300275C+0xec>
 300278c:	e7d00c21 	ldrb	r0, [r0, r1, lsr #24]
 3002790:	e59fe0b4 	ldr	lr, [pc, #180]	@ 300284c <fn_0300275C+0xf0>
 3002794:	e1a01421 	lsr	r1, r1, #8
 3002798:	e1a01031 	lsr	r1, r1, r0
 300279c:	e79e1101 	ldr	r1, [lr, r1, lsl #2]
 30027a0:	e1a01051 	asr	r1, r1, r0
 30027a4:	e1a0018c 	lsl	r0, ip, #3
 30027a8:	e0cc1190 	smull	r1, ip, r0, r1
 30027ac:	e1a01821 	lsr	r1, r1, #16
 30027b0:	e181180c 	orr	r1, r1, ip, lsl #16
 30027b4:	e1a01841 	asr	r1, r1, #16
 30027b8:	e3510b02 	cmp	r1, #2048	@ 0x800
 30027bc:	23a01b02 	movcs	r1, #2048	@ 0x800
 30027c0:	e3e00103 	mvn	r0, #-1073741824	@ 0xc0000000
 30027c4:	e59fc084 	ldr	ip, [pc, #132]	@ 3002850 <fn_0300275C+0xf4>
 30027c8:	e79c1101 	ldr	r1, [ip, r1, lsl #2]
 30027cc:	e3520000 	cmp	r2, #0
 30027d0:	e0400001 	sub	r0, r0, r1
 30027d4:	ba000016 	blt	3002834 <fn_0300275C+0xd8>
 30027d8:	e3530000 	cmp	r3, #0
 30027dc:	b2600000 	rsblt	r0, r0, #0
 30027e0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 30027e4:	e12fff1e 	bx	lr
 30027e8:	e59fe058 	ldr	lr, [pc, #88]	@ 3002848 <fn_0300275C+0xec>
 30027ec:	e7deec2c 	ldrb	lr, [lr, ip, lsr #24]
 30027f0:	e1a00181 	lsl	r0, r1, #3
 30027f4:	e1a0c42c 	lsr	ip, ip, #8
 30027f8:	e59f104c 	ldr	r1, [pc, #76]	@ 300284c <fn_0300275C+0xf0>
 30027fc:	e1a0ce3c 	lsr	ip, ip, lr
 3002800:	e791110c 	ldr	r1, [r1, ip, lsl #2]
 3002804:	e1a0c000 	mov	ip, r0
 3002808:	e1a01e51 	asr	r1, r1, lr
 300280c:	e0c0119c 	smull	r1, r0, ip, r1
 3002810:	e1a01821 	lsr	r1, r1, #16
 3002814:	e1811800 	orr	r1, r1, r0, lsl #16
 3002818:	e1a01841 	asr	r1, r1, #16
 300281c:	e3510b02 	cmp	r1, #2048	@ 0x800
 3002820:	23a01b02 	movcs	r1, #2048	@ 0x800
 3002824:	e59f0024 	ldr	r0, [pc, #36]	@ 3002850 <fn_0300275C+0xf4>
 3002828:	e3520000 	cmp	r2, #0
 300282c:	e7900101 	ldr	r0, [r0, r1, lsl #2]
 3002830:	aaffffe8 	bge	30027d8 <fn_0300275C+0x7c>
 3002834:	e3530000 	cmp	r3, #0
 3002838:	a2600102 	rsbge	r0, r0, #-2147483648	@ 0x80000000
 300283c:	b2800102 	addlt	r0, r0, #-2147483648	@ 0x80000000
 3002840:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 3002844:	e12fff1e 	bx	lr
 3002848:	0802653c 	.word	0x0802653c
 300284c:	0802e53c 	.word	0x0802e53c
 3002850:	0813789c 	.word	0x0813789c
