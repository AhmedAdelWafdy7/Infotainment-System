import QtQuick 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import QtQuick.Extras 1.0
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0
/**
 * CircularGaugeMeter.qml
 *
 * This QML file represents a circular gauge meter component.
 *
 * Properties:
 * - id: The unique identifier of the gauge.
 * - shadowVisible: A boolean indicating whether the shadow is visible or not.
 *
 * Style:
 * - labelStepSize: The step size between labels on the gauge.
 * - labelInset: The inset of the labels from the outer radius.
 * - tickmarkInset: The inset of the tickmarks from the outer radius.
 * - minorTickmarkInset: The inset of the minor tickmarks from the outer radius.
 * - minimumValueAngle: The minimum angle value of the gauge.
 * - maximumValueAngle: The maximum angle value of the gauge.
 * - background: The background of the gauge.
 * - tickmarkLabel: The label of the tickmarks.
 * - tickmark: The major tickmarks of the gauge.
 * - minorTickmark: The minor tickmarks of the gauge.
 *
 * Methods:
 * - degreesToRadians(degrees): Converts degrees to radians.
 * - createLinearGradient(ctx, start, end, colors): Creates a linear gradient.
 *
 * Signals:
 * - onValueChanged: Emitted when the value of the gauge changes.
 *
 * Example usage:
 * ```
 * CircularGauge {
 *     id: gauge
 *     shadowVisible: true
 *     style: CircularGaugeStyle {
 *         // style properties...
 *     }
 * }
 * ```
 */

CircularGaugeStyle {
        property bool shadowVisible: true

        property real xCenter: outerRadius
        property real yCenter: outerRadius
        property real labelStepSize: 50
        property real labelInset: 45
        property real needleLength: 165
        property real needleTipWidth: 1
        property real needleBaseWidth: 10
        property bool halfGauge: false


        tickmarkInset: outerRadius / 4.2
        minorTickmarkInset: outerRadius / 4.2
        minorTickmarkCount: 4

        minimumValueAngle: -135
        maximumValueAngle: 135

        tickmarkStepSize: 25

        background:Rectangle {
            implicitHeight: gauge.height
            implicitWidth: gauge.width
            color: "transparent"
            anchors.centerIn: parent
            radius: 360
            Canvas {
                visible: true
                property int value: gauge.value
                anchors.fill: parent
                opacity: 0.03
                onValueChanged: requestPaint()

                function degreesToRadians(degrees) {
                    return degrees * (Math.PI / 180);
                }

                function createLinearGradient(ctx, start, end, colors) {
                    var gradient = ctx.createLinearGradient(start.x, start.y, end.x, end.y);
                    for (var i = 0; i < colors.length; i++) {
                        gradient.addColorStop(i / (colors.length - 1), colors[i]);
                    }
                    return gradient;
                }

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();

                    // Define the gradient colors for the filled arc
                    var gradientColors = [
                                "#D9D9D9",// Start color
                                "#D9D9D9",    // End color
                            ];

                    // Calculate the start and end angles for the filled arc
                    var startAngle = valueToAngle(gauge.minimumValue) - 90;
                    var endAngle = valueToAngle(gauge.value) - 90;

                    // Create a linear gradient
                    var gradient = createLinearGradient(ctx, { x: 0, y: 0 }, { x: outerRadius * 2, y: 0 }, gradientColors);

                    // Loop through the gradient colors and fill the arc segment with each color
                    for (var i = 0; i < gradientColors.length; i++) {
                        var gradientColor = gradientColors[i];
                        var angle = startAngle + (endAngle - startAngle) * (i / (gradientColors.length - 1));

                        ctx.beginPath();
                        ctx.lineWidth = outerRadius * 0.15;
                        ctx.strokeStyle = gradient;
                        ctx.arc(outerRadius,
                                outerRadius,
                                outerRadius - 48,
                                degreesToRadians(angle),
                                degreesToRadians(endAngle));
                        ctx.stroke();
                    }
                }
            }
        }
        tickmarkLabel: Text {
            FontLoader{
                id: font
                source: "qrc:/font/Nebula-Regular.otf"
            }
            font.family: font.name
            font.pixelSize: 20
            text: styleData.value

            color: styleData.index === 8 || styleData.index === 9 ? "red" : "white"
        }
    }

