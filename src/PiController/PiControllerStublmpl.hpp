#ifndef PICONTROLLERSTUBIMPL_HPP
#define PICONTROLLERSTUBIMPL_HPP

#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/PiControllerStubDefault.hpp>

class PiControllerStubImpl : public v1::commonapi::PiControllerStubDefault
{
public:
    PiControllerStubImpl();
    virtual ~PiControllerStubImpl();
};


#endif // PICONTROLLERSTUBIMPL_HPP