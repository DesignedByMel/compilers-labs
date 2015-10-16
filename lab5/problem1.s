	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI0_0:
	.long	1092825907              ## float 10.1999998
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$10, %eax
	movss	LCPI0_0(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%eax, %edi
	callq	_floatfunc
	leaq	L_.str(%rip), %rdi
	cvtss2sd	%xmm0, %xmm0
	movb	$1, %al
	callq	_printf
	movl	$6, %ecx
	movl	%ecx, %edi
	movl	%ecx, %esi
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	callq	_ackermann
	leaq	L_.str1(%rip), %rdi
	movl	%eax, %esi
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_floatfunc
	.align	4, 0x90
_floatfunc:                             ## @floatfunc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movss	%xmm0, -8(%rbp)
	cvtsi2ssl	-4(%rbp), %xmm0
	movss	%xmm0, -12(%rbp)
	cvtss2sd	-8(%rbp), %xmm0
	cvtsi2sdl	-4(%rbp), %xmm1
	callq	_pow
	cvtss2sd	-12(%rbp), %xmm1
	mulsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	cvtss2sd	-8(%rbp), %xmm0
	callq	_sin
	cvtss2sd	-12(%rbp), %xmm1
	subsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	movss	%xmm0, -12(%rbp)
	movss	-12(%rbp), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_ackermann
	.align	4, 0x90
_ackermann:                             ## @ackermann
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpl	$0, -8(%rbp)
	jne	LBB2_2
## BB#1:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB2_5
LBB2_2:
	cmpl	$0, -12(%rbp)
	jne	LBB2_4
## BB#3:
	movl	$1, %esi
	movl	-8(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	callq	_ackermann
	movl	%eax, -4(%rbp)
	jmp	LBB2_5
LBB2_4:
	movl	-8(%rbp), %eax
	subl	$1, %eax
	movl	-8(%rbp), %edi
	movl	-12(%rbp), %ecx
	subl	$1, %ecx
	movl	%ecx, %esi
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	callq	_ackermann
	movl	-16(%rbp), %edi         ## 4-byte Reload
	movl	%eax, %esi
	callq	_ackermann
	movl	%eax, -4(%rbp)
LBB2_5:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"floatfunc: %f\n"

L_.str1:                                ## @.str1
	.asciz	"ackermann: %i\n"


.subsections_via_symbols
