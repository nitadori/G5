	.file	"gravity_avx2.c"
	.text
	.p2align 4,,15
	.globl	gravity_kernel
	.type	gravity_kernel, @function
gravity_kernel:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	addq	$16, %rsp
	testl	%ecx, %ecx
	vmovaps	%xmm1, -96(%rsp)
	vmovaps	%xmm0, %xmm1
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm0
	vbroadcastf128	(%rdi), %ymm4
	vmovaps	(%rsi), %ymm11
	vmovaps	%ymm4, -80(%rsp)
	vshufps	$0, %ymm11, %ymm11, %ymm6
	vshufps	$85, %ymm11, %ymm11, %ymm7
	vshufps	$170, %ymm11, %ymm11, %ymm12
	vbroadcastf128	16(%rdi), %ymm14
	vshufps	$255, %ymm11, %ymm11, %ymm11
	vbroadcastf128	32(%rdi), %ymm15
	jle	.L4
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%eax, %eax
	vmovaps	%ymm8, %ymm9
	subq	$32768, %r8
	vmovaps	%ymm8, %ymm10
	.p2align 4,,10
	.p2align 3
.L3:
	vsubps	%ymm15, %ymm12, %ymm2
	addq	$32, %rsi
	vmovaps	(%rsi), %ymm1
	vsubps	-80(%rsp), %ymm6, %ymm4
	addl	$2, %eax
	vsubps	%ymm14, %ymm7, %ymm3
	cmpl	%eax, %ecx
	vmovaps	%ymm2, %ymm6
	vfmadd213ps	.LC0(%rip), %ymm2, %ymm6
	vmulps	%ymm3, %ymm3, %ymm5
	vfmadd231ps	%ymm4, %ymm4, %ymm5
	vaddps	%ymm6, %ymm5, %ymm7
	vminps	%ymm0, %ymm7, %ymm5
	vpsrld	$18, %ymm5, %ymm12
	vmovdqa	%ymm12, -48(%rsp)
	vpslld	$18, %ymm12, %ymm13
	movl	-24(%rsp), %r11d
	vsubps	%ymm13, %ymm5, %ymm5
	movl	-40(%rsp), %r9d
	movl	-20(%rsp), %r10d
	movl	-36(%rsp), %edi
	vmovq	(%r8,%r11,8), %xmm6
	movl	-32(%rsp), %r11d
	vpinsrq	$1, (%r8,%r10,8), %xmm6, %xmm12
	vmovq	(%r8,%r9,8), %xmm7
	movl	-28(%rsp), %r10d
	movl	-48(%rsp), %r9d
	vpinsrq	$1, (%r8,%rdi,8), %xmm7, %xmm6
	vinserti128	$0x1, %xmm12, %ymm6, %ymm6
	movl	-44(%rsp), %edi
	vmovq	(%r8,%r11,8), %xmm12
	vpinsrq	$1, (%r8,%r10,8), %xmm12, %xmm7
	vmovq	(%r8,%r9,8), %xmm12
	vpinsrq	$1, (%r8,%rdi,8), %xmm12, %xmm12
	vinserti128	$0x1, %xmm7, %ymm12, %ymm7
	vshufps	$136, %ymm6, %ymm7, %ymm12
	vshufps	$221, %ymm6, %ymm7, %ymm6
	vshufps	$85, %ymm1, %ymm1, %ymm7
	vfmadd132ps	%ymm6, %ymm12, %ymm5
	vshufps	$0, %ymm1, %ymm1, %ymm6
	vmulps	%ymm5, %ymm11, %ymm13
	vshufps	$170, %ymm1, %ymm1, %ymm12
	vshufps	$255, %ymm1, %ymm1, %ymm11
	vfmadd231ps	%ymm4, %ymm13, %ymm10
	vfmadd231ps	%ymm3, %ymm13, %ymm9
	vfmadd231ps	%ymm2, %ymm13, %ymm8
	jg	.L3
.L2:
	vmovaps	%xmm9, %xmm1
	vmovaps	%xmm8, %xmm0
	vxorps	%xmm7, %xmm7, %xmm7
	vextractf128	$0x1, %ymm10, %xmm15
	vextractf128	$0x1, %ymm9, %xmm9
	vextractf128	$0x1, %ymm8, %xmm8
	vaddps	%xmm10, %xmm15, %xmm10
	vmovaps	-96(%rsp), %xmm4
	vmovaps	%xmm7, 48(%rdx)
	vaddps	%xmm1, %xmm9, %xmm2
	vaddps	%xmm0, %xmm8, %xmm13
	vmulps	%xmm4, %xmm10, %xmm3
	vmulps	%xmm4, %xmm2, %xmm5
	vmulps	%xmm4, %xmm13, %xmm6
	vmovaps	%xmm3, (%rdx)
	vmovaps	%xmm5, 16(%rdx)
	vmovaps	%xmm6, 32(%rdx)
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L4:
	.cfi_restore_state
	vxorps	%xmm8, %xmm8, %xmm8
	vmovaps	%ymm8, %ymm9
	vmovaps	%ymm8, %ymm10
	jmp	.L2
	.cfi_endproc
.LFE1:
	.size	gravity_kernel, .-gravity_kernel
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	1073741824
	.long	1073741824
	.long	1073741824
	.long	1073741824
	.long	1073741824
	.long	1073741824
	.long	1073741824
	.long	1073741824
	.ident	"GCC: (GNU) 4.8.1"
	.section	.note.GNU-stack,"",@progbits
