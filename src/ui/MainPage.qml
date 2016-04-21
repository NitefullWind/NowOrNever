import QtQuick 2.0
import QtQml.Models 2.2
import "./Study"
import "./Find"
import "./Mine"
import "./Component"

Page {
    id: mainPage;

    stackView: stack;

    ListView {
        id: listView;
        width: parent.width
        anchors.top: mainPage.top;
        anchors.bottom: navBar.top;

        clip: true
        preferredHighlightBegin: 0
        preferredHighlightEnd: 0
        highlightMoveDuration: 250
        highlightRangeMode: ListView.StrictlyEnforceRange
        snapMode: ListView.SnapOneItem
        orientation: ListView.Horizontal
        maximumFlickVelocity: 3000
        boundsBehavior: ListView.StopAtBounds

        onCurrentIndexChanged: {
            navBar.activePageIndex = currentIndex;
        }

        model: itemsModel;
    }

    ObjectModel {
        id: itemsModel
        StudyPage {
            id: studyPage;
            width: listView.width;
            height: listView.height;
            stackView: stack;
        }

        //发现页面
        FindPage {
            id: findPage;
            width: listView.width;
            height: listView.height;
            stackView: stack;
        }

        //我的设置页面
        MinePage {
            id: minePage;
            width: listView.width;
            height: listView.height;
            stackView: stack;
        }
    }

    NavBar {
        id: navBar;
        width: parent.width;
        anchors.bottom: parent.bottom;
        onActivePageIndexChanged: {
            listView.currentIndex = activePageIndex;
        }
    }
}

