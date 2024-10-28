import QtQuick 2.9

CircularGaugeBasic {
    minimumValueAngle: -135
    maximumValueAngle: 135

    tickmarkStepSize: 25
    minorTickmarkCount: 4

    labelStepSize: 50
    labelInset: 45

    needleLength: 165
    needleBaseWidth: 10
    needleTipWidth: 1

    tickmark: Rectangle {
        implicitWidth: 3
        implicitHeight: 15
        color: "white"
    }

    minorTickmark: Rectangle {
        implicitWidth: 2
        implicitHeight: 7
        color: "white"
    }
    background: Canvas{
        FontLoader{
            id: font
            source: "qrc:/font/Nebula-Regular.otf"
        }

        Text{
            text: valueSource.speed
            color: "white"
            font.family: font.name
            font.pixelSize: 80
            anchors.horizontalCenter: parent.horizontalCenter
            y: 170
        }

        Text {
            text: "mm/s"
            color: "white"
            font.family: font.name
            font.pixelSize: 30
            anchors.horizontalCenter: parent.horizontalCenter
            y: 260
        }
    }
}
