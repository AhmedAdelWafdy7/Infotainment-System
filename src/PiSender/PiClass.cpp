#include "PiClass.hpp"

PiControllerClass::PiControllerClass(){
    Py_Initialize();
    pModule = PyImport_ImportModule("piracer.vehicles");
    pClass = PyObject_GetAttrString(pModule, "PiRacerStandard"); // get class name
    pInstance = PyObject_CallObject(pClass, NULL); // create instance
}

PiControllerClass::~PiControllerClass(){
    Py_DECREF(pModule);
    Py_DECREF(pClass);
    Py_DECREF(pInstance);
    Py_Finalize();
}

uint16_t PiControllerClass::getBattery()
{
    pVoltage = PyObject_CallMethod(pInstance, "get_battery_voltage", NULL);
    voltageLevel = PyFloat_AsDouble(pVoltage);
    batteryLevel = (uint16_t)A((voltageLevel - 2.8 * 3.0) / (12.3 - 2.8 * 3.0) * 100.0);

    return batteryLevel;
}