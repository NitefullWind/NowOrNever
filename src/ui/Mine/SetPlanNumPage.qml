import QtQuick 2.0
import "../Component"

Page {
    id: root;
    topBar: TopBar {
        pageTitle: "每日计划";
        stackPage: root.stackView;
    }
    Column {
        id: column1
        anchors.centerIn: parent;
        spacing: text_advice.height;
        Text {
            id: text_plan;
            text: "每日计划学习单词个数"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 22;
        }
        Text {
            id: text_advice;
            text: "建议每日不少于30个"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12;
            font.italic: true;
            color: "#9cdff8"
        }

        LineTextInput {
//            id: input_plan;
            backgroundText: input_plan.text=="" ? "1-1000" :"";
//            text: User.planNum;
            TextInput {
                id: input_plan;
                font.pointSize: 22;
//                height: parent.height;
//                width: parent.height;
//                anchors.bottom: parent.bottom;
                anchors.fill: parent;
                verticalAlignment: TextInput.AlignVCenter
                validator: IntValidator {bottom: 1; top: 1000;}
            }

            anchors.horizontalCenter: parent.horizontalCenter
        }

        MyButton {
            id: btn_plan;
            text: "Do it!"
            anchors.horizontalCenter: parent.horizontalCenter
            width: input_plan.width;
            height: input_plan.height;
            onClicked: {
                User.planNum = newPlanNum();
                User.updateLearnInfo();
                root.popPage();
            }
        }
    }

    function newPlanNum() {
        var value = parseInt(input_plan.text);
        console.log(value);
        if(value>0 && value <= 1000) {
            return value;
        }
        return User.planNum;
    }
}

