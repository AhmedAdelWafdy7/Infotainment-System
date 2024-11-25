#ifndef IPCMANAGERSENDERCLASS_HPP
#define IPCMANAGERSENDERCLASS_HPP

#include <string>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/CANSenderProxy.hpp>
#include <v1/commonapi/PiControllerProxy.hpp>
#include <v1/commonapi/PiSenderProxy.hpp>
#include <v1/commonapi/HeadUnitProxy.hpp>


using namespace v1_0::commonapi;

class IPCManagerSenderClass {
    public:
        IPCManagerSenderClass();
        ~IPCManagerSenderClass();

        std::shared_ptr<CommonAPI::Runtime> runtime;
        std::shared_ptr<CANSenderProxy<>> CANSenderTargetProxy;
        std::shared_ptr<PiControllerProxy<>> PiControllerTargetProxy;
        std::shared_ptr<PiSenderProxy<>> PiControllerSenderTargetProxy;
        std::shared_ptr<HeadUnitProxy<>> HeadUnitTargetProxy;


        CommonAPI::CallStatus callStatus;
        std::string returnMessage;        
};

#endif // IPCMANAGERSENDERCLASS_HPP