#include "IPCManagerSenderClass.hpp"

using namespace v1_0::commonapi;

IPCManagerSenderClass::IPCManagerSenderClass(){
    runtime = CommonAPI::Runtime::get(); // Get the runtime

    CANSenderTargetProxy = runtime->buildProxy<CANSenderProxy>("local", "CANSender"); // Build the proxy for CANSender
    PiControllerTargetProxy = runtime->buildProxy<PiControllerProxy>("local", "PiController"); // Build the proxy for PiController
    PiControllerSenderTargetProxy = runtime->buildProxy<PiSenderProxy>("local", "PiSender"); // Build the proxy for PiControllerSender
    HeadUnitTargetProxy = runtime->buildProxy<HeadUnitProxy>("local", "HeadUnit"); // Build the proxy for HeadUnit
}

IPCManagerSenderClass::~IPCManagerSenderClass(){
    // Do nothing
}