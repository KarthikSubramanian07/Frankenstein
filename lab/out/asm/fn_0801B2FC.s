fn_0801B2FC:
 801b2fc:	b570      	push	{r4, r5, r6, lr}
 801b2fe:	f7e5 f8bf 	bl	8000480 <fn_08000480>
 801b302:	4b0c      	ldr	r3, [pc, #48]	@ (801b334 <fn_0801B2FC+0x38>)
 801b304:	681a      	ldr	r2, [r3, #0]
 801b306:	4b0c      	ldr	r3, [pc, #48]	@ (801b338 <fn_0801B2FC+0x3c>)
 801b308:	2196      	movs	r1, #150	@ 0x96
 801b30a:	58d2      	ldr	r2, [r2, r3]
 801b30c:	23f0      	movs	r3, #240	@ 0xf0
 801b30e:	0209      	lsls	r1, r1, #8
 801b310:	01db      	lsls	r3, r3, #7
 801b312:	18d2      	adds	r2, r2, r3
 801b314:	4e09      	ldr	r6, [pc, #36]	@ (801b33c <fn_0801B2FC+0x40>)
 801b316:	18c3      	adds	r3, r0, r3
 801b318:	4d09      	ldr	r5, [pc, #36]	@ (801b340 <fn_0801B2FC+0x44>)
 801b31a:	1840      	adds	r0, r0, r1
 801b31c:	4c09      	ldr	r4, [pc, #36]	@ (801b344 <fn_0801B2FC+0x48>)
 801b31e:	490a      	ldr	r1, [pc, #40]	@ (801b348 <fn_0801B2FC+0x4c>)
 801b320:	6033      	str	r3, [r6, #0]
 801b322:	33f0      	adds	r3, #240	@ 0xf0
 801b324:	602a      	str	r2, [r5, #0]
 801b326:	6021      	str	r1, [r4, #0]
 801b328:	32f0      	adds	r2, #240	@ 0xf0
 801b32a:	4298      	cmp	r0, r3
 801b32c:	d1f8      	bne.n	801b320 <fn_0801B2FC+0x24>
 801b32e:	bc70      	pop	{r4, r5, r6}
 801b330:	bc01      	pop	{r0}
 801b332:	4700      	bx	r0
 801b334:	030064c4 	.word	0x030064c4
 801b338:	00005a30 	.word	0x00005a30
 801b33c:	040000d4 	.word	0x040000d4
 801b340:	040000d8 	.word	0x040000d8
 801b344:	040000dc 	.word	0x040000dc
 801b348:	80000078 	.word	0x80000078
