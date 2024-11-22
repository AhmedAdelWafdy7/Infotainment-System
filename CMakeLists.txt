cmake_minimum_required(VERSION 3.15)
project(IVIproject)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -pthread")

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 COMPONENTS Core Quick Gui Multimedia REQUIRED)
find_package(PythonLibs REQUIRED)

include_directories(${PYTHON_INCLUDE_DIRS})

include_directories(
    src-gen
    ${CMAKE_INCLUDE_PATH}/CommonAPI-3.2
    ${CMAKE_INCLUDE_PATH}
)

link_directories(
    ${CMAKE_LIBRARY_PATH}
)

include_directories(
    src-gen/CANSender/core/common
    src-gen/CANSender/core/common
    src-gen/CANSender/core/proxy
    src-gen/CANSender/core/skel
    src-gen/CANSender/core/stub
    src-gen/CANSender/someip/common
    src-gen/CANSender/someip/proxy
    src-gen/CANSender/someip/stub
    
    src-gen/HeadUnit/core/common
    src-gen/HeadUnit/core/proxy
    src-gen/HeadUnit/core/skel
    src-gen/HeadUnit/core/stub
    src-gen/HeadUnit/someip/common
    src-gen/HeadUnit/someip/proxy
    src-gen/HeadUnit/someip/stub


    src-gen/IPCManager/core/common
    src-gen/IPCManager/core/proxy
    src-gen/IPCManager/core/skel
    src-gen/IPCManager/core/stub
    src-gen/IPCManager/someip/common
    src-gen/IPCManager/someip/proxy
    src-gen/IPCManager/someip/stub

    src-gen/PiController/core/common
    src-gen/PiController/core/proxy
    src-gen/PiController/core/skel
    src-gen/PiController/core/stub
    src-gen/PiController/someip/common
    src-gen/PiController/someip/proxy
    src-gen/PiController/someip/stub

    src-gen/PiSender/core/common
    src-gen/PiSender/core/proxy
    src-gen/PiSender/core/skel
    src-gen/PiSender/core/stub
    src-gen/PiSender/someip/common
    src-gen/PiSender/someip/proxy
    src-gen/PiSender/someip/stub
)


set(SOMEIP_PROXY_PATH someip/proxy/v1/commonapi/)
set(SOMEIP_DEPLOYMENT_PATH someip/common/v1/commonapi/)
set(SOMEIP_STUBADAPTER_PATH someip/stub/v1/commonapi/)

add_executable(CANSender
    src/CANSENDER/CANSender.cpp
    src/CANSENDER/ReadCANThread.c
    src/CANSENDER/DistanceBuffer.c
    src/CANSENDER/SpeedBuffer.c
    src/CANSENDER/SendSomeipThread.cpp
    src/CANSENDER/CANSenderStublmpl.cpp
    src-gen/IPCManager/${SOMEIP_PROXY_PATH}/IPCManagerSomeIPProxy.cpp
    src-gen/IPCManager/${SOMEIP_DEPLOYMENT_PATH}/IPCManagerSomeIPDeployment.cpp
    src-gen/CANSender/${SOMEIP_STUBADAPTER_PATH}/CANSenderSomeIPStubAdapter.cpp
    src-gen/CANSender/${SOMEIP_DEPLOYMENT_PATH}/CANSenderSomeIPDeployment.cpp
)
target_link_libraries(CANSender CommonAPI CommonAPI-SomeIP vsomeip3)

add_executable(PiSender
    src/PiSender/PiClass.cpp
    src/PiSender/PiControllerSender.cpp
    src/PiSender/PiControllerSenderStublmpl.cpp
    src-gen/IPCManager/${SOMEIP_PROXY_PATH}/IPCManagerSomeIPProxy.cpp
    src-gen/IPCManager/${SOMEIP_DEPLOYMENT_PATH}/IPCManagerSomeIPDeployment.cpp
    src-gen/PiSender/${SOMEIP_STUBADAPTER_PATH}/PiSenderSomeIPStubAdapter.cpp
    src-gen/PiSender/${SOMEIP_DEPLOYMENT_PATH}/PiSenderSomeIPDeployment.cpp
)
target_link_libraries(PiSender ${PYTHON_LIBRARIES} CommonAPI CommonAPI-SomeIP vsomeip3)

add_executable(PiController
    src/PiController/ControllerClass.cpp
    src/PiController/PiController.cpp
    src/PiController/PiControllerStublmpl.cpp
    src-gen/IPCManager/${SOMEIP_PROXY_PATH}/IPCManagerSomeIPProxy.cpp
    src-gen/IPCManager/${SOMEIP_DEPLOYMENT_PATH}/IPCManagerSomeIPDeployment.cpp
    src-gen/PiController/${SOMEIP_STUBADAPTER_PATH}/PiControllerSomeIPStubAdapter.cpp
    src-gen/PiController/${SOMEIP_DEPLOYMENT_PATH}/PiControllerSomeIPDeployment.cpp
)
target_link_libraries(PiController ${PYTHON_LIBRARIES} CommonAPI CommonAPI-SomeIP vsomeip3)

add_executable(IPCManager
    src/IPCMANAGER/IPCManager.cpp
    src/IPCMANAGER/IPCManagerStublmpl.cpp
    src/IPCMANAGER/IPCManagerSenderClass.cpp
    src/IPCMANAGER/PiController.cpp    
    src-gen/CANSender/${SOMEIP_PROXY_PATH}/CANSenderSomeIPProxy.cpp
    src-gen/CANSender/${SOMEIP_DEPLOYMENT_PATH}/CANSenderSomeIPDeployment.cpp
    src-gen/PiSender/${SOMEIP_PROXY_PATH}/PiSenderSomeIPProxy.cpp
    src-gen/PiSender/${SOMEIP_DEPLOYMENT_PATH}/PiSenderSomeIPDeployment.cpp
    src-gen/PiController/${SOMEIP_PROXY_PATH}/PiControllerSomeIPProxy.cpp
    src-gen/PiController/${SOMEIP_DEPLOYMENT_PATH}/PiControllerSomeIPDeployment.cpp
    src-gen/HeadUnit/${SOMEIP_PROXY_PATH}/HeadUnitSomeIPProxy.cpp
    src-gen/HeadUnit/${SOMEIP_DEPLOYMENT_PATH}/HeadUnitSomeIPDeployment.cpp
    src-gen/IPCManager/${SOMEIP_STUBADAPTER_PATH}/IPCManagerSomeIPStubAdapter.cpp
    src-gen/IPCManager/${SOMEIP_DEPLOYMENT_PATH}/IPCManagerSomeIPDeployment.cpp    
)
target_link_libraries(IPCManager ${PYTHON_LIBRARIES} CommonAPI CommonAPI-SomeIP vsomeip3)

add_executable(HeadUnit
        src/HeadUnit/HeadUnit.cpp
        src/HeadUnit/InstrumentClusterStubImpl.cpp
        src/HeadUnit/InstrumentClusterQtClass.cpp
        src/HeadUnit/InstrumentClusterSenderClass.cpp
        src/HeadUnit/scenehelper.cpp
        src/HeadUnit/Infotainment/control/audiocontroller.cpp 
        src/HeadUnit/Infotainment/control/hvachandler.cpp
        src/HeadUnit/Infotainment/control/system.cpp 
        src/HeadUnit/qml.qrc
        src-gen/IPCManager/${SOMEIP_PROXY_PATH}/IPCManagerSomeIPProxy.cpp
        src-gen/IPCManager/${SOMEIP_DEPLOYMENT_PATH}/IPCManagerSomeIPDeployment.cpp
        src-gen/HeadUnit/${SOMEIP_STUBADAPTER_PATH}/HeadUnitSomeIPStubAdapter.cpp
        src-gen/HeadUnit/${SOMEIP_DEPLOYMENT_PATH}/HeadUnitSomeIPDeployment.cpp
)
target_compile_definitions(HeadUnit
PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(HeadUnit
PRIVATE Qt5::Core Qt5::Quick Qt5::Gui Qt5::Multimedia
        CommonAPI CommonAPI-SomeIP vsomeip3)

install(TARGETS HeadUnit DESTINATION /usr/bin/headunit)
install(TARGETS CANSender DESTINATION /usr/bin/headunit)
install(TARGETS IPCManager DESTINATION /usr/bin/headunit)
install(TARGETS PiController DESTINATION /usr/bin/headunit)
install(TARGETS PiSender DESTINATION /usr/bin/headunit)