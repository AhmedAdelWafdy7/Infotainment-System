import QtQuick 2.15

Rectangle{
    id: navSearchBox

    radius: 5

    color: "#f0f5f1"
    Image {
        id: searchIcon

        anchors{
            left: parent.left
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }

        height: parent.height * .45
        fillMode: Image.PreserveAspectFit

        source: "qrc:/Infotainment/assets/magnifying-glass.png"
    }

    Text {
        id: navigationText
        visible: navigationTextInput.text === ""
        text: qsTr("Search")
        color: "#373737"
        anchors{
            verticalCenter: parent.verticalCenter
            left: searchIcon.right
            leftMargin: 10
        }
    }

    TextInput{
        id: navigationTextInput
        clip:true
        anchors{
            left: searchIcon.right
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            leftMargin: 10
        }

        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16
    }


}
