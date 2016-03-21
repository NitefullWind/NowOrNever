#include "network.h"

Network::Network(QObject *parent)
    : QObject(parent)
    , m_nam(this)
    , hostUrl("http://115.159.160.167/NON/%1")
{
    connect(&m_nam, SIGNAL(finished(QNetworkReply*)), this, SLOT(onReplyFinished(QNetworkReply*)));
}

void Network::login(QString email, QString pwd)
{
    QUrl url(hostUrl.arg("Login?username=%1&password=%2").arg(email).arg(pwd));
    m_nam.get(QNetworkRequest(url));
}

void Network::onReplyFinished(QNetworkReply *reply)
{
    reply->deleteLater();
    if(reply->error() != QNetworkReply::NoError) {
        qDebug() << "reply错误" << reply->errorString();
        emit finished(false, "");
        return;
    }

    QByteArray data = reply->readAll();
    if(data.size()>=4){
        emit finished(true, QString(data));
    }
    emit finished(false, "");
}
