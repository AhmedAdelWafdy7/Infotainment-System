#include <unistd.h>
#include <cstdlib>
#include <CommonAPI/CommonAPI.hpp>
#include "IPCManagerStublmpl.hpp"
#include "IPCManagerSenderClass.hpp"

using namespace v1_0::commonapi;

int main() {
    std::shared_ptr<CommonAPI::Runtime> runtime = CommonAPI::Runtime::get(); // Get the runtime
    std::shared_ptr<IPCManagerStubImpl> IPCManagerService;
    IPCManagerService = std::make_shared<IPCManagerStubImpl>(); // Create a new instance of the service
    runtime->registerService("local","IPCManager", IPCManagerService); // Register the service

    IPCManagerSenderClass sender;
    int exitCode;
    while(1){
    }
    return 0;
}