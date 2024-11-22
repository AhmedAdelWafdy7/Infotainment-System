#include "hvachandler.h"

HVACHandler::HVACHandler(QObject *parent)
    : QObject{parent}
    , m_targetTemperture( 70 )
{}



int HVACHandler::targetTemperture() const
{
    return m_targetTemperture;
}
void HVACHandler::incrementTargetTemperature(const int &val)
{
    int newTargetTemp = m_targetTemperture + val;
    setTargetTemperture(newTargetTemp);
}
void HVACHandler::setTargetTemperture(int newTargetTemperture)
{
    if (m_targetTemperture == newTargetTemperture)
        return;
    m_targetTemperture = newTargetTemperture;
    emit targetTempertureChanged();
}
