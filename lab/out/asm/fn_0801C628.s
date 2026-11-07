fn_0801C628:
 801c628:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c62a:	46d6      	mov	lr, sl
 801c62c:	4646      	mov	r6, r8
 801c62e:	464f      	mov	r7, r9
 801c630:	4680      	mov	r8, r0
 801c632:	b5c0      	push	{r6, r7, lr}
 801c634:	4820      	ldr	r0, [pc, #128]	@ (801c6b8 <fn_0801C628+0x90>)
 801c636:	000c      	movs	r4, r1
 801c638:	f000 ff7a 	bl	801d530 <fn_0801D530>
 801c63c:	0003      	movs	r3, r0
 801c63e:	2087      	movs	r0, #135	@ 0x87
 801c640:	2200      	movs	r2, #0
 801c642:	0040      	lsls	r0, r0, #1
 801c644:	4641      	mov	r1, r8
 801c646:	f7ff fdcb 	bl	801c1e0 <fn_0801C1E0>
 801c64a:	2600      	movs	r6, #0
 801c64c:	0020      	movs	r0, r4
 801c64e:	210a      	movs	r1, #10
 801c650:	f008 fff6 	bl	8025640 <fn_08025640>
 801c654:	0035      	movs	r5, r6
 801c656:	3601      	adds	r6, #1
 801c658:	2800      	cmp	r0, #0
 801c65a:	d1f8      	bne.n	801c64e <fn_0801C628+0x26>
 801c65c:	4b17      	ldr	r3, [pc, #92]	@ (801c6bc <fn_0801C628+0x94>)
 801c65e:	429c      	cmp	r4, r3
 801c660:	d023      	beq.n	801c6aa <fn_0801C628+0x82>
 801c662:	2687      	movs	r6, #135	@ 0x87
 801c664:	4b16      	ldr	r3, [pc, #88]	@ (801c6c0 <fn_0801C628+0x98>)
 801c666:	681f      	ldr	r7, [r3, #0]
 801c668:	4699      	mov	r9, r3
 801c66a:	4b16      	ldr	r3, [pc, #88]	@ (801c6c4 <fn_0801C628+0x9c>)
 801c66c:	58fb      	ldr	r3, [r7, r3]
 801c66e:	2200      	movs	r2, #0
 801c670:	5e9b      	ldrsh	r3, [r3, r2]
 801c672:	0076      	lsls	r6, r6, #1
 801c674:	469a      	mov	sl, r3
 801c676:	e007      	b.n	801c688 <fn_0801C628+0x60>
 801c678:	0020      	movs	r0, r4
 801c67a:	210a      	movs	r1, #10
 801c67c:	f008 ffe0 	bl	8025640 <fn_08025640>
 801c680:	464b      	mov	r3, r9
 801c682:	0004      	movs	r4, r0
 801c684:	681f      	ldr	r7, [r3, #0]
 801c686:	3d01      	subs	r5, #1
 801c688:	4653      	mov	r3, sl
 801c68a:	210a      	movs	r1, #10
 801c68c:	0020      	movs	r0, r4
 801c68e:	1af6      	subs	r6, r6, r3
 801c690:	f008 ff82 	bl	8025598 <fn_08025598>
 801c694:	4b0c      	ldr	r3, [pc, #48]	@ (801c6c8 <fn_0801C628+0xa0>)
 801c696:	18cb      	adds	r3, r1, r3
 801c698:	009b      	lsls	r3, r3, #2
 801c69a:	2200      	movs	r2, #0
 801c69c:	4641      	mov	r1, r8
 801c69e:	0030      	movs	r0, r6
 801c6a0:	59db      	ldr	r3, [r3, r7]
 801c6a2:	f7ff fcef 	bl	801c084 <fn_0801C084>
 801c6a6:	2d00      	cmp	r5, #0
 801c6a8:	d1e6      	bne.n	801c678 <fn_0801C628+0x50>
 801c6aa:	bce0      	pop	{r5, r6, r7}
 801c6ac:	46ba      	mov	sl, r7
 801c6ae:	46b1      	mov	r9, r6
 801c6b0:	46a8      	mov	r8, r5
 801c6b2:	bcf0      	pop	{r4, r5, r6, r7}
 801c6b4:	bc01      	pop	{r0}
 801c6b6:	4700      	bx	r0
 801c6b8:	081478e8 	.word	0x081478e8
 801c6bc:	000007ca 	.word	0x000007ca
 801c6c0:	030064c4 	.word	0x030064c4
 801c6c4:	00005a60 	.word	0x00005a60
 801c6c8:	00001698 	.word	0x00001698
