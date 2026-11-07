fn_080127AC:
 80127ac:	b5f0      	push	{r4, r5, r6, r7, lr}
 80127ae:	4d12      	ldr	r5, [pc, #72]	@ (80127f8 <fn_080127AC+0x4c>)
 80127b0:	682b      	ldr	r3, [r5, #0]
 80127b2:	46c6      	mov	lr, r8
 80127b4:	469c      	mov	ip, r3
 80127b6:	4a11      	ldr	r2, [pc, #68]	@ (80127fc <fn_080127AC+0x50>)
 80127b8:	2300      	movs	r3, #0
 80127ba:	b500      	push	{lr}
 80127bc:	4462      	add	r2, ip
 80127be:	e003      	b.n	80127c8 <fn_080127AC+0x1c>
 80127c0:	3301      	adds	r3, #1
 80127c2:	3204      	adds	r2, #4
 80127c4:	2b20      	cmp	r3, #32
 80127c6:	d011      	beq.n	80127ec <fn_080127AC+0x40>
 80127c8:	6811      	ldr	r1, [r2, #0]
 80127ca:	4281      	cmp	r1, r0
 80127cc:	d1f8      	bne.n	80127c0 <fn_080127AC+0x14>
 80127ce:	2600      	movs	r6, #0
 80127d0:	68c2      	ldr	r2, [r0, #12]
 80127d2:	6116      	str	r6, [r2, #16]
 80127d4:	22d6      	movs	r2, #214	@ 0xd6
 80127d6:	0092      	lsls	r2, r2, #2
 80127d8:	189b      	adds	r3, r3, r2
 80127da:	009c      	lsls	r4, r3, #2
 80127dc:	4663      	mov	r3, ip
 80127de:	191b      	adds	r3, r3, r4
 80127e0:	6858      	ldr	r0, [r3, #4]
 80127e2:	f005 feab 	bl	801853c <fn_0801853C>
 80127e6:	682b      	ldr	r3, [r5, #0]
 80127e8:	191b      	adds	r3, r3, r4
 80127ea:	605e      	str	r6, [r3, #4]
 80127ec:	bc80      	pop	{r7}
 80127ee:	46b8      	mov	r8, r7
 80127f0:	bcf0      	pop	{r4, r5, r6, r7}
 80127f2:	bc01      	pop	{r0}
 80127f4:	4700      	bx	r0
 80127f6:	46c0      	nop			@ (mov r8, r8)
 80127f8:	030064c4 	.word	0x030064c4
 80127fc:	00000d64 	.word	0x00000d64
