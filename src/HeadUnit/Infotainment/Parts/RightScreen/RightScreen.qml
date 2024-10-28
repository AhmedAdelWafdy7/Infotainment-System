import QtQuick 2.15
import QtLocation 5.15
import QtPositioning 5.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import QtQml 2.15
import "../Icons"
import "../"

Page {
    id: rightScreen

    property var currentLoc: QtPositioning.coordinate(31.028019 , 31.368806)   // current location
    property bool isRoutingStart: false
    property bool runMapAnimation: false
    property bool enableGradient: true
    padding: 0

    function startAnimation (){
        geoModel.update()
    }

    anchors{
        top: parent.top
        right: parent.right
        bottom: bottomBar.top
    }

    width: parent.width * 2/3



    Plugin {
            id: mapPlugin
            name: "mapboxgl"
            PluginParameter { name: "mapboxgl.access_token"; value: "pk.eyJ1IjoiaGFzZWVidGFyaXExOTk4IiwiYSI6ImNsbGw4cXQ3YTFsdXkzanBxaG1rZDZrYTgifQ.8M9sbj-GM8oDrhAfCMUasw"}
        }

        Map {
            id: map
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(31.028019 , 31.368806) // Oslo
            zoomLevel: 14
            bearing: -80

            MapItemView{
                id:maproute
                model: routeModel
                delegate: Component{
                    MapRoute{
                        route:  routeData
                        line.color: "aqua"
                        line.width: adaptivewidth(7)
                    }
                }
            }

            MapQuickItem{
                id: currentLocationMark
                coordinate: QtPositioning.coordinate(31.028019 , 31.368806)
                visible: true
                z: 1

                onCoordinateChanged: {
                    if (isRoutingStart)
                        map.center = coordinate
                }

                sourceItem: Rectangle {
                                width: adaptive.width(100) * (map.zoomLevel / 17)
                                height: adaptive.height(100) *  (map.zoomLevel / 17)
                                color: "transparent"
                                anchors.centerIn: parent
                                radius: 180

                        Image {
                            id: car
                            width: adaptive.width(100) * (map.zoomLevel / 17)
                            height: adaptive.height(100) *  (map.zoomLevel / 17)
                            source: "qrc:/Infotainment/assets/focus.png"
                            anchors.centerIn: parent
                        }
                    }

                    Behavior on coordinate {
                        PropertyAnimation {
                        duration: 5000
                    }
                }
            }

            // Destination marker
                    MapQuickItem {
                        id: destinationMarker
                        visible: true
                        z: 1

                        sourceItem: Rectangle {
                            width: adaptive.width(50) * (map.zoomLevel / 17)
                            height: adaptive.height(50) *  (map.zoomLevel / 17)
                            color: "transparent"
                            anchors.centerIn: parent
                            radius: 180

                            AnimatedImage {
                                width: adaptive.width(50) * (map.zoomLevel / 17)
                                height: adaptive.height(50) *  (map.zoomLevel / 17)
                                source: "qrc:/Infotainment/assets/destination.gif"
                                anchors.centerIn: parent
                            }
                        }
                    }

                    // Departure location marker
                            MapQuickItem {
                                id: startMarker
                                visible: true
                                z: 1

                                sourceItem: Rectangle {
                                    width: adaptive.width(50) * (map.zoomLevel / 17)
                                    height: adaptive.height(50) *  (map.zoomLevel / 17)
                                    color: "transparent"
                                    anchors.centerIn: parent
                                    radius: 180

                                    Image {
                                        width: adaptive.width(50) * (map.zoomLevel / 17)
                                        height: adaptive.height(50) *  (map.zoomLevel / 17)
                                        source: "qrc:/Infotainment/assets/location-pin.png"
                                        anchors.centerIn: parent
                                    }
                                }
                            }


                            // Route model to calculate route
                                    RouteModel {
                                        id: routeModel
                                        plugin: geoModel.plugin
                                        query: RouteQuery {
                                            id: routeQuery
                                        }

                                        onRoutesChanged: {
                                            map.center = routeModel.get(0).path[(routeModel.get(0).path.length / 2).toFixed(0)]
                                            destinationMarker.coordinate = QtPositioning.coordinate(26.2124, 78.1772)
                                            startMarker.coordinate = currentLoc
                                            destinationMarker.visible = true
                                            startMarker.visible = true
                                            animationTimer.running = true
                                        }
                                    }

                                    // Timer to start car driving animation
                                    Timer {
                                        id: animationTimer
                                        interval: 3000
                                        onTriggered: {
                                            startMarker.visible = false
                                            currentLocationMark.visible = true
                                            isRoutingStart = true
                                            simulateDrive.path = routeModel.get(0).path

                                            routeStartAnimation.running = true
                                            simulateDrive.running = true
                                        }
                                    }

                                    // To simulate car driving on route
                                    Timer {
                                        id: simulateDrive
                                        property var path
                                        property int index
                                        interval: 1000
                                        repeat: true

                                        onTriggered: {
                                            if (path.length > index) {
                                                currentLocationMarker.coordinate = path[index]
                                                index++
                                            } else {
                                                simulateDrive.stop()
                                            }
                                        }
                                    }


            GeocodeModel {
                id: geoModel
                plugin: Plugin {
                    name: "osm"
                    PluginParameter {
                        name: "osm.mapping.custom.host"
                        value: "https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png"
                    }
                }
                query: "Gwalior"

                onLocationsChanged: {
                    if (count) {
                        routeQuery.addWaypoint(currentLoc)
                        routeQuery.addWaypoint(get(0).coordinate)
                        routeModel.update()
                    }
                }
            }
        }
        // To find coordinate of destination location

        // Animation to show at start where map tilts and rotates
            SequentialAnimation {
                id: routeStartAnimation

                PropertyAnimation {
                    id: centeranimation
                    duration: 1000
                    target: map
                    property: "center"
                    to: currentLoc
                }
                NumberAnimation {
                    id: zoomAnimation
                    target: map
                    duration: 6000
                    properties: "zoomLevel"
                    from: map.zoomLevel
                    to: 18
                }
                NumberAnimation {
                    id: tiltAnimation
                    target: map
                    duration: 1000
                    properties: "tilt"
                    from: 0
                    to: map.maximumTilt
                }
                NumberAnimation {
                    id: rotationAnimation
                    target: map
                    duration: 5000
                    properties: "bearing"
                    from: -80
                    to: 0
                }
            }
        Image {
            id: lockIcon
            source: (systemHandler.carLocked ? "qrc:/Infotainment/assets/padlock.png" : "qrc:/Infotainment/assets/open-padlock-silhouette.png")

            MouseArea{
                anchors.fill: parent
                onClicked: systemHandler.setCarLocked( !systemHandler.carLocked)
            }

            anchors{
                top: parent.top
                left: parent.left
                margins: 10
            }
            width: parent.width / 50
            fillMode: Image.PreserveAspectFit
        }

        Text{
            id:dateDisplay
            anchors{
                left: lockIcon.right
                leftMargin: 20
                bottom: lockIcon.bottom
            }

            font.pixelSize: 12
            font.bold: true
            color: "black"

            text: systemHandler.currentTime
        }
        Text{
            id:tempDisplay
            anchors{
                left: dateDisplay.right
                leftMargin: 20
                bottom: dateDisplay.bottom
            }

            font.pixelSize: 12
            font.bold: true
            color: "black"

            text: systemHandler.outdoorTemp + "°F"
        }
        Image{
            id: usernameIcon
            anchors{
                left: tempDisplay.right
                leftMargin: 20
                bottom: tempDisplay.bottom
            }
            source: "qrc:/Infotainment/assets/icons/icons.svg"
            sourceSize: Qt.size(18,18)
        }

        Text{
            id:usernameDisplay
            anchors{
                left: usernameIcon.right
                leftMargin: 2
                bottom: usernameIcon.bottom
            }

            font.pixelSize: 12
            font.bold: true
            color: "black"

            text: systemHandler.username
        }

        NavigationSearchBox{
            id: navSearchbox
            width: parent.width * 1/3
            height: parent.height * 1 /12
            anchors{
                left: lockIcon.left
                top: lockIcon.bottom
                topMargin: 10
            }
        }


}
