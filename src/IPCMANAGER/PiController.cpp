#include "PiController.hpp"

PiContollerClass::PiContollerClass(){
    Py_Initialize();
    pModule = PyImport_ImportModule("piracer.vehicles");
    pClass = PyObject_GetAttrString(pModule, "PiRacerStandard"); // get class name
    pInstance = PyObject_CallObject(pClass, NULL); // create instance

    sensorRpm = 0;
    gearMode = 0;
    direction = 0;
    light = "#808080";
    freeDirection = false;
    steering = 0.0;
}

PiContollerClass::~PiContollerClass(){
    Py_DECREF(pModule);
    Py_DECREF(pClass);
    Py_DECREF(pInstance);
    Py_Finalize();
}

void PiContollerClass::SetSensorRpm(uint16_t _sensorRpm){
    sensorRpm = _sensorRpm;

    return;
}

void PiControllerClass::SetGearMode(uint16_t _gearMode){
    gearMode = _gearMode;

    return;
}

void PiControllerClass::SetDirection(uint16_t _direction){
    direction = _direction;

    return;
}

void PiControllerClass::SetLight(std::string _light){
    light = _light;

    return;
}

void PiControllerClass::SetFreeDirection(bool _freeDirection){
    freeDirection = _freeDirection;

    return;
}

void PiControllerClass::SetSteering(double _steering){
    steering = _steering;

    return;
}

uint16_t PiControllerClass::GetSensorRpm(){
    return sensorRpm;
}

uint16_t PiControllerClass::GetGearMode(){
    return gearMode;
}

uint16_t PiControllerClass::GetDirection(){
    return direction;
}

std::string PiControllerClass::GetLight(){
    return light;
}

bool PiControllerClass::GetFreeDirection(){
    return freeDirection;
}

double PiControllerClass::GetSteering(){
    return steering;
}

void PicontrollerClass::applyThrottle(double throttle){
    switch (gearMode)
    {
    case 0: // P
        PyObject_CallMethod(pInstance, "set_throttle_percent", "(f)", 0.0);
        break;
    
    case 1: // R
        if(throttle <= 0){
            PyObject_CallMethod(pInstance, "set_throttle_percent", "(f)", throttle * 0.3);
        }
        else{
            PyObject_CallMethod(pInstance, "set_throttle_percent", "(f)", 0.0);
        }
        break;
    
    case 2: // N
        PyObject_CallMethod(pInstance, "set_throttle_percent", "(f)", 0.0);
        break;
    
    case 3: // D
        if(throttle >= 0){
            PyObject_CallMethod(pInstance, "set_throttle_percent", "(f)", throttle * 0.5);
        }
        else{
            PyObject_CallMethod(pInstance, "set_throttle_percent", "(f)", 0.0);
        }
        break;
    }
    return;
}

void PicontrollerClass::applySteering(double steering){
    switch (gearMode)
    {
    case 0: // P
        PyObject_CallMethod(pInstance, "set_steering_percent", "(f)", 0.0);
        break;
    
    case 1: // R
        PyObject_CallMethod(pInstance, "set_steering_percent", "(f)", steering * -1.0);
        break;

    case 2: // N
        PyObject_CallMethod(pInstance, "set_steering_percent", "(f)", -1.0);
        break;
    
    case 3: // D
        PyObject_CallMethod(pInstance, "set_steering_percent", "(f)", steering* -1.0);
        break;
    }
    return;
}