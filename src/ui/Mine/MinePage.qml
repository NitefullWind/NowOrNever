import QtQuick 2.4
import "../Component"

//Rectangle {
Page {
    id: root;
    width: 400
    height: 400

    Column {
        spacing: 10;

        //用户信息
        SettingButton {
            id: setting_user;
            width: root.width;
            height: FontUnit.height(25)*3;

            centerText: User.name;
        }

        //词库设置
        SettingButton {
            id: setting_word_table;
            width: root.width;
            settingKey: "词库";
            settingValue: tableName();

            onClicked: {
                root.pushPage("qrc:/src/ui/Mine/SetWordTblPage.qml")
            }

            function tableName() {
                var name = User.wordTableName;
                if(name==User.CET4) {
                    return "CET4";
                }else if(name == User.CET6){
                    return "CET6";
                }else{
                    return "All Words";
                }
            }
        }

        //计划单词数
        SettingButton {
            id: setting_plan_num;
            width: root.width;
            settingKey: "计划单词数"
            settingValue: User.planNum;

            onClicked: {
                root.pushPage("qrc:/src/ui/Mine/SetPlanNumPage.qml");
            }
        }
    }

    //退出按钮
    MyButton {
        text: "Quit";
        width: root.width>>1;
        height: FontUnit.height(25);
        anchors.bottom: root.bottom;
        anchors.bottomMargin: height*2;
        anchors.horizontalCenter: root.horizontalCenter
        onClicked: {
            Qt.quit();
        }
    }

}

