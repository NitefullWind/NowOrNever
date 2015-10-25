import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 480;
    height: 720;

    MainForm {
        anchors.fill: parent;
        property var unitLeftMargin: FontUnit.pixelSize(30);

        studyInfoFrame.anchors.leftMargin: unitLeftMargin;
        studyInfoFrame.width: parent.width - 2 * unitLeftMargin;

        //导航页面索引改变时显示不同的页面
        navBar.onPageIndexChanged: {
            setVisiblePage(pages.children[index]);
        }
        //点击nowToLearn按钮时跳转到学习界面
        studyInfoFrame.mouseArea_nowToLearn.onClicked: {
            setVisiblePage(studyPage);
        }

        //设置可见的页面，实现跳转
        function setVisiblePage(page) {
            //先将所有界面设置为不可见
            for(var i=0; i<4; i++){
                pages.children[i].visible = false;
            }
            //再将传来的界面设置为可见
            page.visible = true;
        }
    }
}
