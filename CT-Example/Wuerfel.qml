import QtQuick 2.0
import de.wuerfelbude.wuerfel 1.0
WuerfelRaw{
    id: rawWuerfel
    width: 100
    height: 100
    seitenZahl: 6
    farbe: "red"

    property int animationDuration: 500
    property var allStates: ["eins", "zwei", "drei", "vier"]
    property int textSize: 40

    Rectangle{
        id: rect
        anchors.fill: parent
        color: parent.farbe
        border.width: 1

        Text{
            id: wuerfelText
            anchors.centerIn: parent
            text: parent.parent.wuerfeln()
            font.pixelSize: textSize
            onRotationChanged: NumberAnimation{
                target: wuerfelText
                property: "font.pixelSize"
                from: textSize+20
                to: textSize
                duration: animationDuration + 10 //+5, da ein Bug die Animation zweimal ausführen möchte
                easing.type: Easing.InQuint
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: rollDice()
    }
    property int stat: 0
    function rollDice(){
        rawWuerfel.state=allStates[(stat+1)%4]
        stat++
        wuerfelText.text = rawWuerfel.wuerfeln()
    }

    state: "eins"
    states: [
        State{
            name: "eins"
            PropertyChanges{
                target: wuerfelText
                rotation: 0
                color: "white"
            }
            PropertyChanges{
                target: rect
                color: "#021C1E"
            }
        },
        State{
            name: "zwei"
            PropertyChanges {
                target: wuerfelText
                rotation: 90
                color: "red"
            }
            PropertyChanges{
                target: rect
                color: "#004445"
            }
        },
        State{
            name: "drei"
            PropertyChanges {
                target: wuerfelText
                rotation: 180
                color: "yellow"
            }
            PropertyChanges{
                target: rect
                color: "#2C7873"
            }
        },
        State{
            name: "vier"
            PropertyChanges {
                target: wuerfelText
                rotation: 270
                color: "lime"
            }
            PropertyChanges{
                target: rect
                color: "#66A5AD"
            }
        }
    ]

    transitions: [
        Transition {
            from: "eins"
            to: "zwei"

            NumberAnimation{
                properties: "rotation"
                duration: animationDuration
                easing.type: Easing.InOutQuad
            }
            ColorAnimation {
                target: wuerfelText
                from: "white"
                to: "red"
                duration: animationDuration
            }
            ColorAnimation {
                target: rect
                from: "#021C1E"
                to: "#004445"
                duration: animationDuration
            }
        }, Transition {
            from: "zwei"
            to: "drei"

            NumberAnimation{
                properties: "rotation"
                duration: animationDuration
                easing.type: Easing.InOutQuad
            }
            ColorAnimation {
                target: wuerfelText
                from: "red"
                to: "yellow"
                duration: animationDuration
            }
            ColorAnimation {
                target: rect
                from: "#004445"
                to: "#2C7873"
                duration: animationDuration
            }
        }, Transition {
            from: "drei"
            to: "vier"

            NumberAnimation{
                properties: "rotation"
                duration: animationDuration
                easing.type: Easing.InOutQuad
            }
            ColorAnimation {
                target: wuerfelText
                from: "yellow"
                to: "lime"
                duration: animationDuration
            }
            ColorAnimation {
                target: rect
                from: "#2C7873"
                to: "#66A5AD"
                duration: animationDuration
            }
        }, Transition {
            from: "vier"
            to: "eins"

            NumberAnimation{
                properties: "rotation"
                duration: animationDuration
                easing.type: Easing.InOutQuad
            }
            ColorAnimation {
                target: wuerfelText
                from: "lime"
                to: "white"
                duration: animationDuration
            }
            ColorAnimation {
                target: rect
                from: "#66A5AD"
                to: "#021C1E"
                duration: animationDuration
            }
        }
    ]
}
