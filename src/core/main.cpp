#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "src/ui/fontUtil.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("FontUnit", new FontUtil);
    engine.load(QUrl(QStringLiteral("qrc:/src/ui/main.qml")));

    return app.exec();
}
