fn_0800F6CC:
 800f6cc:	b570      	push	{r4, r5, r6, lr}
 800f6ce:	6902      	ldr	r2, [r0, #16]
 800f6d0:	68c1      	ldr	r1, [r0, #12]
 800f6d2:	0004      	movs	r4, r0
 800f6d4:	6946      	ldr	r6, [r0, #20]
 800f6d6:	6b05      	ldr	r5, [r0, #48]	@ 0x30
 800f6d8:	f7ff fe7c 	bl	800f3d4 <fn_0800F3D4>
 800f6dc:	228b      	movs	r2, #139	@ 0x8b
 800f6de:	4b0e      	ldr	r3, [pc, #56]	@ (800f718 <fn_0800F6CC+0x4c>)
 800f6e0:	681b      	ldr	r3, [r3, #0]
 800f6e2:	0112      	lsls	r2, r2, #4
 800f6e4:	5899      	ldr	r1, [r3, r2]
 800f6e6:	4a0d      	ldr	r2, [pc, #52]	@ (800f71c <fn_0800F6CC+0x50>)
 800f6e8:	6321      	str	r1, [r4, #48]	@ 0x30
 800f6ea:	589b      	ldr	r3, [r3, r2]
 800f6ec:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
 800f6ee:	6363      	str	r3, [r4, #52]	@ 0x34
 800f6f0:	42ae      	cmp	r6, r5
 800f6f2:	d00f      	beq.n	800f714 <fn_0800F6CC+0x48>
 800f6f4:	6960      	ldr	r0, [r4, #20]
 800f6f6:	1810      	adds	r0, r2, r0
 800f6f8:	4298      	cmp	r0, r3
 800f6fa:	dd01      	ble.n	800f700 <fn_0800F6CC+0x34>
 800f6fc:	1a98      	subs	r0, r3, r2
 800f6fe:	6160      	str	r0, [r4, #20]
 800f700:	1a5b      	subs	r3, r3, r1
 800f702:	17d8      	asrs	r0, r3, #31
 800f704:	0fd1      	lsrs	r1, r2, #31
 800f706:	4293      	cmp	r3, r2
 800f708:	4148      	adcs	r0, r1
 800f70a:	0600      	lsls	r0, r0, #24
 800f70c:	0e00      	lsrs	r0, r0, #24
 800f70e:	bc70      	pop	{r4, r5, r6}
 800f710:	bc02      	pop	{r1}
 800f712:	4708      	bx	r1
 800f714:	6161      	str	r1, [r4, #20]
 800f716:	e7f3      	b.n	800f700 <fn_0800F6CC+0x34>
 800f718:	030064c4 	.word	0x030064c4	@ data_030064C4
 800f71c:	000008b4 	.word	0x000008b4
