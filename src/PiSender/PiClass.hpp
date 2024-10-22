#ifndef PICLASS_HPP
#define PICLASS_HPP


#include <stdint.h>
#include <Python.h>

class PiControllerClass {
    private:
        PyObject *pModule, *pClass, *pInstance,*pVoltage;
        double voltageLevel;
        uint16_t batteryLevel;
    
    public:
        PiControllerClass();
        ~PiControllerClass();

        uint16_t getBatteryLevel();

};

#endif // PICLASS_HPP