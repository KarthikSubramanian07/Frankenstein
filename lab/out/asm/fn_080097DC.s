fn_080097DC:
 80097dc:	b5f0      	push	{r4, r5, r6, r7, lr}
 80097de:	0004      	movs	r4, r0
 80097e0:	215b      	movs	r1, #91	@ 0x5b
 80097e2:	b083      	sub	sp, #12
 80097e4:	f010 fd70 	bl	801a2c8 <fn_0801A2C8>
 80097e8:	6e25      	ldr	r5, [r4, #96]	@ 0x60
 80097ea:	2d00      	cmp	r5, #0
 80097ec:	d005      	beq.n	80097fa <fn_080097DC+0x1e>
 80097ee:	0029      	movs	r1, r5
 80097f0:	6d20      	ldr	r0, [r4, #80]	@ 0x50
 80097f2:	f00a fd4b 	bl	801428c <fn_0801428C>
 80097f6:	2800      	cmp	r0, #0
 80097f8:	d103      	bne.n	8009802 <fn_080097DC+0x26>
 80097fa:	b003      	add	sp, #12
 80097fc:	bcf0      	pop	{r4, r5, r6, r7}
 80097fe:	bc01      	pop	{r0}
 8009800:	4700      	bx	r0
 8009802:	6a2b      	ldr	r3, [r5, #32]
 8009804:	0020      	movs	r0, r4
 8009806:	0cde      	lsrs	r6, r3, #19
 8009808:	f006 fc6c 	bl	80100e4 <fn_080100E4>
 800980c:	68eb      	ldr	r3, [r5, #12]
 800980e:	9301      	str	r3, [sp, #4]
 8009810:	2380      	movs	r3, #128	@ 0x80
 8009812:	20c0      	movs	r0, #192	@ 0xc0
 8009814:	011b      	lsls	r3, r3, #4
 8009816:	4f0d      	ldr	r7, [pc, #52]	@ (800984c <fn_080097DC+0x70>)
 8009818:	199b      	adds	r3, r3, r6
 800981a:	009b      	lsls	r3, r3, #2
 800981c:	58f9      	ldr	r1, [r7, r3]
 800981e:	0340      	lsls	r0, r0, #13
 8009820:	f01b fedc 	bl	80255dc <fn_080255DC>
 8009824:	9b01      	ldr	r3, [sp, #4]
 8009826:	18c0      	adds	r0, r0, r3
 8009828:	60e0      	str	r0, [r4, #12]
 800982a:	20c0      	movs	r0, #192	@ 0xc0
 800982c:	692b      	ldr	r3, [r5, #16]
 800982e:	9301      	str	r3, [sp, #4]
 8009830:	00b3      	lsls	r3, r6, #2
 8009832:	59d9      	ldr	r1, [r3, r7]
 8009834:	0340      	lsls	r0, r0, #13
 8009836:	f01b fed1 	bl	80255dc <fn_080255DC>
 800983a:	9b01      	ldr	r3, [sp, #4]
 800983c:	18c0      	adds	r0, r0, r3
 800983e:	696b      	ldr	r3, [r5, #20]
 8009840:	6120      	str	r0, [r4, #16]
 8009842:	6163      	str	r3, [r4, #20]
 8009844:	0020      	movs	r0, r4
 8009846:	f006 fc61 	bl	801010c <fn_0801010C>
 800984a:	e7d6      	b.n	80097fa <fn_080097DC+0x1e>
 800984c:	081397cc 	.word	0x081397cc
