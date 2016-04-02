#include "network.h"

Network::Network(QObject *parent)
    : QObject(parent)
    , m_nam(this)
    , hostUrl("http://115.159.160.167/NON/%1")
    , hasError(false)
{
}

void Network::signup(QString name, QString email, QString pwd)
{
    QUrl url(hostUrl.arg("Signup?userName=%1&userEmail=%2&userPwd=%3").arg(name).arg(email).arg(pwd));
    m_nam.get(QNetworkRequest(url));
}

QString Network::getReplyData(QNetworkReply *reply)
{
    reply->deleteLater();
    if(reply->error() != QNetworkReply::NoError) {
        hasError = true;
        return reply->errorString();
    }else{
        hasError = false;
    }

    QByteArray data = reply->readAll();

    return QString(data);
}
