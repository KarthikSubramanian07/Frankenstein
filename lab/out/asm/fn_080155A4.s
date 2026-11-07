fn_080155A4:
 80155a4:	2320      	movs	r3, #32
 80155a6:	5ec0      	ldrsh	r0, [r0, r3]
 80155a8:	2809      	cmp	r0, #9
 80155aa:	d002      	beq.n	80155b2 <fn_080155A4+0xe>
 80155ac:	0600      	lsls	r0, r0, #24
 80155ae:	0fc0      	lsrs	r0, r0, #31
 80155b0:	4770      	bx	lr
 80155b2:	2001      	movs	r0, #1
 80155b4:	e7fc      	b.n	80155b0 <fn_080155A4+0xc>
 80155b6:	46c0      	nop			@ (mov r8, r8)
