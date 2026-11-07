fn_08009E8C:
 8009e8c:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 8009e8e:	b570      	push	{r4, r5, r6, lr}
 8009e90:	0004      	movs	r4, r0
 8009e92:	2a00      	cmp	r2, #0
 8009e94:	d012      	beq.n	8009ebc <fn_08009E8C+0x30>
 8009e96:	2120      	movs	r1, #32
 8009e98:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8009e9a:	320c      	adds	r2, #12
 8009e9c:	438b      	bics	r3, r1
 8009e9e:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8009ea0:	6901      	ldr	r1, [r0, #16]
 8009ea2:	ca0c      	ldmia	r2, {r2, r3}
 8009ea4:	68c0      	ldr	r0, [r0, #12]
 8009ea6:	f01b fbb3 	bl	8025610 <fn_08025610>
 8009eaa:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8009eac:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 8009eae:	0001      	movs	r1, r0
 8009eb0:	6220      	str	r0, [r4, #32]
 8009eb2:	035b      	lsls	r3, r3, #13
 8009eb4:	d405      	bmi.n	8009ec2 <fn_08009E8C+0x36>
 8009eb6:	0020      	movs	r0, r4
 8009eb8:	f7ff ff74 	bl	8009da4 <fn_08009DA4>
 8009ebc:	bc70      	pop	{r4, r5, r6}
 8009ebe:	bc01      	pop	{r0}
 8009ec0:	4700      	bx	r0
 8009ec2:	f7fc fe1d 	bl	8006b00 <fn_08006B00>
 8009ec6:	0005      	movs	r5, r0
 8009ec8:	f7fc fe1a 	bl	8006b00 <fn_08006B00>
 8009ecc:	6a23      	ldr	r3, [r4, #32]
 8009ece:	1a29      	subs	r1, r5, r0
 8009ed0:	0549      	lsls	r1, r1, #21
 8009ed2:	18c9      	adds	r1, r1, r3
 8009ed4:	6221      	str	r1, [r4, #32]
 8009ed6:	e7ee      	b.n	8009eb6 <fn_08009E8C+0x2a>
