#!/bin/bash

~/generator/core-generator/commonapi-core-generator-linux-x86_64 --skel --dest-common ./src-gen/CANSender/core/common --dest-proxy ./src-gen/CANSender/core/proxy --dest-stub ./src-gen/CANSender/core/stub --dest-skel ./src-gen/CANSender/core/skel ./fidl/CANSender/CANSender.fidl

~/generator/someip-generator/commonapi-someip-generator-linux-x86_64 --dest-common ./src-gen/CANSender/someip/common --dest-proxy ./src-gen/CANSender/someip/proxy --dest-stub ./src-gen/CANSender/someip/stub ./fidl/CANSender/CANSender.fdepl


~/generator/core-generator/commonapi-core-generator-linux-x86_64 --skel --dest-common ./src-gen/PiSender/core/common --dest-proxy ./src-gen/PiSender/core/proxy --dest-stub ./src-gen/PiSender/core/stub --dest-skel ./src-gen/PiSender/core/skel ./fidl/PiSender/PiSender.fidl

~/generator/someip-generator/commonapi-someip-generator-linux-x86_64 --dest-common ./src-gen/PiSender/someip/common --dest-proxy ./src-gen/PiSender/someip/proxy --dest-stub ./src-gen/PiSender/someip/stub ./fidl/PiSender/PiSender.fdepl


~/generator/core-generator/commonapi-core-generator-linux-x86_64 --skel --dest-common ./src-gen/PiController/core/common --dest-proxy ./src-gen/PiController/core/proxy --dest-stub ./src-gen/PiController/core/stub --dest-skel ./src-gen/PiController/core/skel ./fidl/PiController/PiController.fidl

~/generator/someip-generator/commonapi-someip-generator-linux-x86_64 --dest-common ./src-gen/PiController/someip/common --dest-proxy ./src-gen/PiController/someip/proxy --dest-stub ./src-gen/PiController/someip/stub ./fidl/PiController/PiController.fdepl


~/generator/core-generator/commonapi-core-generator-linux-x86_64 --skel --dest-common ./src-gen/IPCManager/core/common --dest-proxy ./src-gen/IPCManager/core/proxy --dest-stub ./src-gen/IPCManager/core/stub --dest-skel ./src-gen/IPCManager/core/skel ./fidl/IPCManager/IPCManager.fidl

~/generator/someip-generator/commonapi-someip-generator-linux-x86_64 --dest-common ./src-gen/IPCManager/someip/common --dest-proxy ./src-gen/IPCManager/someip/proxy --dest-stub ./src-gen/IPCManager/someip/stub ./fidl/IPCManager/IPCManager.fdepl



~/generator/core-generator/commonapi-core-generator-linux-x86_64 --skel --dest-common ./src-gen/HeadUnit/core/common --dest-proxy ./src-gen/HeadUnit/core/proxy --dest-stub ./src-gen/HeadUnit/core/stub --dest-skel ./src-gen/HeadUnit/core/skel ./fidl/HeadUnit/HeadUnit.fidl

~/generator/someip-generator/commonapi-someip-generator-linux-x86_64 --dest-common ./src-gen/HeadUnit/someip/common --dest-proxy ./src-gen/HeadUnit/someip/proxy --dest-stub ./src-gen/HeadUnit/someip/stub ./fidl/HeadUnit/HeadUnit.fdepl


~/generator/core-generator/commonapi-core-generator-linux-x86_64 --skel --dest-common ./src-gen/PDCUnit/core/common --dest-proxy ./src-gen/PDCUnit/core/proxy --dest-stub ./src-gen/PDCUnit/core/stub --dest-skel ./src-gen/PDCUnit/core/skel ./fidl/PDCUnit/PDCUnit.fidl

~/generator/someip-generator/commonapi-someip-generator-linux-x86_64 --dest-common ./src-gen/PDCUnit/someip/common --dest-proxy ./src-gen/PDCUnit/someip/proxy --dest-stub ./src-gen/PDCUnit/someip/stub ./fidl/PDCUnit/PDCUnit.fdepl


~/generator/core-generator/commonapi-core-generator-linux-x86_64 --skel --dest-common ./src-gen/IVI/core/common --dest-proxy ./src-gen/IVI/core/proxy --dest-stub ./src-gen/IVI/core/stub --dest-skel ./src-gen/IVI/core/skel ./fidl/IVI/IVI.fidl

~/generator/someip-generator/commonapi-someip-generator-linux-x86_64 --dest-common ./src-gen/IVI/someip/common --dest-proxy ./src-gen/IVI/someip/proxy --dest-stub ./src-gen/IVI/someip/stub ./fidl/IVI/IVI.fdepl


~/generator/core-generator/commonapi-core-generator-linux-x86_64 --skel --dest-common ./src-gen/RemoteSpeaker/core/common --dest-proxy ./src-gen/RemoteSpeaker/core/proxy --dest-stub ./src-gen/RemoteSpeaker/core/stub --dest-skel ./src-gen/RemoteSpeaker/core/skel ./fidl/RemoteSpeaker/RemoteSpeaker.fidl

~/generator/someip-generator/commonapi-someip-generator-linux-x86_64 --dest-common ./src-gen/RemoteSpeaker/someip/common --dest-proxy ./src-gen/RemoteSpeaker/someip/proxy --dest-stub ./src-gen/RemoteSpeaker/someip/stub ./fidl/RemoteSpeaker/RemoteSpeaker.fdepl

