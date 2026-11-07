fn_0800FFBC:
 800ffbc:	b5f0      	push	{r4, r5, r6, r7, lr}
 800ffbe:	68cb      	ldr	r3, [r1, #12]
 800ffc0:	000d      	movs	r5, r1
 800ffc2:	b083      	sub	sp, #12
 800ffc4:	6881      	ldr	r1, [r0, #8]
 800ffc6:	0006      	movs	r6, r0
 800ffc8:	1218      	asrs	r0, r3, #8
 800ffca:	9300      	str	r3, [sp, #0]
 800ffcc:	f015 fb5e 	bl	802568c <fn_0802568C>
 800ffd0:	68aa      	ldr	r2, [r5, #8]
 800ffd2:	0007      	movs	r7, r0
 800ffd4:	68f1      	ldr	r1, [r6, #12]
 800ffd6:	1210      	asrs	r0, r2, #8
 800ffd8:	9201      	str	r2, [sp, #4]
 800ffda:	f015 fb57 	bl	802568c <fn_0802568C>
 800ffde:	1a3c      	subs	r4, r7, r0
 800ffe0:	4287      	cmp	r7, r0
 800ffe2:	d01e      	beq.n	8010022 <fn_0800FFBC+0x66>
 800ffe4:	6833      	ldr	r3, [r6, #0]
 800ffe6:	6828      	ldr	r0, [r5, #0]
 800ffe8:	1ac0      	subs	r0, r0, r3
 800ffea:	9900      	ldr	r1, [sp, #0]
 800ffec:	1200      	asrs	r0, r0, #8
 800ffee:	f015 fb4d 	bl	802568c <fn_0802568C>
 800fff2:	686b      	ldr	r3, [r5, #4]
 800fff4:	0007      	movs	r7, r0
 800fff6:	6870      	ldr	r0, [r6, #4]
 800fff8:	1ac0      	subs	r0, r0, r3
 800fffa:	9901      	ldr	r1, [sp, #4]
 800fffc:	1200      	asrs	r0, r0, #8
 800fffe:	f015 fb45 	bl	802568c <fn_0802568C>
 8010002:	19c0      	adds	r0, r0, r7
 8010004:	17c3      	asrs	r3, r0, #31
 8010006:	0005      	movs	r5, r0
 8010008:	18c0      	adds	r0, r0, r3
 801000a:	4058      	eors	r0, r3
 801000c:	17e3      	asrs	r3, r4, #31
 801000e:	18e2      	adds	r2, r4, r3
 8010010:	0401      	lsls	r1, r0, #16
 8010012:	405a      	eors	r2, r3
 8010014:	1400      	asrs	r0, r0, #16
 8010016:	f015 fb07 	bl	8025628 <fn_08025628>
 801001a:	4065      	eors	r5, r4
 801001c:	0004      	movs	r4, r0
 801001e:	2d00      	cmp	r5, #0
 8010020:	db04      	blt.n	801002c <fn_0800FFBC+0x70>
 8010022:	0020      	movs	r0, r4
 8010024:	b003      	add	sp, #12
 8010026:	bcf0      	pop	{r4, r5, r6, r7}
 8010028:	bc02      	pop	{r1}
 801002a:	4708      	bx	r1
 801002c:	4244      	negs	r4, r0
 801002e:	e7f8      	b.n	8010022 <fn_0800FFBC+0x66>
