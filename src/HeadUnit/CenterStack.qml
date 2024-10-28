import QtQuick 2.15

Item {
    id: centerStack
    property int viewIndex: 4
    height: root.height - 173
    width: root.width / 2
    clip: true

    property alias fadeOutCenter: fadeOutCenter
    property alias fadeInCenter: fadeInCenter
    property alias loader: loader

    loader {
        id: loader
        onStatusChanged: {
            if(status == loader.Ready)
                fadeInCenter.start()
        }
        anchors.fill: parent
    }

    PropertyAnimation {
        id: fadeInCenter
        target: loader
        property: "opacity"
        from: 0.0
        to: 1.0
        duration: 400
        easing.type: Easing.Linear
    }

    /**
        * PropertyAnimation component that animates the opacity property from 1.0 to 0.0.
        *
        * This animation is used to fade out the center stack component.
        *
        * @property {real} from - The starting opacity value.
        * @property {real} to - The ending opacity value.
        * @property {int} duration - The duration of the animation in milliseconds.
        * @property {Easing} easing.type - The type of easing to be applied to the animation.
        * @signal stopped - This signal is emitted when the animation has stopped.
        *
        * @note The animation updates the visibility and hidden properties of the car component based on the current view index of the center stack.
        *       If the target is the car component and the view index is the car view index, the car component is set to visible and its item is set to not hidden.
        *       Otherwise, the car component is set to not visible and its item is set to hidden.
        *       The loader's source is updated based on the current view index of the center stack.
        */

    PropertyAnimation {
        id: fadeOutCenter
        property: "opacity"
        from: 0.0
        to: 1.0
        duration: 250
        easing.type: Easing.Linear

        onStopped: {
            if(target === car){
                car.visible = false
                car.item.hidden = true
            }
            if(centerStack.viewIndex === carviewindex){
                car.visible = true
                fadeInCenter.target = car
                car.item.hidden = false
                fadeInCenter.start()
            }else{
                fadeInCenter.target = loader
            }
            loader.source = component[centerStack.viewIndex]
        }
    }
}
