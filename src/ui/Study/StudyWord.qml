import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.0
import hfut.non.Word 1.0
import hfut.non.DicDB 1.0
import hfut.non.FtpOp 1.0
import "../Component"

Page {
    id: root
    width: 400
    height: 400

    property Word word;
    property int wordIndex: settings.wordIndex;

    topBar: Rectangle{
        width: root.width;
        height: 50;
        color: "gray";
//        opacity: 0.3
        Image {
            id: img_back
            source: "qrc:/back";
            height: parent.height;
            width: height;

            MouseArea {
                id: btn_back;
                anchors.fill: parent;
                onClicked: {
                    //点击时退出当前页
                    root.popPage();
                }
            }
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
                showNextWord();
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

    function showNextWord () {
        word = dicDB.getAWordByIndex(wordIndex);
        wordChanged();  //发送word改变的信号，与word绑定处自动更新
        wordIndex++;
        text_word_mean.visible = false;
    }

    //设置
    Settings {
        id: settings;
        property int wordIndex: 1;
    }

    Component.onCompleted: {
//        DicDB.connect("dic.db");
        dicDB.open();
        showNextWord();
        dicDB.setWordList("view_CET6",0,10);
        console.log("创建");
    }
    Component.onDestruction: {
        settings.wordIndex = root.wordIndex;
        dicDB.clearMemory();
        console.log("销毁");
    }

    DicDB {
        id: dicDB;
    }
}

