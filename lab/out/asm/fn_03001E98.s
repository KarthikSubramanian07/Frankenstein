fn_03001E98:
 3001e98:	e92d40f0 	push	{r4, r5, r6, r7, lr}
 3001e9c:	e1a07002 	mov	r7, r2
 3001ea0:	e1d050f8 	ldrsh	r5, [r0, #8]
 3001ea4:	e1550001 	cmp	r5, r1
 3001ea8:	c1a03005 	movgt	r3, r5
 3001eac:	d1a03001 	movle	r3, r1
 3001eb0:	c1a05001 	movgt	r5, r1
 3001eb4:	e1a06001 	mov	r6, r1
 3001eb8:	e1d010fa 	ldrsh	r1, [r0, #10]
 3001ebc:	e1510002 	cmp	r1, r2
 3001ec0:	b1a02001 	movlt	r2, r1
 3001ec4:	a1a02007 	movge	r2, r7
 3001ec8:	b1a01007 	movlt	r1, r7
 3001ecc:	e1530002 	cmp	r3, r2
 3001ed0:	e1a04000 	mov	r4, r0
 3001ed4:	e24dd00c 	sub	sp, sp, #12
 3001ed8:	ca00000a 	bgt	3001f08 <fn_03001E98+0x70>
 3001edc:	e2820001 	add	r0, r2, #1
 3001ee0:	e284e014 	add	lr, r4, #20
 3001ee4:	ea000002 	b	3001ef4 <fn_03001E98+0x5c>
 3001ee8:	e2833001 	add	r3, r3, #1
 3001eec:	e1530000 	cmp	r3, r0
 3001ef0:	0a000002 	beq	3001f00 <fn_03001E98+0x68>
 3001ef4:	e7dec083 	ldrb	ip, [lr, r3, lsl #1]
 3001ef8:	e35c00ff 	cmp	ip, #255	@ 0xff
 3001efc:	0afffff9 	beq	3001ee8 <fn_03001E98+0x50>
 3001f00:	e1520003 	cmp	r2, r3
 3001f04:	aa000006 	bge	3001f24 <fn_03001E98+0x8c>
 3001f08:	e1a03004 	mov	r3, r4
 3001f0c:	e1a00003 	mov	r0, r3
 3001f10:	e1c450b8 	strh	r5, [r4, #8]
 3001f14:	e1c410ba 	strh	r1, [r4, #10]
 3001f18:	e28dd00c 	add	sp, sp, #12
 3001f1c:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
 3001f20:	e12fff1e 	bx	lr
 3001f24:	e1d430f4 	ldrsh	r3, [r4, #4]
 3001f28:	e0835083 	add	r5, r3, r3, lsl #1
 3001f2c:	e59f30bc 	ldr	r3, [pc, #188]	@ 3001ff0 <fn_03001E98+0x158>
 3001f30:	e5940004 	ldr	r0, [r4, #4]
 3001f34:	e5932000 	ldr	r2, [r3]
 3001f38:	e594100c 	ldr	r1, [r4, #12]
 3001f3c:	e0855840 	add	r5, r5, r0, asr #16
 3001f40:	e0613181 	rsb	r3, r1, r1, lsl #3
 3001f44:	e282ca01 	add	ip, r2, #4096	@ 0x1000
 3001f48:	e0855003 	add	r5, r5, r3
 3001f4c:	e59c31a4 	ldr	r3, [ip, #420]	@ 0x1a4
 3001f50:	e3530000 	cmp	r3, #0
 3001f54:	e205501f 	and	r5, r5, #31
 3001f58:	0a000018 	beq	3001fc0 <fn_03001E98+0x128>
 3001f5c:	e593e000 	ldr	lr, [r3]
 3001f60:	e35e0000 	cmp	lr, #0
 3001f64:	e58ce1a4 	str	lr, [ip, #420]	@ 0x1a4
 3001f68:	0282ed46 	addeq	lr, r2, #4480	@ 0x1180
 3001f6c:	028ee024 	addeq	lr, lr, #36	@ 0x24
 3001f70:	058ce1a8 	streq	lr, [ip, #424]	@ 0x1a8
 3001f74:	e3a0c000 	mov	ip, #0
 3001f78:	e0822105 	add	r2, r2, r5, lsl #2
 3001f7c:	e2822a01 	add	r2, r2, #4096	@ 0x1000
 3001f80:	e592e124 	ldr	lr, [r2, #292]	@ 0x124
 3001f84:	e583e000 	str	lr, [r3]
 3001f88:	e5823124 	str	r3, [r2, #292]	@ 0x124
 3001f8c:	e583100c 	str	r1, [r3, #12]
 3001f90:	e5830004 	str	r0, [r3, #4]
 3001f94:	e1c360b8 	strh	r6, [r3, #8]
 3001f98:	e1c370ba 	strh	r7, [r3, #10]
 3001f9c:	e5c3c010 	strb	ip, [r3, #16]
 3001fa0:	e2830014 	add	r0, r3, #20
 3001fa4:	e58d3004 	str	r3, [sp, #4]
 3001fa8:	ebfffded 	bl	3001764 <fn_03001764>
 3001fac:	e59d3004 	ldr	r3, [sp, #4]
 3001fb0:	e1a00003 	mov	r0, r3
 3001fb4:	e28dd00c 	add	sp, sp, #12
 3001fb8:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
 3001fbc:	e12fff1e 	bx	lr
 3001fc0:	e3a02002 	mov	r2, #2
 3001fc4:	e3a01f42 	mov	r1, #264	@ 0x108
 3001fc8:	e3a00001 	mov	r0, #1
 3001fcc:	e59fc020 	ldr	ip, [pc, #32]	@ 3001ff4 <fn_03001E98+0x15c>
 3001fd0:	e1a0e00f 	mov	lr, pc
 3001fd4:	e12fff1c 	bx	ip
 3001fd8:	e59f3010 	ldr	r3, [pc, #16]	@ 3001ff0 <fn_03001E98+0x158>
 3001fdc:	e594100c 	ldr	r1, [r4, #12]
 3001fe0:	e5932000 	ldr	r2, [r3]
 3001fe4:	e1a03000 	mov	r3, r0
 3001fe8:	e5940004 	ldr	r0, [r4, #4]
 3001fec:	eaffffe0 	b	3001f74 <fn_03001E98+0xdc>
 3001ff0:	030064c4 	.word	0x030064c4
 3001ff4:	0801d831 	.word	0x0801d831
