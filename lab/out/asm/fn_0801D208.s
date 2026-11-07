fn_0801D208:
 801d208:	b5f0      	push	{r4, r5, r6, r7, lr}
 801d20a:	2400      	movs	r4, #0
 801d20c:	4f0c      	ldr	r7, [pc, #48]	@ (801d240 <fn_0801D208+0x38>)
 801d20e:	4e0d      	ldr	r6, [pc, #52]	@ (801d244 <fn_0801D208+0x3c>)
 801d210:	b085      	sub	sp, #20
 801d212:	0023      	movs	r3, r4
 801d214:	003a      	movs	r2, r7
 801d216:	2109      	movs	r1, #9
 801d218:	a801      	add	r0, sp, #4
 801d21a:	f7e8 f91d 	bl	8005458 <fn_08005458>
 801d21e:	a801      	add	r0, sp, #4
 801d220:	f000 f986 	bl	801d530 <fn_0801D530>
 801d224:	f000 f9f8 	bl	801d618 <fn_0801D618>
 801d228:	4b07      	ldr	r3, [pc, #28]	@ (801d248 <fn_0801D208+0x40>)
 801d22a:	6835      	ldr	r5, [r6, #0]
 801d22c:	18e3      	adds	r3, r4, r3
 801d22e:	009b      	lsls	r3, r3, #2
 801d230:	3401      	adds	r4, #1
 801d232:	50e8      	str	r0, [r5, r3]
 801d234:	2c0a      	cmp	r4, #10
 801d236:	d1ec      	bne.n	801d212 <fn_0801D208+0xa>
 801d238:	b005      	add	sp, #20
 801d23a:	bcf0      	pop	{r4, r5, r6, r7}
 801d23c:	bc01      	pop	{r0}
 801d23e:	4700      	bx	r0
 801d240:	0814aa44 	.word	0x0814aa44
 801d244:	030064c4 	.word	0x030064c4
 801d248:	00001698 	.word	0x00001698
