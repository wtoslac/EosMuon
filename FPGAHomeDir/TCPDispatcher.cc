#include <TCPDispatcher.hh>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <netdb.h>

TCPDispatcher::TCPDispatcher(size_t _nEvents,
                             int _port,
                             vector<Decoder*> _decoders)
    : Dispatcher(_nEvents, _decoders.size()),
      port(_port),
      decoders(_decoders) {
  this->sockfd = socket(AF_INET, SOCK_STREAM, 0);
  struct sockaddr_in saddr;
  saddr.sin_family = AF_INET;
  saddr.sin_addr.s_addr = INADDR_ANY;
  saddr.sin_port = htons(port);
  int s = connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr));
  if (s < 0) {
    printf("oh no an error %i\n", s);
    pthread_exit(NULL);
  }
}
