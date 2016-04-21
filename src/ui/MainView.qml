import QtQuick 2.4
import QtQuick.Controls 1.4
import hfut.non.FtpOp 1.0
import "./Component"

Item {
    id: root;
    StackView {
        id: stack;
        anchors.fill: parent;
        initialItem: LoginPage {
                id: loginPage;
                stackView: stack;
                onLoginSuccess: {
                    if(isOk===true) {
                        init();
                    }
                }
        }

        //接受键盘事件处理返回退出
        focus: true;
        Keys.enabled: true;
        Keys.onSpacePressed: {
//            (depth==1) ? Qt.quit() : pop();
            if(depth>1) {
                pop();
            }
        }

        Keys.onBackPressed: {
//            (depth==1) ? Qt.quit() : pop();
            if(depth>1) {
                pop();
            }
        }
    }

    function init() {
        if(!DicDB.isDbExist()) {
            popup.show();
        }else{
            DicDB.connect();
            DicDB.setTableName(User.wordTableName);
            User.totalNum = DicDB.getQuantity();
            //将登录页替换为主页
            stack.push({item:"qrc:/src/ui/MainPage.qml", replace:true});
        }
    }

    FtpOp {
        id: ftpOp;
        onFtpDone: {
            if(!error) {
                text_popup.text = "下载成功";
                text_hasDownload.text = "";

                init();

            }else{
                text_popup.text = "下载失败,请重试";
                text_hasDownload.text = "";
            }
            btn_popup.text = "关闭";
        }
        onProgressChanged: {
            text_hasDownload.text = done + "/" + total;
        }
    }

    //是否下载框
    Rectangle {
        id: popup;
        width: root.width>>1;
        height: width;
        anchors.centerIn: parent;
        radius: 5;
        visible: false;
        color: "lightblue"

        Text {
            id: text_popup;
            width: parent.width-10;
            text: "需要从服务器下载单词(约300KB),请保持网络畅通";
            wrapMode: Text.WordWrap
            font.pointSize: 23;
            anchors.centerIn: parent;
        }

        Text {
            id: text_hasDownload;
            anchors.top: text_popup.bottom;
            anchors.topMargin: 10;
        }

        MyButton {
            id: btn_popup;
            width: FontUnit.width(25,text);
            height: FontUnit.height(25);
            anchors.bottom: parent.bottom;
            anchors.horizontalCenter: parent.horizontalCenter;
            text: "继续";
            onClicked: {
                if(text == "继续") {
                    text_popup.text = "正在下载单词..."
                    ftpOp.downloadDicDb();
                }else{
                    popup.hide();
                }
            }
        }

        function show() {
            popup.visible = true;
        }

        function hide() {
            popup.visible = false;
        }
    }
}

