#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "src/ui/fontUtil.h"
#include "src/core/dicDB.h"
#include "src/core/userLogin.h"
#include "src/core/userSignup.h"
#include "src/core/userInfoUpdate.h"
#include "src/core/word.h"
#include "src/core/user.h"
#include "download/ftpOp.h"
#include "src/core/DailySentence.h"
#include <QtWebView/QtWebView>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtWebView::initialize();

    app.setOrganizationName("hfut");
    app.setOrganizationDomain("non.hfut.com");
    app.setApplicationName("Now Or Never");
    qmlRegisterType<Word>("hfut.non.Word", 1, 0, "Word");
//    qmlRegisterType<DicDB>("hfut.non.DicDB",1, 0, "DicDB");
    qmlRegisterType<FtpOp>("hfut.non.FtpOp", 1, 0, "FtpOp");
    qmlRegisterType<UserInfoUpdate>("hfut.non.UserInfoUpdate", 1, 0, "UserInfoUpdate");
//    qmlRegisterType<DailySentence>("hfut.non.DailySentence", 1, 0, "DailySentence");
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("FontUnit", new FontUtil);
    engine.rootContext()->setContextProperty("DicDB", new DicDB);
    engine.rootContext()->setContextProperty("UserLogin", new UserLogin);
    engine.rootContext()->setContextProperty("UserSignup", new UserSignup);
    engine.rootContext()->setContextProperty("User", new User(0, "0","0","0"));
    engine.rootContext()->setContextProperty("DailySentence", new DailySentence);

    engine.load(QUrl(QStringLiteral("qrc:/src/ui/main.qml")));

    return app.exec();
}
