#ifndef PICONTROLLER_HPP
#define PICONTROLLER_HPP


#include <stdint.h>
#include <Python.h>
#include <string>


class PiContollerClass
{
    private:
        PyObject *pModule, *pClass, *pInstance;

        uint16_t sensorRpm;
        uint16_t gearMode;
        uint16_t direction;
        std::string light;
        bool freeDirection;
        double steering;

    public:
        PiContollerClass();
        ~PiContollerClass();

        void SetSensorRpm(uint16_t _sensorRpm);
        void SetGearMode(uint16_t _gearMode);
        void SetDirection(uint16_t _direction);
        void SetLight(std::string _light);
        void SetFreeDirection(bool _freeDirection);
        void SetSteering(double _steering);

        uint16_t GetSensorRpm();
        uint16_t GetGearMode();
        uint16_t GetDirection();
        std::string GetLight();
        bool GetFreeDirection();
        double GetSteering();

        void applyThrottle(double throttle);
        void applySteering(double steering);
}

#endif // PICONTROLLER_HPP