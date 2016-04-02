#ifndef USERSIGNUP_H
#define USERSIGNUP_H
#include "network.h"

class UserSignup : public Network
{
    Q_OBJECT
public:
    explicit UserSignup(QObject *parent=0);
    Q_INVOKABLE void signup(QString name, QString email, QString pwd);
signals:
    void signupFinished(QString info);
public slots:
    void onReplyFinished(QNetworkReply *reply);
};

#endif // USERSIGNUP_H
