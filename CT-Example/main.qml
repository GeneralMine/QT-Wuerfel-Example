import QtQuick 2.9
import QtQuick.Window 2.2
import de.wuerfelbude.wuerfel 1.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import "creator.js" as Creator

ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("Hello World")

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("‹")
                onClicked: console.log("Open Drawer")
            }
            Label {
                text: swipeView.currentItem.name
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                text: qsTr("⋮")
                onClicked: console.log("Open Menu")
            }
        }
    }

    SwipeView{
        id: swipeView
        anchors.fill: parent
        currentIndex: 0
        Item{
            id: rowPage
            property string name: "Repeating Dices"
            Grid{
                columns: 4
                Repeater{
                    model: 6
                    Wuerfel{}
                }
            }
        }
        Rectangle{

        }

        Item{
            id: listPage
            property string name: "Dynamic fluid List of Dices"
            ListView{
                id: diceList
                anchors.fill: parent
                model: VisualItemModel{
                    id: diceModel
                }
                header: Button{
                    height: 100
                    width: 100
                    text: "+"
                    onClicked: diceModel.append(Creator.createSpriteObjects())
                }

                footer: Button{
                    height: 100
                    width: 100
                    text: "-"
                    onClicked: diceModel.remove(diceModel.count - 1)
                }
                add: Transition {
                    NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 400 }
                    NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 400 }
                }
                remove: Transition {
                    ParallelAnimation {
                        NumberAnimation { property: "opacity"; from: 1.0; to: 0; duration: 400 }
                        NumberAnimation { property: "scale"; from: 1.0; to: 0; duration: 400 }
                    }
                }
                displaced: Transition {
                    NumberAnimation { properties: "x,y"; duration: 400; easing.type: Easing.OutBounce }
                }
            }
        }
        Item{
            property string name: "Picture Example"
            Label{
                anchors.bottom: img.top
                text: "BaKaRoS"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 40
            }

            Image{
                id: img
                anchors.centerIn: parent
                source: "qrc:/../../Pictures/Bakaros.png"
                width: parent.width/2
                height: width
            }
        }
    }

    PageIndicator{
        id: indicator
        count: swipeView.count
        currentIndex: swipeView.currentIndex
        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
