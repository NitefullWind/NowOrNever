import QtQuick 2.5
import 'Component'

Page {
    id: root;
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
                height: 30+FontUnit.pixelSize(24);
                KeyNavigation.tab: input_pwd;
            }
            LineTextInput {
                id: input_pwd;
                backgroundText: "Your Password";
                isPassword: true;
                width: logo.width-10;
                height: 30+FontUnit.pixelSize(24);
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
                height: 30+FontUnit.pixelSize(24);
                radius: 7;
                color: mouArea_login.pressed ? "#11b2dd" : "#33ccf5";
                MouseArea {
                    id: mouArea_login;
                    anchors.fill: parent;
                    onClicked: {
                        login();
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
                    login();
                    event.accepted = true;
                }
            }

        }
        Text {
            id: text_link_signup
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 20;
            text: qsTr("No account? Sign Up!")
            anchors.horizontalCenter: parent.horizontalCenter;
            font.pointSize: 15;
            MouseArea {
                id: mouseArea_signup;
                anchors.fill: parent;
                onClicked: {
                    pushPage("qrc:/src/ui/SignupPage.qml");
                }
            }
        }

    }

    //登录函数
    function login() {
        Network.login(input_email.text, input_pwd.text);
    }

    //监听是否登录成功
    Connections {
        target: Network;
        onFinished: {
            if(isOk) {
                console.log(info)
                loginSuccess();
            }
        }
    }

    Component.onCompleted: {
        console.log("创建登录界面");
    }
    Component.onDestruction: {
        console.log("销毁登录界面");
    }
}
