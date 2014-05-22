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
	.eabi_attribute 30, 1
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
	stmfd	sp!, {r4, r5, r6, r7, r8}
	mov	r7, #0
	mov	r8, r7
	b	.L2
.L5:
	mov	r5, r0
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	mov	r6, r1
	strb	r2, [ip, r3]
	add	r3, r3, #1
	cmp	r3, #21
	bne	.L5
	add	r7, r7, #21
	cmp	r7, #840
	beq	.L4
.L2:
	mov	r3, r8
	add	r4, r7, r0
	add	ip, r7, r1
	b	.L5
.L4:
	mov	r3, #20
.L7:
	ldr	r2, [r5, #840]
	str	r2, [r6, #840]
	add	r5, r5, #4
	add	r6, r6, #4
	subs	r3, r3, #1
	bne	.L7
	add	r0, r0, #916
	add	r1, r1, #916
	mov	r3, #0
.L9:
	ldr	r2, [r0, #4]!
	str	r2, [r1, #4]!
	add	r3, r3, #1
	cmp	r3, #40
	bne	.L9
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
	.size	initGame, .-initGame
	.align	2
	.global	my_strncmp
	.type	my_strncmp, %function
my_strncmp:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	cmp	r2, #0
	ble	.L17
	ldrb	r4, [r0]	@ zero_extendqisi2
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r4, r3
	bcc	.L18
	bhi	.L19
	mov	r3, r0
	sub	ip, r0, #1
	add	ip, ip, r2
	b	.L15
.L16:
	ldrb	r0, [r3, #1]!	@ zero_extendqisi2
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	cmp	r0, r2
	bcc	.L20
	bhi	.L21
.L15:
	cmp	r3, ip
	bne	.L16
	mov	r0, #0
	b	.L14
.L17:
	mov	r0, #0
	b	.L14
.L18:
	mvn	r0, #0
	b	.L14
.L19:
	mov	r0, #1
	b	.L14
.L20:
	mvn	r0, #0
	b	.L14
.L21:
	mov	r0, #1
.L14:
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
.L24:
	ldrb	r2, [r1, r3]	@ zero_extendqisi2
	strb	r2, [r0, r3]
	add	r3, r3, #1
	ldrb	r2, [r1, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L24
	bx	lr
	.size	my_strcpy, .-my_strcpy
	.align	2
	.global	CheckConstraint
	.type	CheckConstraint, %function
CheckConstraint:
	@ args = 0, pretend = 0, frame = 560
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #564
	add	r7, sp, #160
	sub	r5, r7, #1
	mov	r4, r0
	add	r8, sp, #556
	add	r8, r8, #3
	mov	r6, #0
	b	.L26
.L29:
	ldrb	ip, [r4, r3]	@ zero_extendqisi2
	strb	ip, [r2, #1]!
	add	r3, r3, #21
	cmp	r3, #420
	bne	.L29
	add	r5, r5, #20
	add	r4, r4, #1
	cmp	r5, r8
	beq	.L28
.L26:
	mov	r2, r5
	mov	r3, r6
	b	.L29
.L28:
	add	r2, r0, #916
	add	ip, sp, #156
	sub	r3, sp, #4
.L32:
	ldr	r0, [r2, #4]!
	str	r0, [r3, #4]!
	cmp	r3, ip
	bne	.L32
	add	fp, r7, #400
	ldr	r10, .L41
	mov	r9, #0
	add	r8, r1, #1
	b	.L31
.L37:
	ldr	r3, [r6, #4]!
	cmp	r3, #0
	beq	.L33
	mov	r0, r5
	mov	r1, r7
	mov	r2, r8
	bl	my_strncmp
	cmp	r0, #0
	bne	.L33
	add	r2, sp, #560
	add	r3, r2, r4, asl #2
	str	r9, [r3, #-560]
	cmp	r4, #39
	ble	.L40
	b	.L34
.L33:
	add	r4, r4, #1
	add	r5, r5, #21
	cmp	r4, #40
	bne	.L37
	mov	r0, #0
	b	.L34
.L40:
	add	r7, r7, #20
	cmp	r7, fp
	beq	.L38
.L31:
	mov	r5, r10
	sub	r6, sp, #4
	mov	r4, r9
	b	.L37
.L38:
	mov	r0, #1
.L34:
	add	sp, sp, #564
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.size	CheckConstraint, .-CheckConstraint
	.align	2
	.global	SolveGame
	.type	SolveGame, %function
SolveGame:
	@ args = 0, pretend = 0, frame = 1080
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #1072
	sub	sp, sp, #8
	mov	r9, r0
	mov	r8, r1
	cmp	r1, #20
	moveq	r0, #1
	beq	.L44
	add	r7, r9, #916
	mov	r6, sp
	ldr	r5, .L51
	mov	r4, #0
	add	r3, sp, #1072
	add	r3, r3, #8
	add	r10, r3, r1, asl #2
	sub	r10, r10, #240
.L48:
	ldr	r3, [r7, #4]!
	cmp	r3, #0
	beq	.L45
	mov	r0, r9
	mov	r1, sp
	bl	initGame
	str	r4, [r10]
	mov	r3, #0
	str	r3, [r6, #920]
	add	r0, r8, r8, asl #1
	rsb	r0, r0, r0, asl #3
	add	r3, sp, r3
	add	r0, r3, r0
	mov	r1, r5
	bl	my_strcpy
	mov	r0, sp
	mov	r1, r8
	bl	CheckConstraint
	cmp	r0, #0
	beq	.L45
	mov	r0, sp
	add	r1, r8, #1
	bl	SolveGame
	cmp	r0, #0
	movne	r0, #1
	bne	.L44
.L45:
	add	r4, r4, #1
	add	r6, r6, #4
	add	r5, r5, #21
	cmp	r4, #40
	bne	.L48
	b	.L50
.L50:
	mov	r0, #0
.L44:
	add	sp, sp, #1072
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L52:
	.align	2
.L51:
	.word	.LANCHOR0
	.size	SolveGame, .-SolveGame
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1080
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #1072
	sub	sp, sp, #12
	add	r1, sp, #8
	add	r3, sp, #916
	add	r2, r1, #1056
	add	r2, r2, #12
	mov	r1, #1
.L55:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L55
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
