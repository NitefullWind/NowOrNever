#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "src/ui/fontUtil.h"
#include "src/core/dicDB.h"
#include "src/core/userLogin.h"
#include "src/core/userSignup.h"
#include "src/core/word.h"
#include "src/core/user.h"
#include "download/ftpOp.h"
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setOrganizationName("hfut");
    app.setOrganizationDomain("non.hfut.com");
    app.setApplicationName("Now Or Never");
    qmlRegisterType<Word>("hfut.non.Word", 1, 0, "Word");
    qmlRegisterType<DicDB>("hfut.non.DicDB",1, 0, "DicDB");
    qmlRegisterType<FtpOp>("hfut.non.FtpOp", 1, 0, "FtpOp");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("FontUnit", new FontUtil);
//    engine.rootContext()->setContextProperty("DicDB", new DicDB);
    engine.rootContext()->setContextProperty("UserLogin", new UserLogin);
    engine.rootContext()->setContextProperty("UserSignup", new UserSignup);
    engine.rootContext()->setContextProperty("User", new User(0, "0","0","0"));

    engine.load(QUrl(QStringLiteral("qrc:/src/ui/main.qml")));

    return app.exec();
}
