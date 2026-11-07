fn_08015560:
 8015560:	b510      	push	{r4, lr}
 8015562:	000c      	movs	r4, r1
 8015564:	b086      	sub	sp, #24
 8015566:	a902      	add	r1, sp, #8
 8015568:	f7fa fed4 	bl	8010314 <fn_08010314>
 801556c:	9a05      	ldr	r2, [sp, #20]
 801556e:	9904      	ldr	r1, [sp, #16]
 8015570:	0fd3      	lsrs	r3, r2, #31
 8015572:	189b      	adds	r3, r3, r2
 8015574:	0fca      	lsrs	r2, r1, #31
 8015576:	1852      	adds	r2, r2, r1
 8015578:	1052      	asrs	r2, r2, #1
 801557a:	105b      	asrs	r3, r3, #1
 801557c:	189b      	adds	r3, r3, r2
 801557e:	9a02      	ldr	r2, [sp, #8]
 8015580:	9903      	ldr	r1, [sp, #12]
 8015582:	9300      	str	r3, [sp, #0]
 8015584:	0fd3      	lsrs	r3, r2, #31
 8015586:	189b      	adds	r3, r3, r2
 8015588:	0fca      	lsrs	r2, r1, #31
 801558a:	1852      	adds	r2, r2, r1
 801558c:	1052      	asrs	r2, r2, #1
 801558e:	105b      	asrs	r3, r3, #1
 8015590:	189b      	adds	r3, r3, r2
 8015592:	0021      	movs	r1, r4
 8015594:	4668      	mov	r0, sp
 8015596:	9301      	str	r3, [sp, #4]
 8015598:	f004 fefe 	bl	801a398 <fn_0801A398>
 801559c:	b006      	add	sp, #24
 801559e:	bc10      	pop	{r4}
 80155a0:	bc01      	pop	{r0}
 80155a2:	4700      	bx	r0
