#include "network.h"

Network::Network(QObject *parent)
    : QObject(parent)
    , m_nam(this)
    , hostUrl("http://115.159.160.167/NON/%1")
    , hasError(false)
{
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
