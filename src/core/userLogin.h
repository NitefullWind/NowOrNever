#ifndef UserLogin_H
#define UserLogin_H
#include "network.h"

class UserLogin : public Network
{
    Q_OBJECT
public:
    explicit UserLogin(QObject *parent=0);
    Q_INVOKABLE void login(QString email, QString pwd);
signals:
    void loginFinished(QString info);
public slots:
    void onReplyFinished(QNetworkReply *reply);
};

#endif // UserLogin_H
