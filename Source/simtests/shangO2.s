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
	stmfd	sp!, {r4, r5}
	mov	r5, #0
.L2:
	mov	r3, #0
	add	r4, r5, r0
	add	ip, r5, r1
.L5:
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	strb	r2, [ip, r3]
	add	r3, r3, #1
	cmp	r3, #21
	bne	.L5
	add	r5, r5, #21
	cmp	r5, #840
	bne	.L2
	mov	r4, r1
	mov	ip, r0
	mov	r3, #20
.L7:
	ldr	r2, [ip, #840]
	subs	r3, r3, #1
	str	r2, [r4, #840]
	add	ip, ip, #4
	add	r4, r4, #4
	bne	.L7
	add	r0, r0, #916
	add	r2, r1, #916
	mov	r3, #40
.L9:
	ldr	r1, [r0, #4]!
	subs	r3, r3, #1
	str	r1, [r2, #4]!
	bne	.L9
	ldmfd	sp!, {r4, r5}
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
	ble	.L18
	ldrb	r4, [r0]	@ zero_extendqisi2
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r4, r3
	bcc	.L21
	bhi	.L22
	sub	ip, r0, #1
	add	ip, ip, r2
	b	.L16
.L17:
	ldrb	r2, [r0, #1]!	@ zero_extendqisi2
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L21
	bhi	.L22
.L16:
	cmp	r0, ip
	bne	.L17
.L18:
	mov	r0, #0
	ldr	r4, [sp], #4
	bx	lr
.L21:
	mvn	r0, #0
	ldr	r4, [sp], #4
	bx	lr
.L22:
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
	ldrb	r3, [r1]	@ zero_extendqisi2
	sub	r0, r0, #1
.L25:
	strb	r3, [r0, #1]!
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L25
	bx	lr
	.size	my_strcpy, .-my_strcpy
	.align	2
	.global	CheckConstraint
	.type	CheckConstraint, %function
CheckConstraint:
	@ args = 0, pretend = 0, frame = 560
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10}
	sub	sp, sp, #564
	add	r6, sp, #556
	mov	r4, r0
	add	r5, sp, #159
	add	r6, r6, #3
.L27:
	mov	r2, r5
	mov	r3, #0
.L30:
	ldrb	ip, [r4, r3]	@ zero_extendqisi2
	add	r3, r3, #21
	cmp	r3, #420
	strb	ip, [r2, #1]!
	bne	.L30
	add	r5, r5, #20
	cmp	r5, r6
	add	r4, r4, #1
	bne	.L27
	add	r2, r0, #916
	sub	r3, sp, #4
	add	ip, sp, #156
.L32:
	ldr	r0, [r2, #4]!
	str	r0, [r3, #4]!
	cmp	r3, ip
	bne	.L32
	add	r3, sp, #160
	add	r10, sp, #560
	mov	r8, r3
	mov	r9, #0
.L40:
	ldr	r6, .L49
	sub	r7, sp, #4
	mov	r5, #0
.L39:
	ldr	r3, [r7, #4]!
	cmp	r3, #0
	beq	.L33
	cmp	r1, #0
	blt	.L34
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L33
	mov	r0, r8
	mov	r2, r6
	mov	r3, #0
	b	.L35
.L36:
	ldrb	r4, [r2, #1]!	@ zero_extendqisi2
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	r4, ip
	bne	.L33
.L35:
	add	r3, r3, #1
	cmp	r1, r3
	bge	.L36
.L34:
	add	r3, sp, #560
	add	r5, r3, r5, asl #2
	add	r8, r8, #20
	cmp	r8, r10
	str	r9, [r5, #-560]
	bne	.L40
	mov	r0, #1
	add	sp, sp, #564
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10}
	bx	lr
.L33:
	add	r5, r5, #1
	cmp	r5, #40
	add	r6, r6, #21
	bne	.L39
	mov	r0, #0
	add	sp, sp, #564
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10}
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.size	CheckConstraint, .-CheckConstraint
	.align	2
	.global	SolveGame
	.type	SolveGame, %function
SolveGame:
	@ args = 0, pretend = 0, frame = 1080
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r1, #20
	sub	sp, sp, #1072
	sub	sp, sp, #12
	mov	r5, r1
	mov	r6, r0
	beq	.L59
	add	r8, r1, r1, asl #1
	add	r3, sp, #0
	rsb	r8, r8, r8, asl #3
	ldr	r9, .L68
	add	r8, r3, r8
	mov	r10, sp
	add	fp, r0, #916
	mov	r4, #0
	add	r7, r1, #210
	b	.L58
.L53:
	add	r4, r4, #1
	cmp	r4, #40
	add	r9, r9, #21
	add	r10, r10, #4
	beq	.L67
.L58:
	ldr	r3, [fp, #4]!
	cmp	r3, #0
	beq	.L53
	mov	r0, r6
	mov	r1, sp
	bl	initGame
	add	lr, sp, #1072
	ldrb	r3, [r9]	@ zero_extendqisi2
	add	lr, lr, #8
	add	r0, lr, r7, asl #2
	sub	ip, r8, #1
	mov	r2, r9
	mov	r1, #0
	str	r4, [r0, #-1080]
	str	r1, [r10, #920]
.L55:
	strb	r3, [ip, #1]!
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L55
	mov	r0, sp
	mov	r1, r5
	bl	CheckConstraint
	cmp	r0, #0
	beq	.L53
	mov	r0, sp
	add	r1, r5, #1
	bl	SolveGame
	cmp	r0, #0
	beq	.L53
.L59:
	mov	r0, #1
	add	sp, sp, #1072
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L67:
	mov	r0, #0
	add	sp, sp, #1072
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L69:
	.align	2
.L68:
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
.L72:
	str	r2, [r3, #4]!
	cmp	r3, r1
	bne	.L72
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
