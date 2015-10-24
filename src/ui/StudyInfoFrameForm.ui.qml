import QtQuick 2.4

Item {
    id: root
    width: 350
    height: width - 100

    property alias mouseArea_nowToLearn: mouseArea_nowToLearn;
    property alias rec_nowToLearn: rec_nowToLearn;

    Rectangle {
        id: rec_todayInfo
        width: parent.width
        height: parent.height - 50
        color: "#f4ebeb"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: text_plan
            width: 50
            height: 15
            text: qsTr("Plan")
            anchors.rightMargin: parent.width / 5
            font.pointSize: 20
            anchors.top: text_new.top
            anchors.topMargin: 0
            anchors.right: text_new.left
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: text_new
            width: 50
            height: 15
            text: qsTr("New")
            anchors.topMargin: parent.height >> 2
            font.pointSize: 20
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: text_finished
            width: 50
            height: 15
            text: qsTr("Finished")
            anchors.leftMargin: parent.width / 5
            font.pointSize: 20
            anchors.left: text_new.right
            anchors.top: text_new.top
            anchors.topMargin: 0
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: text_planNum
            color: "#ed0404"
            text: qsTr("9999")
            anchors.topMargin: 0
            font.pointSize: 18
            anchors.horizontalCenter: text_plan.horizontalCenter
            anchors.top: text_newNum.top
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: text_newNum
            color: "#6b2be6"
            text: qsTr("9999")
            anchors.topMargin: parent.height >> 3
            font.pointSize: 18
            anchors.horizontalCenter: text_new.horizontalCenter
            anchors.top: text_new.bottom
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: text_finishedNum
            text: qsTr("9999")
            font.pointSize: 18
            anchors.horizontalCenter: text_finished.horizontalCenter
            anchors.top: text_newNum.top
            anchors.topMargin: 0
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            id: rec_nowToLearn
            width: parent.width >> 1
            height: parent.height >> 2
            color: "#70efd9"
            radius: 10
            anchors.bottomMargin: height >> 1
            border.color: "#2247fc";
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            MouseArea {
                id: mouseArea_nowToLearn
                z: 2
                anchors.fill: parent
            }

            Text {
                id: text_nowToLearn
                color: "#ffffff"
                text: qsTr("Now To Learn")
                font.family: "Arial"
                style: Text.Normal
                font.pointSize: 20
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
            }
        }
    }

    Text {
        id: text_today
        width: 0
        height: 0
        text: qsTr("Today:")
        anchors.left: rec_todayInfo.left
        anchors.leftMargin: 0
        anchors.bottom: rec_todayInfo.top
        anchors.bottomMargin: 5
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignBottom
        textFormat: Text.AutoText
        font.pointSize: 25
        style: Text.Normal
        font.family: "Courier"
        font.bold: true
    }
}

