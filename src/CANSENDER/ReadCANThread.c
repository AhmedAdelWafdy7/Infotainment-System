#include <stdio.h>
#include "ReadCANThread.h"
#include <linux/if.h>
#include <sys/time.h>


int soc;
uint16_t speed_sensor_rpm;
uint16_t distance;

/**
 * @file ReadCANThread.c
 * @brief This file contains the implementation of the function to open a CAN port.
 *
 * @function open_port
 * @brief Opens a CAN port and sets up the necessary configurations.
 *
 * @param port The name of the CAN interface to open (e.g., "can0").
 * 
 * @return Returns 0 on success, or -1 on failure with an appropriate error message.
 *
 * This function performs the following steps:
 * 1. Creates a socket for CAN communication.
 * 2. Configures the CAN interface using ioctl.
 * 3. Sets the socket to non-blocking mode.
 * 4. Binds the socket to the CAN interface.
 * 5. Sets up CAN filters to receive specific CAN IDs.
 *
 * Error handling is performed at each step, and appropriate error messages are printed using perror.
 */
int open_port(const char *port)
{
    struct sockaddr_can addr;
    struct ifreq ifr;
    struct can_filter rfilter[2];
    soc = socket(PF_CAN, SOCK_RAW, CAN_RAW);
    if (soc < 0)
    {
        perror("socket");
        return -1;
    }

    addr.can_family = AF_CAN;
    strcpy(ifr.ifr_name, port);
    if (ioctl(soc, SIOCGIFINDEX, &ifr) < 0)
    {
        perror("ioctl");
        return -1;
    }
    addr.can_ifindex = ifr.ifr_ifindex;
    fncntl(soc, F_SETFL, O_NONBLOCK);

    if (bind(soc, (struct sockaddr *)&addr, sizeof(addr)) < 0)
    {
        perror("bind");
        return -1;
    }

    rfilter[0].can_id = 0x0F6;
    rfilter[0].can_mask = CAN_SFF_MASK;
    rfilter[1].can_id = 0x0F7;
    rfilter[1].can_mask = CAN_SFF_MASK;
    if(setsockopt(soc, SOL_CAN_RAW, CAN_RAW_FILTER, &rfilter, sizeof(rfilter)) < 0)
    {
        perror("setsockopt");
        return -1;
    }

    return 0;
}

/**
 * @brief Reads data from a CAN port and processes specific CAN frames.
 *
 * This function reads data from a CAN port using the `select` system call to wait for data
 * with a timeout of 1 second. If data is available, it reads the CAN frame and processes
 * frames with specific CAN IDs (0x0F6 and 0x0F7). For CAN ID 0x0F6, it extracts the speed
 * sensor RPM and stores it in a circular buffer protected by a mutex. For CAN ID 0x0F7,
 * it extracts the distance and stores it in another circular buffer, also protected by a mutex.
 *
 * @note The function assumes the existence of global variables and resources such as `soc`,
 *       `speed_sensor_rpm`, `speedBuffer`, `speedBufferIndex`, `speedBufferMutex`, `distance`,
 *       `DistanceBuffer`, `DistanceBufferIndex`, and `DistanceBufferMutex`.
 */
void read_port()
{
    struct can_frame frame;
    int nbytes = 0;
    struct timeval timeout = {1, 0};
    fd_set readSet;
    FD_ZERO(&readSet);
    FD_SET(soc, &readSet);

    if(select(soc + 1, &readSet, NULL, NULL, &timeout) > 0)
    {
        if(FD_ISSET(soc, &readSet))
        {
            nbytes = read(soc, &frame, sizeof(struct can_frame));
            if(nbytes){
                if(frame.can_id == 0x0F6)
                {
                    speed_sensor_rpm = (frame.data[0] << 8) | frame.data[1];
                    pthread_mutex_lock(&speedBufferMutex);
                    speedBuffer[speedBufferIndex] = speed_sensor_rpm;
                    speedBufferIndex = (speedBufferIndex + 1) % SPEED_BUFFER_SIZE;
                    pthread_mutex_unlock(&speedBufferMutex);
                }
                else if(frame.can_id == 0x0F7)
                {
                    distance = (frame.data[0] << 8) | frame.data[1];
                    pthread_mutex_lock(&DistanceBufferMutex);
                    DistanceBuffer[DistanceBufferIndex] = distance;
                    DistanceBufferIndex = (DistanceBufferIndex + 1) % DISTANCE_BUFFER_SIZE;
                    pthread_mutex_unlock(&DistanceBufferMutex);
                }
            }
        }
    }
}



void close_port()
{
    close(soc);
}


/**
 * @brief The main function for the CAN read thread.
 *
 * This function is the main function for the CAN read thread. It opens the CAN port,
 * reads data from the port, and processes the data. The function runs in an infinite
 * loop until the program is terminated.
 *
 * @param arg A pointer to the argument passed to the thread (not used in this function).
 *
 * @return NULL.
 */
void *read_can_thread(void *arg)
{
    open_port("can0");

    while(1)
    {
        read_port();
    }
    close_port();
    return NULL;
}
