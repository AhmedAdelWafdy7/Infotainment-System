#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QCursor>

#include "scenehelper.h"
#include "Infotainment/control/hvachandler.h"
#include "Infotainment/control/audiocontroller.h"
#include "Infotainment/control/system.h"
#include "InstrumentClusterStubImpl.hpp"
#include "InstrumentClusterQtClass.hpp"
#include "InstrumentClusterSenderClass.hpp"
#include "HeadUnitQtClass.hpp"
#include "HeadUnitStubImpl.hpp"
#include "HeadUnitSenderClass.hpp"


using namespace v1_0::commonapi;


int main(int argc, char *argv[])
{

    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<InstrumentClusterStubImpl> InstrumentClusterService;
    std::shared_ptr<HeadUnitStubImpl> HeadUnitService;

    runtime = CommonAPI::Runtime::get();
    InstrumentClusterService = std::make_shared<InstrumentClusterStubImpl>();
    HeadUnitService = std::make_shared<HeadUnitStubImpl>();
    runtime->registerService("local", "InstrumentCluster", InstrumentClusterService);
    runtime->registerService("local", "HeadUnit", HeadUnitService);


    // Initialize the Qt Application
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    
    QCursor cursor(Qt::BlankCursor);
    app.setOverrideCursor(cursor);

    // Register the HeadUnitQtClass as a QML type
    qmlRegisterType<HeadUnitQtClass>("DataModule", 1, 0, "HeadUnitQtClass");

    qmlRegisterType<scenehelper>("Qt3D.Examples", 2, 0, "SceneHelper");


    // Register the HeadUnitQtClass as a QML type
    qmlRegisterType<HeadUnitQtClass>("DataModule", 1, 0, "HeadUnitQtClass");

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("carinfoI", &instrumentClusterCarInfo);
    engine.rootContext()->setContextProperty("carinfoH", &headUnitCarInfo);

    System m_system_handler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passengerHVACHandler;
    AudioController m_audioController;

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    QQmlContext *context (engine.rootContext());

    context->setContextProperty( "systemHandler" , &m_system_handler);
    context->setContextProperty( "driverHVAC" , &m_driverHVACHandler);
    context->setContextProperty( "passengerHVAC" , &m_passengerHVACHandler);
    context->setContextProperty( "audioController" , &m_audioController);

    
    InstrumentClusterSenderClass sender1;
    sender1.IPCManagerTargetProxy->getGearMode("InstrumentCluster", sender1.callStatus, sender1.returnMessage);
    sender1.IPCManagerTargetProxy->getDirection("InstrumentCluster", sender1.callStatus, sender1.returnMessage);
    sender1.IPCManagerTargetProxy->getLight("InstrumentCluster", sender1.callStatus, sender1.returnMessage);
    
    HeadUnitSenderClass sender2;
    sender2.IPCManagerTargetProxy->getGearMode("HeadUnit", sender2.callStatus, sender2.returnMessage);
    sender2.IPCManagerTargetProxy->getDirection("HeadUnit", sender2.callStatus, sender2.returnMessage);
    sender2.IPCManagerTargetProxy->getLight("HeadUnit", sender2.callStatus, sender2.returnMessage);

    return app.exec();
}
