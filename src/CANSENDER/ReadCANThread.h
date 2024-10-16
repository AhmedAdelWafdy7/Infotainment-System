#ifndef READCAN_THREAD_H
#define READCAN_THREAD_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <fcntl.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <linux/can.h>
#include <linux/can/raw.h>
#include <sys/types.h>

#include "SpeedBuffer.h"
#include "DistanceBuffer.h"

int open_port(const char *port);
void read_port();
void close_port();
void *read_can_thread(void *arg);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // READCAN_THREAD_H