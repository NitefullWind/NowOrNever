import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 480;
    height: 720;

    Loader {
        id: loader;
        focus: true;    //loader的focus设置为true其中的item才能接受键盘事件
        anchors.fill: parent;
        source: "qrc:/src/ui/LoginPage.qml"
    }

    Connections {
        target: loader.item;
        onLoginSuccess: {
            loader.source = "qrc:/src/ui/MainView.qml";
        }
    }
}
