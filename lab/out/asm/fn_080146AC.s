fn_080146AC:
 80146ac:	b5f0      	push	{r4, r5, r6, r7, lr}
 80146ae:	46ce      	mov	lr, r9
 80146b0:	4647      	mov	r7, r8
 80146b2:	b580      	push	{r7, lr}
 80146b4:	221e      	movs	r2, #30
 80146b6:	5e83      	ldrsh	r3, [r0, r2]
 80146b8:	0004      	movs	r4, r0
 80146ba:	4699      	mov	r9, r3
 80146bc:	2b00      	cmp	r3, #0
 80146be:	dd3a      	ble.n	8014736 <fn_080146AC+0x8a>
 80146c0:	22e0      	movs	r2, #224	@ 0xe0
 80146c2:	4b21      	ldr	r3, [pc, #132]	@ (8014748 <fn_080146AC+0x9c>)
 80146c4:	681b      	ldr	r3, [r3, #0]
 80146c6:	0112      	lsls	r2, r2, #4
 80146c8:	589a      	ldr	r2, [r3, r2]
 80146ca:	4690      	mov	r8, r2
 80146cc:	6982      	ldr	r2, [r0, #24]
 80146ce:	4694      	mov	ip, r2
 80146d0:	22df      	movs	r2, #223	@ 0xdf
 80146d2:	2083      	movs	r0, #131	@ 0x83
 80146d4:	0112      	lsls	r2, r2, #4
 80146d6:	589e      	ldr	r6, [r3, r2]
 80146d8:	4a1c      	ldr	r2, [pc, #112]	@ (801474c <fn_080146AC+0xa0>)
 80146da:	2100      	movs	r1, #0
 80146dc:	589d      	ldr	r5, [r3, r2]
 80146de:	0600      	lsls	r0, r0, #24
 80146e0:	e008      	b.n	80146f4 <fn_080146AC+0x48>
 80146e2:	2f00      	cmp	r7, #0
 80146e4:	d003      	beq.n	80146ee <fn_080146AC+0x42>
 80146e6:	683b      	ldr	r3, [r7, #0]
 80146e8:	4298      	cmp	r0, r3
 80146ea:	da00      	bge.n	80146ee <fn_080146AC+0x42>
 80146ec:	0018      	movs	r0, r3
 80146ee:	3101      	adds	r1, #1
 80146f0:	4589      	cmp	r9, r1
 80146f2:	dd22      	ble.n	801473a <fn_080146AC+0x8e>
 80146f4:	4662      	mov	r2, ip
 80146f6:	004b      	lsls	r3, r1, #1
 80146f8:	5ad2      	ldrh	r2, [r2, r3]
 80146fa:	0152      	lsls	r2, r2, #5
 80146fc:	4442      	add	r2, r8
 80146fe:	8a97      	ldrh	r7, [r2, #20]
 8014700:	007b      	lsls	r3, r7, #1
 8014702:	19db      	adds	r3, r3, r7
 8014704:	009b      	lsls	r3, r3, #2
 8014706:	18eb      	adds	r3, r5, r3
 8014708:	895f      	ldrh	r7, [r3, #10]
 801470a:	00bb      	lsls	r3, r7, #2
 801470c:	19db      	adds	r3, r3, r7
 801470e:	00db      	lsls	r3, r3, #3
 8014710:	18f7      	adds	r7, r6, r3
 8014712:	42bc      	cmp	r4, r7
 8014714:	d1e5      	bne.n	80146e2 <fn_080146AC+0x36>
 8014716:	8ad7      	ldrh	r7, [r2, #22]
 8014718:	4a0d      	ldr	r2, [pc, #52]	@ (8014750 <fn_080146AC+0xa4>)
 801471a:	4297      	cmp	r7, r2
 801471c:	d0e7      	beq.n	80146ee <fn_080146AC+0x42>
 801471e:	007a      	lsls	r2, r7, #1
 8014720:	19d2      	adds	r2, r2, r7
 8014722:	0092      	lsls	r2, r2, #2
 8014724:	18aa      	adds	r2, r5, r2
 8014726:	8957      	ldrh	r7, [r2, #10]
 8014728:	00ba      	lsls	r2, r7, #2
 801472a:	19d2      	adds	r2, r2, r7
 801472c:	00d2      	lsls	r2, r2, #3
 801472e:	4293      	cmp	r3, r2
 8014730:	d0dd      	beq.n	80146ee <fn_080146AC+0x42>
 8014732:	18b7      	adds	r7, r6, r2
 8014734:	e7d5      	b.n	80146e2 <fn_080146AC+0x36>
 8014736:	2083      	movs	r0, #131	@ 0x83
 8014738:	0600      	lsls	r0, r0, #24
 801473a:	bcc0      	pop	{r6, r7}
 801473c:	46b9      	mov	r9, r7
 801473e:	46b0      	mov	r8, r6
 8014740:	bcf0      	pop	{r4, r5, r6, r7}
 8014742:	bc02      	pop	{r1}
 8014744:	4708      	bx	r1
 8014746:	46c0      	nop			@ (mov r8, r8)
 8014748:	030064c4 	.word	0x030064c4	@ data_030064C4
 801474c:	00000e0c 	.word	0x00000e0c
 8014750:	0000ffff 	.word	0x0000ffff
