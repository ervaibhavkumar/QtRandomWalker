import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml 2.12

Window {
    id: window
    width: 500
    height: 500
    visible: true
    title: qsTr("Qt Random Walker")
    color: "black"

    Timer {
       id: textTimer
       interval: 500
       repeat: true
       running: true
       triggeredOnStart: true
       onTriggered: {
           canvas.requestPaint()
       }
   }
    Canvas {
        id: canvas
        anchors.fill: parent
        property int xCoord: window.width / 2
        property int yCoord: window.height / 2
        readonly property int radius: 6
        property vector2d current: Qt.vector2d(window.width / 2, window.height / 2)
        property vector2d prev: current

        onPaint: {
            var ctx = canvas.getContext("2d")

            var num = Qt.vector2d(25, 25)
            var directionX = ( Math.random() * 2 ) - 1
            var directionY = ( Math.random() * 2 ) - 1
            console.log(directionX, directionY)

            num = num.times(Qt.vector2d(directionX, directionY))

            current = current.plus(num)

            ctx.save();
            ctx.beginPath();

            ctx.lineWidth = 2;
            ctx.fillStyle = "red";
            ctx.strokeStyle = "blue";

            ctx.moveTo(prev.x, prev.y)
            ctx.lineTo(current.x, current.y);
            ctx.ellipse(current.x, current.y, radius, radius);

            ctx.closePath();
            ctx.fill();
            ctx.stroke();
            prev = current;

        }
    }
}
