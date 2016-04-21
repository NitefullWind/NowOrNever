import QtQuick 2.0

Rectangle {
    property var word: null;
    property bool isMeanVisible: true;
    id: root;

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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: text_word.bottom;
        anchors.topMargin: 10;
        font.pointSize: 15;
        width: parent.width >> 1;
        wrapMode: Text.WordWrap;
        visible: isMeanVisible;
    }
}
