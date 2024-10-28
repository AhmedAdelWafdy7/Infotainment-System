import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "Parts/BottomBar"
import "Parts/RightScreen"
import "Parts/LeftScreen"
import "Parts/Icons"
import "Parts"
import "qrc:/Infotainment/LayoutManager.js" as Responsive


Page {
    id: root
    width: 1024
    height: 600
    visible: true
    title: qsTr("Infotainment")

    onWidthChanged: {
        if(adaptive)
        adaptive.updateWindowWidth(root.width)
    }

    onHeightChanged: {
        if(adaptive)
            adaptive.updateWindowHeight(root.height)
    }
    property var adaptive: new Responsive.AdaptiveLayoutManager(root.width,root.height, root.width,root.height)
    BottomBar {
        id: bottomBar
        onOpenLauncher: launcher.open()
    }

    LeftScreen{
        id: leftScreen
    }

    RightScreen{
        id: rightScreen
        visible: Theme.mapAreaVisible
        spacing: 0
        NavigationScreenHelper{
            Layout.fillHeight: true
            Layout.fillWidth: true
            runMenuAnimation: true
        }
    }

    LaunchPad{
        id: launcher
        y: (root.height - height) / 2 + 120
        x: (root.width - width ) / 2
    }

}
