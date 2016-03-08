import QtQuick 2.0

Rectangle {
    id: root;
    property string pageTitle: "";
    property alias mouseArea_back: mouseArea_back;
    property StackPage stackPage: null;

    width: 100
    height: 50
    color: "blue";

    Rectangle {
        id: btn_back;
        height: root.height;
        width: height;
        color: mouseArea_back.pressed ? "red" : "blue";

        MouseArea {
            id: mouseArea_back;
            anchors.fill: parent;
            onClicked: {
                stackPage._pop(1);
            }
        }

        Text {
            text: qsTr("←");
            font.pointSize: 15;
            font.bold: true;
            color: "white";
        }
    }

    Text {
        id: text_title;
        anchors.left: btn_back.right;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.leftMargin: 10;

        text: qsTr(pageTitle);
        font.pointSize: 15;
        font.bold: true;
        color: "white";
    }
}
