fn_080151D4:
 80151d4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80151d6:	46ce      	mov	lr, r9
 80151d8:	4647      	mov	r7, r8
 80151da:	b580      	push	{r7, lr}
 80151dc:	221e      	movs	r2, #30
 80151de:	5e83      	ldrsh	r3, [r0, r2]
 80151e0:	0004      	movs	r4, r0
 80151e2:	4699      	mov	r9, r3
 80151e4:	2b00      	cmp	r3, #0
 80151e6:	dd3a      	ble.n	801525e <fn_080151D4+0x8a>
 80151e8:	22e0      	movs	r2, #224	@ 0xe0
 80151ea:	4b20      	ldr	r3, [pc, #128]	@ (801526c <fn_080151D4+0x98>)
 80151ec:	681b      	ldr	r3, [r3, #0]
 80151ee:	0112      	lsls	r2, r2, #4
 80151f0:	589a      	ldr	r2, [r3, r2]
 80151f2:	4690      	mov	r8, r2
 80151f4:	6982      	ldr	r2, [r0, #24]
 80151f6:	4694      	mov	ip, r2
 80151f8:	22df      	movs	r2, #223	@ 0xdf
 80151fa:	0112      	lsls	r2, r2, #4
 80151fc:	589e      	ldr	r6, [r3, r2]
 80151fe:	4a1c      	ldr	r2, [pc, #112]	@ (8015270 <fn_080151D4+0x9c>)
 8015200:	0008      	movs	r0, r1
 8015202:	589d      	ldr	r5, [r3, r2]
 8015204:	2100      	movs	r1, #0
 8015206:	e009      	b.n	801521c <fn_080151D4+0x48>
 8015208:	2f00      	cmp	r7, #0
 801520a:	d004      	beq.n	8015216 <fn_080151D4+0x42>
 801520c:	2326      	movs	r3, #38	@ 0x26
 801520e:	5cfb      	ldrb	r3, [r7, r3]
 8015210:	4298      	cmp	r0, r3
 8015212:	dd00      	ble.n	8015216 <fn_080151D4+0x42>
 8015214:	0018      	movs	r0, r3
 8015216:	3101      	adds	r1, #1
 8015218:	4589      	cmp	r9, r1
 801521a:	dd21      	ble.n	8015260 <fn_080151D4+0x8c>
 801521c:	4662      	mov	r2, ip
 801521e:	004b      	lsls	r3, r1, #1
 8015220:	5ad2      	ldrh	r2, [r2, r3]
 8015222:	0152      	lsls	r2, r2, #5
 8015224:	4442      	add	r2, r8
 8015226:	8a97      	ldrh	r7, [r2, #20]
 8015228:	007b      	lsls	r3, r7, #1
 801522a:	19db      	adds	r3, r3, r7
 801522c:	009b      	lsls	r3, r3, #2
 801522e:	18eb      	adds	r3, r5, r3
 8015230:	895f      	ldrh	r7, [r3, #10]
 8015232:	00bb      	lsls	r3, r7, #2
 8015234:	19db      	adds	r3, r3, r7
 8015236:	00db      	lsls	r3, r3, #3
 8015238:	18f7      	adds	r7, r6, r3
 801523a:	42bc      	cmp	r4, r7
 801523c:	d1e4      	bne.n	8015208 <fn_080151D4+0x34>
 801523e:	8ad7      	ldrh	r7, [r2, #22]
 8015240:	4a0c      	ldr	r2, [pc, #48]	@ (8015274 <fn_080151D4+0xa0>)
 8015242:	4297      	cmp	r7, r2
 8015244:	d0e7      	beq.n	8015216 <fn_080151D4+0x42>
 8015246:	007a      	lsls	r2, r7, #1
 8015248:	19d2      	adds	r2, r2, r7
 801524a:	0092      	lsls	r2, r2, #2
 801524c:	18aa      	adds	r2, r5, r2
 801524e:	8957      	ldrh	r7, [r2, #10]
 8015250:	00ba      	lsls	r2, r7, #2
 8015252:	19d2      	adds	r2, r2, r7
 8015254:	00d2      	lsls	r2, r2, #3
 8015256:	4293      	cmp	r3, r2
 8015258:	d0dd      	beq.n	8015216 <fn_080151D4+0x42>
 801525a:	18b7      	adds	r7, r6, r2
 801525c:	e7d4      	b.n	8015208 <fn_080151D4+0x34>
 801525e:	0008      	movs	r0, r1
 8015260:	bcc0      	pop	{r6, r7}
 8015262:	46b9      	mov	r9, r7
 8015264:	46b0      	mov	r8, r6
 8015266:	bcf0      	pop	{r4, r5, r6, r7}
 8015268:	bc02      	pop	{r1}
 801526a:	4708      	bx	r1
 801526c:	030064c4 	.word	0x030064c4
 8015270:	00000e0c 	.word	0x00000e0c
 8015274:	0000ffff 	.word	0x0000ffff
