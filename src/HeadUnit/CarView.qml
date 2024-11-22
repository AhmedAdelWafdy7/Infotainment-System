import QtQuick 2.15
import Qt3D.Core 2.0
import Qt3D.Render 2.15
import Qt3D.Input 2.0
import Qt3D.Extras 2.15
import QtQuick.Scene3D 2.0

Item {
    id: mainview
    visible: true
    width: root.width/3
    height: root.height
    property alias hidden: CarModel.hidden

    Scene3D {
        id: carScene
        width: mainview.width
        height: mainview.height
        multisample: true
        CarModel {
            id: carModel
            scene: carScene
        }
    }

    /**
    * Function to control highlights from dashboard.
    *
    * This function calls the `highlightLamp()` method of the `carModel` object to determine the type of highlight to be displayed on the dashboard.
    * It also toggles the idle timer of the `carModel` object to true and restarts the `resetModelTimer`.
    *
    * @returns {string} The type of highlight to be displayed on the dashboard.
    */
    function highlightLamp(){
        var type = carModel.highlightLamp()
        carModel.toggleIdleTimer(true)
        resetModelTimer.restart()
        return type
    }
    /**
    * Highlights the specified doors of the car.
    *
    * @param {Array} doors - The doors to highlight.
    */
    function highlightDoors(doors) {
        doorAction = true
        carModel.doorAction = true
        carModel.highlightOpenDoors(doors)
        carModel.toggleIdleTimer(true)
        resetModelTimer.restart()
    }
    /**
    * Highlights a tire in the car view.
    *
    * This function is responsible for highlighting a specific tire in the car view. It calls the `highlightTire()` function of the `carModel` object to determine the type of tire to highlight. It also toggles the idle timer of the car model to prevent it from going into idle mode while the tire is highlighted. Finally, it restarts the model timer and returns the type of the highlighted tire.
    *
    * @returns {string} The type of the highlighted tire.
    */
    function highlightTire() {
        var type = carModel.highlightTire()
        carModel.toggleIdleTimer(true)
        resetModelTimer.restart()
        return type
    }

    Timer {
        id: resetModelTimer
        interval: 3000
        running: false
        onTriggered: {
            carModel.resetHighlight()
            carModelHighlightType = 0
            doorAction = false
            actionInProgress = false
            if(!CenterStack.visible)
                returnView.start()
            if(visible)
                carModel.toggleIdleTimer(true)
        }
    }

    onVisibleChanged: {
        carModel.toggleIdleTimer(visible)
    }
    Component.onCompleted: {
        carModel.toggleIdleTimer(visible)
    }


}
