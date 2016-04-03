#include "userSignup.h"

UserSignup::UserSignup(QObject *parent)
    :Network(parent)
{
    connect(&m_nam, SIGNAL(finished(QNetworkReply*)), this, SLOT(onReplyFinished(QNetworkReply*)));
}

void UserSignup::signup(QString name, QString email, QString pwd)
{
    QUrl url(hostUrl.arg("Signup?userName=%1&userEmail=%2&userPwd=%3").arg(name).arg(email).arg(pwd));
    m_nam.get(QNetworkRequest(url));
}

void UserSignup::onReplyFinished(QNetworkReply *reply)
{
    QString data = getReplyData(reply);
    emit signupFinished(data);
}
