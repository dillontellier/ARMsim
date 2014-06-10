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
	sub	sp, sp, #16
	str	r0, [fp, #-12]
	str	r1, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-4]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L3
.L4:
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-4]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r1, r3
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	ldr	r2, [fp, #-4]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r0, r3
	mov	r2, r1
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-8]
	cmp	r3, #20
	ble	.L4
	ldr	r3, [fp, #-4]
	add	r3, r3, #1
	str	r3, [fp, #-4]
.L2:
	ldr	r3, [fp, #-4]
	cmp	r3, #39
	ble	.L5
	mov	r3, #0
	str	r3, [fp, #-4]
	b	.L6
.L7:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-4]
	add	r2, r2, #210
	ldr	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-4]
	add	r2, r2, #210
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-4]
	add	r3, r3, #1
	str	r3, [fp, #-4]
.L6:
	ldr	r3, [fp, #-4]
	cmp	r3, #19
	ble	.L7
	mov	r3, #0
	str	r3, [fp, #-4]
	b	.L8
.L9:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-4]
	add	r2, r2, #230
	ldr	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-4]
	add	r2, r2, #230
	str	r1, [r3, r2, asl #2]
	ldr	r3, [fp, #-4]
	add	r3, r3, #1
	str	r3, [fp, #-4]
.L8:
	ldr	r3, [fp, #-4]
	cmp	r3, #39
	ble	.L9
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	mov	pc, lr
	.size	initGame, .-initGame
	.align	2
	.global	my_strncmp
	.type	my_strncmp, %function
my_strncmp:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-12]
	str	r1, [fp, #-16]
	str	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-4]
	b	.L11
.L15:
	ldr	r3, [fp, #-4]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-4]
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	bcs	.L12
	mvn	r3, #0
	str	r3, [fp, #-8]
	b	.L13
.L12:
	ldr	r3, [fp, #-4]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-4]
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r2, r3
	bls	.L14
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L13
.L14:
	ldr	r3, [fp, #-4]
	add	r3, r3, #1
	str	r3, [fp, #-4]
.L11:
	ldr	r2, [fp, #-4]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L15
.L13:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	mov	pc, lr
	.size	my_strncmp, .-my_strncmp
	.align	2
	.global	my_strcpy
	.type	my_strcpy, %function
my_strcpy:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-4]
.L17:
	ldr	r3, [fp, #-4]
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	ldr	r2, [fp, #-4]
	ldr	r1, [fp, #-12]
	add	r2, r1, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-4]
	add	r3, r3, #1
	str	r3, [fp, #-4]
	ldr	r3, [fp, #-4]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L17
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	mov	pc, lr
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
	b	.L19
.L22:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L20
.L21:
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
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	ldr	r1, [fp, #-8]
	mov	r2, #-1711276032
	mov	r2, r2, asr #22
	mov	r3, r1
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r3, r3, asl #2
	sub	ip, fp, #4
	add	r1, ip, r3
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	add	r3, r3, r2
	mov	r2, r0
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L20:
	ldr	r3, [fp, #-12]
	cmp	r3, #19
	ble	.L21
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L19:
	ldr	r3, [fp, #-8]
	cmp	r3, #19
	ble	.L22
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L23
.L24:
	ldr	r3, [fp, #-576]
	ldr	r2, [fp, #-8]
	add	r2, r2, #230
	ldr	r2, [r3, r2, asl #2]
	ldr	r1, [fp, #-8]
	mov	r3, #-1191182336
	mov	r3, r3, asr #21
	mov	r1, r1, asl #2
	sub	r0, fp, #4
	add	r1, r0, r1
	add	r3, r1, r3
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L23:
	ldr	r3, [fp, #-8]
	cmp	r3, #39
	ble	.L24
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L25
.L33:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L26
.L30:
	ldr	r2, [fp, #-12]
	mov	r3, #-1191182336
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L34
.L27:
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	ldr	r3, .L35
	add	r1, r2, r3
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	sub	r2, fp, #412
	add	r2, r2, r3
	ldr	r3, [fp, #-580]
	add	r3, r3, #1
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	my_strncmp
	mov	r3, r0
	cmp	r3, #0
	bne	.L28
	ldr	r2, [fp, #-12]
	mov	r3, #-1191182336
	mov	r3, r3, asr #21
	mov	r2, r2, asl #2
	sub	ip, fp, #4
	add	r2, ip, r2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #0]
	b	.L29
.L34:
	mov	r0, r0	@ nop
.L28:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L26:
	ldr	r3, [fp, #-12]
	cmp	r3, #39
	ble	.L30
.L29:
	ldr	r3, [fp, #-12]
	cmp	r3, #39
	ble	.L31
	mov	r3, #0
	b	.L32
.L31:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L25:
	ldr	r3, [fp, #-8]
	cmp	r3, #19
	ble	.L33
	mov	r3, #1
.L32:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L36:
	.align	2
.L35:
	.word	g_mainSetting
	.size	CheckConstraint, .-CheckConstraint
	.align	2
	.global	SolveGame
	.type	SolveGame, %function
SolveGame:
	@ args = 0, pretend = 0, frame = 1092
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #1088
	sub	sp, sp, #4
	str	r0, [fp, #-1092]
	str	r1, [fp, #-1096]
	ldr	r3, [fp, #-1096]
	cmp	r3, #20
	bne	.L38
	mov	r3, #1
	b	.L39
.L38:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L40
.L43:
	ldr	r3, [fp, #-1092]
	ldr	r2, [fp, #-8]
	add	r2, r2, #230
	ldr	r3, [r3, r2, asl #2]
	cmp	r3, #0
	beq	.L41
	sub	r3, fp, #1072
	sub	r3, r3, #4
	sub	r3, r3, #12
	ldr	r0, [fp, #-1092]
	mov	r1, r3
	bl	initGame
	ldr	r3, [fp, #-1096]
	add	r2, r3, #210
	mvn	r3, #1072
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r2, r3, #230
	mvn	r3, #1072
	sub	r3, r3, #11
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r2, [fp, #-1096]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	sub	r3, fp, #1072
	sub	r3, r3, #4
	sub	r3, r3, #12
	add	r1, r3, r2
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r2, r3, r2
	ldr	r3, .L45
	add	r3, r2, r3
	mov	r0, r1
	mov	r1, r3
	bl	my_strcpy
	sub	r3, fp, #1072
	sub	r3, r3, #4
	sub	r3, r3, #12
	mov	r0, r3
	ldr	r1, [fp, #-1096]
	bl	CheckConstraint
	mov	r3, r0
	cmp	r3, #0
	beq	.L44
.L42:
	ldr	r3, [fp, #-1096]
	add	r2, r3, #1
	sub	r3, fp, #1072
	sub	r3, r3, #4
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, r2
	bl	SolveGame
	mov	r3, r0
	cmp	r3, #0
	beq	.L41
	mov	r3, #1
	b	.L39
.L44:
	mov	r0, r0	@ nop
.L41:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L40:
	ldr	r3, [fp, #-8]
	cmp	r3, #39
	ble	.L43
	mov	r3, #0
.L39:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L46:
	.align	2
.L45:
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
	b	.L48
.L49:
	ldr	r3, [fp, #-8]
	add	r2, r3, #230
	mov	r3, #-1140850688
	mov	r3, r3, asr #20
	mov	r2, r2, asl #2
	sub	r1, fp, #4
	add	r2, r1, r2
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L48:
	ldr	r3, [fp, #-8]
	cmp	r3, #39
	ble	.L49
	sub	r3, fp, #1088
	sub	r3, r3, #4
	mov	r0, r3
	mov	r1, #0
	bl	SolveGame
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 4.6.3"
