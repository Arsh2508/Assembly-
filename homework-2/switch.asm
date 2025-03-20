extern printf
extern scanf

section .data
	fmt_p db "Which is your favourite season: ", 10,"1) Spring", 10,"2) Summer", 10,"3) Autumn", 10,"4) Winter", 10 ,0
	fmt_s db "%d", 0
	fmt_spring db "It's Spring! Flowers are blooming. ", 10 ,0
	fmt_summer db "It's Summer! Time for the beach. ", 10 ,0
	fmt_autumn db "It's Autumn! Leaves are falling. ", 10 ,0
	fmt_winter db "It's Winter! It's snowing. ", 10 , 0
	fmt_inv db "Invalid input, Enter number between 1-4 ", 10, 0
section .bss
	a resb 1
section .text
	global main
main:
	push rbp
	mov rbp, rsp
	
	mov rdi, fmt_p
	xor rax, rax
	call printf
INPUT:	
	mov rdi, fmt_s
	mov rsi, a
	xor rax, rax
	call scanf

	movsx rbx, byte[a]
	cmp rbx, 1
	je SPRING
	cmp rbx, 2
	je SUMMER
	cmp rbx, 3
	je AUTUMN
	cmp rbx, 4
	je WINTER

	mov rdi, fmt_inv
	xor rax, rax
	call printf
	jmp INPUT
	
SPRING:
	mov rdi, fmt_spring
	xor rax, rax
	call printf
	jmp END
SUMMER:
	mov rdi, fmt_summer
	xor rax, rax
	call printf
	jmp END
AUTUMN:
	mov rdi, fmt_autumn
	xor rax, rax
	call printf
	jmp END
WINTER:
	mov rdi, fmt_winter
	xor rax, rax
	call printf
END:
	mov rsp, rbp
	pop rbp
	
	xor rax, rax
	ret





