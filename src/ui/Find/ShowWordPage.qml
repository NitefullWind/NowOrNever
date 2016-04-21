import QtQuick 2.0
import "../Component"

Page {
    id: root;
    property var word: null
    topBar: TopBar {
        pageTitle: word.spell;
        stackPage: root.stackView;
    }

    mainWindow: ShowWordRec {
        word: root.word;
        anchors.fill: parent;
    }
}
