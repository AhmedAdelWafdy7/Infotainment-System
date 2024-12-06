import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Window {
    id: window
    width: 1024
    height: 600
    visible: true
    title: qsTr("Head Unit")


    
    
    property alias font: font

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: panel
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 100
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 100
            }
        }
    }

    ValueSource{
        id:valueSource
    }

    FontLoader
    {
        id: font
        source: "qrc:/fontawesome.otf"
    }

    Image{
        id: panel
        z:-2
        sourceSize: Qt.size(window.width,window.height)
        anchors.centerIn: parent
        source: "qrc:/background.jpg"


        Text {
            text: Math.floor(carinfo.throttle * 100) + "%"
            font.family: font.name
            font.pixelSize: 50
            color: "white"
            x: 70
            y: 20
        }


        //Left Side
        ColumnLayout{
            anchors{
                left: parent.left
                leftMargin: 20
                bottom: leftIndicator.top
                bottomMargin: 40
            }
            IconButton{
                id:handbreak
                roundIcon: true
                iconWidth: 45
                iconHeight: 45
                checkable: true
                setIcon:checked ? "qrc:/icons/icons-left/mdi_car-handbrake.svg" : "qrc:/icons/icons-left/mdi_car-handbrake.svg"
            }
            IconButton{
                id:battery
                roundIcon: true
                iconWidth: 45
                iconHeight: 45
                checkable: true
                setIcon:checked ? "qrc:/icons/icons-left-checked/mdi_car-battery.svg" : "qrc:/icons/icons-left/mdi_car-battery.svg"
                SequentialAnimation {
                    running: battery.checked
                    loops: Animation.Infinite
                    OpacityAnimator {
                        target: battery.roundIcon ? battery.roundIconSource : battery.iconSource
                        from: 0;
                        to: 1;
                        duration: 500
                    }
                    OpacityAnimator {
                        target: battery.roundIcon ? battery.roundIconSource : battery.iconSource
                        from: 1;
                        to: 0;
                        duration: 500
                    }
                }
            }
            IconButton{
                id:engineBold
                roundIcon: true
                iconWidth: 45
                iconHeight: 45
                checkable: true
                setIcon:checked ? "qrc:/icons/icons-left-checked/ph_engine-bold.svg" : "qrc:/icons/icons-left/ph_engine-bold.svg"
                SequentialAnimation {
                    running: engineBold.checked
                    loops: Animation.Infinite
                    OpacityAnimator {
                        target: engineBold.roundIcon ? engineBold.roundIconSource : engineBold.iconSource
                        from: 0;
                        to: 1;
                        duration: 500
                    }
                    OpacityAnimator {
                        target: engineBold.roundIcon ? engineBold.roundIconSource : engineBold.iconSource
                        from: 1;
                        to: 0;
                        duration: 500
                    }
                }
            }
            IconButton{
                id:oil
                roundIcon: true
                iconWidth: 45
                iconHeight: 45
                checkable: true
                setIcon:checked ? "qrc:/icons/icons-left-checked/mdi_oil.svg" : "qrc:/icons/icons-left/mdi_oil.svg"
                SequentialAnimation {
                    running: oil.checked
                    loops: Animation.Infinite
                    OpacityAnimator {
                        target: oil.roundIcon ? oil.roundIconSource : oil.iconSource
                        from: 0;
                        to: 1;
                        duration: 500
                    }
                    OpacityAnimator {
                        target: oil.roundIcon ? oil.roundIconSource : oil.iconSource
                        from: 1;
                        to: 0;
                        duration: 500
                    }
                }
            }
            IconButton{
                id:tireAlert
                roundIcon: true
                iconWidth: 45
                iconHeight: 45
                checkable: true
                setIcon:checked ? "qrc:/icons/icons-left/mdi_car-tire-alert.svg" : "qrc:/icons/icons-left/mdi_car-tire-alert.svg"
            }
        }
        Text {
            text: "P"
            font.family: font.name
            font.pixelSize: 40
            color: (valueSource.gear === 0) ? "white" : "lightgray"
            x: 40
            y: 20
        }

        Text {
            text: "D"
            font.family: font.name
            font.pixelSize: 40
            color: (valueSource.gear === 3) ? "black" : "lightgray"
            x: 40
            y: 60
        }

        Text {
            text: "R"
            font.family: font.name
            font.pixelSize: 40
            color: (valueSource.gear === 1) ? "#FF6868" : "#FFCECE"
            x: 40
            y: 100
        }

        Text {
            text: "N"
            font.family: font.name
            font.pixelSize: 40
            color: (valueSource.gear === 2) ? "#35CA3D" : "#AEFFAE"
            x: 40
            y: 140
        }
        Image{
            id:topBar
            source: "qrc:/Top Bar.png"
            sourceSize: Qt.size(window.width * 0.6,150)
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter


            RowLayout{
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.verticalCenter: parent.verticalCenter
                spacing: 7
                Image{
                    source: "qrc:/icons/cloud.svg"
                    sourceSize: Qt.size(24,24)
                }
                Label{
                    text: qsTr("12 °C")
                    font.pixelSize: 24
                    font.bold: true
                    font.weight: Font.Normal
                    color: "#FFFFFF"
                    font.family: "TacticSans-Med"
                }
            }

            Label{
                id:timeLabel
                text: new Date().toLocaleTimeString(Qt.locale(), "hh:mm AP")
                anchors.right: parent.right
                anchors.rightMargin: 80
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 24
                font.bold: true
                font.weight: Font.Normal
                font.family: "TacticSans-Med"
                color: "#FFFFFF"
            }
        }

    ColumnLayout{
        anchors{
            right: parent.right
            rightMargin: 20
            bottom: rightIndicator.top
            bottomMargin: 40
        }
        IconButton{
            id:seatBreak
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right/mdi_seatbelt.svg" : "qrc:/icons/icons-right/mdi_seatbelt.svg"
        }
        IconButton{
            id:breakParking
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right/mdi_car-brake-parking.svg" : "qrc:/icons/icons-right/mdi_car-brake-parking.svg"
        }
        IconButton{
            id:lightDimmed
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right/mdi_car-light-dimmed.svg" : "qrc:/icons/icons-right/mdi_car-light-dimmed.svg"
        }
        IconButton{
            id:lightHigh
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right-checked/mdi_car-light-high.svg" : "qrc:/icons/icons-right/mdi_car-light-high.svg"
        }
        IconButton{
            id:lightFog
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right/mdi_car-light-fog.svg" : "qrc:/icons/icons-right/mdi_car-light-fog.svg"
        }
    }
        Image{
            id:leftgauge
            sourceSize: Qt.size(window.height /1.4 ,window.height /1.4)
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenterOffset: 50
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/Tacometer.png"

            CircularGauge {
                id:leftIndi
                property bool accelerating
                anchors.centerIn: parent
                width: parent.width * 0.95
                height: parent.height * 0.95
                value: valueSource.rpm
                maximumValue: 450
                style: RPMGauageStyle{}
                Component.onCompleted: forceActiveFocus()
                Behavior on value { NumberAnimation { duration: 1000 }}
                Keys.onSpacePressed:{
                    accelerating = true
                    rightGuage.accelerating = true
                }
                Keys.onReleased: {
                    if (event.key === Qt.Key_Space) {
                        accelerating = false;
                        event.accepted = true;
                        rightGuage.accelerating = false
                        event.accepted = true;
                    }
                }
            }

            Label{
                text: "🍃Echo"
                font.bold: true
                font.weight: Font.Normal
                font.pixelSize: 22
                font.family: "TacticSans-Med"
                color: "#2BD150"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: -10
                anchors.verticalCenterOffset: -70
                layer.effect: DropShadow {
                    anchors.fill: parent
                    horizontalOffset: 5
                    verticalOffset: 5
                    radius: 10
                    samples: 16
                    color: "white"
                }
            }
        }
        IconButton{
            text: "WAFDUNIX"
            anchors.top: topBar.bottom
            anchors.horizontalCenter: topBar.horizontalCenter
            font.pixelSize: 16
            font.bold: Font.DemiBold
            implicitHeight: 80
            implicitWidth: 120
            setIconSize: 50
            checkable: true
            iconBackground: "transparent"
            setIconColor :"#4287f5"
            font.weight: Font.Normal
            font.family: "TacticSans-Lgt"
            onClicked: stack.push("qrc:/Infotainment/infotainment.qml")
        }


        CarLoader{
            id:roadImage
            anchors.centerIn: parent
            onLoaded: item.hidden = false
            width: parent.height * 0.66
            height: parent.height * 0.56
            anchors.verticalCenterOffset: 80
        }

        Image{
            id:roadImage2
            visible: false
            anchors.centerIn: parent
            source: "qrc:/icons/Road/road3.svg"
            anchors.verticalCenterOffset: 40
            sourceSize.height: parent.height * 0.74

            Image{
                id:mainCar
                source: "qrc:/icons/Road/car.png"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 38
                anchors.verticalCenterOffset: 110
            }
            Image{
                sourceSize: Qt.size(mainCar.width*0.5,mainCar.height * 0.5)
                source: "qrc:/icons/Road/car.png"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: -30
                anchors.verticalCenterOffset: -100
            }
        }


        Image{
            id:rightgaugae
            sourceSize: Qt.size(window.height /1.55 ,window.height /1.55)
            anchors.right: parent.right
            anchors.rightMargin: 60
            anchors.verticalCenterOffset: 50
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/Speedometer.png"

            CircularGauge {
                id:rightGuage
                anchors.centerIn: parent
                property bool accelerating
                width: parent.width * 1.1
                height: parent.height * 1.1
                value: valueSource.speed
                maximumValue: 450
                Behavior on value { NumberAnimation { duration: 1000 }}
                style: SpeedGauageStyle{}

            }

            Label{
                text: "🍃Echo"
                font.bold: true
                font.weight: Font.Normal
                font.pixelSize: 22
                font.family: "TacticSans-Med"
                color: "#2BD150"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: -10
                anchors.verticalCenterOffset: -70
                layer.effect: DropShadow {
                    anchors.fill: parent
                    horizontalOffset: 5
                    verticalOffset: 5
                    radius: 10
                    samples: 16
                    color: "white"
                }
            }


    }


        Image{
            sourceSize: Qt.size(topBar.width,topBar.height)
            source: "qrc:/icons/bottom.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            RowLayout{
                spacing: 60
                anchors.right: middle.left
                anchors.rightMargin: 60
                anchors.verticalCenter: middle.verticalCenter
                IconButton{
                    setIconSize:32
                    implicitHeight: 45
                    implicitWidth: 45
                    checkable: true
                    iconBackground: "transparent"
                    setIconColor :checked ? "#777781" : "#777781"
                    text: "\uf3c5"
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.family: font.name
                    font.pixelSize: 32
                    onCheckedChanged: {
                        if(checked){

                        }
                    }
                }

                IconButton{
                    setIconSize:32
                    implicitHeight: 45
                    implicitWidth: 45
                    checkable: true
                    iconBackground: "transparent"
                    setIconColor :checked ? "#777781" : "#777781"
                    text: "\uf601"
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.pixelSize: 32
                    font.family: font.name
                    onCheckedChanged: {
                        if(checked){

                        }
                    }
                }
            }

            RowLayout{
                id:middle
                anchors.centerIn: parent

                Text{
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.pixelSize: 45
                    color: "#FFFFFF"
                    font.family: "TacticSans-Med"
                    text: rightGuage.value.toFixed(0)
                }

                Text{
                    Layout.alignment: Qt.AlignVCenter
                    font.pixelSize: 24
                    color: "#FFFFFF"
                    font.family: "TacticSans-Med"
                    text: "Km/hr"
                }
            }

            RowLayout{
                spacing: 60
                anchors.left: middle.right
                anchors.leftMargin: 60
                anchors.verticalCenter: middle.verticalCenter
                IconButton{
                    setIconSize:32
                    implicitHeight: 45
                    implicitWidth: 45
                    checkable: true
                    iconBackground: "transparent"
                    setIconColor :checked ? "#777781" : "#777781"
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.pixelSize: 32
                    font.family: font.name
                    text: "\uf001"
                    onCheckedChanged: {
                        if(checked){

                        }
                    }
                }
                IconButton{
                    setIconSize:32
                    implicitHeight: 45
                    implicitWidth: 45
                    checkable: true
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.pixelSize: 32
                    font.family: font.name
                    iconBackground: "transparent"
                    setIconColor :checked ? "#777781" : "#777781"
                    text: "\uf1de"
                }
            }
        }
        //Right Side
        IconButton{
            id:rightIndicator
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked || (valueSource.right_on_off) ? "qrc:/icons/icons-right-checked/icon-park-solid_right-two.svg" : "qrc:/icons/icons-right/icon-park-solid_right-two.svg"
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            SequentialAnimation {
                running: rightIndicator.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: rightIndicator.roundIcon ? rightIndicator.roundIconSource : rightIndicator.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: rightIndicator.roundIcon ? rightIndicator.roundIconSource : rightIndicator.iconSource
                    from: 1;
                    to: 0;
                    duration: 500
                }
            }
        }

        IconButton{
            id:leftIndicator
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked || (valueSource.left_on_off) ? "qrc:/icons/icons-left-checked/icon-park-solid_right-two.svg" : "qrc:/icons/icons-left/icon-park-solid_right-two.svg"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            SequentialAnimation {
                running: leftIndicator.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: leftIndicator.roundIcon ? leftIndicator.roundIconSource : leftIndicator.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: leftIndicator.roundIcon ? leftIndicator.roundIconSource : leftIndicator.iconSource
                    from: 1;
                    to: 0;
                    duration: 500
                }
            }
        }

    }

}

