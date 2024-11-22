#include "SendSomeipThread.hpp"

using namespace v1_0::commonapi;

/**
 * @brief Thread function to send SOME/IP messages.
 *
 * This function initializes the CommonAPI runtime, registers the CANSender service,
 * and builds the IPCManager proxy. It continuously reads speed and distance data
 * from buffers, applies a Kalman filter to the speed data, and sends the filtered
 * speed and raw distance data to the IPC manager.
 *
 * @param arg Pointer to thread arguments (unused).
 * @return Always returns NULL.
 *
 * The function performs the following steps:
 * 1. Initializes the CommonAPI runtime and registers the CANSender service.
 * 2. Builds the IPCManager proxy.
 * 3. Enters an infinite loop where it:
 *    a. Reads the current speed from the speed buffer.
 *    b. Applies a Kalman filter to the speed data.
 *    c. Sends the filtered speed to the IPC manager.
 *    d. Reads the current distance from the distance buffer.
 *    e. Sends the distance to the IPC manager.
 *    f. Sleeps for 300 milliseconds before repeating.
 */
void *SendSomeipThread(void *arg) {

    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<CANSenderStubImpl> CANSenderService;
    std::shared_ptr<IPCManagerProxy<>> IPCManagerTargetProxy;
    
    runtime = CommonAPI::Runtime::get();
    CANSenderService = std::make_shared<CANSenderStubImpl>();
    runtime->registerService("local", "CANSender", CANSenderService);

    IPCManagerTargetProxy = runtime->buildProxy<IPCManagerProxy>("local", "IPCManager"); // Build the proxy

    CommonAPI::CallStatus callStatus;

    std::string returnMessage;

    //kalman filter

    double speed_sensor_estimation[SIZE] = {0, 0};

    double speed_sensor_letterP[SIZE][SIZE] = {{100, 0}, {0, 100}};

    double speed_sensor_dt = 1;

    double speed_sensor_renewed_e[SIZE] , speed_sensor_renewed_P[SIZE][SIZE];

    double speed_sensor_measuredstate;

    int currentIndex;

    while(1){
        // Get the current speed from the buffer
        pthread_mutex_lock(&speedBufferMutex);
        currentIndex = speedBufferIndex - 1;

        if(currentIndex < 0){
            currentIndex = SPEED_BUFFER_SIZE - 1;
        }

        uint16_t speed_sensor_rpm = speedBuffer[currentIndex];

        pthread_mutex_unlock(&speedBufferMutex);

        speed_sensor_measuredstate = (double)speed_sensor_rpm;

        // Kalman filter
        KalmanFilter(speed_sensor_measuredstate, speed_sensor_estimation, speed_sensor_letterP, speed_sensor_dt, speed_sensor_renewed_e, speed_sensor_renewed_P);

        //update the estimation for the next iteration

        for(int i = 0; i < SIZE; i++){
            speed_sensor_estimation[i] = speed_sensor_renewed_e[i];
            for(int j = 0; j < SIZE; j++){
                speed_sensor_letterP[i][j] = speed_sensor_renewed_P[i][j];
            }
        }

        // Send the speed to the IPC manager

        uint16_t Kf_speed_sensor_rpm = (uint16_t)round(speed_sensor_renewed_e[0]);

        IPCManagerTargetProxy->setSensorRpm(Kf_speed_sensor_rpm, callStatus,returnMessage);

        //read distance from the buffer
        pthread_mutex_lock(&DistanceBufferMutex);
        currentIndex = DistanceBufferIndex - 1;
        if(currentIndex < 0){
            currentIndex = DISTANCE_BUFFER_SIZE - 1;
        }

        uint16_t distance_sensor_cm = DistanceBuffer[currentIndex];
        pthread_mutex_unlock(&DistanceBufferMutex);

        IPCManagerTargetProxy->setDistance(distance_sensor_cm, callStatus, returnMessage);
        usleep(300000); //sleep for 300ms

    }
    return NULL;
}


void KalmanFilter(double measuredstate, double estimation[SIZE], double letterP[SIZE][SIZE], double dt, double renewed_e[SIZE], double renewed_P[SIZE][SIZE]) 
{
    // Kalman filter constants and parameters
    double letterA[SIZE][SIZE] = {{1, dt}, {0, 1}};
    double letterQ[SIZE][SIZE] = {{100, 0}, {0, 100}};
    double letterH[MEASURE_SIZE][SIZE] = {{1, 0}};
    double letterR[MEASURE_SIZE] = {25};

    // 1. Predict the state and error covariance
    double predicted_e[SIZE];
    double temp_result[SIZE][SIZE];
    matrix_multiplication(letterA, (double (*)[SIZE])estimation, temp_result);
    for (int i = 0; i < SIZE; i++)
    {
        predicted_e[i] = temp_result[i][0];
    }
    double predicted_P[SIZE][SIZE];
    matrix_multiplication(letterA, letterP, predicted_P);
    for (int i = 0; i < SIZE; i++) 
    {
        for (int j = 0; j < SIZE; j++) 
        {
            predicted_P[i][j] += letterQ[i][j];
        }
    }

    // 2. Calculate Kalman Gain
    double K[SIZE];
    double denominator = (letterH[0][0] * predicted_P[0][0] + letterH[0][1] * predicted_P[1][0]) * letterH[0][0] 
                         + (letterH[0][0] * predicted_P[0][1] + letterH[0][1] * predicted_P[1][1]) * letterH[0][1] + letterR[0];
    for (int i = 0; i < SIZE; i++) 
    {
        K[i] = (predicted_P[i][0] * letterH[0][0] + predicted_P[i][1] * letterH[0][1]) / denominator;
    }

    // 3. Update the estimation
    double y = measuredstate - (letterH[0][0] * predicted_e[0] + letterH[0][1] * predicted_e[1]);
    for (int i = 0; i < SIZE; i++) 
    {
        renewed_e[i] = predicted_e[i] + K[i] * y;
    }

    // 4. Update the error covariance
    double I[SIZE][SIZE] = {{1, 0}, {0, 1}};
    double KH[SIZE][SIZE];
    for (int i = 0; i < SIZE; i++) 
    {
        for (int j = 0; j < SIZE; j++) 
        {
            KH[i][j] = K[i] * letterH[0][j];
        }
    }
    for (int i = 0; i < SIZE; i++) 
    {
        for (int j = 0; j < SIZE; j++) 
        {
            renewed_P[i][j] = (I[i][j] - KH[i][j]) * predicted_P[i][j];
        }
    }
}

void matrix_multiplication(double A[SIZE][SIZE], double B[SIZE][SIZE], double result[SIZE][SIZE]){
    for(int i = 0; i < SIZE; i++){
        for(int j = 0; j < SIZE; j++){
            result[i][j] = 0;
            for(int k = 0; k < SIZE; k++){
                result[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}