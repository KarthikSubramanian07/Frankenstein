fn_080019D0:
 80019d0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80019d2:	f023 fdbf 	bl	8025554 <fn_08025554>
 80019d6:	26ee      	movs	r6, #238	@ 0xee
 80019d8:	0007      	movs	r7, r0
 80019da:	4d1f      	ldr	r5, [pc, #124]	@ (8001a58 <fn_080019D0+0x88>)
 80019dc:	0076      	lsls	r6, r6, #1
 80019de:	f023 fdb9 	bl	8025554 <fn_08025554>
 80019e2:	682a      	ldr	r2, [r5, #0]
 80019e4:	6ed3      	ldr	r3, [r2, #108]	@ 0x6c
 80019e6:	66d0      	str	r0, [r2, #108]	@ 0x6c
 80019e8:	1ac4      	subs	r4, r0, r3
 80019ea:	4298      	cmp	r0, r3
 80019ec:	d105      	bne.n	80019fa <fn_080019D0+0x2a>
 80019ee:	e022      	b.n	8001a36 <fn_080019D0+0x66>
 80019f0:	3301      	adds	r3, #1
 80019f2:	3c01      	subs	r4, #1
 80019f4:	6693      	str	r3, [r2, #104]	@ 0x68
 80019f6:	2c00      	cmp	r4, #0
 80019f8:	d021      	beq.n	8001a3e <fn_080019D0+0x6e>
 80019fa:	f003 fb09 	bl	8005010 <fn_08005010>
 80019fe:	682a      	ldr	r2, [r5, #0]
 8001a00:	6e93      	ldr	r3, [r2, #104]	@ 0x68
 8001a02:	5990      	ldr	r0, [r2, r6]
 8001a04:	1a19      	subs	r1, r3, r0
 8001a06:	2903      	cmp	r1, #3
 8001a08:	ddf2      	ble.n	80019f0 <fn_080019D0+0x20>
 8001a0a:	26ee      	movs	r6, #238	@ 0xee
 8001a0c:	000c      	movs	r4, r1
 8001a0e:	2781      	movs	r7, #129	@ 0x81
 8001a10:	0076      	lsls	r6, r6, #1
 8001a12:	e00a      	b.n	8001a2a <fn_080019D0+0x5a>
 8001a14:	f004 fefe 	bl	8006814 <fn_08006814>
 8001a18:	f002 fbae 	bl	8004178 <fn_08004178>
 8001a1c:	682a      	ldr	r2, [r5, #0]
 8001a1e:	5993      	ldr	r3, [r2, r6]
 8001a20:	3c01      	subs	r4, #1
 8001a22:	3301      	adds	r3, #1
 8001a24:	5193      	str	r3, [r2, r6]
 8001a26:	2c00      	cmp	r4, #0
 8001a28:	d013      	beq.n	8001a52 <fn_080019D0+0x82>
 8001a2a:	5dd3      	ldrb	r3, [r2, r7]
 8001a2c:	2b00      	cmp	r3, #0
 8001a2e:	d0f1      	beq.n	8001a14 <fn_080019D0+0x44>
 8001a30:	f000 f884 	bl	8001b3c <fn_08001B3C>
 8001a34:	e7ee      	b.n	8001a14 <fn_080019D0+0x44>
 8001a36:	21ee      	movs	r1, #238	@ 0xee
 8001a38:	0049      	lsls	r1, r1, #1
 8001a3a:	6e93      	ldr	r3, [r2, #104]	@ 0x68
 8001a3c:	5850      	ldr	r0, [r2, r1]
 8001a3e:	1a19      	subs	r1, r3, r0
 8001a40:	2900      	cmp	r1, #0
 8001a42:	dce2      	bgt.n	8001a0a <fn_080019D0+0x3a>
 8001a44:	f023 fd86 	bl	8025554 <fn_08025554>
 8001a48:	1bc0      	subs	r0, r0, r7
 8001a4a:	280a      	cmp	r0, #10
 8001a4c:	ddc7      	ble.n	80019de <fn_080019D0+0xe>
 8001a4e:	f004 fee1 	bl	8006814 <fn_08006814>
 8001a52:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001a54:	bc01      	pop	{r0}
 8001a56:	4700      	bx	r0
 8001a58:	030064c4 	.word	0x030064c4
