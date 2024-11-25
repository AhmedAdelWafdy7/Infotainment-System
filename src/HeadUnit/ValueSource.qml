import QtQuick 2.2

Item {
    id: valueSource



   

    property int speed: carinfo.speed
    property int rpm: carinfo.rpm
    property int battery: carinfo.battery

    property int gear: carinfo.gear
    property int direction: carinfo.direction

    property bool blink: !(valueSource.direction === 0)
    property bool left_direction: (valueSource.direction === 1 || valueSource.direction === 3)
    property bool right_direction: (valueSource.direction === 2 || valueSource.direction === 3)
    property bool left_on_off: false
    property bool right_on_off: false
    property bool initial_delay: !(valueSource.direction === 0)

    onDirectionChanged: {
        valueSource.blink = !(valueSource.direction === 0);
        valueSource.left_direction = (valueSource.direction === 1 || valueSource.direction === 3);
        valueSource.right_direction = (valueSource.direction === 2 || valueSource.direction === 3);
        valueSource.left_on_off = false;
        valueSource.right_on_off = false;
        valueSource.initial_delay = !(valueSource.direction === 0)
    }


    Behavior on speed {
        NumberAnimation {
            target: valueSource
            property: "speed"
            easing.type: Easing.InOutSine
            duration: 500
        }
    }

    Behavior on rpm {
        NumberAnimation {
            target: valueSource
            property: "rpm"
            easing.type: Easing.InOutSine
            duration: 500
        }
    }
    Behavior on battery {
        NumberAnimation {
            target: valueSource
            property: "battery"
            easing.type: Easing.InOutSine
            duration: 500
        }
    }

    function blinking() {
        if (valueSource.left_direction) {
            valueSource.left_on_off = !valueSource.left_on_off;
        }
        if (valueSource.right_direction) {
            valueSource.right_on_off = !valueSource.right_on_off;
        }
    }

    Timer {
        interval: 500; running: valueSource.blink; repeat: true
        onTriggered: {
            if(valueSource.initial_delay){
                valueSource.initial_delay = false
            }else {
                valueSource.blinking()
            }
        }
    }


    property string light: carinfo.light
    property int red: 0
    property int green: 0
    property int blue: 0
    property bool initial_update: false

    onLightChanged: {
        valueSource.red = parseInt(valueSource.light.substring(1, 3), 16)
        valueSource.green = parseInt(valueSource.light.substring(3, 5), 16)
        valueSource.blue = parseInt(valueSource.light.substring(5, 7), 16)

        if (!valueSource.initial_update) {
            valueSource.initial_update = true
        }
    }




}
