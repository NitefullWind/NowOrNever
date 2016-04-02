import QtQuick 2.0
import QtQuick.Layouts 1.1
import "Component"

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

    function signup() {
        if(textInput_password.text != textInput_r_password.text){
            text_info.text = "Two passwords is different";
            return;
        }
        UserSignup.signup(textInput_name.text, textInput_email.text, textInput_password.text);
    }
    Connections {
        target: UserSignup;
        onSignupFinished: {
            if(error) {
                text_info.text = "Host has an error.Please wait..";
            }else if(info=="false"){
                text_info.text = "Change an email adress and try again."
            }else {
                text_info.text = " ";
                popPage();
            }
        }
    }
}

