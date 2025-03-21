extern printf
extern scanf

section .data
	fmt_p db "Enter a positive number: ",10 ,0
	fmt_s db "%d", 0
section .bss 
	num resd 1
section .text
	global main 
main:
	push rbp
	mov rbp, rsp

INPUT:
	mov rdi, fmt_p
	xor rax, rax
	call printf
	
	mov rdi, fmt_s
	mov rsi, num
	xor rax, rax
	call scanf
	
	movsx rbx, dword[num]
	cmp rbx, 0
	jl INPUT

	mov rsp, rbp
	pop rbp

	xor rax, rax
	ret
