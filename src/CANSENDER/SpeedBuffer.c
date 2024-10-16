#include "SpeedBuffer.h"

uint16_t speedBuffer[SPEED_BUFFER_SIZE] = {0};

int speedBufferIndex = 0;

pthread_mutex_t speedBufferMutex = PTHREAD_MUTEX_INITIALIZER;