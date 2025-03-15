extern printf

section .data
	text db "hello world!", 10, 0

section .text
	global main:
main:
	push rbp
	mov rbp, rsp
	
	mov rax, 0
	mov rdi, text
	call printf

	mov rsp, rbp
	pop rbp

	ret
	

	
