// tcp_connect.cc
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <pthread.h> 
#include <stdio.h>

int main() {
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in saddr;
    saddr.sin_family = AF_INET;
    saddr.sin_addr.s_addr = inet_addr("192.168.1.144");
    saddr.sin_port = htons(5000);
    int s = connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr));
    if (s < 0) {
	printf("oh no an error %i\n", s);
	pthread_exit(NULL);
    }
    return s;
}
