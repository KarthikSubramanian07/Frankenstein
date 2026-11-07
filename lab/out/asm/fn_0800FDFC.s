fn_0800FDFC:
 800fdfc:	17c3      	asrs	r3, r0, #31
 800fdfe:	18c0      	adds	r0, r0, r3
 800fe00:	4058      	eors	r0, r3
 800fe02:	17cb      	asrs	r3, r1, #31
 800fe04:	18c9      	adds	r1, r1, r3
 800fe06:	4059      	eors	r1, r3
 800fe08:	180b      	adds	r3, r1, r0
 800fe0a:	4281      	cmp	r1, r0
 800fe0c:	dc02      	bgt.n	800fe14 <fn_0800FDFC+0x18>
 800fe0e:	1049      	asrs	r1, r1, #1
 800fe10:	1a58      	subs	r0, r3, r1
 800fe12:	4770      	bx	lr
 800fe14:	1040      	asrs	r0, r0, #1
 800fe16:	1a18      	subs	r0, r3, r0
 800fe18:	e7fb      	b.n	800fe12 <fn_0800FDFC+0x16>
 800fe1a:	46c0      	nop			@ (mov r8, r8)
