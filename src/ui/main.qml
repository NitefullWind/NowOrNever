import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 480;
    height: 720;

    MainForm {
        anchors.fill: parent;

        //绑定页面和导航的索引值
        pagesList.onCurrentIndexChanged: {
            if(navBar.activePageIndex != pagesList.currentIndex){
                navBar.activePageIndex = pagesList.currentIndex;
            }
            console.log("pageList")
        }
        navBar.onActivePageIndexChanged: {
            if(navBar.activePageIndex != pagesList.currentIndex){
                pagesList.currentIndex = navBar.activePageIndex;
            }
            console.log("navBar")
        }
    }
}
