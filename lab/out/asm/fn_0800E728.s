fn_0800E728:
 800e728:	b570      	push	{r4, r5, r6, lr}
 800e72a:	4c1d      	ldr	r4, [pc, #116]	@ (800e7a0 <fn_0800E728+0x78>)
 800e72c:	0005      	movs	r5, r0
 800e72e:	6880      	ldr	r0, [r0, #8]
 800e730:	6822      	ldr	r2, [r4, #0]
 800e732:	4b1c      	ldr	r3, [pc, #112]	@ (800e7a4 <fn_0800E728+0x7c>)
 800e734:	8bc1      	ldrh	r1, [r0, #30]
 800e736:	58d3      	ldr	r3, [r2, r3]
 800e738:	0089      	lsls	r1, r1, #2
 800e73a:	185b      	adds	r3, r3, r1
 800e73c:	78db      	ldrb	r3, [r3, #3]
 800e73e:	0659      	lsls	r1, r3, #25
 800e740:	d405      	bmi.n	800e74e <fn_0800E728+0x26>
 800e742:	261a      	movs	r6, #26
 800e744:	5f81      	ldrsh	r1, [r0, r6]
 800e746:	09db      	lsrs	r3, r3, #7
 800e748:	021b      	lsls	r3, r3, #8
 800e74a:	4299      	cmp	r1, r3
 800e74c:	d10a      	bne.n	800e764 <fn_0800E728+0x3c>
 800e74e:	f001 fc6f 	bl	8010030 <fn_08010030>
 800e752:	6823      	ldr	r3, [r4, #0]
 800e754:	4a14      	ldr	r2, [pc, #80]	@ (800e7a8 <fn_0800E728+0x80>)
 800e756:	589a      	ldr	r2, [r3, r2]
 800e758:	2001      	movs	r0, #1
 800e75a:	2a00      	cmp	r2, #0
 800e75c:	dd18      	ble.n	800e790 <fn_0800E728+0x68>
 800e75e:	bc70      	pop	{r4, r5, r6}
 800e760:	bc02      	pop	{r1}
 800e762:	4708      	bx	r1
 800e764:	2692      	movs	r6, #146	@ 0x92
 800e766:	0136      	lsls	r6, r6, #4
 800e768:	5993      	ldr	r3, [r2, r6]
 800e76a:	6919      	ldr	r1, [r3, #16]
 800e76c:	68db      	ldr	r3, [r3, #12]
 800e76e:	0002      	movs	r2, r0
 800e770:	0018      	movs	r0, r3
 800e772:	f001 fb53 	bl	800fe1c <fn_0800FE1C>
 800e776:	1e42      	subs	r2, r0, #1
 800e778:	4253      	negs	r3, r2
 800e77a:	415a      	adcs	r2, r3
 800e77c:	6823      	ldr	r3, [r4, #0]
 800e77e:	68a9      	ldr	r1, [r5, #8]
 800e780:	5998      	ldr	r0, [r3, r6]
 800e782:	f008 fca5 	bl	80170d0 <fn_080170D0>
 800e786:	68ab      	ldr	r3, [r5, #8]
 800e788:	8b18      	ldrh	r0, [r3, #24]
 800e78a:	0580      	lsls	r0, r0, #22
 800e78c:	0fc0      	lsrs	r0, r0, #31
 800e78e:	e7e6      	b.n	800e75e <fn_0800E728+0x36>
 800e790:	2292      	movs	r2, #146	@ 0x92
 800e792:	0112      	lsls	r2, r2, #4
 800e794:	5898      	ldr	r0, [r3, r2]
 800e796:	2151      	movs	r1, #81	@ 0x51
 800e798:	f00b fd96 	bl	801a2c8 <fn_0801A2C8>
 800e79c:	2000      	movs	r0, #0
 800e79e:	e7de      	b.n	800e75e <fn_0800E728+0x36>
 800e7a0:	030064c4 	.word	0x030064c4
 800e7a4:	00000e04 	.word	0x00000e04
 800e7a8:	00000934 	.word	0x00000934
