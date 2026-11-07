fn_0801D158:
 801d158:	b5f0      	push	{r4, r5, r6, r7, lr}
 801d15a:	2400      	movs	r4, #0
 801d15c:	4f0c      	ldr	r7, [pc, #48]	@ (801d190 <fn_0801D158+0x38>)
 801d15e:	4e0d      	ldr	r6, [pc, #52]	@ (801d194 <fn_0801D158+0x3c>)
 801d160:	b085      	sub	sp, #20
 801d162:	0023      	movs	r3, r4
 801d164:	003a      	movs	r2, r7
 801d166:	2109      	movs	r1, #9
 801d168:	a801      	add	r0, sp, #4
 801d16a:	f7e8 f975 	bl	8005458 <fn_08005458>
 801d16e:	a801      	add	r0, sp, #4
 801d170:	f000 f986 	bl	801d480 <fn_0801D480>
 801d174:	f000 f9f8 	bl	801d568 <fn_0801D568>
 801d178:	4b07      	ldr	r3, [pc, #28]	@ (801d198 <fn_0801D158+0x40>)
 801d17a:	6835      	ldr	r5, [r6, #0]
 801d17c:	18e3      	adds	r3, r4, r3
 801d17e:	009b      	lsls	r3, r3, #2
 801d180:	3401      	adds	r4, #1
 801d182:	50e8      	str	r0, [r5, r3]
 801d184:	2c0a      	cmp	r4, #10
 801d186:	d1ec      	bne.n	801d162 <fn_0801D158+0xa>
 801d188:	b005      	add	sp, #20
 801d18a:	bcf0      	pop	{r4, r5, r6, r7}
 801d18c:	bc01      	pop	{r0}
 801d18e:	4700      	bx	r0
 801d190:	0814a970 	.word	0x0814a970
 801d194:	030064c4 	.word	0x030064c4
 801d198:	00001698 	.word	0x00001698
