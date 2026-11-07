fn_0800E67C:
 800e67c:	b570      	push	{r4, r5, r6, lr}
 800e67e:	7903      	ldrb	r3, [r0, #4]
 800e680:	0004      	movs	r4, r0
 800e682:	2b00      	cmp	r3, #0
 800e684:	d040      	beq.n	800e708 <fn_0800E67C+0x8c>
 800e686:	68a5      	ldr	r5, [r4, #8]
 800e688:	8b2b      	ldrh	r3, [r5, #24]
 800e68a:	075b      	lsls	r3, r3, #29
 800e68c:	d40c      	bmi.n	800e6a8 <fn_0800E67C+0x2c>
 800e68e:	4e20      	ldr	r6, [pc, #128]	@ (800e710 <fn_0800E67C+0x94>)
 800e690:	4b20      	ldr	r3, [pc, #128]	@ (800e714 <fn_0800E67C+0x98>)
 800e692:	6832      	ldr	r2, [r6, #0]
 800e694:	58d3      	ldr	r3, [r2, r3]
 800e696:	330c      	adds	r3, #12
 800e698:	002a      	movs	r2, r5
 800e69a:	cb03      	ldmia	r3!, {r0, r1}
 800e69c:	f001 fbbe 	bl	800fe1c <fn_0800FE1C>
 800e6a0:	2800      	cmp	r0, #0
 800e6a2:	d029      	beq.n	800e6f8 <fn_0800E67C+0x7c>
 800e6a4:	2001      	movs	r0, #1
 800e6a6:	e020      	b.n	800e6ea <fn_0800E67C+0x6e>
 800e6a8:	0028      	movs	r0, r5
 800e6aa:	f001 fcc1 	bl	8010030 <fn_08010030>
 800e6ae:	4b18      	ldr	r3, [pc, #96]	@ (800e710 <fn_0800E67C+0x94>)
 800e6b0:	4a18      	ldr	r2, [pc, #96]	@ (800e714 <fn_0800E67C+0x98>)
 800e6b2:	681b      	ldr	r3, [r3, #0]
 800e6b4:	4818      	ldr	r0, [pc, #96]	@ (800e718 <fn_0800E67C+0x9c>)
 800e6b6:	5899      	ldr	r1, [r3, r2]
 800e6b8:	5818      	ldr	r0, [r3, r0]
 800e6ba:	6b8a      	ldr	r2, [r1, #56]	@ 0x38
 800e6bc:	4290      	cmp	r0, r2
 800e6be:	db0d      	blt.n	800e6dc <fn_0800E67C+0x60>
 800e6c0:	6948      	ldr	r0, [r1, #20]
 800e6c2:	4916      	ldr	r1, [pc, #88]	@ (800e71c <fn_0800E67C+0xa0>)
 800e6c4:	5859      	ldr	r1, [r3, r1]
 800e6c6:	1a09      	subs	r1, r1, r0
 800e6c8:	428a      	cmp	r2, r1
 800e6ca:	dc07      	bgt.n	800e6dc <fn_0800E67C+0x60>
 800e6cc:	2293      	movs	r2, #147	@ 0x93
 800e6ce:	21c0      	movs	r1, #192	@ 0xc0
 800e6d0:	0112      	lsls	r2, r2, #4
 800e6d2:	589a      	ldr	r2, [r3, r2]
 800e6d4:	0349      	lsls	r1, r1, #13
 800e6d6:	1a12      	subs	r2, r2, r0
 800e6d8:	428a      	cmp	r2, r1
 800e6da:	dde3      	ble.n	800e6a4 <fn_0800E67C+0x28>
 800e6dc:	228e      	movs	r2, #142	@ 0x8e
 800e6de:	0112      	lsls	r2, r2, #4
 800e6e0:	6821      	ldr	r1, [r4, #0]
 800e6e2:	5898      	ldr	r0, [r3, r2]
 800e6e4:	4281      	cmp	r1, r0
 800e6e6:	db03      	blt.n	800e6f0 <fn_0800E67C+0x74>
 800e6e8:	2000      	movs	r0, #0
 800e6ea:	bc70      	pop	{r4, r5, r6}
 800e6ec:	bc02      	pop	{r1}
 800e6ee:	4708      	bx	r1
 800e6f0:	5099      	str	r1, [r3, r2]
 800e6f2:	4a0b      	ldr	r2, [pc, #44]	@ (800e720 <fn_0800E67C+0xa4>)
 800e6f4:	509d      	str	r5, [r3, r2]
 800e6f6:	e7f7      	b.n	800e6e8 <fn_0800E67C+0x6c>
 800e6f8:	228e      	movs	r2, #142	@ 0x8e
 800e6fa:	6833      	ldr	r3, [r6, #0]
 800e6fc:	0112      	lsls	r2, r2, #4
 800e6fe:	6821      	ldr	r1, [r4, #0]
 800e700:	5898      	ldr	r0, [r3, r2]
 800e702:	4281      	cmp	r1, r0
 800e704:	daf0      	bge.n	800e6e8 <fn_0800E67C+0x6c>
 800e706:	e7f3      	b.n	800e6f0 <fn_0800E67C+0x74>
 800e708:	4806      	ldr	r0, [pc, #24]	@ (800e724 <fn_0800E67C+0xa8>)
 800e70a:	f7f1 ff4d 	bl	80005a8 <fn_080005A8>
 800e70e:	e7ba      	b.n	800e686 <fn_0800E67C+0xa>
 800e710:	030064c4 	.word	0x030064c4	@ data_030064C4
 800e714:	000008e8 	.word	0x000008e8
 800e718:	00000934 	.word	0x00000934
 800e71c:	0000092c 	.word	0x0000092c
 800e720:	000008e4 	.word	0x000008e4
 800e724:	08149f04 	.word	0x08149f04
