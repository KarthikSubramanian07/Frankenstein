fn_08005404:
 8005404:	b510      	push	{r4, lr}
 8005406:	2300      	movs	r3, #0
 8005408:	2400      	movs	r4, #0
 800540a:	b082      	sub	sp, #8
 800540c:	000a      	movs	r2, r1
 800540e:	0001      	movs	r1, r0
 8005410:	4668      	mov	r0, sp
 8005412:	9300      	str	r3, [sp, #0]
 8005414:	9401      	str	r4, [sp, #4]
 8005416:	f7ff fed1 	bl	80051bc <fn_080051BC>
 800541a:	b002      	add	sp, #8
 800541c:	bc10      	pop	{r4}
 800541e:	bc01      	pop	{r0}
 8005420:	4700      	bx	r0
 8005422:	46c0      	nop			@ (mov r8, r8)
