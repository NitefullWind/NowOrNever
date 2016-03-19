import QtQuick 2.5
import 'Component'

Page {
    signal loginSuccess();
    Rectangle {
        anchors.fill: parent;
        Image {
            id: logo
            source: "qrc:/logoAndSlogan";
            width: parent.width*0.7;
            fillMode: Image.PreserveAspectFit;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;
            anchors.topMargin: parent.height>>3
        }
        Column {
            id: colum;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: logo.bottom;
            anchors.topMargin: 80;
            LineTextInput {
                id: input_email;
                backgroundText: "Your Email";
                width: logo.width-10;
                height: 40;
                KeyNavigation.tab: input_pwd;
            }
            LineTextInput {
                id: input_pwd;
                backgroundText: "Your Password";
                isPassword: true;
                width: logo.width-10;
                height: 40;
                KeyNavigation.tab: input_email;
            }
            Item {
                //占位元素
                height: 20;
                width: 10;
            }
            Rectangle {
                id: rec_login;
                width: logo.width-10;
                height: 40;
                radius: 7;
                color: mouArea_login.pressed ? "#11b2dd" : "#33ccf5";
                MouseArea {
                    id: mouArea_login;
                    anchors.fill: parent;
                    onClicked: {
                        openDb();
                        mouse.accepted = true;
                    }
                }
                Text {
                    id: text_login;
                    anchors.centerIn: parent;
                    font.pointSize: 20;
                    text: qsTr("Log in")
                }
                Keys.onReturnPressed: {
                    openDb();
                    event.accepted = true;
                }
            }

        }

    }

    function openDb() {
        UserDB.open();
        var isOk = UserDB.login(input_email.text, input_pwd.text);
        if(isOk){
            loginSuccess();
        }
    }

    Component.onCompleted: {
        console.log("创建登录界面");
    }
    Component.onDestruction: {
        console.log("销毁登录界面");
    }
}
