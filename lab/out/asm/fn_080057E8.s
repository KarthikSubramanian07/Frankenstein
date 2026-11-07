fn_080057E8:
 80057e8:	23aa      	movs	r3, #170	@ 0xaa
 80057ea:	2201      	movs	r2, #1
 80057ec:	b510      	push	{r4, lr}
 80057ee:	4c0c      	ldr	r4, [pc, #48]	@ (8005820 <fn_080057E8+0x38>)
 80057f0:	6820      	ldr	r0, [r4, #0]
 80057f2:	005b      	lsls	r3, r3, #1
 80057f4:	50c2      	str	r2, [r0, r3]
 80057f6:	3b20      	subs	r3, #32
 80057f8:	3206      	adds	r2, #6
 80057fa:	54c2      	strb	r2, [r0, r3]
 80057fc:	2100      	movs	r1, #0
 80057fe:	30e0      	adds	r0, #224	@ 0xe0
 8005800:	f007 fc6e 	bl	800d0e0 <fn_0800D0E0>
 8005804:	21dc      	movs	r1, #220	@ 0xdc
 8005806:	6822      	ldr	r2, [r4, #0]
 8005808:	4b06      	ldr	r3, [pc, #24]	@ (8005824 <fn_080057E8+0x3c>)
 800580a:	58d3      	ldr	r3, [r2, r3]
 800580c:	0089      	lsls	r1, r1, #2
 800580e:	5859      	ldr	r1, [r3, r1]
 8005810:	185b      	adds	r3, r3, r1
 8005812:	21cc      	movs	r1, #204	@ 0xcc
 8005814:	0049      	lsls	r1, r1, #1
 8005816:	5053      	str	r3, [r2, r1]
 8005818:	bc10      	pop	{r4}
 800581a:	bc01      	pop	{r0}
 800581c:	4700      	bx	r0
 800581e:	46c0      	nop			@ (mov r8, r8)
 8005820:	030064c4 	.word	0x030064c4	@ data_030064C4
 8005824:	0000075c 	.word	0x0000075c
