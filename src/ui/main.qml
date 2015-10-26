import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 480;
    height: 720;

    MainForm {
        anchors.fill: parent;
        //导航页面索引改变时显示不同的页面
        navBar.onPageIndexChanged: {
            pagesList.currentIndex = index;
        }
    }
}
