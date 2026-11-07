fn_0800549C:
 800549c:	6883      	ldr	r3, [r0, #8]
 800549e:	428b      	cmp	r3, r1
 80054a0:	dd05      	ble.n	80054ae <fn_0800549C+0x12>
 80054a2:	6081      	str	r1, [r0, #8]
 80054a4:	6843      	ldr	r3, [r0, #4]
 80054a6:	4293      	cmp	r3, r2
 80054a8:	dd08      	ble.n	80054bc <fn_0800549C+0x20>
 80054aa:	6042      	str	r2, [r0, #4]
 80054ac:	4770      	bx	lr
 80054ae:	68c3      	ldr	r3, [r0, #12]
 80054b0:	428b      	cmp	r3, r1
 80054b2:	daf7      	bge.n	80054a4 <fn_0800549C+0x8>
 80054b4:	6843      	ldr	r3, [r0, #4]
 80054b6:	60c1      	str	r1, [r0, #12]
 80054b8:	4293      	cmp	r3, r2
 80054ba:	dcf6      	bgt.n	80054aa <fn_0800549C+0xe>
 80054bc:	6803      	ldr	r3, [r0, #0]
 80054be:	4293      	cmp	r3, r2
 80054c0:	daf4      	bge.n	80054ac <fn_0800549C+0x10>
 80054c2:	6002      	str	r2, [r0, #0]
 80054c4:	e7f2      	b.n	80054ac <fn_0800549C+0x10>
 80054c6:	46c0      	nop			@ (mov r8, r8)
