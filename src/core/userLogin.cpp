#include "userLogin.h"

UserLogin::UserLogin(QObject *parent)
    :Network(parent)
{
    connect(&m_nam, SIGNAL(finished(QNetworkReply*)), this, SLOT(onReplyFinished(QNetworkReply*)));
}

void UserLogin::login(QString email, QString pwd)
{
    QUrl url(hostUrl.arg("Login?userEmail=%1&userPwd=%2").arg(email).arg(pwd));
    m_nam.get(QNetworkRequest(url));
}

void UserLogin::onReplyFinished(QNetworkReply *reply)
{
    QString data = getReplyData(reply);
    emit loginFinished(data);
}
