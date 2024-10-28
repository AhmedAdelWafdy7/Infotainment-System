import QtQuick 2.9
import QtQuick.Controls 2.0

ApplicationWindow {
    id:root
    width: 1024
    height: 600
    visible: true
    title: qsTr("DashBoard")
    color: "#000"
    CarLoader{
        anchors.centerIn: parent
        onLoaded: item.hidden = false
        width: parent.width / 2.5
        height: parent.height - 180
    }
}
