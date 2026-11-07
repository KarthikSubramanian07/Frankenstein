fn_0801C718:
 801c718:	4b29      	ldr	r3, [pc, #164]	@ (801c7c0 <fn_0801C718+0xa8>)
 801c71a:	681a      	ldr	r2, [r3, #0]
 801c71c:	4b29      	ldr	r3, [pc, #164]	@ (801c7c4 <fn_0801C718+0xac>)
 801c71e:	58d1      	ldr	r1, [r2, r3]
 801c720:	2394      	movs	r3, #148	@ 0x94
 801c722:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c724:	5cd3      	ldrb	r3, [r2, r3]
 801c726:	68c8      	ldr	r0, [r1, #12]
 801c728:	b087      	sub	sp, #28
 801c72a:	2b02      	cmp	r3, #2
 801c72c:	d03f      	beq.n	801c7ae <fn_0801C718+0x96>
 801c72e:	ad03      	add	r5, sp, #12
 801c730:	680b      	ldr	r3, [r1, #0]
 801c732:	4a25      	ldr	r2, [pc, #148]	@ (801c7c8 <fn_0801C718+0xb0>)
 801c734:	9000      	str	r0, [sp, #0]
 801c736:	2109      	movs	r1, #9
 801c738:	0028      	movs	r0, r5
 801c73a:	f7e8 fe8d 	bl	8005458 <fn_08005458>
 801c73e:	4c23      	ldr	r4, [pc, #140]	@ (801c7cc <fn_0801C718+0xb4>)
 801c740:	0020      	movs	r0, r4
 801c742:	f000 fe9d 	bl	801d480 <fn_0801D480>
 801c746:	f7fc fd6b 	bl	8019220 <fn_08019220>
 801c74a:	0006      	movs	r6, r0
 801c74c:	0020      	movs	r0, r4
 801c74e:	24a0      	movs	r4, #160	@ 0xa0
 801c750:	f000 fe96 	bl	801d480 <fn_0801D480>
 801c754:	0064      	lsls	r4, r4, #1
 801c756:	1ba1      	subs	r1, r4, r6
 801c758:	0fca      	lsrs	r2, r1, #31
 801c75a:	1852      	adds	r2, r2, r1
 801c75c:	0003      	movs	r3, r0
 801c75e:	2102      	movs	r1, #2
 801c760:	1050      	asrs	r0, r2, #1
 801c762:	2200      	movs	r2, #0
 801c764:	f7ff fce4 	bl	801c130 <fn_0801C130>
 801c768:	0028      	movs	r0, r5
 801c76a:	f000 fe89 	bl	801d480 <fn_0801D480>
 801c76e:	f7fc fd5f 	bl	8019230 <fn_08019230>
 801c772:	0006      	movs	r6, r0
 801c774:	0028      	movs	r0, r5
 801c776:	f000 fe83 	bl	801d480 <fn_0801D480>
 801c77a:	f7fc fd51 	bl	8019220 <fn_08019220>
 801c77e:	0007      	movs	r7, r0
 801c780:	0028      	movs	r0, r5
 801c782:	f000 fe7d 	bl	801d480 <fn_0801D480>
 801c786:	2103      	movs	r1, #3
 801c788:	00b2      	lsls	r2, r6, #2
 801c78a:	1992      	adds	r2, r2, r6
 801c78c:	0003      	movs	r3, r0
 801c78e:	17d0      	asrs	r0, r2, #31
 801c790:	1be4      	subs	r4, r4, r7
 801c792:	4001      	ands	r1, r0
 801c794:	1889      	adds	r1, r1, r2
 801c796:	0fe2      	lsrs	r2, r4, #31
 801c798:	1912      	adds	r2, r2, r4
 801c79a:	1089      	asrs	r1, r1, #2
 801c79c:	1050      	asrs	r0, r2, #1
 801c79e:	3102      	adds	r1, #2
 801c7a0:	2200      	movs	r2, #0
 801c7a2:	f7ff fcc5 	bl	801c130 <fn_0801C130>
 801c7a6:	b007      	add	sp, #28
 801c7a8:	bcf0      	pop	{r4, r5, r6, r7}
 801c7aa:	bc01      	pop	{r0}
 801c7ac:	4700      	bx	r0
 801c7ae:	ad03      	add	r5, sp, #12
 801c7b0:	0003      	movs	r3, r0
 801c7b2:	2109      	movs	r1, #9
 801c7b4:	0028      	movs	r0, r5
 801c7b6:	4a06      	ldr	r2, [pc, #24]	@ (801c7d0 <fn_0801C718+0xb8>)
 801c7b8:	f7e8 fe4e 	bl	8005458 <fn_08005458>
 801c7bc:	e7bf      	b.n	801c73e <fn_0801C718+0x26>
 801c7be:	46c0      	nop			@ (mov r8, r8)
 801c7c0:	030064c4 	.word	0x030064c4
 801c7c4:	00005a40 	.word	0x00005a40
 801c7c8:	0814a92c 	.word	0x0814a92c
 801c7cc:	08147820 	.word	0x08147820
 801c7d0:	0814a920 	.word	0x0814a920
