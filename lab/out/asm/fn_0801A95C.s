fn_0801A95C:
 801a95c:	4b0b      	ldr	r3, [pc, #44]	@ (801a98c <fn_0801A95C+0x30>)
 801a95e:	781b      	ldrb	r3, [r3, #0]
 801a960:	b510      	push	{r4, lr}
 801a962:	0004      	movs	r4, r0
 801a964:	2b00      	cmp	r3, #0
 801a966:	d108      	bne.n	801a97a <fn_0801A95C+0x1e>
 801a968:	280f      	cmp	r0, #15
 801a96a:	d809      	bhi.n	801a980 <fn_0801A95C+0x24>
 801a96c:	0020      	movs	r0, r4
 801a96e:	f7ea fa7b 	bl	8004e68 <fn_08004E68>
 801a972:	4b07      	ldr	r3, [pc, #28]	@ (801a990 <fn_0801A95C+0x34>)
 801a974:	681a      	ldr	r2, [r3, #0]
 801a976:	4b07      	ldr	r3, [pc, #28]	@ (801a994 <fn_0801A95C+0x38>)
 801a978:	50d4      	str	r4, [r2, r3]
 801a97a:	bc10      	pop	{r4}
 801a97c:	bc01      	pop	{r0}
 801a97e:	4700      	bx	r0
 801a980:	0021      	movs	r1, r4
 801a982:	4805      	ldr	r0, [pc, #20]	@ (801a998 <fn_0801A95C+0x3c>)
 801a984:	f7e5 fe10 	bl	80005a8 <fn_080005A8>
 801a988:	e7f0      	b.n	801a96c <fn_0801A95C+0x10>
 801a98a:	46c0      	nop			@ (mov r8, r8)
 801a98c:	080257f5 	.word	0x080257f5	@ data_080257F5
 801a990:	030064c4 	.word	0x030064c4	@ data_030064C4
 801a994:	00005634 	.word	0x00005634
 801a998:	0814a7e0 	.word	0x0814a7e0
