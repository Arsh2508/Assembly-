extern printf
extern scanf

section .data
	fmt_p db "a to b power = %d", 10, 0
	fmt_a db "Enter the value of a: ", 0	
	fmt_b db "Enter the value of b: ", 0
	fmt_in db "%d", 0
section .text
	global main
main:
	push rbp
	mov rbp, rsp
	
	sub rsp, 16	;place for stack
	
	mov dword[rbp-4], 0
	mov dword[rbp-8], 0
	mov qword[rbp-16], 1	; 1 for be multiplied

	mov rdi, fmt_a
	xor rax, rax
	call printf	; printing fmt_a

	mov rdi, fmt_in
	lea rsi, [rbp-4]
	xor rax, rax
	call scanf  	; scanf the value of 'a'
	
	mov rdi, fmt_b
	xor rax, rax
	call printf

	mov rdi, fmt_in
        lea rsi, [rbp-8]
        xor rax, rax
        call scanf	; value of 'b'
	
	mov rbx, qword[rbp-4]		; the value of 'a' in rbx 
	movsx rcx, dword[rbp-8]		; rcx for loop count(value of b)
	movsx rax, dword[rbp-16]	; mov 1 in rax  

L1:
	cmp rcx, 1	
	jl L1_END	; if count is small than 1 jump to END
		
	mul rbx
	dec rcx  	
	jmp L1	
L1_END:
	
	mov rdi, fmt_p
	mov rsi, rax
	xor rax, rax
	call printf
	
	mov rsp, rbp
	pop rbp

	xor rax, rax
	ret
