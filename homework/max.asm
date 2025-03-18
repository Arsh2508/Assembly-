extern printf
extern scanf

section .data 
	scanf_fmt db "%d", 0
	max_fmt db "Maximum element is %d", 10, 0	
section .bss
	arr resd 10
section .text
	global main
main:
	push rbp
	mov rbp, rsp
	
	mov rbx, 0

L1:
	cmp rbx, 10
	jae L1_END

	mov rdi, scanf_fmt 
	lea rsi, [arr + 4 * rbx]
	call scanf

	inc rbx
	jmp L1
L1_END:
	xor rax, rax
	mov eax, [arr] 
	mov rbx, 1
L2:
	cmp rbx, 10
	jae L2_END

	cmp eax, [arr + 4 * rbx]
	jl ASSIGN
	inc rbx
	jmp L2

ASSIGN:
	mov eax, [arr + 4 * rbx]
	jmp L2
L2_END:
	
	;mov max_elem, eax
	
	mov rdi, max_fmt	
	movsx rsi, eax
	xor rax, rax
	call printf

	mov rsp, rbp
	pop rbp

	xor rax, rax
	ret



