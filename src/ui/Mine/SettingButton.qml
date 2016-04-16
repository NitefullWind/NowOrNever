import QtQuick 2.0

MouseArea {
    id: root;
    height: FontUnit.height(20)*2

    property string settingKey: "";
    property string settingValue: "";
    property string centerText: "";
    property int marginWidth: FontUnit.width(20,"俩字");

    Rectangle {
        id: rec_setting;
        color: root.pressed ? "#f3f3f3" : "#ffffff"
        anchors.fill: parent;

        border.width: 1;
        border.color: "#b1abab";

        Text {
            text: centerText;
            anchors.centerIn: parent;
            font.pointSize: 22
        }

        Text {
            text: settingKey;
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left;
            anchors.leftMargin: marginWidth;
            font.pointSize: 18;
        }
        Text {
            text: settingValue
            color: "#979797";
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: icon_in.left;
            anchors.rightMargin: marginWidth>>1;
            font.pointSize: 18;
        }
        Text {
            id: icon_in;
            text: ">"
            color: "#a3a0a0";
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: marginWidth;
            font.pointSize: 18;
        }
    }
}

