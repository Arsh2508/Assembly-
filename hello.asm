section .data
	msg db "Hello world:", 10, 0
	
section .text
	global main:
main:
	mov rdi, 1       ; 1 = stdout
	mov rax, 1       ; 1 = write
	mov rsi, msg
	mov rdx, 13      ; number of characters
	
	syscall 	
	mov rax, 60
	mov rdi, 0
	syscall
