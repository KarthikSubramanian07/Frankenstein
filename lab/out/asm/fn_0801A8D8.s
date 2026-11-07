fn_0801A8D8:
 801a8d8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801a8da:	4b1c      	ldr	r3, [pc, #112]	@ (801a94c <fn_0801A8D8+0x74>)
 801a8dc:	781b      	ldrb	r3, [r3, #0]
 801a8de:	2b00      	cmp	r3, #0
 801a8e0:	d127      	bne.n	801a932 <fn_0801A8D8+0x5a>
 801a8e2:	4e1b      	ldr	r6, [pc, #108]	@ (801a950 <fn_0801A8D8+0x78>)
 801a8e4:	2500      	movs	r5, #0
 801a8e6:	6832      	ldr	r2, [r6, #0]
 801a8e8:	e00b      	b.n	801a902 <fn_0801A8D8+0x2a>
 801a8ea:	68fb      	ldr	r3, [r7, #12]
 801a8ec:	2b00      	cmp	r3, #0
 801a8ee:	d005      	beq.n	801a8fc <fn_0801A8D8+0x24>
 801a8f0:	4b18      	ldr	r3, [pc, #96]	@ (801a954 <fn_0801A8D8+0x7c>)
 801a8f2:	6939      	ldr	r1, [r7, #16]
 801a8f4:	58d3      	ldr	r3, [r2, r3]
 801a8f6:	185b      	adds	r3, r3, r1
 801a8f8:	2b00      	cmp	r3, #0
 801a8fa:	dd1d      	ble.n	801a938 <fn_0801A8D8+0x60>
 801a8fc:	3501      	adds	r5, #1
 801a8fe:	2d08      	cmp	r5, #8
 801a900:	d017      	beq.n	801a932 <fn_0801A8D8+0x5a>
 801a902:	006c      	lsls	r4, r5, #1
 801a904:	1964      	adds	r4, r4, r5
 801a906:	4914      	ldr	r1, [pc, #80]	@ (801a958 <fn_0801A8D8+0x80>)
 801a908:	00a4      	lsls	r4, r4, #2
 801a90a:	1913      	adds	r3, r2, r4
 801a90c:	585f      	ldr	r7, [r3, r1]
 801a90e:	2f00      	cmp	r7, #0
 801a910:	d0f4      	beq.n	801a8fc <fn_0801A8D8+0x24>
 801a912:	0028      	movs	r0, r5
 801a914:	f7ea fa48 	bl	8004da8 <fn_08004DA8>
 801a918:	6832      	ldr	r2, [r6, #0]
 801a91a:	2800      	cmp	r0, #0
 801a91c:	d1e5      	bne.n	801a8ea <fn_0801A8D8+0x12>
 801a91e:	4b0e      	ldr	r3, [pc, #56]	@ (801a958 <fn_0801A8D8+0x80>)
 801a920:	1914      	adds	r4, r2, r4
 801a922:	18e4      	adds	r4, r4, r3
 801a924:	6823      	ldr	r3, [r4, #0]
 801a926:	2b00      	cmp	r3, #0
 801a928:	d0e8      	beq.n	801a8fc <fn_0801A8D8+0x24>
 801a92a:	3501      	adds	r5, #1
 801a92c:	6020      	str	r0, [r4, #0]
 801a92e:	2d08      	cmp	r5, #8
 801a930:	d1e7      	bne.n	801a902 <fn_0801A8D8+0x2a>
 801a932:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801a934:	bc01      	pop	{r0}
 801a936:	4700      	bx	r0
 801a938:	4b07      	ldr	r3, [pc, #28]	@ (801a958 <fn_0801A8D8+0x80>)
 801a93a:	1914      	adds	r4, r2, r4
 801a93c:	18e4      	adds	r4, r4, r3
 801a93e:	6823      	ldr	r3, [r4, #0]
 801a940:	2b00      	cmp	r3, #0
 801a942:	d0db      	beq.n	801a8fc <fn_0801A8D8+0x24>
 801a944:	2300      	movs	r3, #0
 801a946:	6023      	str	r3, [r4, #0]
 801a948:	e7d8      	b.n	801a8fc <fn_0801A8D8+0x24>
 801a94a:	46c0      	nop			@ (mov r8, r8)
 801a94c:	080257f6 	.word	0x080257f6	@ data_080257F6
 801a950:	030064c4 	.word	0x030064c4	@ data_030064C4
 801a954:	00005630 	.word	0x00005630
 801a958:	000055d0 	.word	0x000055d0
