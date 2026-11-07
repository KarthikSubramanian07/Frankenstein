fn_03002674:
 3002674:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
 3002678:	e59f20d4 	ldr	r2, [pc, #212]	@ 3002754 <fn_03002674+0xe0>
 300267c:	e5923110 	ldr	r3, [r2, #272]	@ 0x110
 3002680:	e59fc0d0 	ldr	ip, [pc, #208]	@ 3002758 <fn_03002674+0xe4>
 3002684:	e3530000 	cmp	r3, #0
 3002688:	e59c6000 	ldr	r6, [ip]
 300268c:	e24dd008 	sub	sp, sp, #8
 3002690:	0a000023 	beq	3002724 <fn_03002674+0xb0>
 3002694:	e2433001 	sub	r3, r3, #1
 3002698:	e3130902 	tst	r3, #32768	@ 0x8000
 300269c:	1a000012 	bne	30026ec <fn_03002674+0x78>
 30026a0:	e1a08001 	mov	r8, r1
 30026a4:	e1a07000 	mov	r7, r0
 30026a8:	e5925114 	ldr	r5, [r2, #276]	@ 0x114
 30026ac:	e0633183 	rsb	r3, r3, r3, lsl #3
 30026b0:	e0854103 	add	r4, r5, r3, lsl #2
 30026b4:	e1d410f6 	ldrsh	r1, [r4, #6]
 30026b8:	e1a02103 	lsl	r2, r3, #2
 30026bc:	e19520f2 	ldrsh	r2, [r5, r2]
 30026c0:	e1d430f2 	ldrsh	r3, [r4, #2]
 30026c4:	e58d1004 	str	r1, [sp, #4]
 30026c8:	e1d4c0f4 	ldrsh	ip, [r4, #4]
 30026cc:	e1a01008 	mov	r1, r8
 30026d0:	e1a00007 	mov	r0, r7
 30026d4:	e58dc000 	str	ip, [sp]
 30026d8:	ebfffc2e 	bl	3001798 <fn_03001798>
 30026dc:	e0844080 	add	r4, r4, r0, lsl #1
 30026e0:	e1d431b8 	ldrh	r3, [r4, #24]
 30026e4:	e3130902 	tst	r3, #32768	@ 0x8000
 30026e8:	0affffef 	beq	30026ac <fn_03002674+0x38>
 30026ec:	e5962df8 	ldr	r2, [r6, #3576]	@ 0xdf8
 30026f0:	e3c33902 	bic	r3, r3, #32768	@ 0x8000
 30026f4:	e0823103 	add	r3, r2, r3, lsl #2
 30026f8:	e1d330b2 	ldrh	r3, [r3, #2]
 30026fc:	e5962de8 	ldr	r2, [r6, #3560]	@ 0xde8
 3002700:	e0833103 	add	r3, r3, r3, lsl #2
 3002704:	e0823103 	add	r3, r2, r3, lsl #2
 3002708:	e1d331b0 	ldrh	r3, [r3, #16]
 300270c:	e5960df0 	ldr	r0, [r6, #3568]	@ 0xdf0
 3002710:	e0833103 	add	r3, r3, r3, lsl #2
 3002714:	e0800183 	add	r0, r0, r3, lsl #3
 3002718:	e28dd008 	add	sp, sp, #8
 300271c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
 3002720:	e12fff1e 	bx	lr
 3002724:	e5963df8 	ldr	r3, [r6, #3576]	@ 0xdf8
 3002728:	e1d330b2 	ldrh	r3, [r3, #2]
 300272c:	e5962de8 	ldr	r2, [r6, #3560]	@ 0xde8
 3002730:	e0833103 	add	r3, r3, r3, lsl #2
 3002734:	e0823103 	add	r3, r2, r3, lsl #2
 3002738:	e1d331b0 	ldrh	r3, [r3, #16]
 300273c:	e5960df0 	ldr	r0, [r6, #3568]	@ 0xdf0
 3002740:	e0833103 	add	r3, r3, r3, lsl #2
 3002744:	e0800183 	add	r0, r0, r3, lsl #3
 3002748:	e28dd008 	add	sp, sp, #8
 300274c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
 3002750:	e12fff1e 	bx	lr
 3002754:	030064cc 	.word	0x030064cc	@ data_030064CC
 3002758:	030064c4 	.word	0x030064c4	@ data_030064C4
