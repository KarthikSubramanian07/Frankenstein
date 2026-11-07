fn_03000E7C:
 3000e7c:	e5902004 	ldr	r2, [r0, #4]
 3000e80:	e3520001 	cmp	r2, #1
 3000e84:	b3a02001 	movlt	r2, #1
 3000e88:	e5901008 	ldr	r1, [r0, #8]
 3000e8c:	e351007e 	cmp	r1, #126	@ 0x7e
 3000e90:	d0623001 	rsble	r3, r2, r1
 3000e94:	c262307e 	rsbgt	r3, r2, #126	@ 0x7e
 3000e98:	e3530000 	cmp	r3, #0
 3000e9c:	b12fff1e 	bxlt	lr
 3000ea0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 3000ea4:	e59f1070 	ldr	r1, [pc, #112]	@ 3000f1c <fn_03000E7C+0xa0>
 3000ea8:	e59fe070 	ldr	lr, [pc, #112]	@ 3000f20 <fn_03000E7C+0xa4>
 3000eac:	e590c000 	ldr	ip, [r0]
 3000eb0:	e1a00182 	lsl	r0, r2, #3
 3000eb4:	e0602382 	rsb	r2, r0, r2, lsl #7
 3000eb8:	e5911000 	ldr	r1, [r1]
 3000ebc:	e59e0000 	ldr	r0, [lr]
 3000ec0:	e082200c 	add	r2, r2, ip
 3000ec4:	e2833001 	add	r3, r3, #1
 3000ec8:	e0811082 	add	r1, r1, r2, lsl #1
 3000ecc:	e2800c11 	add	r0, r0, #4352	@ 0x1100
 3000ed0:	e0633203 	rsb	r3, r3, r3, lsl #4
 3000ed4:	e59fc048 	ldr	ip, [pc, #72]	@ 3000f24 <fn_03000E7C+0xa8>
 3000ed8:	e1d022b0 	ldrh	r2, [r0, #32]
 3000edc:	e0810203 	add	r0, r1, r3, lsl #4
 3000ee0:	e19c30d2 	ldrsb	r3, [ip, r2]
 3000ee4:	e7d13083 	ldrb	r3, [r1, r3, lsl #1]
 3000ee8:	e2833406 	add	r3, r3, #100663296	@ 0x6000000
 3000eec:	e2833a13 	add	r3, r3, #77824	@ 0x13000
 3000ef0:	e5d33c00 	ldrb	r3, [r3, #3072]	@ 0xc00
 3000ef4:	e4c130f0 	strb	r3, [r1], #240	@ 0xf0
 3000ef8:	e2822001 	add	r2, r2, #1
 3000efc:	e1510000 	cmp	r1, r0
 3000f00:	e202203f 	and	r2, r2, #63	@ 0x3f
 3000f04:	1afffff5 	bne	3000ee0 <fn_03000E7C+0x64>
 3000f08:	e59e3000 	ldr	r3, [lr]
 3000f0c:	e2833c11 	add	r3, r3, #4352	@ 0x1100
 3000f10:	e1c322b0 	strh	r2, [r3, #32]
 3000f14:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 3000f18:	e12fff1e 	bx	lr
 3000f1c:	030064cc 	.word	0x030064cc
 3000f20:	030064c4 	.word	0x030064c4
 3000f24:	0812f6d4 	.word	0x0812f6d4
