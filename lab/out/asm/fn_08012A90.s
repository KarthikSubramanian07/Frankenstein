fn_08012A90:
 8012a90:	b082      	sub	sp, #8
 8012a92:	2905      	cmp	r1, #5
 8012a94:	d021      	beq.n	8012ada <fn_08012A90+0x4a>
 8012a96:	2805      	cmp	r0, #5
 8012a98:	d022      	beq.n	8012ae0 <fn_08012A90+0x50>
 8012a9a:	2908      	cmp	r1, #8
 8012a9c:	d01d      	beq.n	8012ada <fn_08012A90+0x4a>
 8012a9e:	2808      	cmp	r0, #8
 8012aa0:	d01e      	beq.n	8012ae0 <fn_08012A90+0x50>
 8012aa2:	2903      	cmp	r1, #3
 8012aa4:	d019      	beq.n	8012ada <fn_08012A90+0x4a>
 8012aa6:	2803      	cmp	r0, #3
 8012aa8:	d01a      	beq.n	8012ae0 <fn_08012A90+0x50>
 8012aaa:	2902      	cmp	r1, #2
 8012aac:	d015      	beq.n	8012ada <fn_08012A90+0x4a>
 8012aae:	2802      	cmp	r0, #2
 8012ab0:	d016      	beq.n	8012ae0 <fn_08012A90+0x50>
 8012ab2:	2901      	cmp	r1, #1
 8012ab4:	d011      	beq.n	8012ada <fn_08012A90+0x4a>
 8012ab6:	2801      	cmp	r0, #1
 8012ab8:	d012      	beq.n	8012ae0 <fn_08012A90+0x50>
 8012aba:	2907      	cmp	r1, #7
 8012abc:	d00d      	beq.n	8012ada <fn_08012A90+0x4a>
 8012abe:	2807      	cmp	r0, #7
 8012ac0:	d00e      	beq.n	8012ae0 <fn_08012A90+0x50>
 8012ac2:	2904      	cmp	r1, #4
 8012ac4:	d009      	beq.n	8012ada <fn_08012A90+0x4a>
 8012ac6:	2804      	cmp	r0, #4
 8012ac8:	d00a      	beq.n	8012ae0 <fn_08012A90+0x50>
 8012aca:	3806      	subs	r0, #6
 8012acc:	4243      	negs	r3, r0
 8012ace:	4143      	adcs	r3, r0
 8012ad0:	1f88      	subs	r0, r1, #6
 8012ad2:	1e42      	subs	r2, r0, #1
 8012ad4:	4190      	sbcs	r0, r2
 8012ad6:	4018      	ands	r0, r3
 8012ad8:	e000      	b.n	8012adc <fn_08012A90+0x4c>
 8012ada:	2000      	movs	r0, #0
 8012adc:	b002      	add	sp, #8
 8012ade:	4770      	bx	lr
 8012ae0:	2001      	movs	r0, #1
 8012ae2:	e7fb      	b.n	8012adc <fn_08012A90+0x4c>
