#ifndef IPCMANAGERSENDERCLASS_HPP
#define IPCMANAGERSENDERCLASS_HPP

#include <string>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/CANSenderProxy.hpp>
#include <v1/commonapi/PiControllerProxy.hpp>
#include <v1/commonapi/PiControllerSenderProxy.hpp>
#include <v1/commonapi/HeadUnitProxy.hpp>
#include <v1/commonapi/PDCUnitProxy.hpp>
#include <v1/commonapi/IVICompositerProxy.hpp>
#include <v1/commonapi/RemoteSpeakerProxy.hpp>

using namespace v1_0::commonapi;

class IPCManagerSenderClass {
    public:
        IPCManagerSenderClass();
        ~IPCManagerSenderClass();

        std::shared_ptr<CommonAPI::Runtime> runtime;
        std::shared_ptr<CANSenderProxy<>> CANSenderTargetProxy;
        std::shared_ptr<PiControllerProxy<>> PiControllerTargetProxy;
        std::shared_ptr<PiControllerSenderProxy<>> PiControllerSenderTargetProxy;
        std::shared_ptr<HeadUnitProxy<>> HeadUnitTargetProxy;
        std::shared_ptr<PDCUnitProxy<>> PDCUnitTargetProxy;
        std::shared_ptr<IVICompositerProxy<>> IVICompositerTargetProxy;
        std::shared_ptr<RemoteSpeakerProxy<>> RemoteSpeakerTargetProxy;

        CommonAPI::CallStatus callStatus;
        std::string returnMessage;        
};

#endif // IPCMANAGERSENDERCLASS_HPP