fn_0801C578:
 801c578:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c57a:	46d6      	mov	lr, sl
 801c57c:	4646      	mov	r6, r8
 801c57e:	464f      	mov	r7, r9
 801c580:	4680      	mov	r8, r0
 801c582:	b5c0      	push	{r6, r7, lr}
 801c584:	4820      	ldr	r0, [pc, #128]	@ (801c608 <fn_0801C578+0x90>)
 801c586:	000c      	movs	r4, r1
 801c588:	f000 ff7a 	bl	801d480 <fn_0801D480>
 801c58c:	0003      	movs	r3, r0
 801c58e:	2087      	movs	r0, #135	@ 0x87
 801c590:	2200      	movs	r2, #0
 801c592:	0040      	lsls	r0, r0, #1
 801c594:	4641      	mov	r1, r8
 801c596:	f7ff fdcb 	bl	801c130 <fn_0801C130>
 801c59a:	2600      	movs	r6, #0
 801c59c:	0020      	movs	r0, r4
 801c59e:	210a      	movs	r1, #10
 801c5a0:	f008 fff6 	bl	8025590 <fn_08025590>
 801c5a4:	0035      	movs	r5, r6
 801c5a6:	3601      	adds	r6, #1
 801c5a8:	2800      	cmp	r0, #0
 801c5aa:	d1f8      	bne.n	801c59e <fn_0801C578+0x26>
 801c5ac:	4b17      	ldr	r3, [pc, #92]	@ (801c60c <fn_0801C578+0x94>)
 801c5ae:	429c      	cmp	r4, r3
 801c5b0:	d023      	beq.n	801c5fa <fn_0801C578+0x82>
 801c5b2:	2687      	movs	r6, #135	@ 0x87
 801c5b4:	4b16      	ldr	r3, [pc, #88]	@ (801c610 <fn_0801C578+0x98>)
 801c5b6:	681f      	ldr	r7, [r3, #0]
 801c5b8:	4699      	mov	r9, r3
 801c5ba:	4b16      	ldr	r3, [pc, #88]	@ (801c614 <fn_0801C578+0x9c>)
 801c5bc:	58fb      	ldr	r3, [r7, r3]
 801c5be:	2200      	movs	r2, #0
 801c5c0:	5e9b      	ldrsh	r3, [r3, r2]
 801c5c2:	0076      	lsls	r6, r6, #1
 801c5c4:	469a      	mov	sl, r3
 801c5c6:	e007      	b.n	801c5d8 <fn_0801C578+0x60>
 801c5c8:	0020      	movs	r0, r4
 801c5ca:	210a      	movs	r1, #10
 801c5cc:	f008 ffe0 	bl	8025590 <fn_08025590>
 801c5d0:	464b      	mov	r3, r9
 801c5d2:	0004      	movs	r4, r0
 801c5d4:	681f      	ldr	r7, [r3, #0]
 801c5d6:	3d01      	subs	r5, #1
 801c5d8:	4653      	mov	r3, sl
 801c5da:	210a      	movs	r1, #10
 801c5dc:	0020      	movs	r0, r4
 801c5de:	1af6      	subs	r6, r6, r3
 801c5e0:	f008 ff82 	bl	80254e8 <fn_080254E8>
 801c5e4:	4b0c      	ldr	r3, [pc, #48]	@ (801c618 <fn_0801C578+0xa0>)
 801c5e6:	18cb      	adds	r3, r1, r3
 801c5e8:	009b      	lsls	r3, r3, #2
 801c5ea:	2200      	movs	r2, #0
 801c5ec:	4641      	mov	r1, r8
 801c5ee:	0030      	movs	r0, r6
 801c5f0:	59db      	ldr	r3, [r3, r7]
 801c5f2:	f7ff fcef 	bl	801bfd4 <fn_0801BFD4>
 801c5f6:	2d00      	cmp	r5, #0
 801c5f8:	d1e6      	bne.n	801c5c8 <fn_0801C578+0x50>
 801c5fa:	bce0      	pop	{r5, r6, r7}
 801c5fc:	46ba      	mov	sl, r7
 801c5fe:	46b1      	mov	r9, r6
 801c600:	46a8      	mov	r8, r5
 801c602:	bcf0      	pop	{r4, r5, r6, r7}
 801c604:	bc01      	pop	{r0}
 801c606:	4700      	bx	r0
 801c608:	08147814 	.word	0x08147814	@ data_08147814
 801c60c:	000007ca 	.word	0x000007ca
 801c610:	030064c4 	.word	0x030064c4	@ data_030064C4
 801c614:	00005a60 	.word	0x00005a60
 801c618:	00001698 	.word	0x00001698
