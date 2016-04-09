import QtQuick 2.5
import 'Component'
import './js/InputCheck.js' as InputCheck;

Page {
    id: root;
    signal loginSuccess(bool isOk);
    Rectangle {
        id: mainRec;
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
                height: FontUnit.height(25)*1.5;
                KeyNavigation.tab: input_pwd;
            }

            LineTextInput {
                id: input_pwd;
                backgroundText: "Your Password";
                isPassword: true;
                width: input_email.width;
                height: input_email.height;
                KeyNavigation.tab: input_email;
            }
//            Item {
//                //占位元素
//                height: 20;
//                width: 10;
//            }
            Text {
                id: text_info;
                color: "red";
//                height: input_email.height>>1
                width: input_email.width;
                text: " ";
            }
            MyButton {
                id: button_login;
                width: input_email.width - 10;
                text: "Log in";
                onClicked: {
                    login();
//                    toast.show("请输入");

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

        Toast {
            id: toast;
//            anchors.verticalCenter: parent.verticalCenter;
            anchors.centerIn: parent;
        }
    }

    //登录函数
    function login() {
        if(allCheck()) {
            UserLogin.login(input_email.text, input_pwd.text);
        }
    }

    //使用JS验证输入是否合法
    function allCheck() {
        if( InputCheck.checkEmail(input_email.text) === false ||
            InputCheck.checkPassword(input_pwd.text) === false ) {
            toast.show(InputCheck.errorMessage);
            return false;
        }

        return true;
    }

    //监听信息
    Connections {
        target: UserLogin;
        onLoginFinished: {
            //解析传来的JSON参数
            var jo = JSON.parse(info);
            if(jo.isOk === "true") {
                User.name = jo.name;
                User.newNum = jo.new;
                User.planNum = jo.plan;
                User.finishedNum = jo.finished;
                loginSuccess(true)
            }else{
                //登录失败时显示错误信息
                toast.show(jo.info);
            }
        }
    }

    Component.onCompleted: {
        UserLogin.login("1@qq.com", "123456")
        loginSuccess(true)

        console.log("创建登录界面");
    }
    Component.onDestruction: {
        console.log("销毁登录界面");
    }
}
