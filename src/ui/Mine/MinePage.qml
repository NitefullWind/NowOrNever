import QtQuick 2.4
import "../Component"

Page {
    width: 400
    height: 400

    Rectangle {
        id: rectangle1
        color: "#2144f5"
        anchors.fill: parent
    }

    Text {
        id: text1
        x: 188
        y: 194
        text: qsTr("MinePage")
        font.pixelSize: 12
    }

}

