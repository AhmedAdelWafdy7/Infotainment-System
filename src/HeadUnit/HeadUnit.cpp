#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QCursor>

#include "HeadUnitStubImpl.hpp"
#include "HeadUnitQtClass.hpp"
#include "HeadUnitSenderClass.hpp"

#include "Infotainment/control/hvachandler.h"
#include "Infotainment/control/audiocontroller.h"
#include "Infotainment/control/system.h"

using namespace v1_0::commonapi;

int main(int argc, char *argv[])
{
    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<HeadUnitStubImpl> HeadUnitService;

    runtime = CommonAPI::Runtime::get();
    HeadUnitService = std::make_shared<HeadUnitStubImpl>();
    runtime->registerService("local", "HeadUnit", HeadUnitService);

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    
    QCursor cursor(Qt::BlankCursor);
    app.setOverrideCursor(cursor);
    
    qmlRegisterType<HeadUnitQtClass>("DataModule", 1, 0, "HeadUnitQtClass");

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("carinfo", &carinfo);


    System m_system_handler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passengerHVACHandler;
    AudioController m_audioController;

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
    &app, [url](QObject *obj, const QUrl &objUrl)
    {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    QQmlContext *context (engine.rootContext());

    context->setContextProperty( "systemHandler" , &m_system_handler);
    context->setContextProperty( "driverHVAC" , &m_driverHVACHandler);
    context->setContextProperty( "passengerHVAC" , &m_passengerHVACHandler);
    context->setContextProperty( "audioController" , &m_audioController);
    
    HeadUnitSenderClass sender;
    sender.IPCManagerTargetProxy->getGearMode("HeadUnit", sender.callStatus, sender.returnMessage);
    sender.IPCManagerTargetProxy->getDirection("HeadUnit", sender.callStatus, sender.returnMessage);
    sender.IPCManagerTargetProxy->getLight("HeadUnit", sender.callStatus, sender.returnMessage);

    return app.exec();
}
