import QtQuick 2.4

StudyPageForm {
    id: studyPageForm;
    //按钮按下时改变样式
    mouseArea_nowToLearn.onPressedChanged:  {
        rec_nowToLearn.color = mouseArea_nowToLearn.pressed ? "#2247fc" : "#70efd9";
    }
}


