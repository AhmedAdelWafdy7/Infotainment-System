import QtQuick 2.15

Item {
    property string fontColor: "#f2f5f3"

    property var hvacController
    Rectangle{
        id: decrementbutton
        anchors{
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"
        Text {
            id: decrementText
            color: fontColor
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 12
        }

        MouseArea{
            anchors.fill:parent
            onClicked: hvacController.incrementTargetTemperature(-1)
        }

    }


    Text {
        id: targetTempretureText
        anchors{
            left: decrementbutton.right
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
        color: fontColor
        font.pixelSize: 24
        text: hvacController.targetTemperture
    }


    Rectangle{
        id: inccrementbutton
        anchors{
            left: targetTempretureText.right
            leftMargin: 15
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"
        Text {
            id: inccrementText
            color: fontColor
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 12
        }

        MouseArea{
            anchors.fill:parent
            onClicked: hvacController.incrementTargetTemperature(1)
        }
    }
}
