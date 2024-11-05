#include "ReadCANThread.h"

#include "SendSomeipThread.hpp"

int main()
{
    pthread_t readCanThread;
    pthread_t sendSomeipThread;

    if (pthread_create(&readCanThread, NULL, read_can_thread, NULL) != 0)
    {
        perror("pthread_create");
        return -1;
    }

    if (pthread_create(&sendSomeipThread, NULL, SendSomeipThread, NULL) != 0)
    {
        perror("pthread_create");
        return -1;
    }

    pthread_join(readCanThread, NULL);
    pthread_join(sendSomeipThread, NULL);

    return 0;
}
