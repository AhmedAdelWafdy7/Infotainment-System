#include "RemoteSpeakerStublmpl.hpp"

RemoteSpeakerStubImpl::RemoteSpeakerStubImpl() {
}

RemoteSpeakerStubImpl::~RemoteSpeakerStubImpl() {
}

void RemoteSpeakerStubImpl::SetGear(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _gear, setGearReply_t _return) {
    GearBuffer = _gear;
    _return("");
    return;
}

void RemoteSpeakerStubImpl::SetDistance(const std::shared_ptr<CommonAPI::ClientId> _client, uint16_t _distance, setDistanceReply_t _return) {
    DistanceBuffer = _distance;
    _return("");
    return;
}