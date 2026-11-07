fn_030017D0:
 30017d0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
 30017d4:	e590e004 	ldr	lr, [r0, #4]
 30017d8:	e5906008 	ldr	r6, [r0, #8]
 30017dc:	e046600e 	sub	r6, r6, lr
 30017e0:	e2866001 	add	r6, r6, #1
 30017e4:	e3560000 	cmp	r6, #0
 30017e8:	da00009a 	ble	3001a58 <fn_030017D0+0x288>
 30017ec:	e5903010 	ldr	r3, [r0, #16]
 30017f0:	e590c00c 	ldr	ip, [r0, #12]
 30017f4:	e5904000 	ldr	r4, [r0]
 30017f8:	e2801014 	add	r1, r0, #20
 30017fc:	e24e0040 	sub	r0, lr, #64	@ 0x40
 3001800:	e020309c 	mla	r0, ip, r0, r3
 3001804:	e59f3254 	ldr	r3, [pc, #596]	@ 3001a60 <fn_030017D0+0x290>
 3001808:	e5935000 	ldr	r5, [r3]
 300180c:	e1a0318e 	lsl	r3, lr, #3
 3001810:	e063338e 	rsb	r3, r3, lr, lsl #7
 3001814:	e0833004 	add	r3, r3, r4
 3001818:	e1b07246 	asrs	r7, r6, #4
 300181c:	e8910006 	ldm	r1, {r1, r2}
 3001820:	e1a00480 	lsl	r0, r0, #9
 3001824:	e0855083 	add	r5, r5, r3, lsl #1
 3001828:	0a000047 	beq	300194c <fn_030017D0+0x17c>
 300182c:	e247e001 	sub	lr, r7, #1
 3001830:	e2853c0f 	add	r3, r5, #3840	@ 0xf00
 3001834:	e7d14ca0 	ldrb	r4, [r1, r0, lsr #25]
 3001838:	e7d28004 	ldrb	r8, [r2, r4]
 300183c:	e5438f00 	strb	r8, [r3, #-3840]	@ 0xfffff100
 3001840:	e080048c 	add	r0, r0, ip, lsl #9
 3001844:	e080448c 	add	r4, r0, ip, lsl #9
 3001848:	e7d10ca0 	ldrb	r0, [r1, r0, lsr #25]
 300184c:	e7d20000 	ldrb	r0, [r2, r0]
 3001850:	e5430e10 	strb	r0, [r3, #-3600]	@ 0xfffff1f0
 3001854:	e7d18ca4 	ldrb	r8, [r1, r4, lsr #25]
 3001858:	e7d28008 	ldrb	r8, [r2, r8]
 300185c:	e5438d20 	strb	r8, [r3, #-3360]	@ 0xfffff2e0
 3001860:	e084048c 	add	r0, r4, ip, lsl #9
 3001864:	e080448c 	add	r4, r0, ip, lsl #9
 3001868:	e7d10ca0 	ldrb	r0, [r1, r0, lsr #25]
 300186c:	e7d20000 	ldrb	r0, [r2, r0]
 3001870:	e5430c30 	strb	r0, [r3, #-3120]	@ 0xfffff3d0
 3001874:	e7d18ca4 	ldrb	r8, [r1, r4, lsr #25]
 3001878:	e7d28008 	ldrb	r8, [r2, r8]
 300187c:	e5438b40 	strb	r8, [r3, #-2880]	@ 0xfffff4c0
 3001880:	e084048c 	add	r0, r4, ip, lsl #9
 3001884:	e080448c 	add	r4, r0, ip, lsl #9
 3001888:	e7d10ca0 	ldrb	r0, [r1, r0, lsr #25]
 300188c:	e7d20000 	ldrb	r0, [r2, r0]
 3001890:	e5430a50 	strb	r0, [r3, #-2640]	@ 0xfffff5b0
 3001894:	e7d18ca4 	ldrb	r8, [r1, r4, lsr #25]
 3001898:	e7d28008 	ldrb	r8, [r2, r8]
 300189c:	e5438960 	strb	r8, [r3, #-2400]	@ 0xfffff6a0
 30018a0:	e084048c 	add	r0, r4, ip, lsl #9
 30018a4:	e080448c 	add	r4, r0, ip, lsl #9
 30018a8:	e7d10ca0 	ldrb	r0, [r1, r0, lsr #25]
 30018ac:	e7d20000 	ldrb	r0, [r2, r0]
 30018b0:	e5430870 	strb	r0, [r3, #-2160]	@ 0xfffff790
 30018b4:	e7d18ca4 	ldrb	r8, [r1, r4, lsr #25]
 30018b8:	e7d28008 	ldrb	r8, [r2, r8]
 30018bc:	e5438780 	strb	r8, [r3, #-1920]	@ 0xfffff880
 30018c0:	e084048c 	add	r0, r4, ip, lsl #9
 30018c4:	e080448c 	add	r4, r0, ip, lsl #9
 30018c8:	e7d10ca0 	ldrb	r0, [r1, r0, lsr #25]
 30018cc:	e7d20000 	ldrb	r0, [r2, r0]
 30018d0:	e5430690 	strb	r0, [r3, #-1680]	@ 0xfffff970
 30018d4:	e7d18ca4 	ldrb	r8, [r1, r4, lsr #25]
 30018d8:	e7d28008 	ldrb	r8, [r2, r8]
 30018dc:	e084048c 	add	r0, r4, ip, lsl #9
 30018e0:	e54385a0 	strb	r8, [r3, #-1440]	@ 0xfffffa60
 30018e4:	e080448c 	add	r4, r0, ip, lsl #9
 30018e8:	e7d10ca0 	ldrb	r0, [r1, r0, lsr #25]
 30018ec:	e7d20000 	ldrb	r0, [r2, r0]
 30018f0:	e54304b0 	strb	r0, [r3, #-1200]	@ 0xfffffb50
 30018f4:	e084048c 	add	r0, r4, ip, lsl #9
 30018f8:	e7d14ca4 	ldrb	r4, [r1, r4, lsr #25]
 30018fc:	e7d24004 	ldrb	r4, [r2, r4]
 3001900:	e54343c0 	strb	r4, [r3, #-960]	@ 0xfffffc40
 3001904:	e080848c 	add	r8, r0, ip, lsl #9
 3001908:	e7d10ca0 	ldrb	r0, [r1, r0, lsr #25]
 300190c:	e7d20000 	ldrb	r0, [r2, r0]
 3001910:	e54302d0 	strb	r0, [r3, #-720]	@ 0xfffffd30
 3001914:	e088448c 	add	r4, r8, ip, lsl #9
 3001918:	e7d18ca8 	ldrb	r8, [r1, r8, lsr #25]
 300191c:	e7d28008 	ldrb	r8, [r2, r8]
 3001920:	e54381e0 	strb	r8, [r3, #-480]	@ 0xfffffe20
 3001924:	e084048c 	add	r0, r4, ip, lsl #9
 3001928:	e7d14ca4 	ldrb	r4, [r1, r4, lsr #25]
 300192c:	e24ee001 	sub	lr, lr, #1
 3001930:	e7d24004 	ldrb	r4, [r2, r4]
 3001934:	e37e0001 	cmn	lr, #1
 3001938:	e2833c0f 	add	r3, r3, #3840	@ 0xf00
 300193c:	e5434ff0 	strb	r4, [r3, #-4080]	@ 0xfffff010
 3001940:	1affffbb 	bne	3001834 <fn_030017D0+0x64>
 3001944:	e0677207 	rsb	r7, r7, r7, lsl #4
 3001948:	e0855407 	add	r5, r5, r7, lsl #8
 300194c:	e206600f 	and	r6, r6, #15
 3001950:	e59f310c 	ldr	r3, [pc, #268]	@ 3001a64 <fn_030017D0+0x294>
 3001954:	e2466001 	sub	r6, r6, #1
 3001958:	e356000e 	cmp	r6, #14
 300195c:	8a00003d 	bhi	3001a58 <fn_030017D0+0x288>
 3001960:	e7d36006 	ldrb	r6, [r3, r6]
 3001964:	e08ff106 	add	pc, pc, r6, lsl #2
 3001968:	e1a00000 	nop			@ (mov r0, r0)
 300196c:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 3001970:	e7d23003 	ldrb	r3, [r2, r3]
 3001974:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 3001978:	e080048c 	add	r0, r0, ip, lsl #9
 300197c:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 3001980:	e7d23003 	ldrb	r3, [r2, r3]
 3001984:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 3001988:	e080048c 	add	r0, r0, ip, lsl #9
 300198c:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 3001990:	e7d23003 	ldrb	r3, [r2, r3]
 3001994:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 3001998:	e080048c 	add	r0, r0, ip, lsl #9
 300199c:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 30019a0:	e7d23003 	ldrb	r3, [r2, r3]
 30019a4:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 30019a8:	e080048c 	add	r0, r0, ip, lsl #9
 30019ac:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 30019b0:	e7d23003 	ldrb	r3, [r2, r3]
 30019b4:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 30019b8:	e080048c 	add	r0, r0, ip, lsl #9
 30019bc:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 30019c0:	e7d23003 	ldrb	r3, [r2, r3]
 30019c4:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 30019c8:	e080048c 	add	r0, r0, ip, lsl #9
 30019cc:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 30019d0:	e7d23003 	ldrb	r3, [r2, r3]
 30019d4:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 30019d8:	e080048c 	add	r0, r0, ip, lsl #9
 30019dc:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 30019e0:	e7d23003 	ldrb	r3, [r2, r3]
 30019e4:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 30019e8:	e080048c 	add	r0, r0, ip, lsl #9
 30019ec:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 30019f0:	e7d23003 	ldrb	r3, [r2, r3]
 30019f4:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 30019f8:	e080048c 	add	r0, r0, ip, lsl #9
 30019fc:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 3001a00:	e7d23003 	ldrb	r3, [r2, r3]
 3001a04:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 3001a08:	e080048c 	add	r0, r0, ip, lsl #9
 3001a0c:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 3001a10:	e7d23003 	ldrb	r3, [r2, r3]
 3001a14:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 3001a18:	e080048c 	add	r0, r0, ip, lsl #9
 3001a1c:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 3001a20:	e7d23003 	ldrb	r3, [r2, r3]
 3001a24:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 3001a28:	e080048c 	add	r0, r0, ip, lsl #9
 3001a2c:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 3001a30:	e7d23003 	ldrb	r3, [r2, r3]
 3001a34:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 3001a38:	e080048c 	add	r0, r0, ip, lsl #9
 3001a3c:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 3001a40:	e7d23003 	ldrb	r3, [r2, r3]
 3001a44:	e4c530f0 	strb	r3, [r5], #240	@ 0xf0
 3001a48:	e080048c 	add	r0, r0, ip, lsl #9
 3001a4c:	e7d13ca0 	ldrb	r3, [r1, r0, lsr #25]
 3001a50:	e7d23003 	ldrb	r3, [r2, r3]
 3001a54:	e5c53000 	strb	r3, [r5]
 3001a58:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
 3001a5c:	e12fff1e 	bx	lr
 3001a60:	030064cc 	.word	0x030064cc
 3001a64:	0812f6c3 	.word	0x0812f6c3
