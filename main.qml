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

        onPaint: {
            var ctx = canvas.getContext("2d")

            var num = Math.floor( Math.random() * 4 )

            switch (num) {
            case 0: {
                xCoord += radius;
                break;
            }
            case 1: {
                xCoord -= radius;
                break;
            }
            case 2: {
                yCoord += radius;
                break;
            }
            case 3: {
                yCoord -= radius;
                break;
            }
            }

            ctx.save();
            ctx.beginPath();
            console.log(1)
            ctx.fillStyle = "red";
            ctx.moveTo(xCoord, yCoord);
            ctx.ellipse(xCoord, yCoord, radius, radius)
            ctx.fill();
        }
    }
}
