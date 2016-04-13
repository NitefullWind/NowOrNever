import QtQuick 2.5

Rectangle {

    property string backgroundText: "";
    property bool isPassword: false;
    property string text: textInput.text;

    id: root;
    implicitWidth: 200;
    implicitHeight: 50;

    border.width: 1;
    border.color: "lightblue";
//    color: "red";
    radius: 7

    TextInput {
        id: textInput;
        font.pointSize: 20;
        width: parent.width;
        height: parent.height;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: parent.left;
        anchors.leftMargin: 5;
        verticalAlignment: TextInput.AlignVCenter
        echoMode: isPassword==true ? TextInput.Password : TextInput.Normal;
        activeFocusOnPress: true;
        activeFocusOnTab: true;
        validator: RegExpValidator {
            regExp: /[\d\z-\u4e00\u9fa5-\uffff!@#$%^&*()_+-=,.<>?/:;"'{}\[\]`~'"]+/
        }

        Text {
//            anchors.verticalCenter: parent.verticalCenter;
            verticalAlignment: Text.AlignVCenter
            text: textInput.text=="" ? backgroundText : "";
            anchors.fill: parent;
            font.pointSize: parent.font.pointSize;
            opacity: 0.3;
        }

    }
}

