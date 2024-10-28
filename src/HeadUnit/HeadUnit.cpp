#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "scenehelper.h"
#include "Infotainment/control/hvachandler.h"
#include "Infotainment/control/audiocontroller.h"
#include "Infotainment/control/system.h"
#include "InstrumentClusterStubImpl.hpp"
#include "InstrumentClusterQtClass.hpp"
#include "InstrumentClusterSenderClass.hpp"

using namespace v1_0::commonapi;


int main(int argc, char *argv[])
{

    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<InstrumentClusterStubImpl> InstrumentClusterService;

    runtime = CommonAPI::Runtime::get();
    InstrumentClusterService = std::make_shared<InstrumentClusterStubImpl>();
    runtime->registerService("local", "InstrumentCluster", InstrumentClusterService);


#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    qmlRegisterType<scenehelper>("Qt3D.Examples", 2, 0, "SceneHelper");

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("carinfo", &carinfo);

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


    InstrumentClusterSenderClass sender;
    sender.IPCManagerTargetProxy->getGearMode("InstrumentCluster", sender.callStatus, sender.returnMessage);
    sender.IPCManagerTargetProxy->getDirection("InstrumentCluster", sender.callStatus, sender.returnMessage);
    sender.IPCManagerTargetProxy->getLight("InstrumentCluster", sender.callStatus, sender.returnMessage);

    return app.exec();
}
