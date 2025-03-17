extern printf
extern scanf

section .data
	fmt_ent db "Enter numbers: ", 0
	fmt_op db "Choose operator", 10, "1) +", 10, "2) -", 10, "3) *", 10,"4) /",10 ,0
	fmt_inp db "%d", 0
	fmt_again db "Invalid choice. Choose again (from 1-4): ", 10, 0	
	fmt_div_0 db "Division by zero is not allowed!!", 10, 0
	fmt_answ db "The result is: %d", 10, 0
	fmt_div db "The result is %d  whith the reminder %d", 10, 0

section .text
	global main
main:
	push rbp	
	mov rbp, rsp	

	sub rsp, 16	; place for stack

	mov rdi, fmt_ent	; asks user to input numbers
	xor rax, rax
	call printf
		
	mov rdi, fmt_inp	
	lea rsi, [rbp-4]	;input the first number
	xor rax, rax
	call scanf 

	mov rdi, fmt_inp
	lea rsi, [rbp-8]	;input the second number
	xor rax, rax
	call scanf
SWITCH:
	mov rdi, fmt_op		; asking user to switch the operation
	xor rax, rax
	call printf
	
	mov rdi, fmt_inp
	lea rsi, [rbp-12]	; input the number of operation
	xor rax, rax
	call scanf	
	
	movsx rbx, dword[rbp-12]	; replace operation code in rbx
	movsx rax, dword[rbp-4]  	;  replace first number in rax

	cmp rbx, 1	; finding the operation and jump the right loop
	je L1 
	cmp rbx, 2
	je L2
	cmp rbx, 3
	je L3
	cmp rbx, 4
	je L4
	
	mov rdi, fmt_again	; if operation is not found jump and input it again 
	xor rax, rax
	call printf
	jmp SWITCH
	
L1:
	add eax, dword[rbp-8]	; executing the operations in each loop
	jmp END
L2:
	sub eax, dword[rbp-8]
	jmp END
L3:
	movsx rbx, dword[rbp-8]
	mul rbx
	jmp END
L4:
	movsx rbx, dword[rbp-8]
	cmp rbx, 0
	je L4_div_0
	div rbx
	
	mov rdi, fmt_div
	mov rsi, rax
	mov rdx, rdx		; output the restul with reminder
	xor rax, rax
	call printf
	jmp RET
L4_div_0:
	mov rdi, fmt_div_0	; if divide by 0 inform
	xor rax, rax
	call printf
	jmp RET

END:
	mov rdi, fmt_answ	; outputs the result of each operation except division
	mov rsi, rax
	xor rax, rax
	call printf
RET:
	mov rsp, rbp
	pop rbp 

	xor rax, rax
	ret
