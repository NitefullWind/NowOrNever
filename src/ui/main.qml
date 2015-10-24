import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 480;
    height: 720;

    //导航栏
    NavBar {
        id: mainForm;
        anchors.bottom: parent.bottom;
        width: parent.width;
    }

    //首页学习信息展示框
    StudyInfoFrame {
        anchors.bottom: mainForm.top;
        anchors.bottomMargin: 50;
        anchors.left: parent.left;
        anchors.leftMargin: 20;
        width: parent.width - 40;
    }

    Component.onCompleted: {
        console.log("=======================\n"+FontUnit.pixelSize(1000)+"\n====================");
    }
}
