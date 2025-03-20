extern printf
extern scanf

section .data
        fmt_enter db "Enter your grade: ",0
        fmt_s db "%d", 0
        fmt_great db "You have a great result", 10, 0 
	fmt_good db "You have a good result", 10, 0
        fmt_all db "Thanks for participating", 10, 0  
section .bss
        grade resd 1
section .text
        global main
main:
        push rbp
        mov rbp, rsp

        mov rdi, fmt_enter	
        xor rax, rax
        call printf

        mov rdi, fmt_s
        mov rsi, grade
        xor rax, rax
        call scanf

        movsx rbx, dword[grade]  
        cmp rbx, 90		 ; if over 90 texts fmt_great
        jl ELSE_IF

        mov rdi, fmt_great
        xor rax, rax
        call printf
	jmp END

ELSE_IF:
	cmp rbx, 80		; if over 80 texts fmt_good
	jl END
	
	mov rdi, fmt_good
	xor rax, rax
	call printf
 
END:
        mov rdi, fmt_all	; in any case prints 
        xor rax, rax
        call printf

        mov rsp, rbp
        pop rbp

        xor rax, rax
        ret


