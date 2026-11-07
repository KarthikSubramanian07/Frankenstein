fn_0801C65C:
 801c65c:	4b29      	ldr	r3, [pc, #164]	@ (801c704 <fn_0801C65C+0xa8>)
 801c65e:	681a      	ldr	r2, [r3, #0]
 801c660:	4b29      	ldr	r3, [pc, #164]	@ (801c708 <fn_0801C65C+0xac>)
 801c662:	58d1      	ldr	r1, [r2, r3]
 801c664:	2394      	movs	r3, #148	@ 0x94
 801c666:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c668:	5cd3      	ldrb	r3, [r2, r3]
 801c66a:	6888      	ldr	r0, [r1, #8]
 801c66c:	b087      	sub	sp, #28
 801c66e:	2b02      	cmp	r3, #2
 801c670:	d03f      	beq.n	801c6f2 <fn_0801C65C+0x96>
 801c672:	ad03      	add	r5, sp, #12
 801c674:	680b      	ldr	r3, [r1, #0]
 801c676:	4a25      	ldr	r2, [pc, #148]	@ (801c70c <fn_0801C65C+0xb0>)
 801c678:	9000      	str	r0, [sp, #0]
 801c67a:	2109      	movs	r1, #9
 801c67c:	0028      	movs	r0, r5
 801c67e:	f7e8 feeb 	bl	8005458 <fn_08005458>
 801c682:	0028      	movs	r0, r5
 801c684:	f000 fefc 	bl	801d480 <fn_0801D480>
 801c688:	f7fc fdca 	bl	8019220 <fn_08019220>
 801c68c:	24a0      	movs	r4, #160	@ 0xa0
 801c68e:	0006      	movs	r6, r0
 801c690:	0028      	movs	r0, r5
 801c692:	f000 fef5 	bl	801d480 <fn_0801D480>
 801c696:	0064      	lsls	r4, r4, #1
 801c698:	1ba1      	subs	r1, r4, r6
 801c69a:	0fca      	lsrs	r2, r1, #31
 801c69c:	1852      	adds	r2, r2, r1
 801c69e:	0003      	movs	r3, r0
 801c6a0:	2102      	movs	r1, #2
 801c6a2:	1050      	asrs	r0, r2, #1
 801c6a4:	2200      	movs	r2, #0
 801c6a6:	f7ff fd43 	bl	801c130 <fn_0801C130>
 801c6aa:	0028      	movs	r0, r5
 801c6ac:	f000 fee8 	bl	801d480 <fn_0801D480>
 801c6b0:	f7fc fdbe 	bl	8019230 <fn_08019230>
 801c6b4:	4e16      	ldr	r6, [pc, #88]	@ (801c710 <fn_0801C65C+0xb4>)
 801c6b6:	0005      	movs	r5, r0
 801c6b8:	0030      	movs	r0, r6
 801c6ba:	f000 fee1 	bl	801d480 <fn_0801D480>
 801c6be:	f7fc fdaf 	bl	8019220 <fn_08019220>
 801c6c2:	0007      	movs	r7, r0
 801c6c4:	0030      	movs	r0, r6
 801c6c6:	f000 fedb 	bl	801d480 <fn_0801D480>
 801c6ca:	2103      	movs	r1, #3
 801c6cc:	00aa      	lsls	r2, r5, #2
 801c6ce:	1952      	adds	r2, r2, r5
 801c6d0:	0003      	movs	r3, r0
 801c6d2:	17d0      	asrs	r0, r2, #31
 801c6d4:	1be4      	subs	r4, r4, r7
 801c6d6:	4001      	ands	r1, r0
 801c6d8:	1889      	adds	r1, r1, r2
 801c6da:	0fe2      	lsrs	r2, r4, #31
 801c6dc:	1912      	adds	r2, r2, r4
 801c6de:	1089      	asrs	r1, r1, #2
 801c6e0:	1050      	asrs	r0, r2, #1
 801c6e2:	3102      	adds	r1, #2
 801c6e4:	2200      	movs	r2, #0
 801c6e6:	f7ff fd23 	bl	801c130 <fn_0801C130>
 801c6ea:	b007      	add	sp, #28
 801c6ec:	bcf0      	pop	{r4, r5, r6, r7}
 801c6ee:	bc01      	pop	{r0}
 801c6f0:	4700      	bx	r0
 801c6f2:	ad03      	add	r5, sp, #12
 801c6f4:	0003      	movs	r3, r0
 801c6f6:	2109      	movs	r1, #9
 801c6f8:	0028      	movs	r0, r5
 801c6fa:	4a06      	ldr	r2, [pc, #24]	@ (801c714 <fn_0801C65C+0xb8>)
 801c6fc:	f7e8 feac 	bl	8005458 <fn_08005458>
 801c700:	e7bf      	b.n	801c682 <fn_0801C65C+0x26>
 801c702:	46c0      	nop			@ (mov r8, r8)
 801c704:	030064c4 	.word	0x030064c4	@ data_030064C4
 801c708:	00005a40 	.word	0x00005a40
 801c70c:	0814a92c 	.word	0x0814a92c
 801c710:	0814781c 	.word	0x0814781c	@ data_0814781C
 801c714:	0814a920 	.word	0x0814a920
