import QtQuick 2.0
import QtQuick.Layouts 1.1
import "Component"
import "./js/InputCheck.js" as InputCheck

Page {
    id: root;
    Column {
        anchors.horizontalCenter: root.horizontalCenter;
        anchors.verticalCenter: root.verticalCenter;
        LineTextInput {
            id: textInput_name;
            backgroundText: "Your Name"
            width: root.width*0.7;
            height: FontUnit.height(25)*1.5;
        }
        LineTextInput {
            id: textInput_email;
            backgroundText: "Your Email"
            width: textInput_name.width;
            height: textInput_name.height;
        }
        LineTextInput {
            id: textInput_password;
            isPassword: true;
            backgroundText: "Your Password";
            width: textInput_name.width;
            height: textInput_name.height;
        }
        LineTextInput {
            id: textInput_r_password;
            isPassword: true;
            backgroundText: "Password Again";
            width: textInput_name.width;
            height: textInput_name.height;
        }
        Text {
            id: text_info;
            width: textInput_email.width;
            text: " ";
            color: "red";
            wrapMode: Text.WordWrap;
        }

        MyButton {
            id: button_signup;
            width: textInput_name.width-10;
            height: textInput_name.height;
            text: "Sign up for NON";
            onClicked: {
                signup();
            }
        }

    }

    Toast {
        id: toast;
//            anchors.verticalCenter: parent.verticalCenter;
        anchors.centerIn: parent;
    }
    Text {
        id: text_link_login
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 20;
        text: qsTr("Have account? Log in!")
        anchors.horizontalCenter: parent.horizontalCenter;
        font.pointSize: 15;
        MouseArea {
            id: mouseArea_signup;
            anchors.fill: parent;
            onClicked: {
                popPage();
            }
        }
    }

    //注册函数
    function signup() {
        if(allCheck()){
            UserSignup.signup(textInput_name.text, textInput_email.text, textInput_password.text);
        }
    }

    function allCheck() {
        if(     InputCheck.checkName(textInput_name.text) === false ||
                InputCheck.checkEmail(textInput_email.text) === false ||
                InputCheck.checkPassword(textInput_password.text) === false) {
            toast.show(InputCheck.errorMessage)
            return false;
        }
        if(textInput_password.text !== textInput_r_password.text) {
            toast.show("两次密码不同，请重新输入");
            return false;
        }

        return true;
    }

    Connections {
        target: UserSignup;
        onSignupFinished: {
            var jo = JSON.parse(info);
            if(jo.isOk === "true") {
                toast.show("注册成功，两秒后返回登录界面");
                timer.start();
                button_signup.enabled = false;
            }else {
                toast.show("Change an email adress and try again.")
            }
        }
    }

    //计时器，两秒后返回登录界面
    Timer {
        id: timer;
        interval: 2000;
        onTriggered: {
            popPage();
        }
    }
}

