extern printf
extern scanf

section .data
	fmt_enter db "Enter the age: ", 0
	fmt_scanf db "%d", 0
	fmt_print db "Adult:", 10, 0
	fmt_not db "Not Adult:", 10, 0
section .bss
	a resd 1

section .text
	global main
main:
	push rbp
	mov rbp, rsp	

	mov rdi, fmt_enter
	xor rax, rax
	call printf

	mov rdi, fmt_scanf
	mov rsi, a
	xor rax, rax
	call scanf

	movsx rbx, dword[a]	

	cmp rbx, 18
	jl N_ADULT
	
	mov rdi, fmt_print
	xor rax, rax
	call printf
	jmp END
N_ADULT:
	mov rdi, fmt_not
	xor rax, rax
	call printf
END:
	mov rsp, rbp
	pop rbp

	xor rax, rax
	ret

