import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../Component"

Page {
    id: root;
    width: 400
    height: 400

    mainWindow: WordListPage {
    }

    //显示单词详情
    function showWord(spell) {
        var word = DicDB.getWordBySpell(spell);
        var component = Qt.createComponent("qrc:/src/ui/Find/ShowWordPage.qml");
        if(component.status == Component.Ready) {
            var loadPage = component.createObject(root.stackView, {"stackView": root.stackView, "word":word})
        }else{
            console.log("Not Ready", component.errorString())
        }

        root.stackView.push({item: loadPage, destroyOnPop: true});
    }

    //显示关联单词表
    function showRelated(spell) {
        DicDB.getWordListModel(spell);
        var component = Qt.createComponent("qrc:/src/ui/Find/WordListPage.qml");
        if(component.status == Component.Ready) {
            var loadPage = component.createObject(root.stackView, {"stackView":root.stackView,
                                                      "word": spell,
                                                      "m_data":DicDB.getWordListModel(spell)});
        }else{
            console.log("Not Ready", component.errorString())
        }

        root.stackView.push({item: loadPage, destroyOnPop: true});
    }
}
