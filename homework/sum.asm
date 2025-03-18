extern printf
extern scanf

section .data
         fmt_s db "Enter a positive number: ", 0
         fmt_in db "%d", 0
         fmt_res db "The result is: %d", 10, 0
section .bss
        N resd 1
section .text
         global main
main:
         push rbp
         mov rbp, rsp
 
INPUT:
        mov rdi, fmt_s
        xor rax, rax
        call printf

        mov rdi, fmt_in
        mov rsi, N
        xor rax, rax
        call scanf

        movsx rcx, dword[N]
        cmp rcx, 0
        jl INPUT		;if the nubmer is negative jump to INPUT

	mov rbx, 0
SUM:
	cmp rcx, 0
	jle SUM_END 
	add rbx, rcx
	dec rcx
	jmp SUM
	
SUM_END:

	mov rdi, fmt_res
	mov rsi, rbx	
	xor rax, rax
	call printf
		
        mov rsp, rbp
	pop rbp
 
        xor rax, rax
	ret
