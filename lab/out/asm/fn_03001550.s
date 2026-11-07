fn_03001550:
 3001550:	e0203fc0 	eor	r3, r0, r0, asr #31
 3001554:	e0433fc0 	sub	r3, r3, r0, asr #31
 3001558:	e0212fc1 	eor	r2, r1, r1, asr #31
 300155c:	e92d4070 	push	{r4, r5, r6, lr}
 3001560:	e0422fc1 	sub	r2, r2, r1, asr #31
 3001564:	e0204001 	eor	r4, r0, r1
 3001568:	e59f501c 	ldr	r5, [pc, #28]	@ 300158c <fn_03001550+0x3c>
 300156c:	e1a01803 	lsl	r1, r3, #16
 3001570:	e1a00843 	asr	r0, r3, #16
 3001574:	e1a0e00f 	mov	lr, pc
 3001578:	e12fff15 	bx	r5
 300157c:	e3540000 	cmp	r4, #0
 3001580:	b2600000 	rsblt	r0, r0, #0
 3001584:	e8bd4070 	pop	{r4, r5, r6, lr}
 3001588:	e12fff1e 	bx	lr
 300158c:	0300092c 	.word	0x0300092c
