import QtQuick 2.15
import QtLocation 5.15
import QtPositioning 5.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "../Icons"
import "../"


Rectangle{

    property bool runMenuAnimation: false
    color: "black"
    visible: true
    clip: true

    // Main stack view of application
    StackView{
        id: mainApplicationStackView
        anchors.fill: parent

        // Sliding in animation
        pushEnter: Transition {
            NumberAnimation {
                properties: "x"
                from: mainApplicationStackView.width
                to: 0
                duration: 1000 // Milliseconds for push animation
                easing.type: Easing.InOutQuad
            }
        }

        // Sliding out animation
        pushExit: Transition {
            NumberAnimation {
                properties: "x"
                from: 0
                to: -mainApplicationStackView.width
                duration: 1000 // Milliseconds for push animation
                easing.type: Easing.InOutQuad
            }
        }
    }

    // Map Page
    RightScreen {
        id: rightScreen
        enableGradient: true
        visible: false
    }

    Component.onCompleted: {
        mainApplicationStackView.push(rightScreen)
        rightScreen.startAnimation()
    }
}
