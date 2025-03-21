extern printf
extern scanf

section .data
	fmt_p db "Enter a number: ", 0
	fmt_s db "%d", 0
	fmt_num db "%d ",0
	fmt_endl db "",10, 0
section .bss
	num resd 1
section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov rdi, fmt_p
	xor rax, rax
	call printf

	mov rdi, fmt_s
	mov rsi, num
	xor rax, rax
	call scanf
	
	movsx rbx, dword[num]
LOOP:	
	cmp rbx, 0
	jle END
	mov rdi, fmt_num
	mov rsi, rbx
	xor rax, rax
	call printf		; counting down
	DEC rbx
	jmp LOOP

END:
	mov rdi, fmt_endl
	xor rax, rax
	call printf
	
	mov rsp, rbp
	pop rbp
	
	xor rax, rax
	ret
