#include "system.h"
#include <QDateTime>
#include <QDebug>


System::System(QObject *parent)
    : QObject{parent}
    , m_carLocked( true )
    , m_outdoorTemp ( 64 )
    ,m_username(" Wafdy ")
{

    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);
    m_currentTimeTimer->setSingleShot(true);
    connect( m_currentTimeTimer, &QTimer::timeout,this, &System::currentTimeTimerTimeout);
    currentTimeTimerTimeout();
}

bool System::carLocked() const
{
    return m_carLocked;
}

void System::setCarLocked(bool newCarLocked)
{
    if (m_carLocked == newCarLocked)
        return;
    m_carLocked = newCarLocked;
    emit carLockedChanged();
}

int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

void System::setOutdoorTemp(int newOutdoorTemp)
{
    if (m_outdoorTemp == newOutdoorTemp)
        return;
    m_outdoorTemp = newOutdoorTemp;
    emit outdoorTempChanged();
}

QString System::username() const
{
    return m_username;
}

void System::setUsername(const QString &newUsername)
{
    if (m_username == newUsername)
        return;
    m_username = newUsername;
    emit usernameChanged();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void System::currentTimeTimerTimeout()
{
    QDateTime dateTime;

    QString currentTime = dateTime.currentDateTime().toString( "hh:mm ap" );

    setCurrentTime(currentTime);

    m_currentTimeTimer->start();

}
