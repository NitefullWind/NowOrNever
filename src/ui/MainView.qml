import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQml.Models 2.2
import "./Study"
import "./Find"
import "./Mine"
import "./Component"

Item {
    id: root;
    StackView {
        id: stack;
        anchors.fill: parent;
        initialItem: LoginPage {
                id: loginPage;
                stackView: stack;
                onLoginSuccess: {
                    if(isOk===true) {
                        stack.pop();
                        stack.push(mainPage);
                        stack.initialItem = mainPage;
                        console.log(stack.depth);
                    }
                }
        }

        //接受键盘事件处理返回退出
        focus: true;
        Keys.enabled: true;
        Keys.onSpacePressed: {
            (depth==1) ? Qt.quit() : pop();
        }

        Keys.onBackPressed: {
            (depth==1) ? Qt.quit() : pop();
        }
    }

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
}

