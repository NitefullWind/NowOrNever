import QtQuick 2.0

Rectangle {
    id: rec_toast;
    color: "gray";
    radius: 9
    border.width: 0
    width: 300
    height: 50;
    opacity: 0;
    Text {
        id: text_message;
        text: "Toast 通知"
        anchors.centerIn: parent;
        font.pointSize: 22;
    }

    //出现动画
    NumberAnimation {
        id: showAnimation;
        target: rec_toast
        property: "opacity"
        duration: 1000
        from: 0;
        to: 1;
        easing.type: Easing.InOutQuad
    }

    //消失动画
    Timer {
        id: timer;
        interval: 3000;
        onTriggered: {
            rec_toast.opacity = 0;
            text_message.text = "";
        }
    }

    function show(message) {
        text_message.text = message;
        showAnimation.start();
        timer.start();
    }
}


