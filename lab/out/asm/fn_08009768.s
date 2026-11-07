fn_08009768:
 8009768:	b5f0      	push	{r4, r5, r6, r7, lr}
 800976a:	0004      	movs	r4, r0
 800976c:	215c      	movs	r1, #92	@ 0x5c
 800976e:	b083      	sub	sp, #12
 8009770:	f010 fdaa 	bl	801a2c8 <fn_0801A2C8>
 8009774:	6e25      	ldr	r5, [r4, #96]	@ 0x60
 8009776:	2d00      	cmp	r5, #0
 8009778:	d005      	beq.n	8009786 <fn_08009768+0x1e>
 800977a:	0029      	movs	r1, r5
 800977c:	6d20      	ldr	r0, [r4, #80]	@ 0x50
 800977e:	f00a fd85 	bl	801428c <fn_0801428C>
 8009782:	2800      	cmp	r0, #0
 8009784:	d103      	bne.n	800978e <fn_08009768+0x26>
 8009786:	b003      	add	sp, #12
 8009788:	bcf0      	pop	{r4, r5, r6, r7}
 800978a:	bc01      	pop	{r0}
 800978c:	4700      	bx	r0
 800978e:	6a2b      	ldr	r3, [r5, #32]
 8009790:	0020      	movs	r0, r4
 8009792:	0cde      	lsrs	r6, r3, #19
 8009794:	f006 fca6 	bl	80100e4 <fn_080100E4>
 8009798:	68eb      	ldr	r3, [r5, #12]
 800979a:	9301      	str	r3, [sp, #4]
 800979c:	2380      	movs	r3, #128	@ 0x80
 800979e:	20c0      	movs	r0, #192	@ 0xc0
 80097a0:	011b      	lsls	r3, r3, #4
 80097a2:	4f0d      	ldr	r7, [pc, #52]	@ (80097d8 <fn_08009768+0x70>)
 80097a4:	199b      	adds	r3, r3, r6
 80097a6:	009b      	lsls	r3, r3, #2
 80097a8:	58f9      	ldr	r1, [r7, r3]
 80097aa:	0340      	lsls	r0, r0, #13
 80097ac:	f01b ff16 	bl	80255dc <fn_080255DC>
 80097b0:	9b01      	ldr	r3, [sp, #4]
 80097b2:	18c0      	adds	r0, r0, r3
 80097b4:	60e0      	str	r0, [r4, #12]
 80097b6:	20c0      	movs	r0, #192	@ 0xc0
 80097b8:	692b      	ldr	r3, [r5, #16]
 80097ba:	9301      	str	r3, [sp, #4]
 80097bc:	00b3      	lsls	r3, r6, #2
 80097be:	59d9      	ldr	r1, [r3, r7]
 80097c0:	0340      	lsls	r0, r0, #13
 80097c2:	f01b ff0b 	bl	80255dc <fn_080255DC>
 80097c6:	9b01      	ldr	r3, [sp, #4]
 80097c8:	18c0      	adds	r0, r0, r3
 80097ca:	696b      	ldr	r3, [r5, #20]
 80097cc:	6120      	str	r0, [r4, #16]
 80097ce:	6163      	str	r3, [r4, #20]
 80097d0:	0020      	movs	r0, r4
 80097d2:	f006 fc9b 	bl	801010c <fn_0801010C>
 80097d6:	e7d6      	b.n	8009786 <fn_08009768+0x1e>
 80097d8:	081397cc 	.word	0x081397cc
