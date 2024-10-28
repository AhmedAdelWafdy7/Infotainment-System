/*
* This file was generated by the CommonAPI Generators.
* Used org.genivi.commonapi.core 3.2.0.v202012010850.
* Used org.franca.core 0.13.1.201807231814.
*
* This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
* If a copy of the MPL was not distributed with this file, You can obtain one at
* http://mozilla.org/MPL/2.0/.
*/
#ifndef V1_COMMONAPI_IPC_Manager_PROXY_BASE_HPP_
#define V1_COMMONAPI_IPC_Manager_PROXY_BASE_HPP_

#include <v1/commonapi/IPCManager.hpp>



#if !defined (COMMONAPI_INTERNAL_COMPILATION)
#define COMMONAPI_INTERNAL_COMPILATION
#define HAS_DEFINED_COMMONAPI_INTERNAL_COMPILATION_HERE
#endif

#include <vector>

#include <CommonAPI/Proxy.hpp>
#include <functional>
#include <future>

#if defined (HAS_DEFINED_COMMONAPI_INTERNAL_COMPILATION_HERE)
#undef COMMONAPI_INTERNAL_COMPILATION
#undef HAS_DEFINED_COMMONAPI_INTERNAL_COMPILATION_HERE
#endif

namespace v1 {
namespace commonapi {

class IPCManagerProxyBase
    : virtual public CommonAPI::Proxy {
public:

    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> SetSensorRpmAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> SetBatteryLevelAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> SetGearModeAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> SetDirectionAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> SetLightAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> SetThrottleAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> SetSteeringAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> SetDistanceAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> GetGearModeAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> GetDirectionAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> GetLightAsyncCallback;
    typedef std::function<void(const CommonAPI::CallStatus&, const std::string&)> GetSteeringAsyncCallback;

    virtual void setSensorRpm(uint16_t _SensorRpm, CommonAPI::CallStatus &_internalCallStatus, std::string &_messag, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> setSensorRpmAsync(const uint16_t &_SensorRpm, SetSensorRpmAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void setBatteryLevel(uint16_t _BatteryLevel, CommonAPI::CallStatus &_internalCallStatus, std::string &_message, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> setBatteryLevelAsync(const uint16_t &_BatteryLevel, SetBatteryLevelAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void setGearMode(uint16_t _GearMode, CommonAPI::CallStatus &_internalCallStatus, std::string &_message, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> setGearModeAsync(const uint16_t &_GearMode, SetGearModeAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void setDirection(uint16_t _Direction, CommonAPI::CallStatus &_internalCallStatus, std::string &_message, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> setDirectionAsync(const uint16_t &_Direction, SetDirectionAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void setLight(std::string _Light, CommonAPI::CallStatus &_internalCallStatus, std::string &_message, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> setLightAsync(const std::string &_Light, SetLightAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void setThrottle(double _Throttle, CommonAPI::CallStatus &_internalCallStatus, std::string &_message, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> setThrottleAsync(const double &_Throttle, SetThrottleAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void setSteering(double _Steering, CommonAPI::CallStatus &_internalCallStatus, std::string &_message, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> setSteeringAsync(const double &_Steering, SetSteeringAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void setDistance(uint16_t _Distance, CommonAPI::CallStatus &_internalCallStatus, std::string &_message, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> setDistanceAsync(const uint16_t &_Distance, SetDistanceAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void getGearMode(std::string _message1, CommonAPI::CallStatus &_internalCallStatus, std::string &_message2, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> getGearModeAsync(const std::string &_message1, GetGearModeAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void getDirection(std::string _message1, CommonAPI::CallStatus &_internalCallStatus, std::string &_message2, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> getDirectionAsync(const std::string &_message1, GetDirectionAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void getLight(std::string _message1, CommonAPI::CallStatus &_internalCallStatus, std::string &_message2, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> getLightAsync(const std::string &_message1, GetLightAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual void getSteering(std::string _message1, CommonAPI::CallStatus &_internalCallStatus, std::string &_message2, const CommonAPI::CallInfo *_info = nullptr) = 0;
    virtual std::future<CommonAPI::CallStatus> getSteeringAsync(const std::string &_message1, GetSteeringAsyncCallback _callback = nullptr, const CommonAPI::CallInfo *_info = nullptr) = 0;

    virtual std::future<void> getCompletionFuture() = 0;
};

} // namespace commonapi
} // namespace v1


// Compatibility
namespace v1_0 = v1;

#endif // V1_COMMONAPI_IPC_Manager_PROXY_BASE_HPP_
