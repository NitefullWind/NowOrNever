#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "src/ui/fontUtil.h"
#include "src/core/dicDB.h"
#include "src/core/userDB.h"
#include "src/core/word.h"
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setOrganizationName("hfut");
    app.setOrganizationDomain("non.hfut.com");
    app.setApplicationName("Now Or Never");
    qmlRegisterType<Word>("hfut.non.Word", 1, 0, "Word");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("FontUnit", new FontUtil);
    engine.rootContext()->setContextProperty("DicDB", new DicDB);
    engine.rootContext()->setContextProperty("UserDB", new UserDB);

    engine.load(QUrl(QStringLiteral("qrc:/src/ui/main.qml")));

    return app.exec();
}
