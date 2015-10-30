import QtQuick 2.4
import QtQuick.Window 2.2
import "./Component"

Window {
    visible: true
    width: 480;
    height: 720;

    StackPage {
        id: stackPage;
        initialItem: mainForm;
    }

    MainForm {
        id: mainForm;

        //绑定页面和导航的索引值
        pagesList.onCurrentIndexChanged: {
            if(navBar.activePageIndex != pagesList.currentIndex){
                navBar.activePageIndex = pagesList.currentIndex;
            }
        }
        navBar.onActivePageIndexChanged: {
            if(navBar.activePageIndex != pagesList.currentIndex){
                pagesList.currentIndex = navBar.activePageIndex;
            }
        }

        pagesList.studyPage.mouseArea_nowToLearn.onClicked: {
            stackPage._push("../Study/StudyWord.qml")
        }
    }
}
