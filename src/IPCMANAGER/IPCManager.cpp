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
        if(!sender.CANSenderTargetProxy->isAvailable()){
            exitCode = system("sh ../reboot_script/reboot_can_sender.sh");        
        }
        if(!sender.PiControllerTargetProxy->isAvailable()){
            exitCode = system("sh ../reboot_script/reboot_pi_controller.sh");
        }
        if(!sender.PiControllerSenderTargetProxy->isAvailable()){
            exitCode = system("sh ../reboot_script/reboot_pi_controller_sender.sh");
        }
        if(!sender.HeadUnitTargetProxy->isAvailable()){
            exitCode = system("sh ../reboot_script/reboot_head_unit.sh");
        }
        if(!sender.PDCUnitTargetProxy->isAvailable()){
            exitCode = system("sh ../reboot_script/reboot_pdc_unit.sh");
        }
        if(!sender.IVICompositerTargetProxy->isAvailable()){
            exitCode = system("sh ../reboot_script/reboot_ivi_compositer.sh");
        }

        usleep(1000000);

    }
    return 0;
}