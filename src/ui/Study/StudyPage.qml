import QtQuick 2.4
import "../Component"

//学习界面
Page {
    id: root
    width: 400
    height: 400

    //学习进度条
    Rectangle {
        id: rec_progress
        width: parent.width * 0.8
        height: parent.height / 50
        color: "#f8f810"
        radius: 0
        z: 1
        anchors.bottomMargin: (parent.height - rec_todayInfo.height) >> 4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: text_today.top
        border.width: 0
        border.color: "#ffffff"

        AnimatedImage {
            id: borderImg_progress
            width: (parseFloat(User.learnedNum) / parseFloat(User.totalNum))*rec_progress.width;

            height: parent.height + 2
            z: 2
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: "qrc:/progressBar"

            Text {
                id: text_learned
                text: qsTr("Learned:")
                font.family: "Courier"
                opacity: 0.5
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 12
            }

            Text {
                id: text_learnedNum
                text: User.learnedNum
                font.family: "Courier"
                opacity: 0.5
                font.pointSize: 12
                anchors.top: text_learned.top
                anchors.topMargin: 0
                anchors.left: text_learned.right
                anchors.leftMargin: 10
            }
        }

        Text {
            id: text_total
            text: qsTr("Total:")
            font.family: "Courier"
            opacity: 0.5
            horizontalAlignment: Text.AlignRight
            font.pointSize: 12
            anchors.right: text_totalNum.left
            anchors.rightMargin: 10
            anchors.top: text_totalNum.top
            anchors.topMargin: 0
        }

        Text {
            id: text_totalNum
            text: User.totalNum;
            font.family: "Courier"
            opacity: 0.5
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            font.pointSize: 12
        }
    }

    //Today
    Text {
        id: text_today
        text: qsTr("Today:")
        anchors.left: rec_todayInfo.left
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

    //学习信息展示
    Rectangle {
        id: rec_todayInfo
        width: rec_progress.width;
        height: parent.height * 0.35
        color: "#f4ebeb"
        anchors.verticalCenterOffset: (parent.height - height) * 0.3
        anchors.verticalCenter: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter

        //计划
        Text {
            id: text_plan
            width: 50
            height: 15
            text: qsTr("Plan")
            anchors.rightMargin: parent.width >> 3
            font.pointSize: 20
            anchors.top: text_new.top
            anchors.topMargin: 0
            anchors.right: text_new.left
            horizontalAlignment: Text.AlignHCenter
        }
        //计划数
        Text {
            id: text_planNum
            color: "#ed0404"
            text: User.planNum
            anchors.topMargin: 0
            font.pointSize: 18
            anchors.horizontalCenter: text_plan.horizontalCenter
            anchors.top: text_newNum.top
            horizontalAlignment: Text.AlignHCenter
        }

        //新词
        Text {
            id: text_new
            width: 50
            height: 15
//            text: qsTr("New")
            anchors.topMargin: parent.height >> 2
            font.pointSize: 20
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
        }

        //新单词数
        Text {
            id: text_newNum
            color: "#6b2be6"
//            text: User.newNum
            anchors.topMargin: parent.height >> 3
            font.pointSize: 18
            anchors.horizontalCenter: text_new.horizontalCenter
            anchors.top: text_new.bottom
            horizontalAlignment: Text.AlignHCenter
        }

        //完成
        Text {
            id: text_finished
            width: 50
            height: 15
            text: qsTr("Finished")
            anchors.leftMargin: parent.width >> 3
            font.pointSize: 20
            anchors.left: text_new.right
            anchors.top: text_new.top
            anchors.topMargin: 0
            horizontalAlignment: Text.AlignHCenter
        }
        //完成数
        Text {
            id: text_finishedNum
            text: User.finishedNum
            font.pointSize: 18
            anchors.horizontalCenter: text_finished.horizontalCenter
            anchors.top: text_newNum.top
            anchors.topMargin: 0
            horizontalAlignment: Text.AlignHCenter
        }

        //开始学习按钮
        Rectangle {
            id: rec_nowToLearn
            width: parent.width >> 1
            height: parent.height >> 2
            color: mouseArea_nowToLearn.pressed ? "#2247fc" : "#70efd9";
            radius: 10
            border.width: 0
            anchors.bottomMargin: height >> 1
            border.color: "#2247fc";
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom


            MouseArea {
                id: mouseArea_nowToLearn
                z: 2
                anchors.fill: parent

                //点击时跳转到StudyWord界面
                onClicked: {
                    root.pushPage("../Study/StudyWord.qml")
                }
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
}



