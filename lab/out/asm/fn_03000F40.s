fn_03000F40:
 3000f40:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3000f44:	e59f647c 	ldr	r6, [pc, #1148]	@ 30013c8 <fn_03000F40+0x488>
 3000f48:	e7966100 	ldr	r6, [r6, r0, lsl #2]
 3000f4c:	e1a08006 	mov	r8, r6
 3000f50:	e59fe474 	ldr	lr, [pc, #1140]	@ 30013cc <fn_03000F40+0x48c>
 3000f54:	e59ec004 	ldr	ip, [lr, #4]
 3000f58:	e0c6cc98 	smull	ip, r6, r8, ip
 3000f5c:	e1a0c82c 	lsr	ip, ip, #16
 3000f60:	e18cc806 	orr	ip, ip, r6, lsl #16
 3000f64:	e1a06101 	lsl	r6, r1, #2
 3000f68:	e2866406 	add	r6, r6, #100663296	@ 0x6000000
 3000f6c:	e2866c96 	add	r6, r6, #38400	@ 0x9600
 3000f70:	e59ea008 	ldr	sl, [lr, #8]
 3000f74:	e0428001 	sub	r8, r2, r1
 3000f78:	e5962200 	ldr	r2, [r6, #512]	@ 0x200
 3000f7c:	e59663e0 	ldr	r6, [r6, #992]	@ 0x3e0
 3000f80:	e086600a 	add	r6, r6, sl
 3000f84:	e0ca229c 	smull	r2, sl, ip, r2
 3000f88:	e1a069a6 	lsr	r6, r6, #19
 3000f8c:	e59f943c 	ldr	r9, [pc, #1084]	@ 30013d0 <fn_03000F40+0x490>
 3000f90:	e1a02822 	lsr	r2, r2, #16
 3000f94:	e182280a 	orr	r2, r2, sl, lsl #16
 3000f98:	e286ab02 	add	sl, r6, #2048	@ 0x800
 3000f9c:	e799a10a 	ldr	sl, [r9, sl, lsl #2]
 3000fa0:	e7999106 	ldr	r9, [r9, r6, lsl #2]
 3000fa4:	e1a0b009 	mov	fp, r9
 3000fa8:	e0ca6a92 	smull	r6, sl, r2, sl
 3000fac:	e0c9229b 	smull	r2, r9, fp, r2
 3000fb0:	e59e7010 	ldr	r7, [lr, #16]
 3000fb4:	e59e5014 	ldr	r5, [lr, #20]
 3000fb8:	e1a02822 	lsr	r2, r2, #16
 3000fbc:	e2677000 	rsb	r7, r7, #0
 3000fc0:	e1822809 	orr	r2, r2, r9, lsl #16
 3000fc4:	e0472002 	sub	r2, r7, r2
 3000fc8:	e0c7559c 	smull	r5, r7, ip, r5
 3000fcc:	e59e4018 	ldr	r4, [lr, #24]
 3000fd0:	e1a05825 	lsr	r5, r5, #16
 3000fd4:	e1855807 	orr	r5, r5, r7, lsl #16
 3000fd8:	e0c7449c 	smull	r4, r7, ip, r4
 3000fdc:	e1a04824 	lsr	r4, r4, #16
 3000fe0:	e1844807 	orr	r4, r4, r7, lsl #16
 3000fe4:	e1a06826 	lsr	r6, r6, #16
 3000fe8:	e59e700c 	ldr	r7, [lr, #12]
 3000fec:	e186680a 	orr	r6, r6, sl, lsl #16
 3000ff0:	e0876006 	add	r6, r7, r6
 3000ff4:	e59f73d8 	ldr	r7, [pc, #984]	@ 30013d4 <fn_03000F40+0x494>
 3000ff8:	e0076506 	and	r6, r7, r6, lsl #10
 3000ffc:	e0077485 	and	r7, r7, r5, lsl #9
 3001000:	e59f53d0 	ldr	r5, [pc, #976]	@ 30013d8 <fn_03000F40+0x498>
 3001004:	e0052322 	and	r2, r5, r2, lsr #6
 3001008:	e00553c4 	and	r5, r5, r4, asr #7
 300100c:	e59e401c 	ldr	r4, [lr, #28]
 3001010:	e1862002 	orr	r2, r6, r2
 3001014:	e1877005 	orr	r7, r7, r5
 3001018:	e3540000 	cmp	r4, #0
 300101c:	e24dd014 	sub	sp, sp, #20
 3001020:	0593c00c 	ldreq	ip, [r3, #12]
 3001024:	e8830084 	stm	r3, {r2, r7}
 3001028:	0a000006 	beq	3001048 <fn_03000F40+0x108>
 300102c:	e1a0ca2c 	lsr	ip, ip, #20
 3001030:	e35c007f 	cmp	ip, #127	@ 0x7f
 3001034:	23a0c07f 	movcs	ip, #127	@ 0x7f
 3001038:	e7d4400c 	ldrb	r4, [r4, ip]
 300103c:	e59fc398 	ldr	ip, [pc, #920]	@ 30013dc <fn_03000F40+0x49c>
 3001040:	e08cc404 	add	ip, ip, r4, lsl #8
 3001044:	e583c00c 	str	ip, [r3, #12]
 3001048:	e0600200 	rsb	r0, r0, r0, lsl #4
 300104c:	e59ee000 	ldr	lr, [lr]
 3001050:	e0811180 	add	r1, r1, r0, lsl #3
 3001054:	e1b061a8 	lsrs	r6, r8, #3
 3001058:	e08ea081 	add	sl, lr, r1, lsl #1
 300105c:	e5930008 	ldr	r0, [r3, #8]
 3001060:	e3a01d3f 	mov	r1, #4032	@ 0xfc0
 3001064:	0a000070 	beq	300122c <fn_03000F40+0x2ec>
 3001068:	e1a09006 	mov	r9, r6
 300106c:	e1a0b002 	mov	fp, r2
 3001070:	e98d0500 	stmib	sp, {r8, sl}
 3001074:	e0875087 	add	r5, r7, r7, lsl #1
 3001078:	e58d600c 	str	r6, [sp, #12]
 300107c:	e0855002 	add	r5, r5, r2
 3001080:	e1a0e087 	lsl	lr, r7, #1
 3001084:	e28a4010 	add	r4, sl, #16
 3001088:	e0823087 	add	r3, r2, r7, lsl #1
 300108c:	e043800e 	sub	r8, r3, lr
 3001090:	e045200e 	sub	r2, r5, lr
 3001094:	e0016222 	and	r6, r1, r2, lsr #4
 3001098:	e001a228 	and	sl, r1, r8, lsr #4
 300109c:	e1866d22 	orr	r6, r6, r2, lsr #26
 30010a0:	e18aad28 	orr	sl, sl, r8, lsr #26
 30010a4:	e7d06006 	ldrb	r6, [r0, r6]
 30010a8:	e7d0a00a 	ldrb	sl, [r0, sl]
 30010ac:	e7dc6006 	ldrb	r6, [ip, r6]
 30010b0:	e7dca00a 	ldrb	sl, [ip, sl]
 30010b4:	e18aa406 	orr	sl, sl, r6, lsl #8
 30010b8:	e144a1b0 	strh	sl, [r4, #-16]
 30010bc:	e0016225 	and	r6, r1, r5, lsr #4
 30010c0:	e1866d25 	orr	r6, r6, r5, lsr #26
 30010c4:	e7d05006 	ldrb	r5, [r0, r6]
 30010c8:	e7dc6005 	ldrb	r6, [ip, r5]
 30010cc:	e0015223 	and	r5, r1, r3, lsr #4
 30010d0:	e1855d23 	orr	r5, r5, r3, lsr #26
 30010d4:	e7d03005 	ldrb	r3, [r0, r5]
 30010d8:	e7dc3003 	ldrb	r3, [ip, r3]
 30010dc:	e0822107 	add	r2, r2, r7, lsl #2
 30010e0:	e1833406 	orr	r3, r3, r6, lsl #8
 30010e4:	e14430be 	strh	r3, [r4, #-14]
 30010e8:	e0013222 	and	r3, r1, r2, lsr #4
 30010ec:	e1833d22 	orr	r3, r3, r2, lsr #26
 30010f0:	e7d03003 	ldrb	r3, [r0, r3]
 30010f4:	e0888107 	add	r8, r8, r7, lsl #2
 30010f8:	e7dc5003 	ldrb	r5, [ip, r3]
 30010fc:	e0013228 	and	r3, r1, r8, lsr #4
 3001100:	e1833d28 	orr	r3, r3, r8, lsr #26
 3001104:	e7d06003 	ldrb	r6, [r0, r3]
 3001108:	e7dc6006 	ldrb	r6, [ip, r6]
 300110c:	e08e2002 	add	r2, lr, r2
 3001110:	e08e3008 	add	r3, lr, r8
 3001114:	e1866405 	orr	r6, r6, r5, lsl #8
 3001118:	e14460bc 	strh	r6, [r4, #-12]
 300111c:	e0015222 	and	r5, r1, r2, lsr #4
 3001120:	e0016223 	and	r6, r1, r3, lsr #4
 3001124:	e1855d22 	orr	r5, r5, r2, lsr #26
 3001128:	e1866d23 	orr	r6, r6, r3, lsr #26
 300112c:	e7d05005 	ldrb	r5, [r0, r5]
 3001130:	e7d06006 	ldrb	r6, [r0, r6]
 3001134:	e7dc5005 	ldrb	r5, [ip, r5]
 3001138:	e7dc6006 	ldrb	r6, [ip, r6]
 300113c:	e08e2002 	add	r2, lr, r2
 3001140:	e08e3003 	add	r3, lr, r3
 3001144:	e1866405 	orr	r6, r6, r5, lsl #8
 3001148:	e14460ba 	strh	r6, [r4, #-10]
 300114c:	e0015222 	and	r5, r1, r2, lsr #4
 3001150:	e0016223 	and	r6, r1, r3, lsr #4
 3001154:	e1855d22 	orr	r5, r5, r2, lsr #26
 3001158:	e1866d23 	orr	r6, r6, r3, lsr #26
 300115c:	e7d05005 	ldrb	r5, [r0, r5]
 3001160:	e7d06006 	ldrb	r6, [r0, r6]
 3001164:	e7dc5005 	ldrb	r5, [ip, r5]
 3001168:	e7dc6006 	ldrb	r6, [ip, r6]
 300116c:	e08e2002 	add	r2, lr, r2
 3001170:	e08e3003 	add	r3, lr, r3
 3001174:	e1866405 	orr	r6, r6, r5, lsl #8
 3001178:	e14460b8 	strh	r6, [r4, #-8]
 300117c:	e0015222 	and	r5, r1, r2, lsr #4
 3001180:	e0016223 	and	r6, r1, r3, lsr #4
 3001184:	e1855d22 	orr	r5, r5, r2, lsr #26
 3001188:	e1866d23 	orr	r6, r6, r3, lsr #26
 300118c:	e7d05005 	ldrb	r5, [r0, r5]
 3001190:	e7d06006 	ldrb	r6, [r0, r6]
 3001194:	e7dc5005 	ldrb	r5, [ip, r5]
 3001198:	e7dc6006 	ldrb	r6, [ip, r6]
 300119c:	e08e2002 	add	r2, lr, r2
 30011a0:	e1866405 	orr	r6, r6, r5, lsl #8
 30011a4:	e14460b6 	strh	r6, [r4, #-6]
 30011a8:	e0015222 	and	r5, r1, r2, lsr #4
 30011ac:	e08e3003 	add	r3, lr, r3
 30011b0:	e1855d22 	orr	r5, r5, r2, lsr #26
 30011b4:	e7d05005 	ldrb	r5, [r0, r5]
 30011b8:	e0016223 	and	r6, r1, r3, lsr #4
 30011bc:	e1866d23 	orr	r6, r6, r3, lsr #26
 30011c0:	e7dc5005 	ldrb	r5, [ip, r5]
 30011c4:	e7d06006 	ldrb	r6, [r0, r6]
 30011c8:	e7dc6006 	ldrb	r6, [ip, r6]
 30011cc:	e08e2002 	add	r2, lr, r2
 30011d0:	e1866405 	orr	r6, r6, r5, lsl #8
 30011d4:	e14460b4 	strh	r6, [r4, #-4]
 30011d8:	e0015222 	and	r5, r1, r2, lsr #4
 30011dc:	e1855d22 	orr	r5, r5, r2, lsr #26
 30011e0:	e7d06005 	ldrb	r6, [r0, r5]
 30011e4:	e08e3003 	add	r3, lr, r3
 30011e8:	e0825107 	add	r5, r2, r7, lsl #2
 30011ec:	e7dc2006 	ldrb	r2, [ip, r6]
 30011f0:	e0016223 	and	r6, r1, r3, lsr #4
 30011f4:	e1866d23 	orr	r6, r6, r3, lsr #26
 30011f8:	e7d06006 	ldrb	r6, [r0, r6]
 30011fc:	e7dc6006 	ldrb	r6, [ip, r6]
 3001200:	e2599001 	subs	r9, r9, #1
 3001204:	e1866402 	orr	r6, r6, r2, lsl #8
 3001208:	e14460b2 	strh	r6, [r4, #-2]
 300120c:	e0833107 	add	r3, r3, r7, lsl #2
 3001210:	e2844010 	add	r4, r4, #16
 3001214:	1affff9c 	bne	300108c <fn_03000F40+0x14c>
 3001218:	e59d600c 	ldr	r6, [sp, #12]
 300121c:	e00e0e96 	mul	lr, r6, lr
 3001220:	e99d0500 	ldmib	sp, {r8, sl}
 3001224:	e08b218e 	add	r2, fp, lr, lsl #3
 3001228:	e08aa206 	add	sl, sl, r6, lsl #4
 300122c:	e2088007 	and	r8, r8, #7
 3001230:	e59f31a8 	ldr	r3, [pc, #424]	@ 30013e0 <fn_03000F40+0x4a0>
 3001234:	e2488001 	sub	r8, r8, #1
 3001238:	e3580006 	cmp	r8, #6
 300123c:	8a000056 	bhi	300139c <fn_03000F40+0x45c>
 3001240:	e7d38008 	ldrb	r8, [r3, r8]
 3001244:	e08ff108 	add	pc, pc, r8, lsl #2
 3001248:	e1a00000 	nop			@ (mov r0, r0)
 300124c:	e087e002 	add	lr, r7, r2
 3001250:	e0013222 	and	r3, r1, r2, lsr #4
 3001254:	e1833d22 	orr	r3, r3, r2, lsr #26
 3001258:	e001222e 	and	r2, r1, lr, lsr #4
 300125c:	e1822d2e 	orr	r2, r2, lr, lsr #26
 3001260:	e7d04002 	ldrb	r4, [r0, r2]
 3001264:	e7d03003 	ldrb	r3, [r0, r3]
 3001268:	e087200e 	add	r2, r7, lr
 300126c:	e7dc3003 	ldrb	r3, [ip, r3]
 3001270:	e7dce004 	ldrb	lr, [ip, r4]
 3001274:	e183340e 	orr	r3, r3, lr, lsl #8
 3001278:	e0ca30b2 	strh	r3, [sl], #2
 300127c:	e0875002 	add	r5, r7, r2
 3001280:	e001e222 	and	lr, r1, r2, lsr #4
 3001284:	e0014225 	and	r4, r1, r5, lsr #4
 3001288:	e18eed22 	orr	lr, lr, r2, lsr #26
 300128c:	e1844d25 	orr	r4, r4, r5, lsr #26
 3001290:	e7d0e00e 	ldrb	lr, [r0, lr]
 3001294:	e7d04004 	ldrb	r4, [r0, r4]
 3001298:	e7dce00e 	ldrb	lr, [ip, lr]
 300129c:	e7dc4004 	ldrb	r4, [ip, r4]
 30012a0:	e18ee404 	orr	lr, lr, r4, lsl #8
 30012a4:	e1a03087 	lsl	r3, r7, #1
 30012a8:	e0cae0b2 	strh	lr, [sl], #2
 30012ac:	e0822003 	add	r2, r2, r3
 30012b0:	e0875002 	add	r5, r7, r2
 30012b4:	e001e222 	and	lr, r1, r2, lsr #4
 30012b8:	e0014225 	and	r4, r1, r5, lsr #4
 30012bc:	e18eed22 	orr	lr, lr, r2, lsr #26
 30012c0:	e1844d25 	orr	r4, r4, r5, lsr #26
 30012c4:	e7d0e00e 	ldrb	lr, [r0, lr]
 30012c8:	e7d04004 	ldrb	r4, [r0, r4]
 30012cc:	e7dce00e 	ldrb	lr, [ip, lr]
 30012d0:	e7dc4004 	ldrb	r4, [ip, r4]
 30012d4:	e18ee404 	orr	lr, lr, r4, lsl #8
 30012d8:	e0cae0b2 	strh	lr, [sl], #2
 30012dc:	e0822003 	add	r2, r2, r3
 30012e0:	e0875002 	add	r5, r7, r2
 30012e4:	e001e222 	and	lr, r1, r2, lsr #4
 30012e8:	e0014225 	and	r4, r1, r5, lsr #4
 30012ec:	e18eed22 	orr	lr, lr, r2, lsr #26
 30012f0:	e1844d25 	orr	r4, r4, r5, lsr #26
 30012f4:	e7d0e00e 	ldrb	lr, [r0, lr]
 30012f8:	e7d04004 	ldrb	r4, [r0, r4]
 30012fc:	e7dce00e 	ldrb	lr, [ip, lr]
 3001300:	e7dc4004 	ldrb	r4, [ip, r4]
 3001304:	e18ee404 	orr	lr, lr, r4, lsl #8
 3001308:	e0cae0b2 	strh	lr, [sl], #2
 300130c:	e0822003 	add	r2, r2, r3
 3001310:	e0875002 	add	r5, r7, r2
 3001314:	e001e222 	and	lr, r1, r2, lsr #4
 3001318:	e0014225 	and	r4, r1, r5, lsr #4
 300131c:	e18eed22 	orr	lr, lr, r2, lsr #26
 3001320:	e1844d25 	orr	r4, r4, r5, lsr #26
 3001324:	e7d0e00e 	ldrb	lr, [r0, lr]
 3001328:	e7d04004 	ldrb	r4, [r0, r4]
 300132c:	e7dce00e 	ldrb	lr, [ip, lr]
 3001330:	e7dc4004 	ldrb	r4, [ip, r4]
 3001334:	e18ee404 	orr	lr, lr, r4, lsl #8
 3001338:	e0cae0b2 	strh	lr, [sl], #2
 300133c:	e0822003 	add	r2, r2, r3
 3001340:	e001e222 	and	lr, r1, r2, lsr #4
 3001344:	e0874002 	add	r4, r7, r2
 3001348:	e18eed22 	orr	lr, lr, r2, lsr #26
 300134c:	e0822003 	add	r2, r2, r3
 3001350:	e7d0300e 	ldrb	r3, [r0, lr]
 3001354:	e001e224 	and	lr, r1, r4, lsr #4
 3001358:	e18eed24 	orr	lr, lr, r4, lsr #26
 300135c:	e7d0e00e 	ldrb	lr, [r0, lr]
 3001360:	e7dc3003 	ldrb	r3, [ip, r3]
 3001364:	e7dce00e 	ldrb	lr, [ip, lr]
 3001368:	e183340e 	orr	r3, r3, lr, lsl #8
 300136c:	e0ca30b2 	strh	r3, [sl], #2
 3001370:	e0877002 	add	r7, r7, r2
 3001374:	e0013227 	and	r3, r1, r7, lsr #4
 3001378:	e0011222 	and	r1, r1, r2, lsr #4
 300137c:	e1833d27 	orr	r3, r3, r7, lsr #26
 3001380:	e1811d22 	orr	r1, r1, r2, lsr #26
 3001384:	e7d02003 	ldrb	r2, [r0, r3]
 3001388:	e7d03001 	ldrb	r3, [r0, r1]
 300138c:	e7dc2002 	ldrb	r2, [ip, r2]
 3001390:	e7dc3003 	ldrb	r3, [ip, r3]
 3001394:	e1833402 	orr	r3, r3, r2, lsl #8
 3001398:	e1ca30b0 	strh	r3, [sl]
 300139c:	e28dd014 	add	sp, sp, #20
 30013a0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 30013a4:	e12fff1e 	bx	lr
 30013a8:	e1a03087 	lsl	r3, r7, #1
 30013ac:	eaffffbf 	b	30012b0 <fn_03000F40+0x370>
 30013b0:	e1a03087 	lsl	r3, r7, #1
 30013b4:	eaffffe1 	b	3001340 <fn_03000F40+0x400>
 30013b8:	e1a03087 	lsl	r3, r7, #1
 30013bc:	eaffffd3 	b	3001310 <fn_03000F40+0x3d0>
 30013c0:	e1a03087 	lsl	r3, r7, #1
 30013c4:	eaffffc5 	b	30012e0 <fn_03000F40+0x3a0>
 30013c8:	06009600 	.word	0x06009600
 30013cc:	030064cc 	.word	0x030064cc
 30013d0:	081397cc 	.word	0x081397cc
 30013d4:	ffff0000 	.word	0xffff0000
 30013d8:	0000ffff 	.word	0x0000ffff
 30013dc:	06013600 	.word	0x06013600
 30013e0:	0812f6bc 	.word	0x0812f6bc
