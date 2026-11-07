fn_0801B2AC:
 801b2ac:	4b0c      	ldr	r3, [pc, #48]	@ (801b2e0 <fn_0801B2AC+0x34>)
 801b2ae:	681a      	ldr	r2, [r3, #0]
 801b2b0:	4b0c      	ldr	r3, [pc, #48]	@ (801b2e4 <fn_0801B2AC+0x38>)
 801b2b2:	58d2      	ldr	r2, [r2, r3]
 801b2b4:	23f0      	movs	r3, #240	@ 0xf0
 801b2b6:	21f0      	movs	r1, #240	@ 0xf0
 801b2b8:	01db      	lsls	r3, r3, #7
 801b2ba:	18d2      	adds	r2, r2, r3
 801b2bc:	4b0a      	ldr	r3, [pc, #40]	@ (801b2e8 <fn_0801B2AC+0x3c>)
 801b2be:	0149      	lsls	r1, r1, #5
 801b2c0:	b570      	push	{r4, r5, r6, lr}
 801b2c2:	480a      	ldr	r0, [pc, #40]	@ (801b2ec <fn_0801B2AC+0x40>)
 801b2c4:	185e      	adds	r6, r3, r1
 801b2c6:	4d0a      	ldr	r5, [pc, #40]	@ (801b2f0 <fn_0801B2AC+0x44>)
 801b2c8:	4c0a      	ldr	r4, [pc, #40]	@ (801b2f4 <fn_0801B2AC+0x48>)
 801b2ca:	490b      	ldr	r1, [pc, #44]	@ (801b2f8 <fn_0801B2AC+0x4c>)
 801b2cc:	602b      	str	r3, [r5, #0]
 801b2ce:	33f0      	adds	r3, #240	@ 0xf0
 801b2d0:	6022      	str	r2, [r4, #0]
 801b2d2:	6001      	str	r1, [r0, #0]
 801b2d4:	32f0      	adds	r2, #240	@ 0xf0
 801b2d6:	42b3      	cmp	r3, r6
 801b2d8:	d1f8      	bne.n	801b2cc <fn_0801B2AC+0x20>
 801b2da:	bc70      	pop	{r4, r5, r6}
 801b2dc:	bc01      	pop	{r0}
 801b2de:	4700      	bx	r0
 801b2e0:	030064c4 	.word	0x030064c4
 801b2e4:	00005a30 	.word	0x00005a30
 801b2e8:	081300d4 	.word	0x081300d4
 801b2ec:	040000dc 	.word	0x040000dc
 801b2f0:	040000d4 	.word	0x040000d4
 801b2f4:	040000d8 	.word	0x040000d8
 801b2f8:	80000078 	.word	0x80000078
