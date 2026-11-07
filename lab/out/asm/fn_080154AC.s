fn_080154AC:
 80154ac:	b510      	push	{r4, lr}
 80154ae:	000c      	movs	r4, r1
 80154b0:	b086      	sub	sp, #24
 80154b2:	a902      	add	r1, sp, #8
 80154b4:	f7fa ff2e 	bl	8010314 <fn_08010314>
 80154b8:	9a05      	ldr	r2, [sp, #20]
 80154ba:	9904      	ldr	r1, [sp, #16]
 80154bc:	0fd3      	lsrs	r3, r2, #31
 80154be:	189b      	adds	r3, r3, r2
 80154c0:	0fca      	lsrs	r2, r1, #31
 80154c2:	1852      	adds	r2, r2, r1
 80154c4:	1052      	asrs	r2, r2, #1
 80154c6:	105b      	asrs	r3, r3, #1
 80154c8:	189b      	adds	r3, r3, r2
 80154ca:	9a02      	ldr	r2, [sp, #8]
 80154cc:	9903      	ldr	r1, [sp, #12]
 80154ce:	9300      	str	r3, [sp, #0]
 80154d0:	0fd3      	lsrs	r3, r2, #31
 80154d2:	189b      	adds	r3, r3, r2
 80154d4:	0fca      	lsrs	r2, r1, #31
 80154d6:	1852      	adds	r2, r2, r1
 80154d8:	1052      	asrs	r2, r2, #1
 80154da:	105b      	asrs	r3, r3, #1
 80154dc:	189b      	adds	r3, r3, r2
 80154de:	0021      	movs	r1, r4
 80154e0:	4668      	mov	r0, sp
 80154e2:	9301      	str	r3, [sp, #4]
 80154e4:	f004 fefe 	bl	801a2e4 <fn_0801A2E4>
 80154e8:	b006      	add	sp, #24
 80154ea:	bc10      	pop	{r4}
 80154ec:	bc01      	pop	{r0}
 80154ee:	4700      	bx	r0
