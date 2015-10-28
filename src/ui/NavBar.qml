import QtQuick 2.4

Rectangle {
    id: root;
    property var unitHeight: FontUnit.pixelSize(60);
    width: 400;
    height: (width / 6 < unitHeight) ? width / 6 : unitHeight;

    property var iconNames: ["study", "find", "mine"];
    property var activePageIndex: 0;

    Row {
        anchors.fill: parent;

        //重复创建三个图标
        Repeater {
            model: iconNames;
            MouseArea {
                id: mouseArea;
                width: root.width / iconNames.length;
                height: root.height;
                Image {
                    //活动页面的索引是当前图标时，显示_pressed图片
                    source: (activePageIndex == index) ? "qrc:/"+iconNames[index]+"_pressed" : "qrc:/"+iconNames[index];
                    width: height;
                    height:  root.height;
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                //点击时改变活动页面索引
                onClicked: {
                    activePageIndex = index;
                }
            }
        }
    }
}

