fn_0801C94C:
 801c94c:	2294      	movs	r2, #148	@ 0x94
 801c94e:	b510      	push	{r4, lr}
 801c950:	4b0b      	ldr	r3, [pc, #44]	@ (801c980 <fn_0801C94C+0x34>)
 801c952:	681b      	ldr	r3, [r3, #0]
 801c954:	5c9a      	ldrb	r2, [r3, r2]
 801c956:	2a02      	cmp	r2, #2
 801c958:	d003      	beq.n	801c962 <fn_0801C94C+0x16>
 801c95a:	22dc      	movs	r2, #220	@ 0xdc
 801c95c:	589a      	ldr	r2, [r3, r2]
 801c95e:	2a08      	cmp	r2, #8
 801c960:	d00b      	beq.n	801c97a <fn_0801C94C+0x2e>
 801c962:	2101      	movs	r1, #1
 801c964:	4a07      	ldr	r2, [pc, #28]	@ (801c984 <fn_0801C94C+0x38>)
 801c966:	5499      	strb	r1, [r3, r2]
 801c968:	2100      	movs	r1, #0
 801c96a:	4a07      	ldr	r2, [pc, #28]	@ (801c988 <fn_0801C94C+0x3c>)
 801c96c:	5099      	str	r1, [r3, r2]
 801c96e:	4a07      	ldr	r2, [pc, #28]	@ (801c98c <fn_0801C94C+0x40>)
 801c970:	318c      	adds	r1, #140	@ 0x8c
 801c972:	5099      	str	r1, [r3, r2]
 801c974:	bc10      	pop	{r4}
 801c976:	bc01      	pop	{r0}
 801c978:	4700      	bx	r0
 801c97a:	f7e6 fdf3 	bl	8003564 <fn_08003564>
 801c97e:	e7f9      	b.n	801c974 <fn_0801C94C+0x28>
 801c980:	030064c4 	.word	0x030064c4	@ data_030064C4
 801c984:	00005a3c 	.word	0x00005a3c
 801c988:	00005a38 	.word	0x00005a38
 801c98c:	00005a48 	.word	0x00005a48
