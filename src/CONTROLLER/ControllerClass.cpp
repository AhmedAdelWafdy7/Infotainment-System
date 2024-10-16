#include "ControllerClass.hpp"

ControllerClass::ControllerClass(){
    Py_Initialize();
    pModule = PyImport_ImportModule("piracer.gamepads");
    pClass = PyObject_GetAttrString(pModule, "Gamepad"); // get class name
    pInstance = PyObject_CallObject(pClass, NULL); // create instance

    throttle = 0.0;
    steering = 0.0;
    pre_throttle = 0.0;
    pre_steering = 0.0;
    button_p = false;
    button_r = false;
    button_n = false;
    button_d = false;

    pre_button_p = false;
    pre_button_r = false;
    pre_button_n = false;
    pre_button_d = false;

    button_left_turn = false;
    button_right_turn = false;
    pre_button_left_turn = false;
    pre_button_right_turn = false;
}

ControllerClass::~ControllerClass(){
    Py_DECREF(pModule);
    Py_DECREF(pClass);
    Py_DECREF(pInstance);
    Py_DECREF(pInput);
    Py_DECREF(pThrottle);
    Py_DECREF(pSteering);
    Py_Finalize();
}

/**
 * @brief Reads the control inputs from a Python instance and updates the controller state.
 * 
 * This function reads various control inputs such as throttle, steering, and button states
 * from a Python instance method `read_input`. It then processes and normalizes the throttle
 * input and updates the corresponding member variables of the ControllerClass.
 * 
 * The throttle input is categorized into discrete levels:
 * - -1.0 for values in the range [-1.0, -0.8)
 * - -0.5 for values in the range [-0.8, -0.2)
 * -  0.0 for values in the range [-0.2,  0.2]
 * -  0.5 for values in the range ( 0.2,  0.8]
 * -  1.0 for values in the range ( 0.8,  1.0]
 * 
 * The function also updates the states of various buttons:
 * - button_p (mapped to button_a)
 * - button_r (mapped to button_y)
 * - button_n (mapped to button_b)
 * - button_d (mapped to button_x)
 * - button_left_turn (mapped to button_l1)
 * - button_right_turn (mapped to button_r1)
 * 
 * The previous states of these controls are stored in corresponding member variables
 * prefixed with `pre_`.
 * 
 * @note This function assumes that the Python instance and its methods are correctly set up
 * and that the Python interpreter is properly initialized.
 */
void ControllerClass::readControl(){
    pre_throttle = throttle;
    pre_steering = steering;
    pre_button_p = button_p;
    pre_button_r = button_r;
    pre_button_n = button_n;
    pre_button_d = button_d;

    pre_button_left_turn = button_left_turn;
    pre_button_right_turn = button_right_turn;

    pInput = PyObject_CallMethod(pInstance, "read_input", NULL);
    pThrottle = PyObject_GetAttrString(pInput, "analog_stick_right");
    pThrottle = PyObject_GetAttrString(pThrottle, "y");
    throttle = PyFloat_AsDouble(pThrottle);

    if(( -1.0 <= throttle ) && ( throttle < -0.8 )){
        throttle = -1.0;
    }
    else if (( -0.8 <= throttle ) && ( throttle < -0.2 )){
        throttle = -0.5;
    }
    else if (( -0.2 <= throttle ) && ( throttle <= 0.2 )){
        throttle = 0.0;
    }
    else if (( -0.2 <= throttle ) && ( throttle < 0.0 )){
        throttle = -0.2;
    }
    else if (( 0.2 < throttle ) && ( throttle <= 0.8 )){
        throttle = 0.5;
    }
    else if (( 0.8 < throttle ) && ( throttle <= 1.0 )){
        throttle = 1.0;
    }
    button_p = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_a"));
    button_r = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_y"));
    button_n = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_b"));
    button_d = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_x"));

    button_left_turn = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_l1"));
    button_right_turn = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_r1"));

    return;    
}

double ControllerClass::getThrottle(){
    return throttle;
}

double ControllerClass::getSteering(){
    return steering;
}

double ControllerClass::getPreThrottle(){
    return pre_throttle;
}

double ControllerClass::getPreSteering(){
    return pre_steering;
}

bool ControllerClass::getButtonP(){
    return button_p;
}

bool ControllerClass::getButtonR(){
    return button_r;
}

bool ControllerClass::getButtonN(){
    return button_n;
}

bool ControllerClass::getButtonD(){
    return button_d;
}   

bool ControllerClass::getPreButtonP(){
    return pre_button_p;
}

bool ControllerClass::getPreButtonR(){
    return pre_button_r;
}

bool ControllerClass::getPreButtonN(){
    return pre_button_n;
}

bool ControllerClass::getPreButtonD(){
    return pre_button_d;
}

bool ControllerClass::getButtonLeftTurn(){
    return button_left_turn;
}

bool ControllerClass::getButtonRightTurn(){
    return button_right_turn;
}

bool ControllerClass::getPreButtonLeftTurn(){
    return pre_button_left_turn;
}

bool ControllerClass::getPreButtonRightTurn(){
    return pre_button_right_turn;
}

