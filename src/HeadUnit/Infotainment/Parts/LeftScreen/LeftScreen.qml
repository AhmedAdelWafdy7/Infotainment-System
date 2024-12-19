import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "../Icons"
import "../"


Rectangle {
    id: leftScreen


    anchors{
        left: parent.left
        top: parent.top
        right: rightScreen.left
        bottom:bottomBar.top
    }
    color: "white"

    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * 1.5
        fillMode: Image.PreserveAspectFit
        source: "qrc:/Infotainment/assets/carRender.jpg"
    }

    RowLayout {
        id: root

        RowLayout {
                Layout.leftMargin: 50
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Image {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    source: "qrc:/Infotainment/assets/icons/battery.png"
                    sourceSize: Qt.size(40,50)
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    color:"black"
                    text: "20%"
                    font.family: "Inter"
                    font.bold: Font.Bold
                    font.pixelSize: 10
                }

            }

    }


    ColumnLayout {
        id: carLight
        spacing: 2
        Icon {
            id: headlights2
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon.source: "qrc:/Infotainment/assets/icons/Headlight2.svg"
            implicitHeight: 50
            implicitWidth: 50
        }
        Icon {
            id: property1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon.source: "qrc:/Infotainment/assets/icons/Property 1=Default.svg"
            implicitHeight: 50
            implicitWidth: 50
        }
        Icon {
            id: headlights
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon.source: "qrc:/Infotainment/assets/icons/Headlights.svg"
            implicitHeight: 50
            implicitWidth: 50
        }
        Icon {
            id: seatbelt
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon.source: "qrc:/Infotainment/assets/icons/Seatbelt.svg"
            implicitHeight: 50
            implicitWidth: 50
        }
        Icon {
            id: speedometer
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon.source: "qrc:/Infotainment/assets/icons/speedometer-svgrepo-com.svg"
            implicitHeight: 50
            implicitWidth: 50
            onClicked: {
                stack.pop()
            }
        }
    }
    Icon {
        id: lockIcon
        icon.source: (systemHandler.carLocked ? "qrc:/Infotainment/assets/padlock.png" : "qrc:/Infotainment/assets/open-padlock-silhouette.png")
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        implicitHeight: 40
        implicitWidth: 40
        MouseArea{
            anchors.fill: parent
            onClicked: systemHandler.setCarLocked( !systemHandler.carLocked)
        }
        anchors{
            bottom:  carRender.top
            bottomMargin: 5
            horizontalCenter: carRender.horizontalCenter
            margins: 10
        }
    }
    Rectangle {
        width: 2
        height: 40  // Height of the line
        color: "#A8C3F4" // Color of the line
        visible: systemHandler.carLocked? true : false
        anchors {
            top: lockIcon.bottom
            topMargin: 5  // Space between the lock icon and the line
            horizontalCenter: lockIcon.horizontalCenter
        }
    }
}

