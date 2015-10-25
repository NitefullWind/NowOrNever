import QtQuick 2.4

Item {
    width: 480;
    height: 720;

    property alias pages: pages;
    property alias studyInfoFrame: studyInfoFrame;
    property alias studyPage: studyPage;
    property alias findPage: findPage;
    property alias minePage: minePage;
    property alias navBar: navBar;

    Item {
        id: pages;
        width: parent.width;
        height: parent.height - navBar.height;
        anchors.top: parent.top;

        //首页学习信息展示框
        StudyInfoFrame {
            id: studyInfoFrame;

            anchors.bottom: parent.bottom;
            anchors.bottomMargin: parent.height / 6;
            anchors.left: parent.left;
            height: parent.height >> 1;
        }

        //发现页面
        FindPage {
            id: findPage;
            anchors.fill: parent;
            visible: false;
        }

        //我的设置页面
        MinePage {
            id: minePage;
            anchors.fill: parent;
            visible: false;
        }

        //学习界面
        StudyPage {
            id: studyPage
            anchors.fill: parent
            visible: false;
        }
    }

    //导航栏
    NavBar {
        id: navBar;
        anchors.bottom: parent.bottom;
        width: parent.width;
    }
}
