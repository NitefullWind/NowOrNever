import QtQuick 2.0
import QtQuick.Controls 1.4
Rectangle {
    id: root;
    property string pageTitle: "";
    property alias mouseArea_back: mouseArea_back;
    property StackView stackPage: null;

    width: 100
    height: FontUnit.height(30);
    color: "#70efd9";

    Rectangle {
        id: btn_back;
        height: root.height;
        width: height;
        color: mouseArea_back.pressed ? "#2247fc" : "#70efd9";

        MouseArea {
            id: mouseArea_back;
            anchors.fill: parent;
            onClicked: {
                stackPage.pop();
            }
        }

        Text {
            text: qsTr("<");
            anchors.centerIn: parent;
            font.pointSize: 25;
            font.bold: true;
            color: "white";
        }
    }

    Text {
        id: text_title;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
//        anchors.leftMargin: 10;

        text: qsTr(pageTitle);
        font.pointSize: 22;
        font.bold: true;
        color: "white";
    }
}
