import QtQuick 2.4

Rectangle {
    id: root
    width: 360
    height: 60

    property alias rec_Nav: rec_Nav;
    property alias image_study: image_study;
    property alias image_find: image_find;
    property alias image_mine: image_mine;
    property alias mouseArea_study: mouseArea_study;
    property alias mouseArea_find: mouseArea_find;
    property alias mouseArea_mine: mouseArea_mine;

    Rectangle {

        id: rec_Nav
        width: parent.width
        height: parent.height
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        Image {
            id: image_study
            width: parent.height
            height: width
            anchors.rightMargin: parent.width / 6;
            anchors.right: image_find.left


            MouseArea {
                id: mouseArea_study;
                anchors.fill: parent;
            }
        }

        Image {
            id: image_find
            width: image_study.width
            height: width
            anchors.horizontalCenter: parent.horizontalCenter


            MouseArea {
                id: mouseArea_find;
                anchors.fill: parent;
            }
        }

        Image {
            id: image_mine
            width: image_study.width
            height: width
            anchors.leftMargin: parent.width / 6
            anchors.left: image_find.right


            MouseArea {
                id: mouseArea_mine;
                anchors.fill: parent;
            }
        }

    }

    Rectangle {
        id: line
        width: parent.width;
        height: 1
        color: "#000000"
        anchors.bottom: rec_Nav.top
        anchors.bottomMargin: 0
        opacity: 0.3
    }
}
