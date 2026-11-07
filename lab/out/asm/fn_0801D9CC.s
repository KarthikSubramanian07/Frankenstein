fn_0801D9CC:
 801d9cc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801d9ce:	4d16      	ldr	r5, [pc, #88]	@ (801da28 <fn_0801D9CC+0x5c>)
 801d9d0:	682b      	ldr	r3, [r5, #0]
 801d9d2:	689c      	ldr	r4, [r3, #8]
 801d9d4:	68a2      	ldr	r2, [r4, #8]
 801d9d6:	429a      	cmp	r2, r3
 801d9d8:	d01a      	beq.n	801da10 <fn_0801D9CC+0x44>
 801d9da:	4f14      	ldr	r7, [pc, #80]	@ (801da2c <fn_0801D9CC+0x60>)
 801d9dc:	4e14      	ldr	r6, [pc, #80]	@ (801da30 <fn_0801D9CC+0x64>)
 801d9de:	6823      	ldr	r3, [r4, #0]
 801d9e0:	021b      	lsls	r3, r3, #8
 801d9e2:	0a1b      	lsrs	r3, r3, #8
 801d9e4:	18e3      	adds	r3, r4, r3
 801d9e6:	429a      	cmp	r2, r3
 801d9e8:	d003      	beq.n	801d9f2 <fn_0801D9CC+0x26>
 801d9ea:	0038      	movs	r0, r7
 801d9ec:	f7e2 fddc 	bl	80005a8 <fn_080005A8>
 801d9f0:	68a2      	ldr	r2, [r4, #8]
 801d9f2:	68d3      	ldr	r3, [r2, #12]
 801d9f4:	42a3      	cmp	r3, r4
 801d9f6:	d003      	beq.n	801da00 <fn_0801D9CC+0x34>
 801d9f8:	0030      	movs	r0, r6
 801d9fa:	f7e2 fdd5 	bl	80005a8 <fn_080005A8>
 801d9fe:	68a2      	ldr	r2, [r4, #8]
 801da00:	6863      	ldr	r3, [r4, #4]
 801da02:	2b00      	cmp	r3, #0
 801da04:	d007      	beq.n	801da16 <fn_0801D9CC+0x4a>
 801da06:	0014      	movs	r4, r2
 801da08:	68a2      	ldr	r2, [r4, #8]
 801da0a:	682b      	ldr	r3, [r5, #0]
 801da0c:	429a      	cmp	r2, r3
 801da0e:	d1e6      	bne.n	801d9de <fn_0801D9CC+0x12>
 801da10:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801da12:	bc01      	pop	{r0}
 801da14:	4700      	bx	r0
 801da16:	6853      	ldr	r3, [r2, #4]
 801da18:	2b00      	cmp	r3, #0
 801da1a:	d1f4      	bne.n	801da06 <fn_0801D9CC+0x3a>
 801da1c:	4805      	ldr	r0, [pc, #20]	@ (801da34 <fn_0801D9CC+0x68>)
 801da1e:	f7e2 fdc3 	bl	80005a8 <fn_080005A8>
 801da22:	68a4      	ldr	r4, [r4, #8]
 801da24:	e7f0      	b.n	801da08 <fn_0801D9CC+0x3c>
 801da26:	46c0      	nop			@ (mov r8, r8)
 801da28:	03006780 	.word	0x03006780
 801da2c:	0814ab50 	.word	0x0814ab50
 801da30:	0814ab88 	.word	0x0814ab88
 801da34:	0814abc0 	.word	0x0814abc0
