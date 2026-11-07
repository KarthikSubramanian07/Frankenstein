fn_0801B1F8:
 801b1f8:	4b0c      	ldr	r3, [pc, #48]	@ (801b22c <fn_0801B1F8+0x34>)
 801b1fa:	681a      	ldr	r2, [r3, #0]
 801b1fc:	4b0c      	ldr	r3, [pc, #48]	@ (801b230 <fn_0801B1F8+0x38>)
 801b1fe:	58d2      	ldr	r2, [r2, r3]
 801b200:	23f0      	movs	r3, #240	@ 0xf0
 801b202:	21f0      	movs	r1, #240	@ 0xf0
 801b204:	01db      	lsls	r3, r3, #7
 801b206:	18d2      	adds	r2, r2, r3
 801b208:	4b0a      	ldr	r3, [pc, #40]	@ (801b234 <fn_0801B1F8+0x3c>)
 801b20a:	0149      	lsls	r1, r1, #5
 801b20c:	b570      	push	{r4, r5, r6, lr}
 801b20e:	480a      	ldr	r0, [pc, #40]	@ (801b238 <fn_0801B1F8+0x40>)
 801b210:	185e      	adds	r6, r3, r1
 801b212:	4d0a      	ldr	r5, [pc, #40]	@ (801b23c <fn_0801B1F8+0x44>)
 801b214:	4c0a      	ldr	r4, [pc, #40]	@ (801b240 <fn_0801B1F8+0x48>)
 801b216:	490b      	ldr	r1, [pc, #44]	@ (801b244 <fn_0801B1F8+0x4c>)
 801b218:	602b      	str	r3, [r5, #0]
 801b21a:	33f0      	adds	r3, #240	@ 0xf0
 801b21c:	6022      	str	r2, [r4, #0]
 801b21e:	6001      	str	r1, [r0, #0]
 801b220:	32f0      	adds	r2, #240	@ 0xf0
 801b222:	42b3      	cmp	r3, r6
 801b224:	d1f8      	bne.n	801b218 <fn_0801B1F8+0x20>
 801b226:	bc70      	pop	{r4, r5, r6}
 801b228:	bc01      	pop	{r0}
 801b22a:	4700      	bx	r0
 801b22c:	030064c4 	.word	0x030064c4	@ data_030064C4
 801b230:	00005a30 	.word	0x00005a30
 801b234:	08130000 	.word	0x08130000	@ data_08130000
 801b238:	040000dc 	.word	0x040000dc
 801b23c:	040000d4 	.word	0x040000d4
 801b240:	040000d8 	.word	0x040000d8
 801b244:	80000078 	.word	0x80000078
