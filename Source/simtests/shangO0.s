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
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"shang.c"
	.global	g_mainSetting
	.data
	.align	2
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
	.text
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L3
.L4:
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	add	r3, r1, r3
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	add	r3, r0, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r3, [fp, #-12]
	cmp	r3, #20
	ble	.L4
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #39
	ble	.L5
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L7:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	add	r2, r2, #210
	ldr	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	add	r2, r2, #210
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-8]
	cmp	r3, #19
	ble	.L7
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L8
.L9:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	add	r2, r2, #230
	ldr	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	add	r2, r2, #230
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L8:
	ldr	r3, [fp, #-8]
	cmp	r3, #39
	ble	.L9
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	initGame, .-initGame
	.align	2
	.global	my_strncmp
	.type	my_strncmp, %function
my_strncmp:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L11
.L15:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	ldr	r1, [fp, #-20]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bcs	.L12
	mvn	r3, #0
	str	r3, [fp, #-12]
	b	.L13
.L12:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	ldr	r1, [fp, #-20]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bls	.L14
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L13
.L14:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L11:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L15
.L13:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	my_strncmp, .-my_strncmp
	.align	2
	.global	my_strcpy
	.type	my_strcpy, %function
my_strcpy:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
.L18:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-20]
	add	r2, r1, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L18
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	my_strcpy, .-my_strcpy
	.align	2
	.global	CheckConstraint
	.type	CheckConstraint, %function
CheckConstraint:
	@ args = 0, pretend = 0, frame = 576
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #576
	str	r0, [fp, #-576]
	str	r1, [fp, #-580]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L20
.L23:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L21
.L22:
	ldr	r1, [fp, #-576]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r1, r3
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r2, [fp, #-8]
	ldr	r0, .L36
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	sub	ip, fp, #4
	add	r2, ip, r3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	add	r3, r3, r0
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L21:
	ldr	r3, [fp, #-12]
	cmp	r3, #19
	ble	.L22
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L20:
	ldr	r3, [fp, #-8]
	cmp	r3, #19
	ble	.L23
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L24
.L25:
	ldr	r3, [fp, #-576]
	ldr	r2, [fp, #-8]
	add	r2, r2, #230
	ldr	r2, [r3, r2, asl #2]
	ldr	r1, [fp, #-8]
	ldr	r3, .L36+4
	mov	r1, r1, asl #2
	sub	r0, fp, #4
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-8]
	cmp	r3, #39
	ble	.L25
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L26
.L34:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L27
.L31:
	ldr	r2, [fp, #-12]
	ldr	r3, .L36+4
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L28
	b	.L29
.L28:
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	ldr	r3, .L36+8
	add	r1, r2, r3
	sub	r0, fp, #412
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r0, r3
	ldr	r3, [fp, #-580]
	add	r3, r3, #1
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	my_strncmp
	mov	r3, r0
	cmp	r3, #0
	bne	.L29
	ldr	r2, [fp, #-12]
	ldr	r3, .L36+4
	mov	r2, r2, asl #2
	sub	ip, fp, #4
	add	r2, ip, r2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	b	.L30
.L29:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L27:
	ldr	r3, [fp, #-12]
	cmp	r3, #39
	ble	.L31
.L30:
	ldr	r3, [fp, #-12]
	cmp	r3, #39
	ble	.L32
	mov	r3, #0
	b	.L35
.L32:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L26:
	ldr	r3, [fp, #-8]
	cmp	r3, #19
	ble	.L34
	mov	r3, #1
.L35:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L37:
	.align	2
.L36:
	.word	-408
	.word	-568
	.word	g_mainSetting
	.size	CheckConstraint, .-CheckConstraint
	.align	2
	.global	SolveGame
	.type	SolveGame, %function
SolveGame:
	@ args = 0, pretend = 0, frame = 1096
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #1088
	sub	sp, sp, #8
	str	r0, [fp, #-1096]
	str	r1, [fp, #-1100]
	ldr	r3, [fp, #-1100]
	cmp	r3, #20
	bne	.L39
	mov	r3, #1
	b	.L40
.L39:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L41
.L45:
	ldr	r3, [fp, #-1096]
	ldr	r2, [fp, #-8]
	add	r2, r2, #230
	ldr	r3, [r3, r2, asl #2]
	cmp	r3, #0
	beq	.L42
	sub	r3, fp, #1072
	sub	r3, r3, #4
	sub	r3, r3, #12
	ldr	r0, [fp, #-1096]
	mov	r1, r3
	bl	initGame
	ldr	r3, [fp, #-1100]
	add	r2, r3, #210
	ldr	r3, .L46
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r2, r3, #230
	ldr	r3, .L46
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	sub	r1, fp, #1072
	sub	r1, r1, #4
	sub	r1, r1, #12
	ldr	r2, [fp, #-1100]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	add	r1, r1, r2
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	ldr	r3, .L46+4
	add	r3, r2, r3
	mov	r0, r1
	mov	r1, r3
	bl	my_strcpy
	sub	r3, fp, #1072
	sub	r3, r3, #4
	sub	r3, r3, #12
	mov	r0, r3
	ldr	r1, [fp, #-1100]
	bl	CheckConstraint
	mov	r3, r0
	cmp	r3, #0
	beq	.L42
	ldr	r3, [fp, #-1100]
	add	r2, r3, #1
	sub	r3, fp, #1072
	sub	r3, r3, #4
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, r2
	bl	SolveGame
	mov	r3, r0
	cmp	r3, #0
	beq	.L42
	mov	r3, #1
	b	.L40
.L42:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L41:
	ldr	r3, [fp, #-8]
	cmp	r3, #39
	ble	.L45
	mov	r3, #0
.L40:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L47:
	.align	2
.L46:
	.word	-1084
	.word	g_mainSetting
	.size	SolveGame, .-SolveGame
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1088
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #1088
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L49
.L50:
	ldr	r3, [fp, #-8]
	add	r2, r3, #230
	ldr	r3, .L52
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L49:
	ldr	r3, [fp, #-8]
	cmp	r3, #39
	ble	.L50
	sub	r3, fp, #1088
	sub	r3, r3, #4
	mov	r0, r3
	mov	r1, #0
	bl	SolveGame
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, pc}
.L53:
	.align	2
.L52:
	.word	-1088
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.2 20131219 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
