import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property bool statusListview: false
    Text {
        id: txt
        x:300
        y:240
        z:1
        color: "red"
        font.pixelSize: 30
    }
    Item {
        id: itemoutmouse
        x:200
        width: 440
        height: 480
        DropArea {
            anchors.fill: parent
            onEntered: {
                console.log("vao roi")
            }
            onDropped: {
                console.log("dang day")
            }
        }
    }

    ListView {
        id:listview
        width: 200
        height: 400
        spacing: 5
        model: 30
        delegate: mydelegate
        onDraggingChanged: {
            statusListview = true
            txt.text = statusListview
        }
        onDragEnded: {
             statusListview = false
            txt.text = statusListview
        }
    }
    Component {
        id:mydelegate
        Rectangle {
            id:rec
            width: 200
            height: 50
            color: "pink"
            Text {
                color: "red"
                font.pixelSize: 30
                text: index
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    Drag.drop()
                }
            }

        }
    }
}
