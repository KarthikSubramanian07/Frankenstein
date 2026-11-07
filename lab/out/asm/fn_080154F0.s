fn_080154F0:
 80154f0:	2320      	movs	r3, #32
 80154f2:	5ec0      	ldrsh	r0, [r0, r3]
 80154f4:	2809      	cmp	r0, #9
 80154f6:	d002      	beq.n	80154fe <fn_080154F0+0xe>
 80154f8:	0600      	lsls	r0, r0, #24
 80154fa:	0fc0      	lsrs	r0, r0, #31
 80154fc:	4770      	bx	lr
 80154fe:	2001      	movs	r0, #1
 8015500:	e7fc      	b.n	80154fc <fn_080154F0+0xc>
 8015502:	46c0      	nop			@ (mov r8, r8)
