import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import hfut.non.Word 1.0
import hfut.non.UserInfoUpdate 1.0
import "../Component"

Page {
    id: root
    width: 400
    height: 400

    property Word word;

    topBar: TopBar {
        pageTitle: "Learn Word"
        stackPage: root.stackView;
    }

    property bool isMeanVisible: false;
    //学习单词页面主内容
    mainWindow: ShowWordRec {
        word: root.word;
        anchors.fill: parent;
        isMeanVisible: root.isMeanVisible;

        //认识按钮
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
                onClicked: {
                    isMeanVisible = false;
                    know();
                }
            }
        }

        //不认识按钮
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
                onClicked: {
                    isMeanVisible = true;
                }
            }
        }

    }

    function know() {
        User.finishedNum ++;
        if(User.finishedNum == User.planNum) {
            text_popup.text = "恭喜你已完成今日计划！继续努力吧"
            btn_popup.text = "继续学习";
            popup.show();
        }

        User.learnIndex ++;
        User.learnedNum ++;
        if(User.learnedNum === User.totalNum) {
            text_popup.text = "恭喜你已学完全部单词！";
            btn_popup.text = "再来一遍";
            popup.show();
            User.learnIndex = "0";
            User.learnedNum = "0";
        }

        showNextWord();
    }

    function showNextWord () {
        word = DicDB.getAWord(parseInt(User.learnIndex));
        wordChanged();  //发送word改变的信号，与word绑定处自动更新
    }

    Component.onCompleted: {
        showNextWord();
        console.log("创建");
    }
    Component.onDestruction: {
        User.updateLearnInfo();
//        userInfoUpdate.setLearnInfo(User.id, User.planNum, User.newNum, User.finishedNum, User.learnedNum, User.totalNum, User.learnIndex);
        console.log("销毁");
    }
}

