import QtQuick 2.15
import QtQuick.Extras 2.0
import QtQuick.Controls 2.0

/**
 * @brief DashboardForm is a QML component representing a dashboard form for a sport car instrumental cluster.
 *
 * The DashboardForm component is used to display various information and controls related to a sport car's instrumental cluster.
 * It includes properties for car information, startup animation control, gauge demo time, center stack, and icon colors.
 *
 * Example usage:
 * ```
 * DashboardForm {
 *     car: carModel
 *     startupAnimationStopped: true
 *     gaugeDemoTime: 2000
 *     centerStack: centerStackComponent
 *     iconRed: "#ff0000"
 *     iconGreen: "#00ff00"
 *     iconYellow: "#ffff00"
 *     iconDark: "#000000"
 * }
 * ```
 */

Item {
    id:root
    width: 1280
    height: 480
    property alias car: car
    property bool startupAnimationStopped: false
    property int gaugeDemoTime: 1000
    property alias centerStack: centerStack

    property color iconRed: "#e41e25"
    property color iconGreen: "#5caa15"
    property color iconYellow: "#face20"
    property color iconDark: "#444444"

    Rectangle {
        anchors.fill: parent
        color: "black"
        z: -1
    }

    CarLoader {
        id: car
        width: parent.width /2.5
        height: parent.height - 180

        anchors.centerIn: parent
    }
    Item {
        id: container

        width: root.width
        height: root.height
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent

        CenterStack {
            id: centerStack
            viewIndex: 3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 83
        }
    }

}
