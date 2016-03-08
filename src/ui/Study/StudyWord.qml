import QtQuick 2.4
import "../Component"

Page {
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

    Rectangle {
        id: rec_know
        width: parent.width / 1.5
        height: parent.height / 15
        color: "#0483e9"
        radius: 15
        opacity: mouseArea_know.pressed ? 0.8 : 0.6
        anchors.horizontalCenterOffset: 0
        anchors.bottom: rec_notKnow.top
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: text_know
            color: "#ffffff"
            text: qsTr("I Know")
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
        }

        MouseArea {
            id: mouseArea_know
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rec_notKnow
        width: rec_know.width
        height: rec_know.height
        color: "#0483e9"
        radius: 15
        opacity: mouseArea_notKnow.pressed ? 0.8 : 0.6
        anchors.bottomMargin: parent.height >> 4
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: text_notKnow
            color: "#ffffff"
            text: qsTr("I Don't Know")
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
        }

        MouseArea {
            id: mouseArea_notKnow
            anchors.fill: parent
        }
    }

    Component.onCompleted: {
        console.log("创建");
    }
    Component.onDestruction: {
        console.log("销毁");
    }
}

