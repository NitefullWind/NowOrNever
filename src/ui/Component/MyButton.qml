import QtQuick 2.0

MouseArea {
    property string text: ""
    height: FontUnit.height(25)*1.5;

    id: mouArea;
    Rectangle {
        id: rec_button;
        anchors.fill: parent;
        radius: 7;
        color: mouArea.pressed ? "#11b2dd" : "#33ccf5";
    }
    Text {
        id: text_button;
        anchors.centerIn: parent;
        font.pointSize: 20;
        text: qsTr(mouArea.text)
    }
    Keys.onReturnPressed: {
        clicked()
        event.accepted = true;
    }
}
