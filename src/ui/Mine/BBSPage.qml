import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 1.4
import QtWebView 1.1
import "../Component"

Page {
    id: root;
    topBar: TopBar {
        pageTitle: "论坛";
        stackPage: root.stackView;
    }

    mainWindow: WebView {
        url: "http://115.159.160.167/NON/BBS/index.html"
        anchors.fill: parent;
        onLoadingChanged: {
            busy.running = loading;
        }
    }
    BusyIndicator {
        id: busy;
        anchors.centerIn: parent;
        running: true;
    }
}

