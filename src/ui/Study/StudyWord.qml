import QtQuick 2.4

StudyWordForm {
    Component.onCompleted: {
        console.log("创建")
    }
    Component.onDestruction: {
        console.log("销毁")
    }
}

