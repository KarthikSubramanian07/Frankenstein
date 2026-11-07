fn_080146C0:
 80146c0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80146c2:	46ce      	mov	lr, r9
 80146c4:	4647      	mov	r7, r8
 80146c6:	0004      	movs	r4, r0
 80146c8:	b580      	push	{r7, lr}
 80146ca:	221e      	movs	r2, #30
 80146cc:	5ea3      	ldrsh	r3, [r4, r2]
 80146ce:	6800      	ldr	r0, [r0, #0]
 80146d0:	4699      	mov	r9, r3
 80146d2:	2b00      	cmp	r3, #0
 80146d4:	dd38      	ble.n	8014748 <fn_080146C0+0x88>
 80146d6:	22e0      	movs	r2, #224	@ 0xe0
 80146d8:	4b1e      	ldr	r3, [pc, #120]	@ (8014754 <fn_080146C0+0x94>)
 80146da:	681b      	ldr	r3, [r3, #0]
 80146dc:	0112      	lsls	r2, r2, #4
 80146de:	589a      	ldr	r2, [r3, r2]
 80146e0:	4690      	mov	r8, r2
 80146e2:	69a2      	ldr	r2, [r4, #24]
 80146e4:	4694      	mov	ip, r2
 80146e6:	22df      	movs	r2, #223	@ 0xdf
 80146e8:	0112      	lsls	r2, r2, #4
 80146ea:	589e      	ldr	r6, [r3, r2]
 80146ec:	4a1a      	ldr	r2, [pc, #104]	@ (8014758 <fn_080146C0+0x98>)
 80146ee:	2100      	movs	r1, #0
 80146f0:	589d      	ldr	r5, [r3, r2]
 80146f2:	e008      	b.n	8014706 <fn_080146C0+0x46>
 80146f4:	2f00      	cmp	r7, #0
 80146f6:	d003      	beq.n	8014700 <fn_080146C0+0x40>
 80146f8:	683b      	ldr	r3, [r7, #0]
 80146fa:	4298      	cmp	r0, r3
 80146fc:	dd00      	ble.n	8014700 <fn_080146C0+0x40>
 80146fe:	0018      	movs	r0, r3
 8014700:	3101      	adds	r1, #1
 8014702:	4589      	cmp	r9, r1
 8014704:	dd20      	ble.n	8014748 <fn_080146C0+0x88>
 8014706:	4662      	mov	r2, ip
 8014708:	004b      	lsls	r3, r1, #1
 801470a:	5ad2      	ldrh	r2, [r2, r3]
 801470c:	0152      	lsls	r2, r2, #5
 801470e:	4442      	add	r2, r8
 8014710:	8a97      	ldrh	r7, [r2, #20]
 8014712:	007b      	lsls	r3, r7, #1
 8014714:	19db      	adds	r3, r3, r7
 8014716:	009b      	lsls	r3, r3, #2
 8014718:	18eb      	adds	r3, r5, r3
 801471a:	895f      	ldrh	r7, [r3, #10]
 801471c:	00bb      	lsls	r3, r7, #2
 801471e:	19db      	adds	r3, r3, r7
 8014720:	00db      	lsls	r3, r3, #3
 8014722:	18f7      	adds	r7, r6, r3
 8014724:	42bc      	cmp	r4, r7
 8014726:	d1e5      	bne.n	80146f4 <fn_080146C0+0x34>
 8014728:	8ad7      	ldrh	r7, [r2, #22]
 801472a:	4a0c      	ldr	r2, [pc, #48]	@ (801475c <fn_080146C0+0x9c>)
 801472c:	4297      	cmp	r7, r2
 801472e:	d0e7      	beq.n	8014700 <fn_080146C0+0x40>
 8014730:	007a      	lsls	r2, r7, #1
 8014732:	19d2      	adds	r2, r2, r7
 8014734:	0092      	lsls	r2, r2, #2
 8014736:	18aa      	adds	r2, r5, r2
 8014738:	8957      	ldrh	r7, [r2, #10]
 801473a:	00ba      	lsls	r2, r7, #2
 801473c:	19d2      	adds	r2, r2, r7
 801473e:	00d2      	lsls	r2, r2, #3
 8014740:	4293      	cmp	r3, r2
 8014742:	d0dd      	beq.n	8014700 <fn_080146C0+0x40>
 8014744:	18b7      	adds	r7, r6, r2
 8014746:	e7d5      	b.n	80146f4 <fn_080146C0+0x34>
 8014748:	bcc0      	pop	{r6, r7}
 801474a:	46b9      	mov	r9, r7
 801474c:	46b0      	mov	r8, r6
 801474e:	bcf0      	pop	{r4, r5, r6, r7}
 8014750:	bc02      	pop	{r1}
 8014752:	4708      	bx	r1
 8014754:	030064c4 	.word	0x030064c4
 8014758:	00000e0c 	.word	0x00000e0c
 801475c:	0000ffff 	.word	0x0000ffff
