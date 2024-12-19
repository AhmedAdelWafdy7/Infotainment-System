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
    ~/build-commonapi/capicxx-core-runtime/include
    ~/build-commonapi/capicxx-someip-runtime/include
    ~/build-commonapi/vsomeip/interface
)

link_directories(
    ~/build-commonapi/capicxx-core-runtime/build
    ~/build-commonapi/capicxx-someip-runtime/build
    ~/build-commonapi/vsomeip/build
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

    src-gen/PiracerSender/core/common
    src-gen/PiracerSender/core/proxy
    src-gen/PiracerSender/core/skel
    src-gen/PiracerSender/core/stub
    src-gen/PiracerSender/someip/common
    src-gen/PiracerSender/someip/proxy
    src-gen/PiracerSender/someip/stub

    src-gen/PiracerController/core/common
    src-gen/PiracerController/core/proxy
    src-gen/PiracerController/core/skel
    src-gen/PiracerController/core/stub
    src-gen/PiracerController/someip/common
    src-gen/PiracerController/someip/proxy
    src-gen/PiracerController/someip/stub
    ${CMAKE_INCLUDE_PATH}/CommonAPI-3.2
    ${CMAKE_INCLUDE_PATH}
)

link_directories(
    ${CMAKE_LIBRARY_PATH}
)

set(SOMEIP_PROXY_PATH someip/proxy/v1/commonapi/)
set(SOMEIP_DEPLOYMENT_PATH someip/common/v1/commonapi/)
set(SOMEIP_STUBADAPTER_PATH someip/stub/v1/commonapi/)

add_executable(CANSender
        src/CANSender/CANSender.cpp
        src/CANSender/ReadCANThread.c
        src/CANSender/SpeedBuffer.c
        src/CANSender/DistanceBuffer.c
        src/CANSender/SendSomeipThread.cpp
        src/CANSender/CANSenderStubImpl.cpp
        src-gen/IPCManager/${SOMEIP_PROXY_PATH}/IPCManagerSomeIPProxy.cpp
        src-gen/IPCManager/${SOMEIP_DEPLOYMENT_PATH}/IPCManagerSomeIPDeployment.cpp
        src-gen/CANSender/${SOMEIP_STUBADAPTER_PATH}/CANSenderSomeIPStubAdapter.cpp
        src-gen/CANSender/${SOMEIP_DEPLOYMENT_PATH}/CANSenderSomeIPDeployment.cpp
)
target_link_libraries(CANSender CommonAPI CommonAPI-SomeIP vsomeip3)

add_executable(PiracerSender
        src/PiracerSender/PiracerSender.cpp
        src/PiracerSender/PiracerClass.cpp
        src/PiracerSender/PiracerSenderStubImpl.cpp
        src-gen/IPCManager/${SOMEIP_PROXY_PATH}/IPCManagerSomeIPProxy.cpp
        src-gen/IPCManager/${SOMEIP_DEPLOYMENT_PATH}/IPCManagerSomeIPDeployment.cpp
        src-gen/PiracerSender/${SOMEIP_STUBADAPTER_PATH}/PiracerSenderSomeIPStubAdapter.cpp
        src-gen/PiracerSender/${SOMEIP_DEPLOYMENT_PATH}/PiracerSenderSomeIPDeployment.cpp
)
target_link_libraries(PiracerSender ${PYTHON_LIBRARIES} CommonAPI CommonAPI-SomeIP vsomeip3)

add_executable(PiracerController
        src/PiracerController/PiracerController.cpp
        src/PiracerController/PiracerControllerStubImpl.cpp
        src/PiracerController/ControllerClass.cpp
        src-gen/IPCManager/${SOMEIP_PROXY_PATH}/IPCManagerSomeIPProxy.cpp
        src-gen/IPCManager/${SOMEIP_DEPLOYMENT_PATH}/IPCManagerSomeIPDeployment.cpp
        src-gen/PiracerController/${SOMEIP_STUBADAPTER_PATH}/PiracerControllerSomeIPStubAdapter.cpp
        src-gen/PiracerController/${SOMEIP_DEPLOYMENT_PATH}/PiracerControllerSomeIPDeployment.cpp
)
target_link_libraries(PiracerController ${PYTHON_LIBRARIES} CommonAPI CommonAPI-SomeIP vsomeip3)

add_executable(IPCManager
        src/IPCManager/IPCManager.cpp
        src/IPCManager/IPCManagerStubImpl.cpp
        src/IPCManager/IPCManagerSenderClass.cpp
        src/IPCManager/PiracerClass.cpp
        src-gen/CANSender/${SOMEIP_PROXY_PATH}/CANSenderSomeIPProxy.cpp
        src-gen/CANSender/${SOMEIP_DEPLOYMENT_PATH}/CANSenderSomeIPDeployment.cpp
        src-gen/PiracerSender/${SOMEIP_PROXY_PATH}/PiracerSenderSomeIPProxy.cpp
        src-gen/PiracerSender/${SOMEIP_DEPLOYMENT_PATH}/PiracerSenderSomeIPDeployment.cpp
        src-gen/PiracerController/${SOMEIP_PROXY_PATH}/PiracerControllerSomeIPProxy.cpp
        src-gen/PiracerController/${SOMEIP_DEPLOYMENT_PATH}/PiracerControllerSomeIPDeployment.cpp
        src-gen/HeadUnit/${SOMEIP_PROXY_PATH}/HeadUnitSomeIPProxy.cpp
        src-gen/HeadUnit/${SOMEIP_DEPLOYMENT_PATH}/HeadUnitSomeIPDeployment.cpp
        src-gen/IPCManager/${SOMEIP_STUBADAPTER_PATH}/IPCManagerSomeIPStubAdapter.cpp
        src-gen/IPCManager/${SOMEIP_DEPLOYMENT_PATH}/IPCManagerSomeIPDeployment.cpp
)
target_link_libraries(IPCManager ${PYTHON_LIBRARIES} CommonAPI CommonAPI-SomeIP vsomeip3)


add_executable(HeadUnit
        src/HeadUnit/HeadUnit.cpp
        src/HeadUnit/HeadUnitStubImpl.cpp
        src/HeadUnit/HeadUnitQtClass.cpp
        src/HeadUnit/HeadUnitSenderClass.cpp
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
PRIVATE Qt5::Core Qt5::Quick Qt5::Gui Qt5::Multimedia CommonAPI CommonAPI-SomeIP vsomeip3)


install(TARGETS HeadUnit DESTINATION /usr/bin/headunit)
install(TARGETS CANSender DESTINATION /usr/bin/headunit)
install(TARGETS IPCManager DESTINATION /usr/bin/headunit)
install(TARGETS PiracerController DESTINATION /usr/bin/headunit)
install(TARGETS PiracerSender DESTINATION /usr/bin/headunit)