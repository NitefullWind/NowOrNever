#include "DailySentence.h"
#include <QJsonDocument>
#include <QJsonParseError>
#include <QJsonValue>
#include <QJsonObject>

DailySentence::DailySentence(QObject *object)
    :Network(object)
{
    connect(&m_nam, SIGNAL(finished(QNetworkReply*)), this, SLOT(onReplyFinished(QNetworkReply*)));
    get();
}

void DailySentence::get()
{
    QUrl url("http://open.iciba.com/dsapi/");
    m_nam.get(QNetworkRequest(url));
}

void DailySentence::onReplyFinished(QNetworkReply *reply)
{
    QString data = getReplyData(reply);
    QJsonParseError jpe;
    QJsonDocument jd = QJsonDocument::fromJson(data.toLatin1(), &jpe);
    if(jpe.error == QJsonParseError::NoError) {
        QJsonObject jo = jd.object();
        _content = jo.take("content").toString();
        _note = jo.take("note").toString();
        emit contentChanged(_content);
        emit noteChanged(_note);
    }
}
