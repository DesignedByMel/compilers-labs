  .globl	_main
  .align	4, 0x90
_main:
  pushq	%rbp
  movq	%rsp, %rbp

  movq  $8, %rbx
  pushq %rbx
  callq problem1
  popq %rbx

  leaq	.printProblem1(%rip), %rdi
  movl	%eax, %esi
	callq	_printf

  movq $8, %rbx
  pushq %rbx
  callq problem2
  popq %rbx

  leaq	.printProblem2(%rip), %rdi
  movl	%eax, %esi
	callq	_printf

  popq	%rbp
  retq

.printProblem1:
	.asciz	"Fibinoncci Iterative: %d\n"

.printProblem2:
	.asciz	"Fibinoncci Recursive: %d\n"

.scan:
  .string "%d"

problem1:
  pushq	%rbp
  movq	%rsp, %rbp
  movq  16(%rbp), %rbx
  movq  $0, %rsi
  movq  $1, %r8
  movq  $1, %r9
  movq  $1, %r10

for:
  cmpq  %r8, %rbx
  jl    end1
Loop1:
  movq  %r9, %rsi
  movq  %r10, %r9
  movq  %rsi, %r10
  addq  %r9, %r10
  addq  $1, %r8
  jmp   for
end1:
  movq  %rsi, %rax
  popq	%rbp
  retq

problem2:
  pushq %rbp
  movq  %rsp, %rbp
  movq  16(%rbp), %rbx
  cmpq  $1, %rbx
  jle   end2
else:
  subq $1, %rbx
  pushq   %rbx
  call problem2
  popq  %rbx
  pushq %rax
  subq $1, %rbx
  pushq   %rbx
  call problem2
  popq  %rbx
  movq  %rax, %r10
  popq  %rbx
  addq  %r10, %rbx
end2:
  movq  %rbx, %rax
  popq  %rbp
  retq

problem3:
