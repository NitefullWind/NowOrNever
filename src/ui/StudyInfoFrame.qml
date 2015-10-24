import QtQuick 2.4

StudyInfoFrameForm {
    //按钮按下时改变样式
    mouseArea_nowToLearn.onPressedChanged:  {
        rec_nowToLearn.border.width = mouseArea_nowToLearn.pressed ? 2 : 1;
    }
}

