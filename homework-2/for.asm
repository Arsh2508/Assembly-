extern printf
extern scanf

section .data
	fmt_p db "Add the numbers from 1 to 100 ", 10, 0
	fmt_res db "The result is %d", 10, 0
section .bss
section .text
	global main
main:
	push rbp
	mov rbp, rsp	

	mov rdi, fmt_p
	xor rax, rax
	call printf

	mov rcx, 1
LOOP:	cmp rcx, 100
	jg END
	add rbx, rcx
	INC rcx
	jmp LOOP 

END:
	mov rdi, fmt_res
	mov rsi, rbx
	xor rax, rax
	call printf
	
	mov rsp, rbp
	pop rbp
	
	xor rax, rax
	ret
