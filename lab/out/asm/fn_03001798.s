fn_03001798:
 3001798:	e0402802 	sub	r2, r0, r2, lsl #16
 300179c:	e0411803 	sub	r1, r1, r3, lsl #16
 30017a0:	e1dd00f4 	ldrsh	r0, [sp, #4]
 30017a4:	e1dd30f0 	ldrsh	r3, [sp]
 30017a8:	e0cc1193 	smull	r1, ip, r3, r1
 30017ac:	e0c32290 	smull	r2, r3, r0, r2
 30017b0:	e1a01821 	lsr	r1, r1, #16
 30017b4:	e1a00822 	lsr	r0, r2, #16
 30017b8:	e1800803 	orr	r0, r0, r3, lsl #16
 30017bc:	e181180c 	orr	r1, r1, ip, lsl #16
 30017c0:	e1510000 	cmp	r1, r0
 30017c4:	b3a00000 	movlt	r0, #0
 30017c8:	a3a00001 	movge	r0, #1
 30017cc:	e12fff1e 	bx	lr
