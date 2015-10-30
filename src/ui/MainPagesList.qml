import QtQuick 2.4
import "./Study"
import "./Find"
import "./Mine"

ListView {
    id: listView;

    clip: true;
    preferredHighlightBegin: 0
    preferredHighlightEnd: 0
    highlightMoveDuration: 100
    highlightRangeMode: ListView.StrictlyEnforceRange
    snapMode: ListView.SnapOneItem
    orientation: ListView.Horizontal
    maximumFlickVelocity: 3000
    boundsBehavior: ListView.StopAtBounds

    property alias studyPage: studyPage;
    property alias findPage: findPage;
    property alias minePage: minePage;

    model: VisualItemModel {
        id: itemModel;
            //首页学习信息展示框
        StudyPage {
            id: studyPage;
            width: listView.width;
            height: listView.height;
        }

        //发现页面
        FindPage {
            id: findPage;
            width: listView.width;
            height: listView.height;
        }

        //我的设置页面
        MinePage {
            id: minePage;
            width: listView.width;
            height: listView.height;
        }
    }
}

