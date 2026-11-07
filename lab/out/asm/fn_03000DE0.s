fn_03000DE0:
 3000de0:	e590c004 	ldr	ip, [r0, #4]
 3000de4:	e5902008 	ldr	r2, [r0, #8]
 3000de8:	e042200c 	sub	r2, r2, ip
 3000dec:	e2822001 	add	r2, r2, #1
 3000df0:	e3520000 	cmp	r2, #0
 3000df4:	d12fff1e 	bxle	lr
 3000df8:	e5d0301c 	ldrb	r3, [r0, #28]
 3000dfc:	e3530000 	cmp	r3, #0
 3000e00:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
 3000e04:	13a050ff 	movne	r5, #255	@ 0xff
 3000e08:	03a05cff 	moveq	r5, #65280	@ 0xff00
 3000e0c:	13a04008 	movne	r4, #8
 3000e10:	03a04000 	moveq	r4, #0
 3000e14:	e590e00c 	ldr	lr, [r0, #12]
 3000e18:	e5901010 	ldr	r1, [r0, #16]
 3000e1c:	e24c3040 	sub	r3, ip, #64	@ 0x40
 3000e20:	e021139e 	mla	r1, lr, r3, r1
 3000e24:	e59f304c 	ldr	r3, [pc, #76]	@ 3000e78 <fn_03000DE0+0x98>
 3000e28:	e5908000 	ldr	r8, [r0]
 3000e2c:	e5907014 	ldr	r7, [r0, #20]
 3000e30:	e5906018 	ldr	r6, [r0, #24]
 3000e34:	e5930000 	ldr	r0, [r3]
 3000e38:	e1a0318c 	lsl	r3, ip, #3
 3000e3c:	e063338c 	rsb	r3, r3, ip, lsl #7
 3000e40:	e0833008 	add	r3, r3, r8
 3000e44:	e1a01481 	lsl	r1, r1, #9
 3000e48:	e0800083 	add	r0, r0, r3, lsl #1
 3000e4c:	e7d7cca1 	ldrb	ip, [r7, r1, lsr #25]
 3000e50:	e1d030b0 	ldrh	r3, [r0]
 3000e54:	e7d6c00c 	ldrb	ip, [r6, ip]
 3000e58:	e0033005 	and	r3, r3, r5
 3000e5c:	e183341c 	orr	r3, r3, ip, lsl r4
 3000e60:	e2522001 	subs	r2, r2, #1
 3000e64:	e0c03fb0 	strh	r3, [r0], #240	@ 0xf0
 3000e68:	e081148e 	add	r1, r1, lr, lsl #9
 3000e6c:	1afffff6 	bne	3000e4c <fn_03000DE0+0x6c>
 3000e70:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
 3000e74:	e12fff1e 	bx	lr
 3000e78:	030064cc 	.word	0x030064cc	@ data_030064CC
