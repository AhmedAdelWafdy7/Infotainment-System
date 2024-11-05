#include <string>
#include <unistd.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/IPCManagerProxy.hpp>

#include "PiControllerSenderStublmpl.hpp"
#include "PiClass.hpp"

using namespace v1_0::commonapi;

int main(){
    std::shared_ptr<CommonAPI::Runtime> runtime = CommonAPI::Runtime::get(); // Get the runtime
    std::shared_ptr<IPCManagerProxy<>> IPCManagerTargetProxy; // Create a new instance of the proxy
    std::shared_ptr<PiControllerSenderStubImpl> PiControllerService = std::make_shared<PiControllerSenderStubImpl>(); // Create a new instance of the service
    runtime->registerService("local","PiControllerSender", PiControllerService); // Register the service
    IPCManagerTargetProxy = runtime->buildProxy<IPCManagerProxy>("local", "IPCManager"); // Build the proxy

    PiControllerClass piController;

    CommonAPI::CallStatus callStatus;
    std::string returnMessage;
    while(1){
        IPCManagerTargetProxy->setBatteryLevel(piController.getBatteryLevel() , callStatus, returnMessage);
        usleep(500000);
    }

    return 0;
}