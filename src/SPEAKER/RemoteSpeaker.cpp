#include <string>
#include <unistd.h>

#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/IPCManagerProxy.hpp>

#include "RemoteSpeakerStublmpl.hpp"
#include "DataBuffer.hpp"


using namespace v1_0::commonapi;

int main(int argc, char *argv[]) {
    std::shared_ptr<CommonAPI::Runtime> runtime = CommonAPI::Runtime::get(); // Get the runtime
    std::shared_ptr<RemoteSpeakerStubImpl> RemoteSpeakerService = std::make_shared<RemoteSpeakerStubImpl>(); // Create a new instance of the service

    runtime->registerService("local","RemoteSpeaker", RemoteSpeakerService); // Register the service

    std::shared_ptr<IPCManagerProxy<>> IPCManagerTargetProxy = runtime->buildProxy<IPCManagerProxy>("local", "IPCManager"); // Build the proxy

    CommonAPI::CallStatus callStatus;
    std::string returnMessage;

    usleep(1000000);
    IPCManagerTargetProxy->getGearMode("RemoteSpeaker", callStatus, returnMessage);
    while(1){
        if(GearBuffer == 1){
            if(DistanceBuffer < 15){
                std::cout << '\a' << std::endl;
            }
            else if(DistanceBuffer < 30){
                std::cout << '\a' << std::endl;
                usleep(250000);
            }
            else if (DistanceBuffer < 50){
                std::cout << '\a' << std::endl;
                usleep(500000);    
            }
        }
        usleep(250000);
    }

    return 0;
}