import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../Component"

Page {
    property string word: ""
    property var m_data: DicDB.getWordListModel();

    property double topMarginValue: 0.0 ;
    topBar: TopBar {
        id: top;
        pageTitle: word + "的关联单词"
        stackPage: stackView;
        Component.onCompleted: {
            if(word==""){
                height = 0;
            }
            topMarginValue = height;
        }
    }

    ListView {
        id: listView;
        anchors.fill: parent;
        anchors.margins: 10;
        anchors.topMargin: topMarginValue;

        delegate: listDelegate;
        model: m_data;

        focus: true;
        highlight: Rectangle {
            color: "steelblue";
        }
    }

    Component {
        id: listDelegate;

        Rectangle {
            width: parent.width;
            height: FontUnit.height(30);
            color: listView.currentIndex == index ? "#11b2dd" : "white";
            radius: 5;
            border.width: 1;
            border.color: "white"

            Text {
                id: wrapper;
                anchors.fill: parent;
                font.pointSize: 23;
                verticalAlignment: Text.AlignVCenter;
                horizontalAlignment: Text.AlignHCenter;
                text: m_data[index];
                color: listView.currentIndex == index ? "white" : "blue";
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        if(listView.currentIndex != index){
                            listView.currentIndex = index;
                        }else{
                            showWord(wrapper.text);
                        }
                    }
                }
            }
            Rectangle {
                id: rec_related;
                height: wrapper.height;
                width: wrapper.width>>2;
                anchors.right: wrapper.right;
                color: parent.color;
                border.width: 1;
                border.color: "white"
                radius: 3;
                visible: listView.currentIndex == index;
                enabled: visible;

                Text {
                    text: "关联词";
                    anchors.centerIn: parent;
                    color: "red";
                    font.pointSize: 18;
                }

                MouseArea {
                    id: mouArea;
                    anchors.fill: parent;
                    onClicked: {
                        showRelated(wrapper.text)
                    }
                }
            }
        }
    }
}

