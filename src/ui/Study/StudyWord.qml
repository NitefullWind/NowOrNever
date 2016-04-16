import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import hfut.non.Word 1.0
import hfut.non.DicDB 1.0
import hfut.non.FtpOp 1.0
import hfut.non.UserInfoUpdate 1.0
import "../Component"

Page {
    id: root
    width: 400
    height: 400

    property Word word;

//    topBar: Rectangle{
//        width: root.width;
//        height: 50;
//        color: "gray";
//        Image {
//            id: img_back
//            source: "qrc:/back";
//            height: parent.height;
//            width: height;

//            MouseArea {
//                id: btn_back;
//                anchors.fill: parent;
//                onClicked: {
//                    //点击时退出当前页
//                    root.popPage();
//                }
//            }
//        }
//    }

    topBar: TopBar {
        pageTitle: "Learn Word"
        stackPage: root.stackView;
    }

    Row {
        id: row_words_frequency;
        spacing: 20;
        anchors.horizontalCenter: root.horizontalCenter
        anchors.bottom: text_word.top;
        anchors.bottomMargin: 20;
        Rectangle {
            id: rec_num_cet4;
            width: FontUnit.width(20,"CET4")*1.5;
            height: FontUnit.height(20);
            border.color: "#0aafde";
            border.width: 1;
            Text {
                anchors.centerIn: parent;
                text: "CET4"
                font.pointSize: 20;
                color: "#0aafde";
            }
        }

        Text {
            text: word.CET4_Frequency
            font.pointSize: 20;
        }

        Rectangle {
            id: rec_num_cet6;
            width: rec_num_cet4.width;
            height: rec_num_cet4.height;
            border.color: "#0aafde";
            border.width: 1;
            Text {
                anchors.centerIn: parent;
                text: "CET6"
                font.pointSize: 20;
                color: "#0aafde";
            }
        }

        Text {
            text: word.CET6_Frequency
            font.pointSize: 20;
        }
    }

    Text {
        id: text_word
        color: "#0aafde"
        text: word.spell;
        anchors.topMargin: parent.height >> 2
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pointSize: 50
    }

    Text {
        id: text_word_mean;
        text: word.mean;
        anchors.top: text_word.bottom;
        anchors.topMargin: 10;
        anchors.horizontalCenter: parent.horizontalCenter;
        font.pointSize: 15;
        width: parent.width >> 1;
        wrapMode: Text.WordWrap;
        visible: false;
    }

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
                text_word_mean.visible = true;
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
        word = dicDB.getAWord(parseInt(User.learnIndex));
        wordChanged();  //发送word改变的信号，与word绑定处自动更新
        text_word_mean.visible = false;
    }

    Component.onCompleted: {
        if(!dicDB.isDbExist()) {
            popup.show();
        }else{
            dicDB.connect();
            showNextWord();
            dicDB.setTableName(User.wordTableName);
            User.totalNum = dicDB.getQuantity();
        }
        console.log("创建");
    }
    Component.onDestruction: {
        User.updateLearnInfo();
//        userInfoUpdate.setLearnInfo(User.id, User.planNum, User.newNum, User.finishedNum, User.learnedNum, User.totalNum, User.learnIndex);
        console.log("销毁");
    }

    DicDB {
        id: dicDB;
    }

    FtpOp {
        id: ftpOp;
        onFtpDone: {
            if(!error) {
                text_popup.text = "下载成功";
                text_hasDownload.text = "";

                //连接单词数据库，显示单词
                dicDB.connect();
                showNextWord();
                dicDB.setTableName(User.wordTableName);
                User.totalNum = dicDB.getQuantity();
            }else{
                text_popup.text = "下载失败,请重试";
                text_hasDownload.text = "";
            }
            btn_popup.text = "关闭";
        }
        onProgressChanged: {
            text_hasDownload.text = done + "/" + total;
        }
    }
//    UserInfoUpdate {
//        id: userInfoUpdate;
//    }

    //是否下载框
    Rectangle {
        id: popup;
        width: root.width>>1;
        height: width;
        anchors.centerIn: parent;
        radius: 5;
        visible: false;
        color: "lightblue"

        Text {
            id: text_popup;
            width: parent.width-10;
            text: "需要从服务器下载单词，是否继续?";
            wrapMode: Text.WordWrap
            font.pointSize: 23;
            anchors.centerIn: parent;
        }

        Text {
            id: text_hasDownload;
            anchors.top: text_popup.bottom;
            anchors.topMargin: 10;
        }

        MyButton {
            id: btn_popup;
            width: FontUnit.width(25,text);
            height: FontUnit.height(25);
            anchors.bottom: parent.bottom;
            anchors.horizontalCenter: parent.horizontalCenter;
            text: "继续";
            onClicked: {
                if(text == "继续") {
                    text_popup.text = "正在下载单词..."
                    ftpOp.downloadDicDb();
                }else{
                    popup.hide();
                }
            }
        }

        function show() {
            popup.visible = true;
            mouseArea_know .enabled = false;
            mouseArea_notKnow.enabled = false;
        }

        function hide() {
            popup.visible = false;
            mouseArea_know .enabled = true;
            mouseArea_notKnow.enabled = true;
        }
    }
}

