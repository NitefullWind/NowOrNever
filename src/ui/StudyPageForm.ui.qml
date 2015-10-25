import QtQuick 2.4

Item {
    id: root
    width: 400
    height: 400

    Text {
        id: text_word
        color: "#0aafde"
        text: qsTr("Word")
        anchors.topMargin: parent.height >> 2
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pointSize: 50
    }
}

