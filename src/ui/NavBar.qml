import QtQuick 2.4

NavBarForm {
    property var unitHeight: FontUnit.pixelSize(60);
    //自定义信号发射当前页面号，这里的index应该按MainForm中各个页面的顺序选择
    signal pageIndexChanged(var index);

    //导航按键点击相应事件
    mouseArea_study.onPressedChanged: {
        pageIndexChanged(0);
        pressedThenChange(image_study, mouseArea_study);
    }
    mouseArea_find.onPressedChanged: {
        pageIndexChanged(1);
        pressedThenChange(image_find, mouseArea_find);
    }
    mouseArea_mine.onPressedChanged: {
        pageIndexChanged(2);
        pressedThenChange(image_mine, mouseArea_mine);
    }

    //点击时图片所做改变
    function pressedThenChange(image, mouseArea){
        //恢复所有图片
        initImgSource();
        //图片向下移动3像素并恢复
        image.y = mouseArea.pressed ? 3 : 0;
        //换成其他颜色的图片
        image.source = image.source.toString() + "_pressed";
    }

    //初始化图片的源
    function initImgSource() {
        image_study.source = "qrc:/study";
        image_find.source = "qrc:/find";
        image_mine.source = "qrc:/mine";
    }

    //初始化
    Component.onCompleted: {
        height = unitHeight;
        initImgSource();
        image_study.source = "qrc:/study_pressed";
    }

    onWidthChanged: {
        height = (width / 6 < unitHeight) ? width / 6 : unitHeight;
    }
}

