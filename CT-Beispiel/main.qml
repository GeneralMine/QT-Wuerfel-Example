import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle{
        id: viereck
        width: height
        height: 100
        color: "blue"
        border.width: 3
        border.color: "red"
        Button{
            //color: "green"
            x: 100
            y: 100
            onClicked: {
                viereck.color = "black"
                x = Math.random()*(parent.width - width)
                y = Math.random()*(parent.height - height)
            }
        }

    }
}
