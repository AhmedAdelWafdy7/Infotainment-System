#ifndef PICONTROLLERSENDERSTUBIMPL_HPP
#define PICONTROLLERSENDERSTUBIMPL_HPP

#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/PiSenderStubDefault.hpp>

class PiControllerSenderStubImpl : public v1::commonapi::PiSenderStubDefault {
public:
    PiControllerSenderStubImpl();
    virtual ~PiControllerSenderStubImpl();
};


#endif // PICONTROLLERSENDERSTUBIMPL_HPP 