#ifndef SPEEDBUFFER_H
#define SPEEDBUFFER_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <pthread.h>

#define SPEED_BUFFER_SIZE 10

extern uint16_t speedBuffer[SPEED_BUFFER_SIZE];
extern int speedBufferIndex;

extern pthread_mutex_t speedBufferMutex;

#ifdef __cplusplus
} // extern "C"
#endif

#endif // SPEEDBUFFER_H


