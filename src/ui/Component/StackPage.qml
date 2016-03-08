import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

StackView {
    id: stackView;
    anchors.fill: parent;

    property Component loadPageComponent: null;

    focus: true;
    Keys.enabled: true;
    Keys.onSpacePressed: {
        (depth==1) ? Qt.quit() : pop();
    }

    Keys.onBackPressed: {
        (depth==1) ? Qt.quit() : pop();
    }

    function _push(url) {
//        push({item:Qt.resolvedUrl(url), destroyOnPop:true})
        loadPageComponent = Qt.createComponent(url);
        var loadPage;
        if(loadPageComponent.status == Component.Ready) {
            loadPage = loadPageComponent.createObject(stackView, {
                                                          "stackPage": stackView
                                                          })
        }

        stackView.push({item: loadPage
                           , destroyOnPop:true
                           // 不能用。 界面会僵死
                           // , replace: replace
                       });
    }
    function _pop(i) {
        console.log(i);
        pop();
    }

//    Loader {
//        id: loader;
//    }

//    Rectangle {
//        id: rec_quit;

//        color: "#000000";
//        opacity: 0.5;
//        visible: false;
//        width: FontUnit.width(12,"再按一次退出程序") + 6;
//        height: FontUnit.height(12) + 4;
//        anchors.horizontalCenter: parent.horizontalCenter;
//        y: stackView.height;

//        Text {
//            id: text_quit;
//            color: "#ffffff";
//            anchors.centerIn: parent;
//            font.pointSize: 12;
//            text: "再按一次退出程序";
//        }
//        onYChanged: {
//            console.log(y);
//        }
//    }

//    NumberAnimation {
//        id: animation_quit;
//        target: rec_quit;
//        property: "y";
////        from: stackView.height;
//        to: stackView.height - rec_quit.height*20;
//        duration: 2000;

//        onStarted: {
//            rec_quit.visible = true;
//            timer.start();
//        }
//    }

//    Timer {
//        id: timer;
//        interval: 3000;
//        running: false;
//        onTriggered: {
//            rec_quit.visible = false;
//        }
//    }

}

