import QtQuick 2.0
import QtQuick.Controls 1.4
Rectangle {

    id: root;

    property StackView stackView;

    property Component topBar: Rectangle {}

    property Component mainWindow: Rectangle {}

    property Component bottomBar: Rectangle {}

    focus: true;

    //头部框
    Loader {
        id: topBarLoader;
        width: root.width;
        anchors.top: root.top;
        anchors.left: root.left;
        sourceComponent: topBar;
    }

    //主内容
    Loader {
        id: mainWindowLoader;
        width: root.width;
        anchors.top: topBarLoader.bottom;
        anchors.bottom: bottomBarLoader.top;
        anchors.left: root.left;
        sourceComponent: mainWindow;
    }

    //底部框
    Loader {
        id: bottomBarLoader;
        width: root.width;
        anchors.bottom: root.bottom;
        anchors.left: root.left;
        sourceComponent: bottomBar;
    }

    function pushPage(url) {
        var component = Qt.createComponent(url);
        if(component.status == Component.Ready) {
            var loadPage = component.createObject(root.stackView, {"stackView": root.stackView})
        }else{
            console.log("Not Ready", component.errorString())
        }

        root.stackView.push({item: loadPage, destroyOnPop: true});
    }

    function popPage() {
        root.stackView.pop();
    }
}

