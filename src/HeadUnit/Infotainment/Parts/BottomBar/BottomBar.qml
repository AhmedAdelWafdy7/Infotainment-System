import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "../Icons/"

Rectangle {
    id: bottomBar
    signal openLauncher()
    anchors{
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }

    color: "black"
    height: parent.height / 10


    Icon{
        id:carSettingsIcon
        anchors {
            left:  parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }

        icon.source: "qrc:/Infotainment/assets/icons/sedan-car-front.png"
        onClicked: openLauncher()
    }


    RowLayout {
            id: middleLayout
            anchors.centerIn: parent
            spacing: 20

            Icon{
                icon.source: "qrc:/Infotainment/assets/icons/telephone-call.png"
            }

            Icon{
                icon.source: "qrc:/Infotainment/assets/icons/radio.png"
            }

            Icon{
                icon.source: "qrc:/Infotainment/assets/icons/bluethooth.png"
            }

            Icon{
                icon.source: "qrc:/Infotainment/assets/icons/spotify.png"
            }

            Icon{
                icon.source: "qrc:/Infotainment/assets/icons/dslr-camera.png"
            }

            Icon{
                icon.source: "qrc:/Infotainment/assets/icons/clapperboard2.png"
            }

        }
    HVAC{
        id: driverHVAC
        anchors{
            top: parent.top
            bottom: parent.bottom
            right: volume.right
            rightMargin: 150
            left: carSettingsIcon.right
        }
        hvacController: passengerHVAC
    }

    VolumeControl{
        id: volumeControl
        anchors {
            right:  parent.right
            rightMargin: 30
            top: parent.top
            bottom: parent.bottom
        }

    }
}

