	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"shang.c"
	.text
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7}
	mov	ip, r1
	add	r6, r0, #4
	add	r5, r1, #4
	mov	r2, r0
	mov	r7, #40
	b	.L2
.L6:
	ldr	r3, [r2]
	str	r3, [ip]
	ldr	r3, [r6]
	str	r3, [r5]
	ldr	r3, [r2, #8]
	str	r3, [ip, #8]
	ldr	r3, [r2, #12]
	str	r3, [ip, #12]
	ldr	r3, [r2, #16]
	str	r3, [ip, #16]
	ldrb	r3, [r2, #20]	@ zero_extendqisi2
	strb	r3, [ip, #20]
.L3:
	subs	r7, r7, #1
	add	r2, r2, #21
	add	ip, ip, #21
	add	r6, r6, #21
	add	r5, r5, #21
	beq	.L5
.L2:
	orr	r3, r2, ip
	tst	r3, #3
	movne	r4, #0
	moveq	r4, #1
	cmp	ip, r6
	cmpcc	r2, r5
	movcc	r3, #0
	movcs	r3, #1
	ands	r3, r4, r3
	bne	.L6
.L4:
	ldrb	r4, [r2, r3]	@ zero_extendqisi2
	strb	r4, [ip, r3]
	add	r3, r3, #1
	cmp	r3, #21
	bne	.L4
	b	.L3
.L5:
	mov	ip, r1
	mov	r2, r0
	mov	r3, #20
.L9:
	ldr	r4, [r2, #840]
	subs	r3, r3, #1
	str	r4, [ip, #840]
	add	r2, r2, #4
	add	ip, ip, #4
	bne	.L9
	add	r0, r0, #916
	add	r2, r1, #916
	mov	r3, #40
.L11:
	ldr	r1, [r0, #4]!
	subs	r3, r3, #1
	str	r1, [r2, #4]!
	bne	.L11
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
	.size	initGame, .-initGame
	.align	2
	.global	my_strncmp
	.type	my_strncmp, %function
my_strncmp:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	str	r4, [sp, #-4]!
	ble	.L25
	ldrb	r4, [r0]	@ zero_extendqisi2
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r4, r3
	bcc	.L28
	bhi	.L29
	sub	ip, r0, #1
	add	ip, ip, r2
	b	.L23
.L24:
	ldrb	r2, [r0, #1]!	@ zero_extendqisi2
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L28
	bhi	.L29
.L23:
	cmp	r0, ip
	bne	.L24
.L25:
	mov	r0, #0
	ldr	r4, [sp], #4
	bx	lr
.L28:
	mvn	r0, #0
	ldr	r4, [sp], #4
	bx	lr
.L29:
	mov	r0, #1
	ldr	r4, [sp], #4
	bx	lr
	.size	my_strncmp, .-my_strncmp
	.align	2
	.global	my_strcpy
	.type	my_strcpy, %function
my_strcpy:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
.L32:
	ldrb	r2, [r1, r3]	@ zero_extendqisi2
	strb	r2, [r0, r3]
	add	r3, r3, #1
	ldrb	r2, [r1, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L32
	bx	lr
	.size	my_strcpy, .-my_strcpy
	.align	2
	.global	CheckConstraint
	.type	CheckConstraint, %function
CheckConstraint:
	@ args = 0, pretend = 0, frame = 560
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #560
	add	r6, sp, #556
	mov	r5, r1
	mov	lr, r0
	add	r4, sp, #159
	add	r6, r6, #3
.L34:
	mov	r2, r4
	mov	r3, #0
.L37:
	ldrb	ip, [lr, r3]	@ zero_extendqisi2
	add	r3, r3, #21
	cmp	r3, #420
	strb	ip, [r2, #1]!
	bne	.L37
	add	r4, r4, #20
	cmp	r4, r6
	add	lr, lr, #1
	bne	.L34
	add	r1, r0, #920
	mov	r2, #160
	mov	r0, sp
	bl	memcpy
	add	r3, sp, #160
	add	r10, sp, #560
	mov	r8, r3
	mov	r9, #0
.L38:
	ldr	r6, .L53
	sub	r7, sp, #4
	mov	r1, #0
.L45:
	ldr	r3, [r7, #4]!
	cmp	r3, #0
	beq	.L39
	cmp	r5, #0
	blt	.L40
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L39
	mov	r0, r8
	mov	r2, r6
	mov	r3, #0
	b	.L41
.L42:
	ldrb	r4, [r2, #1]!	@ zero_extendqisi2
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	r4, ip
	bne	.L39
.L41:
	add	r3, r3, #1
	cmp	r5, r3
	bge	.L42
.L40:
	add	r3, sp, #560
	add	r1, r3, r1, asl #2
	add	r8, r8, #20
	cmp	r8, r10
	str	r9, [r1, #-560]
	bne	.L38
	mov	r0, #1
	add	sp, sp, #560
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L39:
	add	r1, r1, #1
	cmp	r1, #40
	add	r6, r6, #21
	bne	.L45
	mov	r0, #0
	add	sp, sp, #560
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.size	CheckConstraint, .-CheckConstraint
	.align	2
	.global	SolveGame
	.type	SolveGame, %function
SolveGame:
	@ args = 0, pretend = 0, frame = 1664
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r1, #20
	sub	sp, sp, #1664
	sub	sp, sp, #4
	mov	r6, r1
	mov	r10, r0
	beq	.L78
	add	r3, r1, r1, asl #1
	add	r9, sp, #584
	ldr	ip, .L92
	rsb	r3, r3, r3, asl #3
	add	r3, r9, r3
	str	ip, [sp, #8]
	str	r3, [sp, #20]
	mov	ip, #0
	add	r3, r0, #916
	str	r9, [sp, #12]
	str	r3, [sp, #16]
	str	ip, [sp, #4]
	b	.L74
.L57:
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #8]
	add	r3, r3, #1
	str	r3, [sp, #4]
	cmp	r3, #40
	ldr	r3, [sp, #12]
	add	ip, ip, #21
	add	r3, r3, #4
	str	ip, [sp, #8]
	str	r3, [sp, #12]
	beq	.L91
.L74:
	ldr	ip, [sp, #16]
	ldr	r3, [ip, #4]!
	cmp	r3, #0
	str	ip, [sp, #16]
	beq	.L57
	mov	r2, #0
.L58:
	add	r3, r10, r2
	add	r1, r9, r2
	ldr	r0, [r3]	@ unaligned
	ldr	r4, [r3, #4]	@ unaligned
	ldr	lr, [r3, #8]	@ unaligned
	ldr	ip, [r3, #12]	@ unaligned
	str	r0, [r9, r2]	@ unaligned
	str	r4, [r1, #4]	@ unaligned
	str	lr, [r1, #8]	@ unaligned
	str	ip, [r1, #12]	@ unaligned
	ldr	r0, [r3, #16]	@ unaligned
	add	r2, r2, #21
	str	r0, [r1, #16]	@ unaligned
	ldrb	r3, [r3, #20]	@ zero_extendqisi2
	cmp	r2, #840
	strb	r3, [r1, #20]
	bne	.L58
	add	r1, r10, #840
	mov	r2, #80
	add	r0, sp, #1424
	bl	memcpy
	add	r1, r10, #920
	mov	r2, #160
	add	r0, sp, #1504
	bl	memcpy
	ldr	ip, [sp, #20]
	ldr	r3, [sp, #8]
	add	lr, sp, #1664
	sub	r1, ip, #1
	add	ip, lr, r6, asl #2
	ldr	lr, [sp, #4]
	ldrb	r0, [r3]	@ zero_extendqisi2
	str	lr, [ip, #-240]
	ldr	ip, [sp, #12]
	mov	r2, r3
	mov	r3, #0
	str	r3, [ip, #920]
.L62:
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	strb	r0, [r1, #1]!
	subs	r0, r3, #0
	bne	.L62
	add	lr, sp, #580
	add	lr, lr, #3
	add	ip, sp, #183
	mov	r0, r9
.L61:
	mov	r2, ip
	mov	r3, #0
.L65:
	ldrb	r1, [r0, r3]	@ zero_extendqisi2
	add	r3, r3, #21
	cmp	r3, #420
	strb	r1, [r2, #1]!
	bne	.L65
	add	ip, ip, #20
	cmp	ip, lr
	add	r0, r0, #1
	bne	.L61
	add	r0, sp, #24
	add	r1, sp, #1504
	mov	r2, #160
	bl	memcpy
	add	ip, sp, #184
	add	fp, sp, #584
	mov	r8, ip
.L66:
	ldr	r5, .L92
	add	r7, sp, #20
	mov	r4, #0
.L73:
	ldr	r3, [r7, #4]!
	cmp	r3, #0
	beq	.L67
	cmp	r6, #0
	blt	.L68
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L67
	mov	r1, r8
	mov	r2, r5
	mov	r3, #0
	b	.L69
.L70:
	ldrb	ip, [r2, #1]!	@ zero_extendqisi2
	ldrb	r0, [r1, #1]!	@ zero_extendqisi2
	cmp	ip, r0
	bne	.L67
.L69:
	add	r3, r3, #1
	cmp	r6, r3
	bge	.L70
.L68:
	add	ip, sp, #1664
	add	r4, ip, r4, asl #2
	add	r8, r8, #20
	mov	r2, #0
	cmp	r8, fp
	str	r2, [r4, #-1640]
	bne	.L66
	mov	r0, r9
	add	r1, r6, #1
	bl	SolveGame
	cmp	r0, #0
	beq	.L57
.L78:
	mov	r0, #1
	add	sp, sp, #1664
	add	sp, sp, #4
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L67:
	add	r4, r4, #1
	cmp	r4, #40
	add	r5, r5, #21
	bne	.L73
	b	.L57
.L91:
	mov	r0, #0
	add	sp, sp, #1664
	add	sp, sp, #4
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	.size	SolveGame, .-SolveGame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1080
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #1072
	sub	sp, sp, #12
	add	r1, sp, #1072
	add	r3, sp, #916
	add	r1, r1, #4
	mov	r2, #1
.L96:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L96
	mov	r0, sp
	mov	r1, #0
	bl	SolveGame
	add	sp, sp, #1072
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.size	main, .-main
	.global	g_mainSetting
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	g_mainSetting, %object
	.size	g_mainSetting, 840
g_mainSetting:
	.ascii	"                   *\000"
	.ascii	"                  **\000"
	.ascii	"       *     *  *   \000"
	.ascii	"           *   ***  \000"
	.ascii	"*   *          *  * \000"
	.ascii	"           **    * *\000"
	.ascii	"  * **  *     *     \000"
	.ascii	"            *****   \000"
	.ascii	"   **    *   * *    \000"
	.ascii	"          * *   *** \000"
	.ascii	" * *   *   *  *     \000"
	.ascii	"      **    * *  *  \000"
	.ascii	"  *  *  *     * *   \000"
	.ascii	"          *  *  ** *\000"
	.ascii	" ***   *         *  \000"
	.ascii	" *  * * *   * *     \000"
	.ascii	"   **  * *    * *   \000"
	.ascii	"  *****           * \000"
	.ascii	"  *  *   * **  *    \000"
	.ascii	"    *  *  * * * *   \000"
	.ascii	"         * ***   ** \000"
	.ascii	"     ** *  *   * *  \000"
	.ascii	"        *** * *   * \000"
	.ascii	"  ***   *  *  *     \000"
	.ascii	"       *  ** * *  * \000"
	.ascii	"   ** * * *  * *    \000"
	.ascii	"    *  *  * *** *   \000"
	.ascii	"*****         *    *\000"
	.ascii	"   **    * * ***    \000"
	.ascii	"*  * * ***    *     \000"
	.ascii	"         ***  ** * *\000"
	.ascii	"     ** *   ** * *  \000"
	.ascii	"***   * *      ***  \000"
	.ascii	"      **   ** *** * \000"
	.ascii	" * * **  *** *      \000"
	.ascii	"* *** ***   **      \000"
	.ascii	"        *** * ** ***\000"
	.ascii	" **** **       ***  \000"
	.ascii	"**   *** *   **  ** \000"
	.ascii	"*   * * *****  **  *\000"
	.ident	"GCC: (GNU) 4.8.2 20131219 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
