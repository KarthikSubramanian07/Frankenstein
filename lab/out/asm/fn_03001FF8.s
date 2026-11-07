fn_03001FF8:
 3001ff8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
 3001ffc:	e59f7134 	ldr	r7, [pc, #308]	@ 3002138 <fn_03001FF8+0x140>
 3002000:	e597e000 	ldr	lr, [r7]
 3002004:	e28e3901 	add	r3, lr, #16384	@ 0x4000
 3002008:	e59331b0 	ldr	r3, [r3, #432]	@ 0x1b0
 300200c:	e1530001 	cmp	r3, r1
 3002010:	03a03000 	moveq	r3, #0
 3002014:	11a04000 	movne	r4, r0
 3002018:	01a06003 	moveq	r6, r3
 300201c:	11a06002 	movne	r6, r2
 3002020:	e0815081 	add	r5, r1, r1, lsl #1
 3002024:	10643184 	rsbne	r3, r4, r4, lsl #3
 3002028:	e0855006 	add	r5, r5, r6
 300202c:	e0855003 	add	r5, r5, r3
 3002030:	e205501f 	and	r5, r5, #31
 3002034:	01a04003 	moveq	r4, r3
 3002038:	e2853d11 	add	r3, r5, #1088	@ 0x440
 300203c:	e2833008 	add	r3, r3, #8
 3002040:	e08e3103 	add	r3, lr, r3, lsl #2
 3002044:	e5933004 	ldr	r3, [r3, #4]
 3002048:	e3530000 	cmp	r3, #0
 300204c:	e24dd008 	sub	sp, sp, #8
 3002050:	1a000003 	bne	3002064 <fn_03001FF8+0x6c>
 3002054:	ea00000f 	b	3002098 <fn_03001FF8+0xa0>
 3002058:	e5933000 	ldr	r3, [r3]
 300205c:	e3530000 	cmp	r3, #0
 3002060:	0a00000c 	beq	3002098 <fn_03001FF8+0xa0>
 3002064:	e593c00c 	ldr	ip, [r3, #12]
 3002068:	e15c0004 	cmp	ip, r4
 300206c:	1afffff9 	bne	3002058 <fn_03001FF8+0x60>
 3002070:	e1d300f4 	ldrsh	r0, [r3, #4]
 3002074:	e1500001 	cmp	r0, r1
 3002078:	1afffff6 	bne	3002058 <fn_03001FF8+0x60>
 300207c:	e1d320f6 	ldrsh	r2, [r3, #6]
 3002080:	e1520006 	cmp	r2, r6
 3002084:	1afffff3 	bne	3002058 <fn_03001FF8+0x60>
 3002088:	e1a00003 	mov	r0, r3
 300208c:	e28dd008 	add	sp, sp, #8
 3002090:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
 3002094:	e12fff1e 	bx	lr
 3002098:	e28e2a01 	add	r2, lr, #4096	@ 0x1000
 300209c:	e59231a4 	ldr	r3, [r2, #420]	@ 0x1a4
 30020a0:	e3530000 	cmp	r3, #0
 30020a4:	e1a08001 	mov	r8, r1
 30020a8:	0a000019 	beq	3002114 <fn_03001FF8+0x11c>
 30020ac:	e5931000 	ldr	r1, [r3]
 30020b0:	e3510000 	cmp	r1, #0
 30020b4:	e58211a4 	str	r1, [r2, #420]	@ 0x1a4
 30020b8:	028e1d46 	addeq	r1, lr, #4480	@ 0x1180
 30020bc:	02811024 	addeq	r1, r1, #36	@ 0x24
 30020c0:	058211a8 	streq	r1, [r2, #424]	@ 0x1a8
 30020c4:	e3a02000 	mov	r2, #0
 30020c8:	e08ee105 	add	lr, lr, r5, lsl #2
 30020cc:	e28eea01 	add	lr, lr, #4096	@ 0x1000
 30020d0:	e59e1124 	ldr	r1, [lr, #292]	@ 0x124
 30020d4:	e5831000 	str	r1, [r3]
 30020d8:	e59f105c 	ldr	r1, [pc, #92]	@ 300213c <fn_03001FF8+0x144>
 30020dc:	e58e3124 	str	r3, [lr, #292]	@ 0x124
 30020e0:	e2830014 	add	r0, r3, #20
 30020e4:	e583400c 	str	r4, [r3, #12]
 30020e8:	e1c380b4 	strh	r8, [r3, #4]
 30020ec:	e1c360b6 	strh	r6, [r3, #6]
 30020f0:	e5831008 	str	r1, [r3, #8]
 30020f4:	e5c32010 	strb	r2, [r3, #16]
 30020f8:	e58d3004 	str	r3, [sp, #4]
 30020fc:	ebfffd98 	bl	3001764 <fn_03001764>
 3002100:	e59d3004 	ldr	r3, [sp, #4]
 3002104:	e1a00003 	mov	r0, r3
 3002108:	e28dd008 	add	sp, sp, #8
 300210c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
 3002110:	e12fff1e 	bx	lr
 3002114:	e3a02002 	mov	r2, #2
 3002118:	e3a01f42 	mov	r1, #264	@ 0x108
 300211c:	e3a00001 	mov	r0, #1
 3002120:	e59fc018 	ldr	ip, [pc, #24]	@ 3002140 <fn_03001FF8+0x148>
 3002124:	e1a0e00f 	mov	lr, pc
 3002128:	e12fff1c 	bx	ip
 300212c:	e597e000 	ldr	lr, [r7]
 3002130:	e1a03000 	mov	r3, r0
 3002134:	eaffffe2 	b	30020c4 <fn_03001FF8+0xcc>
 3002138:	030064c4 	.word	0x030064c4
 300213c:	ffff0078 	.word	0xffff0078
 3002140:	0801d781 	.word	0x0801d781
