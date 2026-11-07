fn_08001990:
 8001990:	b570      	push	{r4, r5, r6, lr}
 8001992:	f023 fddf 	bl	8025554 <fn_08025554>
 8001996:	4d0d      	ldr	r5, [pc, #52]	@ (80019cc <fn_08001990+0x3c>)
 8001998:	682a      	ldr	r2, [r5, #0]
 800199a:	6ed3      	ldr	r3, [r2, #108]	@ 0x6c
 800199c:	66d0      	str	r0, [r2, #108]	@ 0x6c
 800199e:	1ac4      	subs	r4, r0, r3
 80019a0:	4298      	cmp	r0, r3
 80019a2:	d00f      	beq.n	80019c4 <fn_08001990+0x34>
 80019a4:	26ee      	movs	r6, #238	@ 0xee
 80019a6:	0076      	lsls	r6, r6, #1
 80019a8:	e004      	b.n	80019b4 <fn_08001990+0x24>
 80019aa:	3301      	adds	r3, #1
 80019ac:	3c01      	subs	r4, #1
 80019ae:	668b      	str	r3, [r1, #104]	@ 0x68
 80019b0:	2c00      	cmp	r4, #0
 80019b2:	d007      	beq.n	80019c4 <fn_08001990+0x34>
 80019b4:	f003 fb2c 	bl	8005010 <fn_08005010>
 80019b8:	6829      	ldr	r1, [r5, #0]
 80019ba:	6e8b      	ldr	r3, [r1, #104]	@ 0x68
 80019bc:	598a      	ldr	r2, [r1, r6]
 80019be:	1a9a      	subs	r2, r3, r2
 80019c0:	2a03      	cmp	r2, #3
 80019c2:	ddf2      	ble.n	80019aa <fn_08001990+0x1a>
 80019c4:	bc70      	pop	{r4, r5, r6}
 80019c6:	bc01      	pop	{r0}
 80019c8:	4700      	bx	r0
 80019ca:	46c0      	nop			@ (mov r8, r8)
 80019cc:	030064c4 	.word	0x030064c4	@ data_030064C4
