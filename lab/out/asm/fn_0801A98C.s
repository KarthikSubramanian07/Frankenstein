fn_0801A98C:
 801a98c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801a98e:	4b1c      	ldr	r3, [pc, #112]	@ (801aa00 <fn_0801A98C+0x74>)
 801a990:	781b      	ldrb	r3, [r3, #0]
 801a992:	2b00      	cmp	r3, #0
 801a994:	d127      	bne.n	801a9e6 <fn_0801A98C+0x5a>
 801a996:	4e1b      	ldr	r6, [pc, #108]	@ (801aa04 <fn_0801A98C+0x78>)
 801a998:	2500      	movs	r5, #0
 801a99a:	6832      	ldr	r2, [r6, #0]
 801a99c:	e00b      	b.n	801a9b6 <fn_0801A98C+0x2a>
 801a99e:	68fb      	ldr	r3, [r7, #12]
 801a9a0:	2b00      	cmp	r3, #0
 801a9a2:	d005      	beq.n	801a9b0 <fn_0801A98C+0x24>
 801a9a4:	4b18      	ldr	r3, [pc, #96]	@ (801aa08 <fn_0801A98C+0x7c>)
 801a9a6:	6939      	ldr	r1, [r7, #16]
 801a9a8:	58d3      	ldr	r3, [r2, r3]
 801a9aa:	185b      	adds	r3, r3, r1
 801a9ac:	2b00      	cmp	r3, #0
 801a9ae:	dd1d      	ble.n	801a9ec <fn_0801A98C+0x60>
 801a9b0:	3501      	adds	r5, #1
 801a9b2:	2d08      	cmp	r5, #8
 801a9b4:	d017      	beq.n	801a9e6 <fn_0801A98C+0x5a>
 801a9b6:	006c      	lsls	r4, r5, #1
 801a9b8:	1964      	adds	r4, r4, r5
 801a9ba:	4914      	ldr	r1, [pc, #80]	@ (801aa0c <fn_0801A98C+0x80>)
 801a9bc:	00a4      	lsls	r4, r4, #2
 801a9be:	1913      	adds	r3, r2, r4
 801a9c0:	585f      	ldr	r7, [r3, r1]
 801a9c2:	2f00      	cmp	r7, #0
 801a9c4:	d0f4      	beq.n	801a9b0 <fn_0801A98C+0x24>
 801a9c6:	0028      	movs	r0, r5
 801a9c8:	f7ea f9ee 	bl	8004da8 <fn_08004DA8>
 801a9cc:	6832      	ldr	r2, [r6, #0]
 801a9ce:	2800      	cmp	r0, #0
 801a9d0:	d1e5      	bne.n	801a99e <fn_0801A98C+0x12>
 801a9d2:	4b0e      	ldr	r3, [pc, #56]	@ (801aa0c <fn_0801A98C+0x80>)
 801a9d4:	1914      	adds	r4, r2, r4
 801a9d6:	18e4      	adds	r4, r4, r3
 801a9d8:	6823      	ldr	r3, [r4, #0]
 801a9da:	2b00      	cmp	r3, #0
 801a9dc:	d0e8      	beq.n	801a9b0 <fn_0801A98C+0x24>
 801a9de:	3501      	adds	r5, #1
 801a9e0:	6020      	str	r0, [r4, #0]
 801a9e2:	2d08      	cmp	r5, #8
 801a9e4:	d1e7      	bne.n	801a9b6 <fn_0801A98C+0x2a>
 801a9e6:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801a9e8:	bc01      	pop	{r0}
 801a9ea:	4700      	bx	r0
 801a9ec:	4b07      	ldr	r3, [pc, #28]	@ (801aa0c <fn_0801A98C+0x80>)
 801a9ee:	1914      	adds	r4, r2, r4
 801a9f0:	18e4      	adds	r4, r4, r3
 801a9f2:	6823      	ldr	r3, [r4, #0]
 801a9f4:	2b00      	cmp	r3, #0
 801a9f6:	d0db      	beq.n	801a9b0 <fn_0801A98C+0x24>
 801a9f8:	2300      	movs	r3, #0
 801a9fa:	6023      	str	r3, [r4, #0]
 801a9fc:	e7d8      	b.n	801a9b0 <fn_0801A98C+0x24>
 801a9fe:	46c0      	nop			@ (mov r8, r8)
 801aa00:	080258a6 	.word	0x080258a6
 801aa04:	030064c4 	.word	0x030064c4
 801aa08:	00005630 	.word	0x00005630
 801aa0c:	000055d0 	.word	0x000055d0
