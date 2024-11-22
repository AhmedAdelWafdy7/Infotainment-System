#ifndef DISTANCEBUFFER_H
#define DISTANCEBUFFER_H

#ifdef __cplusplus
extern "C" {
#endif



#include <stdint.h>
#include <pthread.h>

#define DISTANCE_BUFFER_SIZE 10

extern uint16_t DistanceBuffer[DISTANCE_BUFFER_SIZE];
extern int DistanceBufferIndex;


extern pthread_mutex_t DistanceBufferMutex;

#ifdef __cplusplus
} // extern "C"
#endif


#endif // DISTANCEBUFFER_H
