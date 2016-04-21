import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../Component"

Page {
    id: root;
    topBar: TopBar {
        pageTitle: "词库设置";
        stackPage: root.stackView;
    }

    Text {
        text: "选一个要学的词库：";
        anchors.bottom: column.top;
        anchors.bottomMargin: 30;
        anchors.left: column.left;
        font.pointSize: 15;
    }

    Column {
        id: column;
        spacing: 20;

        anchors.centerIn: parent;
        ExclusiveGroup {id: group}
        Column {
            RadioButton {
                text: "CET4";
                checked: User.wordTableName == User.CET4;
                exclusiveGroup: group;
                style: radioStyle;
                activeFocusOnPress: true;
                onCheckedChanged: {
                    if(checked && User.wordTableName != User.CET4) {
                        User.wordTableName = User.CET4
                        User.updateLearnInfo();
                    }
                }
            }
            RadioButton {
                text: "CET6";
                checked: User.wordTableName == User.CET6;
                exclusiveGroup: group;
                style: radioStyle;
                activeFocusOnPress: true;
                onCheckedChanged: {
                    if(checked && User.wordTableName != User.CET6) {
                        User.wordTableName = User.CET6
                        User.updateLearnInfo();
                    }
                }
            }
            RadioButton {
                text: "All Words";
                checked: User.wordTableName == User.AllWord;
                exclusiveGroup: group;
                style: radioStyle;
                activeFocusOnPress: true;
                onCheckedChanged: {
                    if(checked && User.wordTableName != User.AllWord) {
                        User.wordTableName = User.AllWord
                        User.updateLearnInfo();
                    }
                }
            }
        }
    }

    Component {
        id: radioStyle;
        RadioButtonStyle {
            indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 9
                            border.color: control.activeFocus ? "darkblue" : "gray"
                            border.width: 1
                            Rectangle {
                                anchors.fill: parent
                                visible: control.checked
                                color: "#555"
                                radius: 9
                                anchors.margins: 4
                            }
                    }
            label: Text {
                color: control.activeFocus ? "blue" : "black";
                text: control.text;
                font.pointSize: 22;
            }
        }
    }

    //更新信息
    Component.onDestruction: {
        DicDB.setTableName(User.wordTableName);
        User.totalNum = DicDB.getQuantity();
    }
}

