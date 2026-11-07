fn_0801C70C:
 801c70c:	4b29      	ldr	r3, [pc, #164]	@ (801c7b4 <fn_0801C70C+0xa8>)
 801c70e:	681a      	ldr	r2, [r3, #0]
 801c710:	4b29      	ldr	r3, [pc, #164]	@ (801c7b8 <fn_0801C70C+0xac>)
 801c712:	58d1      	ldr	r1, [r2, r3]
 801c714:	2394      	movs	r3, #148	@ 0x94
 801c716:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c718:	5cd3      	ldrb	r3, [r2, r3]
 801c71a:	6888      	ldr	r0, [r1, #8]
 801c71c:	b087      	sub	sp, #28
 801c71e:	2b02      	cmp	r3, #2
 801c720:	d03f      	beq.n	801c7a2 <fn_0801C70C+0x96>
 801c722:	ad03      	add	r5, sp, #12
 801c724:	680b      	ldr	r3, [r1, #0]
 801c726:	4a25      	ldr	r2, [pc, #148]	@ (801c7bc <fn_0801C70C+0xb0>)
 801c728:	9000      	str	r0, [sp, #0]
 801c72a:	2109      	movs	r1, #9
 801c72c:	0028      	movs	r0, r5
 801c72e:	f7e8 fe93 	bl	8005458 <fn_08005458>
 801c732:	0028      	movs	r0, r5
 801c734:	f000 fefc 	bl	801d530 <fn_0801D530>
 801c738:	f7fc fdcc 	bl	80192d4 <fn_080192D4>
 801c73c:	24a0      	movs	r4, #160	@ 0xa0
 801c73e:	0006      	movs	r6, r0
 801c740:	0028      	movs	r0, r5
 801c742:	f000 fef5 	bl	801d530 <fn_0801D530>
 801c746:	0064      	lsls	r4, r4, #1
 801c748:	1ba1      	subs	r1, r4, r6
 801c74a:	0fca      	lsrs	r2, r1, #31
 801c74c:	1852      	adds	r2, r2, r1
 801c74e:	0003      	movs	r3, r0
 801c750:	2102      	movs	r1, #2
 801c752:	1050      	asrs	r0, r2, #1
 801c754:	2200      	movs	r2, #0
 801c756:	f7ff fd43 	bl	801c1e0 <fn_0801C1E0>
 801c75a:	0028      	movs	r0, r5
 801c75c:	f000 fee8 	bl	801d530 <fn_0801D530>
 801c760:	f7fc fdc0 	bl	80192e4 <fn_080192E4>
 801c764:	4e16      	ldr	r6, [pc, #88]	@ (801c7c0 <fn_0801C70C+0xb4>)
 801c766:	0005      	movs	r5, r0
 801c768:	0030      	movs	r0, r6
 801c76a:	f000 fee1 	bl	801d530 <fn_0801D530>
 801c76e:	f7fc fdb1 	bl	80192d4 <fn_080192D4>
 801c772:	0007      	movs	r7, r0
 801c774:	0030      	movs	r0, r6
 801c776:	f000 fedb 	bl	801d530 <fn_0801D530>
 801c77a:	2103      	movs	r1, #3
 801c77c:	00aa      	lsls	r2, r5, #2
 801c77e:	1952      	adds	r2, r2, r5
 801c780:	0003      	movs	r3, r0
 801c782:	17d0      	asrs	r0, r2, #31
 801c784:	1be4      	subs	r4, r4, r7
 801c786:	4001      	ands	r1, r0
 801c788:	1889      	adds	r1, r1, r2
 801c78a:	0fe2      	lsrs	r2, r4, #31
 801c78c:	1912      	adds	r2, r2, r4
 801c78e:	1089      	asrs	r1, r1, #2
 801c790:	1050      	asrs	r0, r2, #1
 801c792:	3102      	adds	r1, #2
 801c794:	2200      	movs	r2, #0
 801c796:	f7ff fd23 	bl	801c1e0 <fn_0801C1E0>
 801c79a:	b007      	add	sp, #28
 801c79c:	bcf0      	pop	{r4, r5, r6, r7}
 801c79e:	bc01      	pop	{r0}
 801c7a0:	4700      	bx	r0
 801c7a2:	ad03      	add	r5, sp, #12
 801c7a4:	0003      	movs	r3, r0
 801c7a6:	2109      	movs	r1, #9
 801c7a8:	0028      	movs	r0, r5
 801c7aa:	4a06      	ldr	r2, [pc, #24]	@ (801c7c4 <fn_0801C70C+0xb8>)
 801c7ac:	f7e8 fe54 	bl	8005458 <fn_08005458>
 801c7b0:	e7bf      	b.n	801c732 <fn_0801C70C+0x26>
 801c7b2:	46c0      	nop			@ (mov r8, r8)
 801c7b4:	030064c4 	.word	0x030064c4
 801c7b8:	00005a40 	.word	0x00005a40
 801c7bc:	0814aa00 	.word	0x0814aa00
 801c7c0:	081478f0 	.word	0x081478f0
 801c7c4:	0814a9f4 	.word	0x0814a9f4
