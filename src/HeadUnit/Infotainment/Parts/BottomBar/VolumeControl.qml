import QtQuick 2.15

Item {
    property string fontColor: "#f2f5f3"

    Connections{
        target: audioController
        function onVolumeLevelChanged(){
            volumeIcon.visible = false
            visibleTimer.stop()
            visibleTimer.start()
        }
    }

    Timer{
        id: visibleTimer
        interval: 1000
        repeat: false
        onTriggered: {
            volumeIcon.visible = true
        }
    }

    Rectangle{
        id: decrementbutton
        anchors{
            right: volumeIcon.left
            rightMargin: 15
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
            onClicked: audioController.incrementVolume(-1)
        }

    }


    Image {
        id: volumeIcon
        height: parent.height *.5
        fillMode: Image.PreserveAspectFit
        anchors{
            right: inccrementbutton.left
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
        source:{
            if(audioController.volumeLevel <=1 )
                return "qrc:/Infotainment/assets/mute.png"
            else if (audioController.volumeLevel <= 50)
                return "qrc:/Infotainment/assets/volume-low.png"
            else
                return "qrc:/Infotainment/assets/volume-high.png"
        }
    }


    Text {
        id: targetAudioText
        visible: !volumeIcon.visible
        anchors{
            centerIn: volumeIcon
        }
        color: fontColor
        font.pixelSize: 24
        text: audioController.volumeLevel
    }

    Rectangle{
        id: inccrementbutton
        anchors{
            right: parent.right
            rightMargin: 15
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
            onClicked: audioController.incrementVolume(1)
        }
    }
}
