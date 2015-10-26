import QtQuick 2.4

Item {
    width: 480;
    height: 720;

    property alias pagesList: pagesList;
    property alias navBar: navBar;

    MainPagesList {
        id: pagesList;
        width: parent.width;
        height: parent.height - navBar.height;
    }

    //导航栏
    NavBar {
        id: navBar;
        anchors.bottom: parent.bottom;
        width: parent.width;
    }
}
