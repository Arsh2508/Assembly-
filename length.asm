section .data
	msg1 db "Hello world!", 10, 0
	msg1Len equ $-msg1-1	 	    ; measure the length - 0

	msg2 db "My assembly code", 10, 0   
	msg2Len equ $-msg2-1		    ; measuring the length 

section .text
	global main
main:	
	push rbp
	mov rbp, rsp
	
	mov rax, 1
	mov rdi, 1
	mov rsi, msg1
	mov rdx, msg1Len
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, msg2
	mov rdx, msg2Len
	syscall

	mov rsp, rbp
	pop rbp
	
	mov rax, 60
	mov rdi, 0
	syscall
