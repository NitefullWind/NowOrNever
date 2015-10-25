import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 480;
    height: 720;

    Item {
        id: pages;
        width: parent.width;
        height: parent.height - navBar.height;
        anchors.top: parent.top;

        //首页学习信息展示框
        StudyInfoFrame {
            id: studyInfoFrame;
            property var unitLeftMargin: FontUnit.pixelSize(30);

            anchors.bottom: parent.bottom;
            anchors.bottomMargin: parent.height / 6;
            anchors.left: parent.left;
            anchors.leftMargin: unitLeftMargin;
            width: parent.width - 2 * unitLeftMargin;
            height: parent.height >> 1;
        }

        FindPage {
            id: findPage;
            anchors.fill: parent;
            visible: false;
        }

        MinePage {
            id: minePage;
            anchors.fill: parent;
            visible: false;
        }
    }

    //导航栏
    NavBar {
        id: navBar;
        anchors.bottom: parent.bottom;
        width: parent.width;

        //导航页面索引改变时显示不同的页面
        onPageIndexChanged: {
            for(var i=0; i< 3; i++){
                if(i != index){
                    pages.children[i].visible = false;
                }
            }
            pages.children[index].visible = true
        }
    }

    Component.onCompleted: {
        console.log("=======================\n"+FontUnit.pixelSize(1000)+"\n====================");
    }
}
