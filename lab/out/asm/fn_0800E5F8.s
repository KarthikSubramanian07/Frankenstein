fn_0800E5F8:
 800e5f8:	b510      	push	{r4, lr}
 800e5fa:	4c1c      	ldr	r4, [pc, #112]	@ (800e66c <fn_0800E5F8+0x74>)
 800e5fc:	6881      	ldr	r1, [r0, #8]
 800e5fe:	4b1c      	ldr	r3, [pc, #112]	@ (800e670 <fn_0800E5F8+0x78>)
 800e600:	6820      	ldr	r0, [r4, #0]
 800e602:	8bca      	ldrh	r2, [r1, #30]
 800e604:	58c3      	ldr	r3, [r0, r3]
 800e606:	0092      	lsls	r2, r2, #2
 800e608:	189b      	adds	r3, r3, r2
 800e60a:	78db      	ldrb	r3, [r3, #3]
 800e60c:	065a      	lsls	r2, r3, #25
 800e60e:	d409      	bmi.n	800e624 <fn_0800E5F8+0x2c>
 800e610:	201a      	movs	r0, #26
 800e612:	5e0a      	ldrsh	r2, [r1, r0]
 800e614:	09db      	lsrs	r3, r3, #7
 800e616:	2001      	movs	r0, #1
 800e618:	021b      	lsls	r3, r3, #8
 800e61a:	429a      	cmp	r2, r3
 800e61c:	d002      	beq.n	800e624 <fn_0800E5F8+0x2c>
 800e61e:	bc10      	pop	{r4}
 800e620:	bc02      	pop	{r1}
 800e622:	4708      	bx	r1
 800e624:	8b0b      	ldrh	r3, [r1, #24]
 800e626:	07db      	lsls	r3, r3, #31
 800e628:	d501      	bpl.n	800e62e <fn_0800E5F8+0x36>
 800e62a:	2000      	movs	r0, #0
 800e62c:	e7f7      	b.n	800e61e <fn_0800E5F8+0x26>
 800e62e:	0008      	movs	r0, r1
 800e630:	f001 fcfe 	bl	8010030 <fn_08010030>
 800e634:	6823      	ldr	r3, [r4, #0]
 800e636:	4a0f      	ldr	r2, [pc, #60]	@ (800e674 <fn_0800E5F8+0x7c>)
 800e638:	589a      	ldr	r2, [r3, r2]
 800e63a:	2a00      	cmp	r2, #0
 800e63c:	ddf5      	ble.n	800e62a <fn_0800E5F8+0x32>
 800e63e:	2292      	movs	r2, #146	@ 0x92
 800e640:	2493      	movs	r4, #147	@ 0x93
 800e642:	20c0      	movs	r0, #192	@ 0xc0
 800e644:	0112      	lsls	r2, r2, #4
 800e646:	5899      	ldr	r1, [r3, r2]
 800e648:	0124      	lsls	r4, r4, #4
 800e64a:	694a      	ldr	r2, [r1, #20]
 800e64c:	0340      	lsls	r0, r0, #13
 800e64e:	591c      	ldr	r4, [r3, r4]
 800e650:	1810      	adds	r0, r2, r0
 800e652:	4284      	cmp	r4, r0
 800e654:	dce9      	bgt.n	800e62a <fn_0800E5F8+0x32>
 800e656:	6b89      	ldr	r1, [r1, #56]	@ 0x38
 800e658:	1852      	adds	r2, r2, r1
 800e65a:	4907      	ldr	r1, [pc, #28]	@ (800e678 <fn_0800E5F8+0x80>)
 800e65c:	585b      	ldr	r3, [r3, r1]
 800e65e:	0fd1      	lsrs	r1, r2, #31
 800e660:	17d8      	asrs	r0, r3, #31
 800e662:	4293      	cmp	r3, r2
 800e664:	4148      	adcs	r0, r1
 800e666:	0600      	lsls	r0, r0, #24
 800e668:	0e00      	lsrs	r0, r0, #24
 800e66a:	e7d8      	b.n	800e61e <fn_0800E5F8+0x26>
 800e66c:	030064c4 	.word	0x030064c4
 800e670:	00000e04 	.word	0x00000e04
 800e674:	00000934 	.word	0x00000934
 800e678:	0000092c 	.word	0x0000092c
