extern printf
extern scanf

section .data
	fmt_print db "Enter your grade: ",0
	fmt_scan db "%d", 0
	fmt_high db "You have a great result", 10, 0  ; only for grades over 90
	fmt_all db "Thanks for participating", 10, 0  ; texts for everyone 
section .bss
	grade resd 1
section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov rdi, fmt_print
	xor rax, rax
	call printf

	mov rdi, fmt_scan
	mov rsi, grade
	xor rax, rax
	call scanf

	movsx rbx, dword[grade]
	cmp rbx, 90
	jl END
	
	mov rdi, fmt_high
	xor rax, rax
	call printf

END: 
	mov rdi, fmt_all
	xor rax, rax
	call printf
	
	mov rsp, rbp
	pop rbp

	xor rax, rax
	ret












